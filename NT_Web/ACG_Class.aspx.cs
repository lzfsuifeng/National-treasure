﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using NT_BLL;
using NT_Models;

namespace WebApplication1
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindNew();
                BindTop();
                BindTally();
               //根据分类或是标签展示所有ACG
                if (Request.QueryString["acgclass"] != null)
                {
                    DataTable dt = AcgService.SelectTay(Request.QueryString["acgclass"].ToString());
                    if (dt != null && dt.Rows.Count != 0)
                    {
                        Acgview.DataSource = dt;
                        Acgview.DataBind();
                    }
                    classname.Text = Request.QueryString["acgclass"].ToString();
                }
                if (Request.QueryString["tally_name"] != null)
                {
                    DataTable dt = AcgService.SelectTally(Request.QueryString["tally_name"].ToString());
                    if (dt != null && dt.Rows.Count != 0)
                    {
                        Acgview.DataSource = dt;
                        Acgview.DataBind();
                    }
                    classname.Text = Request.QueryString["tally_name"].ToString();
                }
            }
        }
        #region 绑定前台数据

        //热度排行榜
        private void BindTop()
        {

            DataTable dt = AcgService.Top6();
            if (dt != null && dt.Rows.Count != 0)
            {
                Topacg.DataSource = dt;
                Topacg.DataBind();
            }


        }
        //右边最新分类
        private void BindNew()
        {
            string a = "视频";
            string b = "漫画";
            string c = "插画";
            DataTable dt = AcgService.acgTop4(a);
            if (dt != null && dt.Rows.Count != 0)
            {
                newShiping.DataSource = dt;
                newShiping.DataBind();
            }
            DataTable dt1 = AcgService.acgTop4(b);
            if (dt1 != null && dt1.Rows.Count != 0)
            {
                newManhua.DataSource = dt1;
                newManhua.DataBind();
            }
            DataTable dt2 = AcgService.acgTop4(c);
            if (dt2 != null && dt2.Rows.Count != 0)
            {
                newChahua.DataSource = dt2;
                newChahua.DataBind();
            }

        }
        //标签分类
        private void BindTally()
        {
            DataTable dt = TallyBll.allTally();
            if (dt != null && dt.Rows.Count != 0)
            {
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
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