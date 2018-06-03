using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NT_Models;
using NT_DAL;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
namespace NT_DAL
{
    public class SqlServerAction
    {
        //后台展现
        public DataTable selectAll()
        {
            string sql = "select * from Action";
            return DBHelper.GetFillData(sql);
        }

        public SqlDataReader selectaction(int act_id)
        {
            string sql = "select * from Action where Act_ID='"+act_id+"'";
            return DBHelper.GetDataReader(sql);
        }

        //后台增加
        public int insert(NT_Models.Action action)
        {
            string sql = "insert into Action values(@Act_Title,@Act_Content,@Act_Img,@Act_Time)";
            SqlParameter[] sp = new SqlParameter[] {
                                                 new SqlParameter("@Act_Title",action.Act_Title),
                                                 new SqlParameter("@Act_Content",action.Act_Content),
                                                 new SqlParameter("@Act_Img",action.Act_Img),
                                                 new SqlParameter("@Act_Time",action.Act_Time)};
            return DBHelper.GetExcuteNonQuery(sql, sp);
        }
        //后台删除
        public int DeleteAction(int Act_ID)
        {
            string sql = "delete from Action where Act_ID=@Act_ID";
            SqlParameter[] sp = { new SqlParameter("@Act_ID", Act_ID) };
            return DBHelper.GetExcuteNonQuery(sql, sp);

        }
    }
}
