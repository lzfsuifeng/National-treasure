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
    public class InformBll
    {
        private static InformDal iinform = new InformDal();
        //增加举报
        public static int addInform(Inform inform)
        {

            return iinform.addInform(inform);
        }
        //取消举报
        public static int deleteInform(int User_ID, int Pro_ID)
        {
            return iinform.deleteInform(User_ID, Pro_ID);
        }
        //查询举报
        public static SqlDataReader seletcInform(int User_ID, int Pro_ID)
        {
            return iinform.seletcInform(User_ID, Pro_ID);
        }


    }
}
