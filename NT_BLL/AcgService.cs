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
   public class AcgService
    {
        private static SqlServerAcg iacg = new SqlServerAcg();
        //查找某用户创建的ACG&文物内容
        public static DataTable UserAcg(int User_ID)
        {
            return iacg.UserAcg(User_ID);
        }
        //根据ID查找ACG
        public static SqlDataReader select(int Pro_ID)
        {
            return iacg.select(Pro_ID);
        }
        
        //根据ID查找ACG
        public static DataTable select1(int Pro_ID)
        {
            return iacg.select1(Pro_ID);
        }
        //后台展现
        public static DataTable SelectAll()
        {
            return iacg.SelectAll();
        }
        //根据分类查找前八的ACG作品
        public static DataTable acgTop9(string Pro_Class)
        {
            return iacg.acgTop9(Pro_Class);
        }
        public static DataTable acgTop6(string Pro_Class)
        {
            return iacg.acgTop6(Pro_Class);
        }
        public static DataTable acgTop3(string Pro_Class)
        {
            return iacg.acgTop3(Pro_Class);
        }
        //展现前8
        public static DataTable Top6()
        {
            return iacg.Top6();
        }
        //根据作品ID进行删除操作
        public static int delete(int Pro_ID)
        {
            return iacg.delete(Pro_ID);
        }
        //用户发表ACG作品
        public static int addAcg(ACG acg)
        {
            return iacg.addAcg(acg);
        }
        //根据分类查找所有的ACG作品
        public static DataTable selectacg(string Pro_Class)
        {
            return iacg.selectacg(Pro_Class);
        }
        //根据分类查找前4的ACG作品
        public static DataTable acgTop4(string Pro_Class)
        {
            return iacg.acgTop4(Pro_Class);
        }
        ////根据分类查找前五精华的Acg作品
        //public static DataTable acgjinghua(string Pro_Class)
        //{
        //    return iacg.acgjinghua(Pro_Class);
        //}
        ////查找前6精华的Acg作品
        //public static DataTable tuiguang()
        //{
        //    return iacg.tuiguang();
        //}
        //后台增加
        public static int Insert(ACG acg)
        {
            return iacg.Insert(acg);
        }
        //根据分类名显示
        public static DataTable SelectTay(string Pro_Class)
        {
            return iacg.SelectTay(Pro_Class);
        }
        //根据标签名显示
        public static DataTable SelectTally(string Tally_Name)
        {
            return iacg.SelectTally(Tally_Name);
        }
        //根据标题模糊查询具体的ACG
        public static DataTable SelectMoHu(string TiTle)
        {
            return iacg.SelectMoHu(TiTle);
        }
     }
}
