using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using NT_Models;

namespace NT_DAL
{
    public class InformDal
    {
        //增加举报
        public int addInform(Inform inform)
        {
            string sql = "insert into Inform values(@User_ID,@Pro_ID,@results)";
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("@User_ID",inform.User_ID),
                new SqlParameter("@Pro_ID",inform.Pro_ID),
                new SqlParameter("@results",inform.results)
            };
            return DBHelper.GetExcuteNonQuery(sql, sp);
        }
        //取消举报
        public int deleteInform(int User_ID, int Pro_ID)
        {
            string sql = "delete Inform where User_ID=@User_ID and Pro_ID=@Pro_ID";
            SqlParameter[] sp = new SqlParameter[]
            {
                  new SqlParameter("@User_ID",User_ID),
                new SqlParameter("@Pro_ID",Pro_ID)
            };
            return DBHelper.GetExcuteNonQuery(sql, sp);
        }
        //查询举报
        public SqlDataReader seletcInform(int User_ID, int Pro_ID)
        {
            string sql = "select *from Inform where User_ID=@User_ID and Pro_ID=@Pro_ID";
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("@User_ID",User_ID),
                new SqlParameter("@Pro_ID",Pro_ID)
            };
            return DBHelper.GetDataReader(sql, sp);
        }
    }
}
