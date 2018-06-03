using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using NT_Models;
using System.Data;

namespace NT_DAL
{
   public  class SqlServerNewsinfo
    {
        //根据ID展现
        public SqlDataReader SelectID(int News_ID)
        {
            string sql = "select  * from News where News_ID=@News_ID";
            SqlParameter[] sp = new SqlParameter[]{
                new SqlParameter("@News_ID",News_ID)
            };
            return DBHelper.GetDataReader(sql,sp);
        }
        //根据ID展现
        public DataTable  SelectID1(int News_ID)
        {
            string sql = "select  * from News where News_ID=@News_ID";
            SqlParameter[] sp = new SqlParameter[]{
                new SqlParameter("@News_ID",News_ID)
            };
            return DBHelper.GetFillData(sql, sp);
        }
        //删除
        public int Delete(int News_ID)
        {
            string sql = "delete from News where News_ID=@News_ID";
            SqlParameter[] sp = new SqlParameter[]
            { 
                new SqlParameter("@News_ID", News_ID) 
            };
            return DBHelper.GetExcuteNonQuery(sql, sp);
        }
        //根据文物查询相关的新闻
        public DataTable selectCull(int Cull_ID)
        {
            string sql = "select * from News,Cull where News.Cull_ID=@Cull_ID and Cull.Cull_ID=News.Cull_ID";
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("@Cull_ID",Cull_ID)
            };
            return DBHelper.GetFillData(sql, sp);
        }

        //展现
        public DataTable SelectAll()
        {
            string sql = "select a.*,b.Cull_Name from News a,Cull b where a.Cull_ID=b.Cull_ID ";
            return DBHelper.GetFillData(sql);
        }
        //展现前几调用时输入具体数字
        public DataTable SelectTop(int top)
        {
            string sql = "select  top " + top + " * from News order by News_Time desc";

            return DBHelper.GetFillData(sql);
        }
        //后台新闻增加
        public int Insert(Newsinfo news)
        {
            string sql = "insert into News(News_Title,News_Img,News_Content,Cull_ID,News_Time) values(@News_Title,@News_Img,@News_Content,@Cull_ID,@News_Time)";
            SqlParameter[] sp = new SqlParameter[] {
                                                 new SqlParameter("@News_Title",news.News_Title),
                                                 new SqlParameter("@News_Img",news.News_Img),
                                                 new SqlParameter("@News_Content",news.News_Content),
                                                 new SqlParameter("@Cull_ID",news.Cull_ID),
                                                 new SqlParameter("@News_Time",news.News_Time)};
            return DBHelper.GetExcuteNonQuery(sql, sp);
        }

    }
}
