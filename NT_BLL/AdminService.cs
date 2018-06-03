using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NT_Models;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using NT_DAL;
namespace NT_BLL
{
   public class AdminService
    {
        private static SqlServerAdminInfo iadmininfo = new SqlServerAdminInfo();
        //登陆
        public static SqlDataReader Login(string Name, string paw)
        {
            return iadmininfo.Login(Name, paw);
        }
    }
}
