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
    public class DynDal
    {
        //展现所有的朝代
        public DataTable allDyn()
        {
            string sql = "select * from Dyn";
            return DBHelper.GetFillData(sql);
        }
        //根据ID查询朝代名字
        public SqlDataReader dynname(int Dyn_ID)
        {
            string sql = "select * from Dyn where Dyn_ID=@Dyn_ID";
            SqlParameter[] sp = new SqlParameter[]{
                new SqlParameter("@Dyn_ID",Dyn_ID)
            };
            return DBHelper.GetDataReader(sql, sp);
        }
    }
}
