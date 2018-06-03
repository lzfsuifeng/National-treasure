using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NT_Models;
using NT_BLL;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication1
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindNews();
                BindNews1();
                BindNews2();
            }
        }
        #region 绑定前台数据
      
        //前世今生数据
        private void BindNews()
        {
            DataTable dt = NewsService.SelectAll();
            if (dt != null && dt.Rows.Count != 0)
            {
                Newsview.DataSource = dt;
                Newsview.DataBind();
            }
        }
        //热门数据
        private void BindNews1()
        {
            DataTable dt = NewsService.SelectAll();
            if (dt != null && dt.Rows.Count != 0)
            {
                TopNews.DataSource = dt;
                TopNews.DataBind();
            }
        }
        //最新数据
        private void BindNews2()
        {
            DataTable dt = NewsService.SelectAll();
            if (dt != null && dt.Rows.Count != 0)
            {
                newNews.DataSource = dt;
                newNews.DataBind();
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