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
    public class CollectionBll
    {
        private static CollectionDal icollection = new CollectionDal();
        //增加收藏
        public static int addCollect(Collection collection)
        {

            return icollection.addCollect(collection);
        }
        //取消收藏
        public static int deleteCollect(int User_ID, int Pro_ID)
        {
            return icollection.deleteCollect(User_ID, Pro_ID);
        }
        //查询收藏
        public static SqlDataReader seletcCollect(int User_ID, int Pro_ID)
        {
            return icollection.seletcCollect(User_ID, Pro_ID);
        }
    }
}
