using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using NT_Models;

namespace NT_DAL
{
   public class SqlServerAdminInfo
    {
        //登陆
        public SqlDataReader Login(string Name, string paw)
        {

            string sql = "select * from Admin where  Admin_Name=@Admin_Name and Admin_Password=@Admin_Password";
            SqlParameter[] sp = new SqlParameter[]{

                new SqlParameter("@Admin_Name",Name),
                new SqlParameter("@Admin_Password",paw)
        };
            return DBHelper.GetDataReader(sql, sp);
        }
    }
}
