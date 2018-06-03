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
    public class TallyDal
    {
        //展现所有标签
        public DataTable allTally()
        {
            string sql = "select top 6*from Tally ";
            return DBHelper.GetFillData(sql);
        }
    }
}
