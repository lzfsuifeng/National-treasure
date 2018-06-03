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
    public class ClassificationDal
    {
        //展现所有的分类
        public DataTable allclass()
        {
            string sql = "select *from Classification";
            return DBHelper.GetFillData(sql);
        }
        //根据ID查询朝代名字
        public SqlDataReader clssname(int Class_ID)
        {
            string sql = "select * from Classification where Class_ID=@Class_ID";
            SqlParameter[] sp = new SqlParameter[]{
                new SqlParameter("@Class_ID",Class_ID)
            };
            return DBHelper.GetDataReader(sql, sp);
        }
    }
}
