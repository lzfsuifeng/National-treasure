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
    public partial class WebForm8 : System.Web.UI.Page
    {
        static string iddyn;
        static string idclass;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindClass();
                classpanel.Visible = false;
                dynpanel.Visible = false;
               
                #region 朝代进来
                if (Request.QueryString["dynid"] != null)
                {
                    dynpanel.Visible = true;                
                    if (Request.QueryString["dynid"] == "dyn")
                    {
                        //全部数据
                        dyn.Text = "朝代";
                        iddyn = "朝代";
                        DataTable dt = CullService.SelectAll();
                        if (dt != null && dt.Rows.Count != 0)
                        {
                            cullview.DataSource = dt;
                            cullview.DataBind();
                        }
                      
                    }
                    else
                    {
                        
                        iddyn =Request.QueryString["dynid"].ToString();
                        //根据分类ID查询分类名或者朝代名
                        SqlDataReader dynname = DynBll.dynname(int.Parse(Request.QueryString["dynid"].ToString()));
                        dynname.Read();
                        dyn.Text = dynname["Dyn_Name"].ToString();                       
                        //根据朝代绑定前台数据
                        DataTable dt = CullService.SelectCullDyn(int.Parse(Request.QueryString["dynid"].ToString()));
                        if (dt != null && dt.Rows.Count != 0)
                        {
                            cullview.DataSource = dt;
                            cullview.DataBind();
                        }
                        
                    }                                  
                }
                #endregion
                #region 页面内分类查询
                if (Request.QueryString["class2"] != null)
                {                    
                    classpanel.Visible = true;
                    
                    //根据分类ID查询分类名或者朝代名
                    SqlDataReader classname = ClassificationBll.clssname(int.Parse(Request.QueryString["class2"].ToString()));
                    classname.Read();                   
                    cullclass.Text = classname["Class_Name"].ToString();
                    if (iddyn == "朝代")
                    {
                        dyn.Text = iddyn;
                        //根据朝代和分类绑定前台数据
                        DataTable dt2 = CullService.SelectCullClass(int.Parse(Request.QueryString["class2"]));
                        if (dt2 != null && dt2.Rows.Count != 0)
                        {
                            cullview.DataSource = dt2;
                            cullview.DataBind();
                        }
                    }
                    else
                    {
                        //根据分类ID查询分类名或者朝代名
                        SqlDataReader dynname = DynBll.dynname(int.Parse(iddyn));
                        dynname.Read();
                        dyn.Text = dynname["Dyn_Name"].ToString();
                        DataTable dt2 = CullService.SelectCullClassDyn(int.Parse(iddyn), int.Parse(Request.QueryString["class2"].ToString()));
                        if (dt2 != null && dt2.Rows.Count != 0)
                        {
                            cullview.DataSource = dt2;
                            cullview.DataBind();
                        }
                    }

                }
                #endregion
                #region 分类进来
                if (Request.QueryString["classid"] != null)
                {                  
                    classpanel.Visible = true;
                    if(Request.QueryString["classid"]== "leibie")
                    {
                        cullclass.Text = "类别";
                        idclass = "类别";
                        DataTable dt = CullService.SelectAll();
                        if (dt != null && dt.Rows.Count != 0)
                        {
                            cullview.DataSource = dt;
                            cullview.DataBind();
                        }
                       
                    }
                    else
                    {
                        idclass =Request.QueryString["classid"].ToString();                    
                        //根据分类ID查询分类名或者朝代名
                        SqlDataReader cullclassname = ClassificationBll.clssname(int.Parse(Request.QueryString["classid"].ToString()));
                        cullclassname.Read();
                        cullclass.Text = cullclassname["Class_Name"].ToString();
                        //根据分类绑定前台数据
                        DataTable dt = CullService.SelectCullClass(int.Parse(Request.QueryString["classid"].ToString()));
                        if (dt != null && dt.Rows.Count != 0)
                        {
                            cullview.DataSource = dt;
                            cullview.DataBind();
                        }
                       
                    }                                                   
                }

                #endregion
                #region 页面内朝代查询
                if (Request.QueryString["dyn2"] != null)
                {
                    dynpanel.Visible = true;          
                   
                    //根据分类ID查询分类名或者朝代名
                    SqlDataReader dynname = DynBll.dynname(int.Parse(Request.QueryString["dyn2"].ToString()));
                    dynname.Read();
                    dyn.Text = dynname["Dyn_Name"].ToString();
                    if (idclass == "类别")
                    {
                        cullclass.Text = idclass;
                        //根据朝代和分类绑定前台数据
                        DataTable dt2 = CullService.SelectCullDyn(int.Parse(Request.QueryString["dyn2"]));
                        if (dt2 != null && dt2.Rows.Count != 0)
                        {
                            cullview.DataSource = dt2;
                            cullview.DataBind();
                        }
                    }
                    else
                    {
                        //根据分类ID查询分类名或者朝代名
                        SqlDataReader cullclassname = ClassificationBll.clssname(int.Parse(idclass));
                        cullclassname.Read();
                        cullclass.Text = cullclassname["Class_Name"].ToString();
                        //根据朝代和分类绑定前台数据
                        DataTable dt2 = CullService.SelectCullClassDyn(int.Parse(Request.QueryString["dyn2"].ToString()),int.Parse(idclass));
                        if (dt2 != null && dt2.Rows.Count != 0)
                        {
                            cullview.DataSource = dt2;
                            cullview.DataBind();
                        }
                    }

                }
                #endregion
            }
        }
        #region 绑定数据
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
        #endregion
    }
}