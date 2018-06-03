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
using System.Configuration;

namespace WebApplication1
{
   
    public partial class WebForm13 : System.Web.UI.Page
    {
        static bool flag;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                flag = true;
                string a = "插画";
                DataTable dt = AcgService.SelectTay(a);
                if (dt != null && dt.Rows.Count != 0)
                {
                    Acgview.DataSource = dt;
                    Acgview.DataBind();
                }
            }
        }

        protected string SplitChar(string sObj, int intLen)
        {
            if (sObj.Length > intLen)
            {
                return sObj.Substring(0, intLen) + "…";
            }
            return sObj;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            flag = false;
            Button bt = (Button)sender;
            
            Response.Write("<script>alert('投票成功');</script>");
            
        }

    }
}