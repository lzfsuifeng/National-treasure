<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="NT_Web.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
      <title></title>
 <%--       <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="keywords" content="Sign In Form Widget Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
    <script src="js/jquery-1.11.1.min.js"></script>
    <link href="css/style.css" rel="stylesheet" />--%>
     <%-- 引用的两个CSS文件 --%>
    <link href="CSS/login_input.css" rel="stylesheet" />
    <link href="CSS/login_css.css" rel="stylesheet" />
     <%-- 引用的三个js文件 --%>
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script src="Scripts/jquery.fullbg.js"></script>
    <script src="Scripts/Factory.js"></script>
    <script>
        //浏览器加载完所有标签之后再执行这段代码
        window.onload = function () {
            $("#background").fullBg();
        }
    </script>
    <style>
        /*
            position代表标签放的位置，fixed为相对浏览器位置，不随滚动条的滚动而滚动；
            overflow代表是否显示滚动条，hidden不显示。absolute为绝对定位
        */
        .fullBg{
            position:fixed;
            top:0;
            left:0;
            overflow:hidden;
        }
        #maincontent{
            position:absolute;
            top:10px;
            left:0;
            z-index:50;
        }
    </style>
</head>
<body>
       <form id="form1" runat="server">
    <div>
    <%-- 添加网页背景图片 --%>
        <img src="Img_UI/背景图.jpg" id="background" />
        <%--整体布局 --%>
        <div id="maincontent" style="width:100%;height:50px;">
            <div style="width:700px;height:500px;margin-left:auto;margin-right:auto;margin-top:100px;">
                <div style="float:left;padding-top:30px;padding-left:30px;width:560px;">
                    
                    <div style="width: 100%; height: 300px; background-image:url('Img_UI/透明背景.png'); 
         background-size: 100% 300px;">  
                        <div style="float: right; font-size: 15px; color:#0094ff; height: 30px; line-height: 30px;padding-right:20px; ">
                              <a href="Register.aspx">立即注册</a>
                             <a href="Login.aspx">用户登录</a>
                            </div>      
                       <%-- 用户名   --%>
                        <div style="height: 30px; padding-top: 30px; width: 320px; margin-left: auto; margin-right: auto;">
                            <div style="float: left; font-size:12px; line-height:30px;margin-right:6px;">
                                <img src="Img_UI/用户1.png" />
                            </div>

                            <div style="float: left;">
                            <%--添加一个文本框用于输入用户名 --%>
                                <asp:TextBox ID="txtName" runat="server" onkeypress="getkey(event)" style="border: none;  height: 28px; width: 186px; font-size: 12px; line-height: 30px;"></asp:TextBox>
                               <%-- 用户名验证--%>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="用户不能为空" ControlToValidate="txtName">
                               </asp:RequiredFieldValidator>
                            </div>
                        </div>       

                            <br />

                         <%--   密码--%>
                            <div style="height: 30px; padding-top: 13px; width: 320px; margin-left: auto; margin-right: auto;">

                            <div style="float: left; font-size:12px; line-height:30px;">
                              <img src="Img_UI/密码1.png" />&nbsp;
                           </div>
                           <div style="float: left;">
                               <%--添加输入密码的文本框--%>
                               <asp:TextBox ID="txtPassword" runat="server" onkeypress="getkey(event)"  style="border: none;  height: 28px; width: 186px; font-size: 12px; line-height: 30px;" ></asp:TextBox>
                              <%-- 密码验证--%>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="密码不能为空" ControlToValidate="txtPassword">
                               </asp:RequiredFieldValidator>
                              
                           </div>
                            </div>
                          <%-- 邮箱   --%>
                        <div style="height: 30px; padding-top: 36px; width: 320px; margin-left: auto; margin-right: auto;">
                            <div style="float: left; font-size:12px; line-height:30px;margin-right:6px;">
                                <img src="Img_UI/邮箱1.png" />
                            </div>

                            <div style="float: left;">
                            <%--添加一个文本框用于输入邮箱 --%>
                                <asp:TextBox ID="TextBox1" runat="server" onkeypress="getkey(event)" style="border-style: none; border-color: inherit; border-width: medium; height: 28px; width: 186px; font-size: 12px; line-height: 30px; margin-top: 0px;"></asp:TextBox>
                               <%-- 邮箱验证--%>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="邮箱不能为空" ControlToValidate="txtName">
                               </asp:RequiredFieldValidator>
                            </div>
                        </div>    
                          <%-- 邮箱   --%>
                        <div style="height: 30px; padding-top: 36px; width: 320px; margin-left: auto; margin-right: auto;">
                            <div style="float: left; font-size:12px; line-height:30px;margin-right:6px;">
                                <img src="Img_UI/手机1.png" />
                            </div>

                            <div style="float: left;">
                            <%--添加一个文本框用于输入邮箱 --%>
                                <asp:TextBox ID="TextBox2" runat="server" onkeypress="getkey(event)" style="border-style: none; border-color: inherit; border-width: medium; height: 28px; width: 186px; font-size: 12px; line-height: 30px; margin-top: 0px;"></asp:TextBox>
                               <%-- 邮箱验证--%>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="邮箱不能为空" ControlToValidate="txtName">
                               </asp:RequiredFieldValidator>
                            </div>
                        </div>    
                          <%-- 登录--%>
                       
                                   <asp:Button ID="login_Button1" runat="server" Text="注册·" BorderStyle="None" BackColor="blue" Height="30px" Width="50px" ForeColor="White" style="margin-top:17px"  OnClick="login_Button1_Click" />
                              </div> 
                        </div>
                    </div>
                </div>
           </form>

</body>
</html>
