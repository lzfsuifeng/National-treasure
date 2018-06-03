using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using NT_Models;
using NT_BLL;


namespace WebApplication1
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CKFinder.FileBrowser fileBrowser = new CKFinder.FileBrowser();
            fileBrowser.BasePath = "../ckfinder/";  //设置CKFinder的基路径  
            fileBrowser.SetupCKEditor(txtContent);
            UnobtrusiveValidationMode = new UnobtrusiveValidationMode();
            int id;
            if (!IsPostBack)
            {
                #region 前台panel控件可见与否

                if (Request.QueryString["menupanel"] != null)
                {
                    #region a1可见
                    if (Request.QueryString["menupanel"] == "a1")
                    {
                        a1.Visible = true;
                        b1.Visible = false;
                        b2.Visible = false;
                        c1.Visible = false;
                        c2.Visible = false;
                        c3.Visible = false;
                        c4.Visible = false;
                        d1.Visible = false;
                        d2.Visible = false;
                        d3.Visible = false;

                    }
                    #endregion
                    #region b1可见
                    if (Request.QueryString["menupanel"] == "b1")
                    {
                        a1.Visible = false;
                        b1.Visible = true;
                        b2.Visible = false;
                        c1.Visible = false;
                        c2.Visible = false;
                        c3.Visible = false;
                        c4.Visible = false;
                        d1.Visible = false;
                        d2.Visible = false;
                        d3.Visible = false;

                    }
                    #endregion
                    #region b2可见
                    if (Request.QueryString["menupanel"] == "b2")
                    {
                        a1.Visible = false;
                        b1.Visible = false;
                        b2.Visible = true;
                        c1.Visible = false;
                        c2.Visible = false;
                        c3.Visible = false;
                        c4.Visible = false;
                        d1.Visible = false;
                        d2.Visible = false;
                        d3.Visible = false;

                    }
                    #endregion
                    #region c1可见
                    if (Request.QueryString["menupanel"] == "c1")
                    {
                        a1.Visible = false;
                        b1.Visible = false;
                        b2.Visible = false;
                        c1.Visible = true;
                        c2.Visible = false;
                        c3.Visible = false;
                        c4.Visible = false;
                        d1.Visible = false;
                        d2.Visible = false;
                        d3.Visible = false;

                    }
                    #endregion
                    #region c2可见
                    if (Request.QueryString["menupanel"] == "c2")
                    {
                        a1.Visible = false;
                        b1.Visible = false;
                        b2.Visible = false;
                        c1.Visible = false;
                        c2.Visible = true;
                        c3.Visible = false;
                        c4.Visible = false;
                        d1.Visible = false;
                        d2.Visible = false;
                        d3.Visible = false;

                    }
                    #endregion
                    #region c3可见
                    if (Request.QueryString["menupanel"] == "c3")
                    {
                        a1.Visible = false;
                        b1.Visible = false;
                        b2.Visible = false;
                        c1.Visible = false;
                        c2.Visible = false;
                        c3.Visible = true;
                        c4.Visible = false;
                        d1.Visible = false;
                        d2.Visible = false;
                        d3.Visible = false;

                    }
                    #endregion
                    #region c4可见
                    if (Request.QueryString["menupanel"] == "c4")
                    {
                        a1.Visible = false;
                        b1.Visible = false;
                        b2.Visible = false;
                        c1.Visible = false;
                        c2.Visible = false;
                        c3.Visible = false;
                        c4.Visible = true;
                        d1.Visible = false;
                        d2.Visible = false;
                        d3.Visible = false;

                    }
                    #endregion
                    #region d1可见
                    if (Request.QueryString["menupanel"] == "d1")
                    {
                        a1.Visible = false;
                        b1.Visible = false;
                        b2.Visible = false;
                        c1.Visible = false;
                        c2.Visible = false;
                        c3.Visible = false;
                        c4.Visible = false;
                        d1.Visible = true;
                        d2.Visible = false;
                        d3.Visible = false;

                    }
                    #endregion
                    #region d2可见
                    if (Request.QueryString["menupanel"] == "d2")
                    {
                        a1.Visible = false;
                        b1.Visible = false;
                        b2.Visible = false;
                        c1.Visible = false;
                        c2.Visible = false;
                        c3.Visible = false;
                        c4.Visible = false;
                        d1.Visible = false;
                        d2.Visible = true;
                        d3.Visible = false;

                    }
                    #endregion
                    #region d3可见
                    if (Request.QueryString["menupanel"] == "d3")
                    {
                        a1.Visible = false;
                        b1.Visible = false;
                        b2.Visible = false;
                        c1.Visible = false;
                        c2.Visible = false;
                        c3.Visible = false;
                        c4.Visible = false;
                        d1.Visible = false;
                        d2.Visible = false;
                        d3.Visible = true;

                    }
                    #endregion

                }
                #endregion
                #region 如果用户登录了，将用户信息绑定
                overlogin.Visible = false;
                nologin.Visible = false;
                //如果用户登录了，将用户信息绑定
                if (Session["User_Name"] != null)
                {
                    overlogin.Visible = true;
                    //绑定ACG
                    BindAcg();
                    //绑定评论
                    BindComments();
                    //绑定留言
                    BindLeavewords();
                    //绑定他人评论
                    BindTComments();
                    //绑定他人留言
                    BindTLea();
                    //绑定被评论
                    BindReplyComments();
                    //绑定被回复             
                    BindReplyLeavewords();

                    SqlDataReader dt = UserInfoService.users(int.Parse(Session["User_ID"].ToString()));
                    dt.Read();
                    if (dt != null)
                    {
                        UserName.Text = dt[1].ToString();
                        UserEmail.Text = dt[4].ToString();
                        //Image1.ImageUrl = dt[3].ToString();
                        //UserPhone.Text = dt[5].ToString();
                        UserImg.ImageUrl = dt[3].ToString();
                    }
                    #region 修改用户信息
                  
                        if (Request.QueryString["queren"] != null)
                        {
                            if (ChangMima.Text.Trim() == ChangMima2.Text.Trim())
                            {
                                UserInfo user = new UserInfo();
                                user.User_ID = int.Parse(Session["User_ID"].ToString());
                                user.User_Name = ChangName.Text.Trim();
                                user.User_Password = ChangMima.Text.Trim();
                                user.User_Phone = ChangPhone.Text.Trim();
                                user.User_Email = ChangEmail.Text.Trim();
                                user.User_Img = "Img\\UserImg\\" + ChangImg.PostedFile.FileName;
                                if (UserInfoService.usersupdate(user) == 1)
                                {
                                    //Session["UserImg"] = @"~/User_Img/" + FileUpload_img.PostedFile.FileName;
                                    Page.ClientScript.RegisterClientScriptBlock(typeof(Object), "alert", "<script>alert('修改成功！');</script>");
                                }
                                else
                                {
                                    Page.ClientScript.RegisterClientScriptBlock(typeof(object), "alert", "<script>alert('修改失败！');</script>");

                                }
                            }
                            else
                            {
                                Page.ClientScript.RegisterClientScriptBlock(typeof(object), "alert", "<script>alert('前后密码不一致！');</script>");
                            }
                        }

                    
                    #endregion

                }
                else
                {
                    nologin.Visible = true;
                }


                #endregion
                 try
                {
                    #region Acg投稿数据绑定和删除

                    if (Request.QueryString["proid"] != null)
                    {
                        id = Convert.ToInt32(Request.QueryString["proid"].ToString());
                        if (AcgService.delete(id) == 1)
                        {
                            BindAcg();
                            Page.ClientScript.RegisterClientScriptBlock(typeof(Object), "alert", "<script>alert('删除成功！');</script>");
                        }
                        else
                        {
                            Page.ClientScript.RegisterClientScriptBlock(typeof(Object), "alert", "<script>alert('删除删除失败！');</script>");
                        }

                    }
                    #endregion

                    #region 用户评论删除

                    if (Request.QueryString["commentsid"] != null)
                    {
                        id = Convert.ToInt32(Request.QueryString["commentsid"].ToString());
                        if (CommentService.usersDelete(id) == 1)
                        {
                            BindComments();
                            Page.ClientScript.RegisterClientScriptBlock(typeof(Object), "alert", "<script>alert('删除成功！');</script>");
                        }
                        else
                        {
                            Page.ClientScript.RegisterClientScriptBlock(typeof(Object), "alert", "<script>alert('删除删除失败！');</script>");
                        }

                    }
                    #endregion

                    #region 用户回复数据绑定和删除

                    if (Request.QueryString["Leavewordsid"] != null)
                    {
                        id = Convert.ToInt32(Request.QueryString["Leavewordsid"].ToString());
                        if (LeavewordsService.usersDelete(id) == 1)
                        {
                            BindLeavewords();
                            Page.ClientScript.RegisterClientScriptBlock(typeof(Object), "alert", "<script>alert('删除成功！');</script>");
                        }
                        else
                        {
                            Page.ClientScript.RegisterClientScriptBlock(typeof(Object), "alert", "<script>alert('删除删除失败！');</script>");
                        }

                    }
                    #endregion

                }
                 catch (Exception ex)
                 {

                 }
            }
            
        }
        #region 数据绑定
        //绑定用户创作的作品
        protected void BindAcg()
        {
            UserIndex_Acg.DataSource = AcgService.UserAcg(int.Parse(Session["User_ID"].ToString()));
            UserIndex_Acg.DataBind();
        }
        //绑定评论
        protected void BindComments()
        {
            UserIndex_Comments.DataSource = CommentService.usersSellect(int.Parse(Session["User_ID"].ToString()));
            UserIndex_Comments.DataBind();
        }
        //绑定留言
        protected void BindLeavewords()
        {
            UserIndex_Leavewords.DataSource = LeavewordsService.usersSellect(int.Parse(Session["User_ID"].ToString()));
            UserIndex_Leavewords.DataBind();
        }
        //绑定他人评论
        protected void BindTComments()
        {
            ListView2.DataSource = ReplyCommentsService.replyusers(int.Parse(Session["User_ID"].ToString()));
            ListView2.DataBind();
        }
        //绑定他人留言
        protected void BindTLea()
        {
            ListView1.DataSource = ReplyLeavewordsService.replayuser(int.Parse(Session["User_ID"].ToString()));
            ListView1.DataBind();
        }
        //绑定作品被评论
        protected void BindReplyComments()
        {
            ListView3.DataSource = CommentService.Select(int.Parse(Session["User_ID"].ToString()));
            ListView3.DataBind();
        }
        //绑定被评论
        protected void BindBComments()
        {
            UserIndex_replaycomments.DataSource= CommentService.SelectBComments(int.Parse(Session["User_ID"].ToString()));
            UserIndex_replaycomments.DataBind();
        }
        //绑定被回复
        protected void BindReplyLeavewords()
        {
            UserIndex_replayleawords.DataSource = LeavewordsService.SelectBLae(int.Parse(Session["User_ID"].ToString()));
            UserIndex_replayleawords.DataBind();
        }
        #endregion
        #region
        //发表ACG创作
        protected void AddNews_Click(object sender, EventArgs e)
        {
            ACG acg = new ACG();
            acg.Pro_Title = txtTitle.Text.Trim();
            acg.User_ID = int.Parse(Session["User_ID"].ToString());
            //news.AssID = 1;
            acg.Pro_Img = "Img/ACGImg/" + FileUpload1.PostedFile.FileName;
            acg.Pro_Content = txtContent.Text.Trim();
            acg.Pro_Class = this.DropDownList2.SelectedItem.ToString();
            switch (DropDownList3.SelectedItem.ToString())
            {
                case "国家宝藏":
                    acg.Tally_ID = 1;
                    break;
                case "汉服":
                    acg.Tally_ID = 2;
                    break;
                case "青铜器":
                    acg.Tally_ID = 3;
                    break;
                case "瓷器":
                    acg.Tally_ID = 4;
                    break;
                case "金银器":
                    acg.Tally_ID = 5;
                    break;
            }
            acg.Pro_Time = DateTime.Now;
            int result = AcgService.Insert(acg);
            if (result >= 1)
            {
                Response.Write("<script>alert('发布成功!')</script>");
            }
            //user.User_Img = @"~/User_Img/" + ChangImg.PostedFile.FileName;
        }
        #endregion
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload.HasFile)//判断上传框是否有文件
            {
                bool FileOK = false;//初始化文件格式是否正确
                string FileExtension = System.IO.Path.GetExtension(FileUpload.FileName.ToLower());
                string[] allowedExtension = { ".jpg", ".jpeg", ".gif", ".png", ".bmp" };//设置允许上传的文件类型
                for (int i = 0; i < allowedExtension.Length; i++)
                {
                    if (FileExtension == allowedExtension[i])
                    {
                        FileOK = true;
                    }
                }
                if (FileOK)//文件类型正确
                {
                    try
                    {
                        string SavePath = Server.MapPath("~/Img/ACGImg/");//指定上传文件在服务器上的保存路径
                        if (!System.IO.Directory.Exists(SavePath))//检查服务器上是否存在这个物理路径，如果不存在则创建
                        {
                            System.IO.Directory.CreateDirectory(SavePath);
                        }
                        SavePath = SavePath + "\\" + FileUpload.FileName;
                        FileUpload.SaveAs(SavePath);
                        Session["DocAddr"] = "UploadFiles\\Documents\\" + Session["UserName"] + "\\" + FileUpload.FileName;
                        Response.Write("<script>alert('上传成功');</script>");
                        Label2.Text = "Img\\ACGImg\\" + FileUpload.FileName;
                        //this.btnUpload.Enabled = false;
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('上传失败');</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('上传的文件格式不正确，请重新选择！');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('请选择需要上传的文件！');</script>");
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)//判断上传框是否有文件
            {
                bool FileOK = false;//初始化文件格式是否正确
                string FileExtension = System.IO.Path.GetExtension(FileUpload1.FileName.ToLower());
                string[] allowedExtension = { ".mp4" };//设置允许上传的文件类型
                for (int i = 0; i < allowedExtension.Length; i++)
                {
                    if (FileExtension == allowedExtension[i])
                    {
                        FileOK = true;
                    }
                }
                if (FileOK)//文件类型正确
                {
                    try
                    {
                        string SavePath = Server.MapPath("~/video/");//指定上传文件在服务器上的保存路径
                        if (!System.IO.Directory.Exists(SavePath))//检查服务器上是否存在这个物理路径，如果不存在则创建
                        {
                            System.IO.Directory.CreateDirectory(SavePath);
                        }
                        SavePath = SavePath + "\\" + FileUpload1.FileName;
                        FileUpload1.SaveAs(SavePath);
                        Session["DocAddr"] = "UploadFiles\\Documents\\" + Session["UserName"] + "\\" + FileUpload1.FileName;
                        Response.Write("<script>alert('上传成功');</script>");
                        Label1.Text = "video\\" + FileUpload1.FileName;
                        //this.btnUpload.Enabled = false;
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('上传失败');</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('上传的文件格式不正确，请重新选择！');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('请选择需要上传的文件！');</script>");
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            try
            {
                if (Label2.Text.Trim() == "")
                {
                    Response.Write("<script>alert('照片不能为空!')</script>");
                }
                else
                {
                    ACG acg = new ACG();
                    acg.Pro_Title = txtTitle.Text.Trim();
                    acg.User_ID = 5;
                    //news.AssID = 1;
                    acg.Pro_Img = Label2.Text;
                    acg.Pro_Content = Label1.Text;
                    acg.Pro_Class = this.DropDownList2.SelectedItem.ToString();
                    switch (DropDownList3.SelectedItem.ToString())
                    {
                        case "国家宝藏":
                            acg.Tally_ID = 1;
                            break;
                        case "汉服":
                            acg.Tally_ID = 2;
                            break;
                        case "青铜器":
                            acg.Tally_ID = 3;
                            break;
                        case "瓷器":
                            acg.Tally_ID = 4;
                            break;
                        case "金银器":
                            acg.Tally_ID = 5;
                            break;
                    }
                    acg.Pro_Time = DateTime.Now;
                    int result = AcgService.Insert(acg);
                    if (result >= 1)
                    {
                        txtContent.Text = "";
                        Label2.Text = "Img\\ACGImg\\";
                        Label1.Text = "video\\";
                        txtTitle.Text = "";
                        Response.Write("<script>alert('发布成功!')</script>");
                    }

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('上传失败');</script> 原因是：" + ex);
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {

        }

        //protected void AddNews_Click(object sender, EventArgs e)
        //{
        //    ACG acg = new ACG();
        //    acg.Pro_Title = txtTitle.Text.Trim();
        //    acg.User_ID = 5;
        //    //news.AssID = 1;
        //    acg.Pro_Img = Label2.Text;
        //    acg.Pro_Content = txtContent.Text;
        //    acg.Pro_Class = this.DropDownList2.SelectedItem.ToString();
        //    switch (DropDownList3.SelectedItem.ToString())
        //    {
        //        case "国家宝藏":
        //            acg.Tally_ID = 1;
        //            break;
        //        case "汉服":
        //            acg.Tally_ID = 2;
        //            break;
        //        case "青铜器":
        //            acg.Tally_ID = 3;
        //            break;
        //        case "瓷器":
        //            acg.Tally_ID = 4;
        //            break;
        //        case "金银器":
        //            acg.Tally_ID = 5;
        //            break;
        //    }
        //    acg.Pro_Time = DateTime.Now;
        //    int result = AcgService.Insert(acg);
        //    if (result >= 1)
        //    {
        //        txtContent.Text = "";
        //        Label2.Text = "Img\\ACGImg\\";
        //        txtTitle.Text = "";
        //        Response.Write("<script>alert('发布成功!')</script>");
        //    }
        //}



        protected string SplitChar(string sObj, int intLen)
        {
            if (sObj.Length > intLen)
            {
                return sObj.Substring(0, intLen) + "…";
            }
            return sObj;
        }
        //留言删除
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button bt = (Button)sender;
            int id = Convert.ToInt32(((HiddenField)(bt.Parent.FindControl("HiddenField1"))).Value);
            if (LeavewordsService.usersDelete(id) > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "message", "<script language='javascript' >alert('删除成功！');</script>");
            }
        }
        //评论删除
        protected void btnDelete1_Click(object sender, EventArgs e)
        {
            Button bt = (Button)sender;
            int id = Convert.ToInt32(((HiddenField)(bt.Parent.FindControl("HiddenField2"))).Value);
            if (CommentService.usersDelete(id) > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "message", "<script language='javascript' >alert('删除成功！');</script>");
            }
        }
        //回复他人留言删除
        protected void btnDelete2_Click(object sender, EventArgs e)
        {
            Button bt = (Button)sender;
            int id = Convert.ToInt32(((HiddenField)(bt.Parent.FindControl("HiddenField3"))).Value);
            if (ReplyLeavewordsService.Delete(id)> 0)
            {
                BindReplyLeavewords();
                Page.ClientScript.RegisterClientScriptBlock(typeof(Object), "alert", "<script>alert('删除成功！');</script>");
            }
        }
        //回复他人的评论删除
        protected void btnDelete3_Click(object sender, EventArgs e)
        {
            Button bt = (Button)sender;
            int id = Convert.ToInt32(((HiddenField)(bt.Parent.FindControl("HiddenField4"))).Value);
            if (ReplyCommentsService.Delete(id) > 0)
            {
                BindTComments();
                Page.ClientScript.RegisterClientScriptBlock(typeof(Object), "alert", "<script>alert('删除成功！');</script>");
            }
        }
    }
}