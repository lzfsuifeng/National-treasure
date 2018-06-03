using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using NT_BLL;
using NT_Models;

namespace WebApplication1
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                BindBC();
                #region 详细新闻信息
                if (Request.QueryString["act_id"] != null)
                {
                    SqlDataReader dt = ActionServer.selectaction(int.Parse(Request.QueryString["act_id"].ToString()));
                    dt.Read();
                    if (dt != null)
                    {
                       
                        newstime.Text = dt["Act_Time"].ToString();
                        newstitle.Text = dt["Act_Title"].ToString();
                        newscontent.Text = dt["Act_Content"].ToString();

                    }
                }
                #endregion
            }
        }
        #region 绑定前台数据

        private void BindBC()
        {
            DataTable dt = ActionServer.selectAll();
            if (dt != null && dt.Rows.Count != 0)
            {
                action.DataSource = dt;
                action.DataBind();
            }
        }
       
        #endregion
        protected string SplitChar(string sObj, int intLen)
        {
            if (sObj.Length > intLen)
            {
                return sObj.Substring(0, intLen) + "…";
            }
            return sObj;
        }
    }
}