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
   public class ReplyCommentsService
    {
        private static SqlServerReplyComments ireplycomments = new SqlServerReplyComments();
        //删除
        public static int Delete(int ReplyComments_ID)
        {
            return ireplycomments.Delete(ReplyComments_ID);
        }
        //展现
        public static DataTable SelectAll()
        {
            return ireplycomments.SelectAll();
        }
        //提到某用户的评论
        public static DataTable replyusers(int User_ID)
        {
            return ireplycomments.replyusers(User_ID);
        }
        //查找某用户在某ACG创作中的二级评论
        public static  DataTable acgreplycomments( int Comments_ID)
        {
            return ireplycomments.acgreplycomments( Comments_ID);
        }
        //添加被评论
        public static int addreplycomments(ReplyComments replycomments)
        {
            return ireplycomments.addreplycomments(replycomments);
        }
    }
}
