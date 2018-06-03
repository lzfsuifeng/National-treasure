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
   public  class SqlServerReplyComments
    {
        //删除
        public int Delete(int ReplyComments_ID)
        {
            string sql = "delete from ReplyComments where ReplyComments_ID=@ReplyComments_ID";
            SqlParameter[] sp = { new SqlParameter("@ReplyComments_ID", ReplyComments_ID) };
            return DBHelper.GetExcuteNonQuery(sql, sp);
        }

        //展现
        public DataTable SelectAll()
        {
            string sql = "select a.*,b.User_Name,c.Comments_Content from ReplyComments a,UserInfo b,Comments c where a.User_ID=b.User_ID and a.Comments_ID=c.Comments_ID";
            return DBHelper.GetFillData(sql);
        }
        //提到某用户的评论
        public DataTable replyusers(int User_ID)
        {
            string sql = "select *from ReplyComments as a,Comments as b,UserInfo as c where a.User_ID = c.User_ID and a.Comments_ID = b.Comments_ID and b.User_ID=@User_ID order by a.ReplyComments_Time desc";
            SqlParameter[] sp= new SqlParameter[]
            {
                new SqlParameter("@User_ID",User_ID)
            };
            return DBHelper.GetFillData(sql, sp);
        }
        //查找某用户在某ACG创作中的二级评论
        public DataTable acgreplycomments(int Comments_ID)
        {
            string sql = "select * from ReplyComments, UserInfo, Comments where ReplyComments.Comments_ID =@Comments_ID   and ReplyComments.Comments_ID=Comments.Comments_ID and ReplyComments.User_ID=UserInfo.User_ID order by ReplyComments_Time";
            SqlParameter[] sp = new SqlParameter[]
            {
               
                new SqlParameter("@Comments_ID",Comments_ID)
            };
            return DBHelper.GetFillData(sql, sp);
        }
        //添加被评论
        public int addreplycomments(ReplyComments replycomments)
        {
            string sql = "insert into ReplyComments values(@ReplyComments_Content,@ReplyComments_Time,@Comments_ID,@User_ID)";
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("@ReplyComments_Content",replycomments.ReplyComments_Content),
                new SqlParameter("@ReplyComments_Time",replycomments.ReplyComments_Time),
                new SqlParameter("@Comments_ID",replycomments.Comments_ID),
                new SqlParameter("@User_ID",replycomments.User_ID)
            };
            return DBHelper.GetExcuteNonQuery(sql, sp);
        }
    }
}
