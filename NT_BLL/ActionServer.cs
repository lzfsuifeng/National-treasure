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
    public class ActionServer
    {
        private static SqlServerAction iaction = new SqlServerAction();
        //展现action
        public static SqlDataReader selectaction(int act_id)
        {
            return iaction.selectaction(act_id);
        }
        //后台展现
        public static DataTable selectAll()
        {
            return iaction.selectAll();
        }
        //后台增加
        public static int insert(NT_Models.Action action)
        {
            return iaction.insert(action);
        }
        //后台删除
        public static int DeleteAction(int Act_ID)
        {
            return iaction.DeleteAction(Act_ID);
        }
    }
}
