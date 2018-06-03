using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NT_Models;
using System.Data;
using System.Configuration;
using NT_DAL;
namespace NT_BLL
{
   public class CommentService
    {
        private static SqlServerComments icomments = new SqlServerComments();
        public static DataTable usersSellect(int User_ID)
        {
            return icomments.usersSellect(User_ID);
        }
       
        //后台删除评论
        public static int DeleteComments(int Comments_ID)
        {
            return icomments.DeleteComments(Comments_ID);
        }
        //后台展现评论

        public static DataTable SelectAllpinlun()
        {
            return icomments.SelectAllpinlun();
        }
        //用户删除自己的某个评论
        public static int usersDelete(int Comments_ID)
        {
            return icomments.usersDelete(Comments_ID);
        }
        //查找在某个acg作品下的所有评论
        public static DataTable acgselect(int Pro_ID)
        {
            return icomments.acgselect(Pro_ID);
        }
        //显示某个acg作品下的评论数量
        public static int num(int Pro_ID)
        {
            return icomments.num(Pro_ID);
        }
        //发表评论
        public static int addcomments(Comments commnets)
        {
            return icomments.addcomments(commnets);
        }
        //用户展现自己作品被评论
        public static DataTable Select(int User_ID)
        {
            return icomments.Select(User_ID);
        }
        //用户展现自己评论被评论
        public static DataTable SelectBComments(int User_ID)
        {
            return icomments.SelectBComments(User_ID);
        }
    }
}
