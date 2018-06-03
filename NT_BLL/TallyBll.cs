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
    public class TallyBll
    {
        private static TallyDal itally = new TallyDal();
        public static DataTable allTally()
        {
            return itally.allTally();
        }
    }
}
