using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using NT_Models;

namespace NT_DAL
{
   public class SqlServerCulinfo
    {
        //后台增加
        public int Insert(Culinfo Cull)
        {
            string sql = "insert into Cull values(@Cull_Name,@Cull_Img,@Cull_Content,@Dyn_ID,@Class_ID)";
            SqlParameter[] sp = new SqlParameter[] {
                                                 new SqlParameter("@Cull_Name",Cull.Cull_Name),
                                                 new SqlParameter("@Cull_Img",Cull.Cull_Img),
                                                 new SqlParameter("@Cull_Content",Cull.Cull_Content),
                                                 new SqlParameter("@Dyn_ID",Cull.Dyn_ID),
                                                 new SqlParameter("@Class_ID",Cull.Class_ID)};
            return DBHelper.GetExcuteNonQuery(sql, sp);
        }
        //后台删除
        public int Delete(int Cull_ID)
        {
            string sql = "delete from Cull where Cull_ID=@Cull_ID";
            SqlParameter[] sp = { new SqlParameter("@Cull_ID", Cull_ID) };
            return DBHelper.GetExcuteNonQuery(sql, sp);
        }

        //后台展现
        public DataTable SelectAll()
        {
            string sql = "select * from Cull,Dyn ,Classification where Classification.Class_ID=Cull.Class_ID and Dyn.Dyn_ID=Cull.Dyn_ID order by cull.Cull_ID desc";
            return DBHelper.GetFillData(sql);
        }
        //主页展示前8的
        public DataTable SelectTop8()
        {
            string sql = "select top 8 * from Cull,Dyn ,Classification where Classification.Class_ID=Cull.Class_ID and Dyn.Dyn_ID=Cull.Dyn_ID order by cull.Cull_ID desc";
            return DBHelper.GetFillData(sql);
        }
        //展示详细信息
        public SqlDataReader culldetail(int Cull_ID)
        {
            string sql = "select * from Cull where Cull_ID=@Cull_ID";
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("@Cull_ID",Cull_ID)
            };
            return DBHelper.GetDataReader(sql, sp);
        }
        //展示详细信息
        public DataTable culldetail1(int Cull_ID)
        {
            string sql = "select * from Cull where Cull_ID=@Cull_ID";
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("@Cull_ID",Cull_ID)
            };
            return DBHelper.GetFillData(sql, sp);
        }

        ///根据朝代显示文物
        public DataTable SelectCullDyn(int Dyn_ID)
        {
            string sql = "select * from Cull,Dyn ,Classification where Dyn.Dyn_ID=@Dyn_ID and Classification.Class_ID=Cull.Class_ID and Dyn.Dyn_ID=Cull.Dyn_ID order by cull.Cull_ID desc";
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("@Dyn_ID",Dyn_ID)
            };
            return DBHelper.GetFillData(sql, sp);
        }
        //根据分类（Classification）查询所有的Cull
        public DataTable SelectCullClass(int Class_ID)
        {
            string sql = "select * from Cull,Dyn ,Classification where Classification.Class_ID=@Class_ID and Classification.Class_ID=Cull.Class_ID and Dyn.Dyn_ID=Cull.Dyn_ID order by cull.Cull_ID desc";
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("@Class_ID",Class_ID)
            };
            return DBHelper.GetFillData(sql, sp);
        }
        //根据朝代和分类显示
        public DataTable SelectCullClassDyn(int Dyn_ID, int Class_ID )
        {
            string sql = "select * from Cull,Dyn ,Classification where Dyn.Dyn_ID=@Dyn_ID and Classification.Class_ID=@Class_ID and Classification.Class_ID=Cull.Class_ID and Dyn.Dyn_ID=Cull.Dyn_ID order by cull.Cull_ID desc";
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("@Class_ID",Class_ID),
                new SqlParameter("@Dyn_ID",Dyn_ID)
            };
            return DBHelper.GetFillData(sql, sp);
        }
        //根据Cull_Name查询具体的Cull
        public DataTable SelectCullName(string Cull_Name)
        {
            string sql = "select a.*,b.Class_Name from Cull a,Classification b where b.Cull_Name='" + Cull_Name + "' and a.Class_ID=b.Class_ID order by Class_ID desc";
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("Cull_Name",Cull_Name)
            };
            return DBHelper.GetFillData(sql, sp);
        }
        //根据Cull_Name模糊查询
        public DataTable mohu(string Cull_Name)
        {
            string sql = "select * from Cull,Classification,Dyn where Cull.Cull_Name like '%" + Cull_Name+ "%' and Cull.Class_ID=Classification.Class_ID and Cull.Dyn_ID=Dyn.Dyn_ID order by Cull.Cull_ID desc";
            //SqlParameter[] sp = new SqlParameter[]
            //{
            //    new SqlParameter("Cull_Name",Cull_Name)
            //};
            return DBHelper.GetFillData(sql);
        }
    }
}
