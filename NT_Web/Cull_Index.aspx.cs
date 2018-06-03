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
    public partial class WebForm7 : System.Web.UI.Page
    {
        static string cull_name;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindClass();

                if (Request.QueryString["flag"] == "true")
                {
                    DataTable dt = CullService.mohu(cull_name);
                    if (dt != null && dt.Rows.Count != 0)
                    {
                        cullview.DataSource = dt;
                        cullview.DataBind();
                    }
                    cullpanel.Visible = false;
                    cullpanel2.Visible = true;

                }else
                {
                    cullpanel.Visible = true;
                    cullpanel2.Visible = false;
                   
                    BindCull();
                }
               
            }
        }
        #region 绑定前台数据
        //绑定朝代分类数据
        protected void BindClass()
        {
            DataTable dt = DynBll.allDyn();
            if (dt != null && dt.Rows.Count != 0)
            {
                dynlist.DataSource = dt;
                dynlist.DataBind();
            }
            DataTable dt1 = ClassificationBll.allclass();
            if (dt1 != null && dt1.Rows.Count != 0)
            {
                classlist.DataSource = dt1;
                classlist.DataBind();
            }
        }
        //绑定文物数据
        private void BindCull()
        {
            //唐
            DataTable dt = CullService.SelectCullDyn(6);
            if (dt != null && dt.Rows.Count != 0)
            {
                tanglist.DataSource = dt;
                tanglist.DataBind();
            }
            //宋
            DataTable dt1 = CullService.SelectCullDyn(8);
            if (dt1 != null && dt1.Rows.Count != 0)
            {
                songlist.DataSource = dt1;
                songlist.DataBind();
            }
            //书画
            DataTable dt2 = CullService.SelectCullClass(8);
            if (dt2 != null && dt2.Rows.Count != 0)
            {
                shuhualist.DataSource = dt2;
                shuhualist.DataBind();
            }
            //书画
            DataTable dt3 = CullService.SelectCullClass(1);
            if (dt3 != null && dt3.Rows.Count != 0)
            {
                qingtonglist.DataSource = dt3;
                qingtonglist.DataBind();
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
        //模糊查找
        protected void select_Click(object sender, EventArgs e)
        {
            //flag = true;
            //cullpanel2.Visible = true;
            //cullpanel.Visible = false;
            cull_name = txtCullname.Text;
          
            Response.Redirect("~/Cull_Index.aspx?flag=true");
        }
    }
}