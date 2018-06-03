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
    public partial class WebForm4 : System.Web.UI.Page
    {
        static bool flag;
        static bool informflag;
        static bool collectflag;
      
        protected void Page_Load(object sender, EventArgs e)
        {
            CKFinder.FileBrowser fileBrowser = new CKFinder.FileBrowser();
            fileBrowser.BasePath = "../ckfinder/";  //设置CKFinder的基路径  
            fileBrowser.SetupCKEditor(txtContent);
            if (!IsPostBack)
            {
                flag = true;
                //id = int.Parse(Request.QueryString["pro_id"].ToString());
                #region 绑定前台数据
                //BindNew();
                //BindTop();
                //BindTally();
                if (Request.QueryString["pro_id"] != null)
                {
                   
                    SqlDataReader proclassname = AcgService.select(int.Parse(Request.QueryString["pro_id"].ToString()));
                    proclassname.Read();
                    string classname=proclassname["Pro_Class"].ToString();
                     DataTable dt = AcgService.select1(int.Parse(Request.QueryString["pro_id"].ToString()));
                        if (classname == "视频")
                        {
                            
                            shiping.Visible = true;
                            otheracg.Visible = false;
                            acgdetall.DataSource = dt;
                            acgdetall.DataBind();
                        }
                        else
                        {
                            shiping.Visible = false;
                            otheracg.Visible = true;
                            Repeater2.DataSource = dt;
                            Repeater2.DataBind();
                        }
                    BindBC();
                    //显示总共多少评论
                    num.Text = CommentService.num(int.Parse(Request.QueryString["pro_id"].ToString())).ToString();

                }
                #endregion
                #region 举报收藏
                if (Session["User_ID"] != null && Request.QueryString["pro_id"].ToString() != null)
                {
                    SqlDataReader colletdt = CollectionBll.seletcCollect(int.Parse(Session["User_ID"].ToString()), int.Parse(Request.QueryString["pro_id"].ToString()));
                    colletdt.Read();
                    SqlDataReader informdt = InformBll.seletcInform(int.Parse(Session["User_ID"].ToString()), int.Parse(Request.QueryString["pro_id"].ToString()));
                    informdt.Read();
                    if (colletdt != null&&colletdt.HasRows==true)
                    {
                        collectbutton.CssClass = "btn btn-large";
                        collectbutton.Text = "已收藏";
                        collectflag = true;
                    }
                    else
                    {
                        collectbutton.CssClass = "btn btn-primary btn-large";
                        collectbutton.Text = "收藏";
                        collectflag = false;
                    }
                    if (informdt != null&&informdt.HasRows==true)
                    {
                       informbutton.CssClass = "btn btn-large";
                        informbutton.Text = "已举报";
                        informflag = true;
                    }else
                    {
                        informbutton.CssClass = "btn btn-danger btn-large";
                        informbutton.Text = "举报";
                        informflag = false;
                    }
                }
                #endregion
            }
        }
        #region 评论回复功能
        //发表评论
        protected void pinglun_Click(object sender, EventArgs e)
        {
            //Response.Redirect("~/Index.aspx");
            if (Session["User_ID"] != null)
            {
                try
                {
                    int id = Convert.ToInt32(Request.QueryString["pro_id"].ToString());
                    Comments comments = new Comments();
                    comments.Pro_ID = id;
                    comments.User_ID = int.Parse(Session["User_ID"].ToString());
                    comments.Comments_Time = DateTime.Now;
                    comments.Comments_Content = txtContent.Text;
                    if (CommentService.addcomments(comments) == 1)
                    {
                        txtContent.Text = "";
                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "updateScript", "alert('评论成功！');", true);
                        BindBC();
                       
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "updateScript", "alert('评论失败！');", true);
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("错误原因：" + ex.Message);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "updateScript", "alert('对不起，请先登录！');", true);
            }
        }
        //回复
        protected void huifu_Click(object sender, EventArgs e)
        {
            Button bt = (Button)sender;
            if (Session["User_ID"] != null)
            {
                try
                {
                    ReplyComments replycomments = new ReplyComments();
                    replycomments.ReplyComments_Content = (bt.Parent.FindControl("txtContent") as TextBox).Text;
                    replycomments.ReplyComments_Time = DateTime.Now;
                    replycomments.User_ID = int.Parse(Session["User_ID"].ToString());
                    replycomments.Comments_ID = Int32.Parse((bt.Parent.FindControl("HiddenField1") as HiddenField).Value);
                    if (ReplyCommentsService.addreplycomments(replycomments) == 1)
                    {
                        txtContent.Text = "";
                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "updateScript", "alert('回复评论成功！');", true);
                        flag = true;
                        BindBC();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "updateScript", "alert('回复评论失败！');", true);
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("错误原因：" + ex.Message);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "updateScript", "alert('对不起，请先登录！');", true);
            }
        }
        protected void BindBC()
        {
            int id = int.Parse(Request.QueryString["pro_id"].ToString());
            DataTable dt = CommentService.acgselect(id);
            if (dt != null)
            {
                listView1.DataSource = dt;
                listView1.DataBind();
            }
            
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton bt = (LinkButton)sender;
            Panel pl = (bt.Parent.FindControl("Panel1") as Panel);
            pl.Visible = !pl.Visible;
            flag = !flag;

        }
        protected void listView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            Repeater rpt = e.Item.FindControl("Repeater2") as Repeater;//找到里层的repeate;
            int commentsid = Convert.ToInt32(((Label)e.Item.FindControl("Label1")).Text);
            if ( Request.QueryString["pro_id"] != null)
            {
                rpt.DataSource = ReplyCommentsService.acgreplycomments( commentsid);
                rpt.DataBind();
            }

        }
        protected void DataPager1_PreRender(object sender, EventArgs e)
        {
            if (flag == true)
            {
                BindBC();
            }
        }
        #endregion


        //#region 绑定前台数据

        ////热度排行榜
        //private void BindTop()
        //{

        //    DataTable dt = AcgService.Top8();
        //    if (dt != null && dt.Rows.Count != 0)
        //    {
        //        Topacg.DataSource = dt;
        //        Topacg.DataBind();
        //    }


        //}
        ////右边最新分类
        //private void BindNew()
        //{
        //    string a = "视频";
        //    string b = "漫画";
        //    string c = "插画";
        //    DataTable dt = AcgService.acgTop4(a);
        //    if (dt != null && dt.Rows.Count != 0)
        //    {
        //        newShiping.DataSource = dt;
        //        newShiping.DataBind();
        //    }
        //    DataTable dt1 = AcgService.acgTop4(b);
        //    if (dt1 != null && dt1.Rows.Count != 0)
        //    {
        //        newManhua.DataSource = dt1;
        //        newManhua.DataBind();
        //    }
        //    DataTable dt2 = AcgService.acgTop4(c);
        //    if (dt2 != null && dt2.Rows.Count != 0)
        //    {
        //        newChahua.DataSource = dt2;
        //        newChahua.DataBind();
        //    }

        //}
        ////标签分类
        //private void BindTally()
        //{
        //    DataTable dt = TallyBll.allTally();
        //    if (dt != null && dt.Rows.Count != 0)
        //    {
        //        Repeater1.DataSource = dt;
        //        Repeater1.DataBind();
        //    }
        //}
        //#endregion

        protected string SplitChar(string sObj, int intLen)
        {
            if (sObj.Length > intLen)
            {
                return sObj.Substring(0, intLen) + "…";
            }
            return sObj;
        }
        #region 收藏按钮事件
        protected void collectbutton_Click(object sender, EventArgs e)
        {
            if (Session["User_ID"] != null)
            {
           
            if (collectflag==false)
            {
                Collection collection = new Collection();
                collection.User_ID = int.Parse(Session["User_ID"].ToString());
                collection.Pro_ID = int.Parse(Request.QueryString["pro_id"].ToString());
                collection.collect = "收藏";
                if (CollectionBll.addCollect(collection) == 1)
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "updateScript", "alert('收藏成功！');", true);
                    collectbutton.CssClass = "btn btn-large";
                    collectbutton.Text = "已收藏";
                    collectflag = true;
                }
               
            }else if (collectflag==true)
            {
               
                int  User_ID = int.Parse(Session["User_ID"].ToString());
                    int Pro_ID = int.Parse(Request.QueryString["pro_id"].ToString());
          
                if (CollectionBll.deleteCollect(User_ID,Pro_ID) == 1)
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "updateScript", "alert('取消收藏成功！');", true);
                    collectbutton.CssClass = "btn btn-primary btn-large";
                    collectbutton.Text = "收藏";
                    collectflag = false;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "updateScript", "alert('取消失败！');", true);
                }
            }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "updateScript", "alert('收藏失败，请登录！');", true);
            }
        }
        #endregion
        #region 举报按钮事件
        protected void informbutton_Click(object sender, EventArgs e)
        {
            if (Session["User_ID"] != null)
            {
                if (informflag == false)
            {
                Inform inform = new Inform();
                inform.User_ID = int.Parse(Session["User_ID"].ToString());
                    inform.Pro_ID = int.Parse(Request.QueryString["pro_id"].ToString());
                inform.results = "等待处理结果";
                if (InformBll.addInform(inform) == 1)
                {
                    informbutton.CssClass = "btn btn-large";
                    informbutton.Text = "已举报";
                    informflag = true;
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "updateScript", "alert('举报成功！请等待管理员处理');", true);
                }
            }
            else if (informflag == true)
            {
                int User_ID = int.Parse(Session["User_ID"].ToString());
                    int Pro_ID = int.Parse(Request.QueryString["pro_id"].ToString());

                if (InformBll.deleteInform(User_ID,Pro_ID) == 1)
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "updateScript", "alert('取消举报成功！');", true);
                    informbutton.CssClass = "btn btn-danger btn-large";
                    informbutton.Text = "举报";
                    informflag = false;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "updateScript", "alert('取消失败！');", true);
                }
            }
        }else
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "updateScript", "alert('举报失败，请登录！');", true);
                }

}
        #endregion
    }
}