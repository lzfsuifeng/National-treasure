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
   public  class SqlServerLeavewords
    {
        public DataTable userSellect(int User_ID)
        {
            string sql = "select * from Leavewords ,News where Leavewords.User_ID='" + User_ID + "' and Leavewords.News_ID=News.News_ID";
            return DBHelper.GetFillData(sql);
        }
        //用户删除自己的某个留言
        public int usersDelete(int Leavewords_ID)
        {
            string sql = "delete from Leavewords where Leavewords_ID='" + Leavewords_ID + "'";
            return DBHelper.GetExcuteNonQuery(sql);
        }
        //删除留言
        public int Deleteliuyan(int Leavewords_ID)
        {
            string sql = "delete from Leavewords where Leavewords_ID=@Leavewords_ID";
            SqlParameter[] sp = { new SqlParameter("@Leavewords_ID", Leavewords_ID) };
            return DBHelper.GetExcuteNonQuery(sql, sp);
        }
        //展现留言

        public DataTable SelectAllliuyan()
        {
            string sql = "select a.*,b.User_Name,c.News_Title from Leavewords a,UserInfo b,News c where a.User_ID=b.User_ID and a.News_ID=c.News_ID";
            return DBHelper.GetFillData(sql);
        }
        //根据ID展现留言
        public DataTable SelectLeavewords(int News_ID)
        {
            string sql = "select *from Leavewords,UserInfo where Leavewords.User_ID=UserInfo.User_ID and Leavewords.News_ID=@News_ID order by Leavewords.Leavewords_Time";
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("@News_ID",News_ID)
            };
            return DBHelper.GetFillData(sql, sp);
        }
        //增加留言
        public int InsertLeavewords(Leavewords words)
        {
            string sql = "insert into Leavewords values(@LeaveContent,@LeaveTime,@UserID,@NewsID)";
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("@UserID",words.User_ID),
                new SqlParameter("@NewsID",words.News_ID),
                new SqlParameter("@LeaveContent",words.Leavewords_Content),
                new SqlParameter("@LeaveTime",words.Leavewords_Time)
            };
            return DBHelper.GetExcuteNonQuery(sql, sp);
        }
        //用户展现自己留言被回复
        public DataTable SelectBLae(int User_ID)
        {
            string sql = "select a.ReplyLeavewords_Comment,a.ReplyLeavewords_Time,b.Leavewords_ID,b.Leavewords_Content,c.User_Name from ReplyLeavewords a,Leavewords b,UserInfo c,UserInfo d where d.User_ID='" + User_ID + "' and b.User_ID=d.User_ID and c.User_ID=a.User_ID";
            return DBHelper.GetFillData(sql);
        }
    }
}
