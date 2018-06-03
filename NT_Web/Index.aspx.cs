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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCull();
                BindNews();
                BindAcg();
                BindLunbo();
            }
        }
        #region 绑定前台数据
        //轮播图片
        private void BindLunbo()
        {

            DataTable dt = ActionServer.selectAll();
            if (dt != null && dt.Rows.Count != 0)
            {
                lunbo1.DataSource = dt;
                lunbo1.DataBind();
                lunbo2.DataSource = dt;
                lunbo2.DataBind();
            }


        }
        //文物宝鉴数据
        private void BindCull()
        {
            DataTable dt = CullService.SelectTop8();
            if (dt != null && dt.Rows.Count != 0)
            {
                cullview.DataSource = dt;
                cullview.DataBind();
            }
        }
        //前世今生数据
        private void BindNews()
        {
            DataTable dt = NewsService.SelectAll();
            if (dt != null && dt.Rows.Count != 0)
            {
                news.DataSource = dt;
                news.DataBind();
            }
        }
        //最新几个的acg数据
        private void BindAcg()
        {
            DataTable dt = AcgService.Top6();
            if (dt != null && dt.Rows.Count != 0)
            {
                acgview.DataSource = dt;
                acgview.DataBind();
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