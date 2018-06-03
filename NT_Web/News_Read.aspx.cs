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
    public partial class WebForm10 : System.Web.UI.Page
    {
        static bool flag;
      
        protected void Page_Load(object sender, EventArgs e)
        {
            CKFinder.FileBrowser fileBrowser = new CKFinder.FileBrowser();
            fileBrowser.BasePath = "../ckfinder/";  //设置CKFinder的基路径  
            fileBrowser.SetupCKEditor(txtContent);
            if (!IsPostBack)
            {
                flag = true;
                //BindNews1();
                //BindNews2();
                BindBC();
                #region 详细新闻信息
                if (Request.QueryString["id"] != null)
                {
                    DataTable  dt = NewsService.SelectID1(int.Parse(Request.QueryString["id"].ToString()));
                                     
                    if (dt != null)
                    {
                        newsdetail.DataSource = dt;
                        newsdetail.DataBind();            

                    }
                }
                #endregion
            }
        }
        #region 评论回复功能
        //发表评论
        protected void pinglun_Click(object sender, EventArgs e)
        {
            if (Session["User_ID"] != null)
            {
                try
                {
                    int id = Convert.ToInt32(Request.QueryString["id"].ToString());
                    Leavewords leavewords = new Leavewords();
                    leavewords.News_ID= id;
                    leavewords.User_ID = int.Parse(Session["User_ID"].ToString());
                    leavewords.Leavewords_Time = DateTime.Now;
                    leavewords.Leavewords_Content = txtContent.Text;
                    if (LeavewordsService.InsertLeavewords(leavewords)  == 1)
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
                    ReplyLeavewords reply = new ReplyLeavewords();
                    reply.ReplyLeavewords_Comment = (bt.Parent.FindControl("txtContent") as TextBox).Text;
                    reply.ReplyLeavewords_Time = DateTime.Now;
                    reply.User_ID = int.Parse(Session["User_ID"].ToString());
                    reply.Leavewords_ID = Int32.Parse((bt.Parent.FindControl("HiddenField1") as HiddenField).Value);
                    if (ReplyLeavewordsService.InsertReplyLeavewords(reply)==1)
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
            int id = int.Parse(Request.QueryString["id"].ToString());
            DataTable dt = LeavewordsService.SelectLeavewords(id);
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
            int Leavewords_ID = Convert.ToInt32(((Label)e.Item.FindControl("Label1")).Text);
            if ( Request.QueryString["id"] != null)
            {
                rpt.DataSource = ReplyLeavewordsService.SelectReplyLeavewords( Leavewords_ID);
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

        ////热门数据
        //private void BindNews1()
        //{
        //    DataTable dt = NewsService.SelectAll();
        //    if (dt != null && dt.Rows.Count != 0)
        //    {
        //        TopNews.DataSource = dt;
        //        TopNews.DataBind();
        //    }
        //}
        ////最新数据
        //private void BindNews2()
        //{
        //    DataTable dt = NewsService.SelectAll();
        //    if (dt != null && dt.Rows.Count != 0)
        //    {
        //        newNews.DataSource = dt;
        //        newNews.DataBind();
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
    }
}