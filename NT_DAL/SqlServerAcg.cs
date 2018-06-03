using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NT_Models;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace NT_DAL
{
   public  class SqlServerAcg
    {
        //查找某用户创建的ACG&文物内容
        public DataTable UserAcg(int User_ID)
        {
            string sql = "select * from ACG where User_ID='" + User_ID + "'";

            return DBHelper.GetFillData(sql);
        }
        //前台展现
        public DataTable SelectAll()
        {
            //string sql = "select a.*,b.Cull_Name from  ACG a,Cull b where a.Cull_Name=b.Cull_Name";
            //return DBHelper.GetFillData(sql);
            string sql = "select a.*,b.Tally_Name from  ACG a,Tally b where a.Tally_ID=b.Tally_ID";
            return DBHelper.GetFillData(sql);
        }
            
        //主页展现前几
        public DataTable SelectTop8()
        {
            string sql = "select top 8 * from ACG order by Pro_Time desc";
            return DBHelper.GetFillData(sql);
        }
        //根据ID查找ACG
        public SqlDataReader select(int Pro_ID)
        {
            string sql = "select * from ACG,Tally,UserInfo where ACG.Pro_ID='" + Pro_ID + "' and UserInfo.User_ID=ACG.User_ID and ACG.Tally_ID=Tally.Tally_ID";

            return DBHelper.GetDataReader(sql);
        }
        //根据ID查找ACG
        public DataTable select1(int Pro_ID)
        {
            string sql = "select * from ACG,Tally,UserInfo where ACG.Pro_ID='" + Pro_ID + "' and UserInfo.User_ID=ACG.User_ID and ACG.Tally_ID=Tally.Tally_ID";

            return DBHelper.GetFillData(sql);
        }
        //根据作品ID进行删除操作
        public int delete(int Pro_ID)
        {
            string sql= "delete from ACG where Pro_ID = '" + Pro_ID + "'";
            return DBHelper.GetExcuteNonQuery(sql);
        }
       //用户发表ACG作品
       public int addAcg(ACG acg)
        {
            string sql = "insert into ACG values(@User_ID, @Pro_Class, @Pro_Title, @Pro_Time, @Pro_Content, @Tally_ID, @Pro_Img)";
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("@User_ID",acg.User_ID),
                new SqlParameter("@Pro_Class",acg.Pro_Class),
                new SqlParameter("@Pro_Title",acg.Pro_Title),
                new SqlParameter("@Pro_Time",acg.Pro_Time),
                new SqlParameter("@Pro_Content",acg.Pro_Content),
                new SqlParameter("@Tally_ID",acg.Tally_ID),
                new SqlParameter("@Pro_Img",acg.Pro_Img)
            };
            return DBHelper.GetExcuteNonQuery(sql, sp);
            
        }
        //根据分类查找所有的ACG作品
        public DataTable selectacg(string Pro_Class)
        {
            string sql = "select *from ACG where Pro_Class=@Pro_Class";
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("@Pro_Class",Pro_Class)
            };
            return DBHelper.GetFillData(sql, sp);
        }
        //根据分类查找前八的ACG作品
        public DataTable acgTop9(string Pro_Class)
        {
            string sql = "select top 9 * from ACG,Tally,UserInfo where ACG.Pro_Class=@Pro_Class and UserInfo.User_ID=ACG.User_ID and ACG.Tally_ID=Tally.Tally_ID";
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("@Pro_Class",Pro_Class)
            };
            return DBHelper.GetFillData(sql, sp);
        }
        public DataTable acgTop6(string Pro_Class)
        {
            string sql = "select top 6 * from ACG,Tally,UserInfo where ACG.Pro_Class=@Pro_Class and UserInfo.User_ID=ACG.User_ID and ACG.Tally_ID=Tally.Tally_ID order by ACG.Pro_Time desc";
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("@Pro_Class",Pro_Class)
            };
            return DBHelper.GetFillData(sql, sp);
        }
        public DataTable acgTop3(string Pro_Class)
        {
            string sql = "select top 3 * from ACG,Tally,UserInfo where ACG.Pro_Class=@Pro_Class and UserInfo.User_ID=ACG.User_ID and ACG.Tally_ID=Tally.Tally_ID order by ACG.Pro_Time desc";
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("@Pro_Class",Pro_Class)
            };
            return DBHelper.GetFillData(sql, sp);
        }
        ////查找前6精华的Acg作品
        //public DataTable tuiguang()
        //{
        //    string sql = "select top 6*from ACG,Recommend where ACG.Pro_ID=Recommend.Pro_ID and Recommend.AcgRecommend='是'  order by Pro_Time desc";

        //    return DBHelper.GetFillData(sql);
        //}
        ////根据分类查找前五精华的Acg作品
        //public DataTable acgjinghua(string Pro_Class)
        //{
        //    string sql = "select top 5*from ACG,Recommend where ACG.Pro_ID=Recommend.Pro_ID and Recommend.AcgRecommend='是' and ACG.Pro_Class=@Pro_Class order by Pro_Time desc";
        //    SqlParameter[] sp = new SqlParameter[]
        //    {
        //        new SqlParameter("@Pro_Class",Pro_Class)
        //    };
        //    return DBHelper.GetFillData(sql, sp);
        //}

        //后台增加
        public int Insert(ACG acg)
        {
            string sql = "insert into ACG (Pro_Title,Tally_ID,User_ID,Pro_Img,Pro_Content,Pro_Class,Pro_Time) values(@Pro_Title,@Tally_ID,@User_ID,@Pro_Img,@Pro_Content,@Pro_Class,@Pro_Time)";
            SqlParameter[] sp = new SqlParameter[] {
                                                 new SqlParameter("@Pro_Title",acg.Pro_Title),
                                                  new SqlParameter("@Tally_ID",acg.Tally_ID),
                                                 new SqlParameter("@User_ID",acg.User_ID),
                                                 new SqlParameter("@Pro_Img",acg.Pro_Img),
                                                 new SqlParameter("@Pro_Content",acg.Pro_Content),
                                                 new SqlParameter("@Pro_Class",acg.Pro_Class),
                                                 new SqlParameter("@Pro_Time",acg.Pro_Time)};
            return DBHelper.GetExcuteNonQuery(sql, sp);
        }
        //根据分类（视频，漫画，插画），查询所有ACG
        public DataTable SelectTay(string Pro_Class)
        {
            string sql = "select * from ACG,Tally,UserInfo where ACG.Pro_Class=@Pro_Class and UserInfo.User_ID=ACG.User_ID and ACG.Tally_ID=Tally.Tally_ID";
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("@Pro_Class",Pro_Class)
            };
            return DBHelper.GetFillData(sql, sp);
        }
        //查询最新的8个ACG
        public DataTable Top6()
        {
            string sql = "select top 6 * from ACG,Tally,UserInfo where UserInfo.User_ID=ACG.User_ID and ACG.Tally_ID=Tally.Tally_ID ORDER BY Pro_Time DESC";
            return DBHelper.GetFillData(sql);
        }
      
        //根据分类 查询4最新个ACG
        public DataTable acgTop4(string Pro_Class)
        {
            string sql = "select top 4 *from ACG,Tally,UserInfo where ACG.Pro_Class=@Pro_Class and UserInfo.User_ID=ACG.User_ID and ACG.Tally_ID=Tally.Tally_ID";
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("@Pro_Class",Pro_Class)
            };
            return DBHelper.GetFillData(sql, sp);
        }
        //根据Tally_Name查询所有的ACG
        public DataTable SelectTally(string Tally_Name)
        {
            string sql = "select * from ACG a,Tally b where b.Tally_Name='"+ Tally_Name + "' and a.Tally_ID=b.Tally_ID order by Pro_Time desc";
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("Tally_Name",Tally_Name)
            };
            return DBHelper.GetFillData(sql, sp);
        }
        //根据标题模糊查询具体的ACG
        public DataTable SelectMoHu(string TiTle)
        {
            string sql = "select  * from ACG  where Pro_Title like '%" + TiTle + "%' ";
            return DBHelper.GetFillData(sql);
        }
    }
}
