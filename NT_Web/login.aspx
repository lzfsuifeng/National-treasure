<%@ Page Language="C#"   AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="NT_Web.login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登录界面</title>
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
                    <div style="width:221px; height:79px;">
                       
                    </div>
                    <div style="width: 100%; height: 300px; background-image:url('Img_UI/透明背景.png'); 
         background-size: 100% 300px;">  
                        <div style="float: right; font-size: 15px; color:#000; height: 30px; line-height: 30px;padding-right:20px; ">
                              <a href="Register.aspx">立即注册</a>
                             <a href="Admin/Admin.aspx">管理员登录</a>
                            </div>      
                       <%-- 用户名   --%>
                        <div style="height: 30px; padding-top: 100px; width: 320px; margin-left: auto; margin-right: auto;">
                            <div style="float: left; font-size:12px; line-height:30px;">
                                <img src="Img_UI/用户.png" />
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
                            <div style="height: 30px; padding-top: 20px; width: 320px; margin-left: auto; margin-right: auto;">

                            <div style="float: left; font-size:12px; line-height:30px;">
                              <img src="Img_UI/密码.png" />&nbsp;
                           </div>
                           <div style="float: left;">
                               <%--添加输入密码的文本框--%>
                               <asp:TextBox ID="txtPassword" runat="server" onkeypress="getkey(event)"  style="border: none;  height: 28px; width: 186px; font-size: 12px; line-height: 30px;" ></asp:TextBox>
                              <%-- 密码验证--%>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="密码不能为空" ControlToValidate="txtPassword">
                               </asp:RequiredFieldValidator>
                              
                           </div>
                            </div>
                                   
                             <%--添加一个按钮--%> 
                          <div style="height: 22px; padding-top: 20px; width: 300px; margin-left: auto; margin-right: auto;">
                                  <div style="float: left; color: #666666">
                                       <%--添加一个复选框--%>
                                      <input type="checkbox" id="RmMe" />
                                      <%--添加复选框的提示--%>
                                      <a style="cursor: pointer; font-size:12px;color:#000;" onclick="OnClickRmMe()">记住我</a>
                                  </div> 
                               <div style=" color: #666666;margin-left:25px;width:50px; padding-left:120px;">
                                   <asp:Button ID="login_Button1" runat="server" Text="登录" BorderStyle="None" BackColor="blue" Height="30px" Width="50px" ForeColor="White" OnClick="login_Button1_Click" />
                              </div>
                               <a style="color:red;">
                                 <%--  对用户名、密码的综合验证--%>                        
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="密码必须以1-3个字母开头，3-6个数字结尾" ControlToValidate="txtPassword" ValidationExpression="[A-Z,a-z]{1,3}\d{3,6}"></asp:RegularExpressionValidator>
                               </a>       
                          </div>
                              
                            

                        </div>
                    </div>
                </div>
            </div>
    </div>
    </form>
</body>
</html>
