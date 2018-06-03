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
    public class CollectionDal
    {
        //增加收藏
        public int addCollect(Collection collection)
        {
            string sql = "insert into Collection values(@User_ID,@Pro_ID,@collect)";
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("@User_ID",collection.User_ID),
                new SqlParameter("@Pro_ID",collection.Pro_ID),
                new SqlParameter("@collect",collection.collect)
            };
            return DBHelper.GetExcuteNonQuery(sql, sp);
        }
        //取消收藏
        public int deleteCollect(int User_ID,int Pro_ID)
        {
            string sql = "delete Collection where User_ID=@User_ID and Pro_ID=@Pro_ID";
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("@User_ID",User_ID),
                new SqlParameter("@Pro_ID",Pro_ID)
            };
            return DBHelper.GetExcuteNonQuery(sql, sp);
        }
        //查询收藏
        public SqlDataReader seletcCollect(int User_ID, int Pro_ID)
        {
            string sql = "select *from Collection where User_ID=@User_ID and Pro_ID=@Pro_ID";
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("@User_ID",User_ID),
                new SqlParameter("@Pro_ID",Pro_ID)
            };
            return DBHelper.GetDataReader(sql, sp);
        }
    }
}
