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
   public class SqlServerComments
    {
        //查询某用户的所有评论
        public DataTable usersSellect(int User_ID)
        {

            string sql = "select * from Comments where User_ID='"+User_ID+"'";
            return DBHelper.GetFillData(sql);
        }
        //用户删除自己的某个评论
        public int usersDelete(int Comments_ID)
        {
            string sql= "delete from Comments where Comments_ID='" + Comments_ID + "'";
            return DBHelper.GetExcuteNonQuery(sql);
        }
       
        //后台删除评论
        public int DeleteComments(int Comments_ID)
        {
            string sql = "delete from Comments where Comments_ID=@Comments_ID";
            SqlParameter[] sp = { new SqlParameter("@Comments_ID", Comments_ID) };
            return DBHelper.GetExcuteNonQuery(sql, sp);

        }
        //后台展现评论

        public DataTable SelectAllpinlun()
        {
            string sql = "select a.*,b.User_Name,c.Pro_Title from Comments a,UserInfo b,ACG c where a.User_ID=b.User_ID and a.Pro_ID=c.Pro_ID";
            return DBHelper.GetFillData(sql);
        }
        //查找在某个acg作品下的所有评论
        public DataTable acgselect(int Pro_ID)
        {
            string sql = "select * from Comments, UserInfo where Comments.User_ID = UserInfo.User_ID and Pro_ID=@Pro_ID order by Comments.Comments_Time";
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("@Pro_ID",Pro_ID)
            };
            return DBHelper.GetFillData(sql, sp);
        }
        //显示某个acg作品下的评论数量
        public int num(int Pro_ID)
        {
            string sql = "select count(*)from Comments where Pro_ID='" + Pro_ID + "'";
            return DBHelper.ExecuteScalar<int>(sql);
        }
        //发表评论
        public  int addcomments(Comments commnets)
        {
            string sql = "insert into Comments values(@Comments_Content,@Comments_Time,@User_ID,@Pro_ID)";
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("@Comments_Content",commnets.Comments_Content),
                new SqlParameter("@Comments_Time",commnets.Comments_Time),
                new SqlParameter("@Pro_ID",commnets.Pro_ID),
                new SqlParameter("@User_ID",commnets.User_ID)
            };
            return DBHelper.GetExcuteNonQuery(sql, sp);
        }
        //用户展现自己作品被评论
        public DataTable Select(int User_ID)
        {
            string sql = "select a.Pro_Title,a.Pro_ID,b.Comments_ID,b.Comments_Content,b.Comments_Time,c.User_Name from ACG a,Comments b,UserInfo c,UserInfo d where d.User_ID='" + User_ID + "' and a.User_ID=d.User_ID and c.User_ID=b.User_ID";
            return DBHelper.GetFillData(sql);
        }
        //用户展现自己评论被评论
        public DataTable SelectBComments(int User_ID)
        {
            string sql = "select a.ReplyComments_Content,a.ReplyComments_Time,b.Comments_ID,c.User_Name from ReplyComments a,Comments b,UserInfo c,UserInfo d where d.User_ID='" + User_ID + "' and b.User_ID=d.User_ID and c.User_ID=a.User_ID";
            return DBHelper.GetFillData(sql);
        }
    }
}
