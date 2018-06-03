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
   public class NewsService
    {
        public static SqlServerNewsinfo inewsinfo = new SqlServerNewsinfo();
        //后台删除
        public static int Delete(int News_ID)
        {
            return inewsinfo.Delete(News_ID);
        }

        //后台展现
        public static DataTable SelectAll()
        {
            return inewsinfo.SelectAll();
        }
        //根据ID展示
        public static SqlDataReader SelectID(int News_ID)
        {
            return inewsinfo.SelectID(News_ID);
        }
        //根据ID展示
        public static DataTable  SelectID1(int News_ID)
        {
            return inewsinfo.SelectID1(News_ID);
        }
        //前台展现前几
        public static DataTable SelectTop(int top)
        {
            return inewsinfo.SelectTop(top);
        }
        //根据文物ID查询所有新闻
        public static DataTable selectCull(int Cull_ID)
        {
            return inewsinfo.selectCull(Cull_ID);
        }
        //后台增加新闻
        public static int Insert(Newsinfo news)
        {
            return inewsinfo.Insert(news);
        }

    }
}
