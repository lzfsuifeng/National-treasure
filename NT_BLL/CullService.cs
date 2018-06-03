using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NT_Models;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using NT_DAL;

namespace NT_BLL
{
   public class CullService
    {
        public static SqlServerCulinfo icull = new SqlServerCulinfo();
        //后台插入
        public static int Insert(Culinfo Cull)
        {
            return icull.Insert(Cull);
        }
        //后台删除
        public static int Delete(int Cull_ID)
        {
            return icull.Delete(Cull_ID);
        }
        //后台展现
        public static DataTable SelectAll()
        {
            return icull.SelectAll();
        }
        //主页展现前几
        public static DataTable SelectTop8()
        {
            return icull.SelectTop8();
        }
        //根据朝代显示
        public static DataTable SelectCullDyn(int Dyn_ID)
        {
            return icull.SelectCullDyn(Dyn_ID);
        }
        //根据分类显示
        public static DataTable SelectCullClass(int Class_ID)
        {
            return icull.SelectCullClass(Class_ID);
        }
        //根据朝代和分类显示
        public static DataTable SelectCullClassDyn(int Dyn_ID, int Class_ID)
        {
            return icull.SelectCullClassDyn(Dyn_ID, Class_ID);
        }
        //根据Cull_Name查询具体的Cull
        public static DataTable SelectCullName(string Cull_Name)
        {
            return icull.SelectCullName(Cull_Name);
        }
       
       //展示cull的详细信息
       public static SqlDataReader culldetail(int Cull_ID)
        {
            return icull.culldetail(Cull_ID);
        }
        //展示cull的详细信息
        public static DataTable culldetail1(int Cull_ID)
        {
            return icull.culldetail1(Cull_ID);
        }
        //根据Cull_Name模糊查询
        public static DataTable mohu(string Cull_Name)
        {
            return icull.mohu(Cull_Name);
        }
    }
}
