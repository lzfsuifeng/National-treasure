using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using NT_Models;
using System.Data;

namespace NT_DAL
{
   public  class SqlServerReplyLeavewords
    {
        //提到某用户的留言
        public DataTable replayuser(int User_ID)
        {
            string sql = "select a.ReplyLeavewords_ID,a.ReplyLeavewords_Comment,a.ReplyLeavewords_Time,c.User_Name,b.Leavewords_Content from ReplyLeavewords as a,Leavewords as b,UserInfo as c where a.User_ID = c.User_ID and a.Leavewords_ID = b.Leavewords_ID and b.User_ID = @User_ID order by a.ReplyLeavewords_Time desc";
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("@User_ID",User_ID)
            };
            return DBHelper.GetFillData(sql, sp);
        }
        //删除
        public int Delete(int ReplyLeavewords_ID)
        {
            string sql = "delete from ReplyLeavewords where ReplyLeavewords_ID=@ReplyLeavewords_ID";
            SqlParameter[] sp = { new SqlParameter("@ReplyLeavewords_ID", ReplyLeavewords_ID) };
            return DBHelper.GetExcuteNonQuery(sql, sp);
        }

        //展现
        public DataTable SelectAll()
        {
            string sql = "select a.*,b.User_Name,c.Leavewords_Content from ReplyLeavewords a,UserInfo b,Leavewords c where a.User_ID=b.User_ID and a.Leavewords_ID=c.Leavewords_ID";
            return DBHelper.GetFillData(sql);
        }
        //回复留言
        public int InsertReplyLeavewords(ReplyLeavewords Replywords)
        {
            string sql = "insert into ReplyLeavewords(Leavewords_ID,User_ID,ReplyLeavewords_Comment,ReplyLeavewords_Time) values(@LeaveID,@UserID,@ReplyContent,@ReplyTime)";
            SqlParameter[] sp = new SqlParameter[]
                {
                    new SqlParameter("@LeaveID",Replywords.Leavewords_ID),
                    new SqlParameter("@UserID",Replywords.User_ID),
                    new SqlParameter("@ReplyContent",Replywords.ReplyLeavewords_Comment),
                    new SqlParameter("@ReplyTime",Replywords.ReplyLeavewords_Time)
                };
            return DBHelper.GetExcuteNonQuery(sql, sp);
        }
        public DataTable SelectReplyLeavewords(int Leavewords_ID )
        {
            string sql = "select * from ReplyLeavewords, UserInfo, Leavewords where  ReplyLeavewords.Leavewords_ID =@Leavewords_ID and ReplyLeavewords.Leavewords_ID=Leavewords.Leavewords_ID and ReplyLeavewords.User_ID=UserInfo.User_ID order by ReplyLeavewords.ReplyLeavewords_Time";
            SqlParameter[] sp = new SqlParameter[]
            {               
               
                new SqlParameter("@Leavewords_ID", Leavewords_ID)
            };
            return DBHelper.GetFillData(sql, sp);
        }
    }
}
