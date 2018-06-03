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
    public partial class WebForm12 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {              
                BindNews1();
                BindNews2();
                if (Request.QueryString["cull_id"] != null)
                {
                    DataTable cull = CullService.culldetail1(int.Parse(Request.QueryString["cull_id"].ToString()));
                    //cull.Read();
                    Repeater1.DataSource = cull;
                    Repeater1.DataBind();
                    //cullname.Text = cull[1].ToString();
                    DataTable dt = NewsService.selectCull(int.Parse(Request.QueryString["cull_id"]));
                    if (dt != null && dt.Rows.Count != 0)
                    {
                        Newsview.DataSource = dt;
                        Newsview.DataBind();
                    }
                }
            }
        }
        #region 绑定前台数据
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