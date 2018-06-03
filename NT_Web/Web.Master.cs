using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using NT_BLL;
using NT_Models;

namespace WebApplication1
{
    public partial class Web : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["User_Name"] != null)
                {
                    PanelUserInfo.Visible = true;
                    PanelLogin.Visible = false;
                    UserName .Text= Session["User_Name"].ToString();
                    img.ImageUrl = Session["User_Img"].ToString();
                }
                else
                {
                    PanelLogin.Visible = true;
                    PanelUserInfo.Visible = false;

                }
            }
        }
        
    }
}