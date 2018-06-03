<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="NT_Web.Admin.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="css/admin_index.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $(".div2").click(function () {
            $(this).next("div").slideToggle("slow").siblings(".div3:visible").slideUp("slow");
        });
    });
</script>
    <title>国家宝藏后台</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <%--顶部菜单信息--%>
        <div class="topbar ">
            <div class="white left" >
                <a href="../Index.aspx" class="bt_left white">首页</a></div>
            <div class="white right">
                <asp:LinkButton ID="LBtuichu" runat="server" ForeColor="White" 
                      CssClass="bt_right">退出</asp:LinkButton>                 
            </div>
        </div>
       <%-- 左侧菜单--%>
        <div class="leftquyu left">
            <di class="div1">
            <div></div>
            
                <div class="div2">
                    用户管理</div>
                <div class="div3">
                    <ul>
                        <li><a href="adminuser.aspx" target="mainframe">编辑用户</a></li>
                    </ul>
                </div>
            <div class="div2">
                    前世今生管理</div>
            <div class="div3">
                    <ul>                               
                    <li><a href="AdminNews.aspx" target="mainframe">编辑资讯</a></li>                     
                </ul>
            </div>
                 <div class="div2">
                    活动管理</div>
                <div class="div3">
                    <ul>
                        <li><a href="AddAction.aspx"target="mainframe">增加活动</a></li>
                        <li><a href="AdminAction.aspx"target="mainframe">编辑活动</a></li>
                    </ul>
                </div>
                 <div class="div2">
                    ACG管理</div>
                <div class="div3">
                    <ul>
                        <li><a href="AddAcg.aspx"target="mainframe">增加ACG</a></li>
                        <li><a href="AdminAcg.aspx" target="mainframe">编辑ACG</a></li>
                    </ul>
                </div>
                 <div class="div2">
                    文物宝鉴管理</div>
                <div class="div3">
                    <ul>
                        <li><a href="AddCull.aspx" target="mainframe">增加宝鉴</a></li>
                        <li><a href="AdminCull.aspx" target="mainframe">编辑宝鉴</a></li>
                    </ul>
                </div>
                 <div class="div2">
                    评论管理</div>
                <div class="div3">
                    <ul>
                        <li><a href="AdminPinlun.aspx" target="mainframe">编辑评论</a></li>
                    </ul>
                </div>
                 <div class="div2">
                     留言管理</div>
                <div class="div3">
                    <ul>
                        <li><a href="AdminLiuyan.aspx" target="mainframe">编辑留言</a></li>
                    </ul>
                </div>
                 <div class="div2">
                    回复评论管理</div>
                <div class="div3">
                    <ul>
                        <li><a href="AdminReplyComments.aspx" target="mainframe">编辑回复评论</a></li>
                    </ul>
                </div>
                 <div class="div2">
                    回复留言管理</div>
                <div class="div3">
                    <ul>
                        <li><a href="AdminReplyLeavewords.aspx" target="mainframe">编辑回复留言</a></li>
                    </ul>
                </div>                
        </div>
        <%--右侧显示区域--%>
        <div class="rightquyu right">
        <iframe class="rightframe"  name="mainframe"></iframe>
         <div class="copyright"> &copy;2015 Powered by <a href="http://www.learning365.cn" target="_blank">learning365</a></div>
        </div>

    </div>
    </form>
</body>
</html>
