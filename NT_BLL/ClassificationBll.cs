using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using NT_DAL;
using NT_Models;

namespace NT_BLL
{
    public class ClassificationBll
    {
        private static ClassificationDal iClassification = new ClassificationDal();
        //展现所有的分类
        public static DataTable allclass()
        {
            return iClassification.allclass();
        }
       //根据ID查询朝代名字
        public static SqlDataReader clssname(int Class_ID)
        {
            return iClassification.clssname(Class_ID);
        }
    }
}
