using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using NT_Models;
using NT_DAL;

namespace NT_BLL
{
    public class DynBll
    {
        private static DynDal idyn = new DynDal();
        //展现所有的朝代
        public static DataTable allDyn()
        {
            return idyn.allDyn();
        }
          //根据ID查询朝代名字
        public static SqlDataReader dynname(int Dyn_ID)
        {
            return idyn.dynname(Dyn_ID);
        }
    }
}
