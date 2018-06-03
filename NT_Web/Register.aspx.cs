using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NT_Models;
using NT_BLL;
using System.Data.SqlClient;
namespace NT_Web
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void login_Button1_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                try
                {
                    string img = "Img/UserImg.jpg";
                    UserInfo us = new UserInfo();
                    us.User_Name = txtName.Text.Trim();
                    us.User_Img = img;
                    us.User_Password = txtPassword.Text.Trim();
                    us.User_Email = TextBox1.Text.Trim();
                    us.User_Phone = TextBox2.Text.Trim();

                    int i = UserInfoService.Insert(us);
                    if (i >= 1)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "true", "<script>alert('注册成功！');location='Login.aspx'</script>");
                    }

                }
                catch (Exception ex)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "true", "<script>alert('注册失败！失败原因如下：" + ex.Message + "');</script>");
                    Response.Write("错误原因：" + ex);
                }

            }
        }
    }
}