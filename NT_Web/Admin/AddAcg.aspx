<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddAcg.aspx.cs" Inherits="NT_Web.Admin.AddAcg" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <title></title>
        <link href="css/addnews.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../ckeditor/ckeditor.js"></script> 
</head>
<body>
    <form id="form1" runat="server">
      <div class="main">
    <hr />
        <div class="NewsIcon">
            <p>发布Acg</p>
        </div>
        <div class="title">
            <asp:TextBox ID="txtTitle" runat="server" class="form-control" placeholder="标题" Display="Dynamic" Width="996px"></asp:TextBox>
<%--<asp:RegularExpressionValidator ID="rfvTitle" runat="server" ControlToValidate="txtTitle" SetFocusOnError="true">请输入课程标题</asp:RegularExpressionValidator>--%>
        </div>
        <div class="form-group" style="margin-top: 10px;">
             <label for="exampleInputFile" style="font-size: 14px;">封面照</label>
            <asp:FileUpload ID="FileUpload" runat="server" ValidationGroup="shangchuan"/>
           <asp:Button ID="btnUpload" CssClass="btn btn-info" runat="server" Text="上传" OnClick="btnUpload_Click" ValidationGroup="shangchuan" /><br />         
           路径：<asp:Label ID="Label2" runat="server" Text=""></asp:Label>

           </div>
          <div class="form-group" style="margin-top: 10px;">
             <label for="exampleInputFile" style="font-size: 14px;">视频</label>
            <asp:FileUpload ID="FileUpload1" runat="server" ValidationGroup="shangchuan"/>
           <asp:Button ID="Button1" CssClass="btn btn-info" runat="server" Text="上传" OnClick="Button1_Click" ValidationGroup="shangchuan"  /><br />         
           路径：<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
           </div>
          <p>分类</p>
          <asp:DropDownList ID="DropDownList2" runat="server">
              <asp:ListItem>漫画</asp:ListItem>
              <asp:ListItem>插画</asp:ListItem>
              <asp:ListItem>视频</asp:ListItem>
          </asp:DropDownList>
          <p>标签</p>
           <asp:DropDownList ID="DropDownList3" runat="server">
               <asp:ListItem>国家宝藏</asp:ListItem>
               <asp:ListItem>汉服</asp:ListItem>
               <asp:ListItem>青铜器</asp:ListItem>
               <asp:ListItem>瓷器</asp:ListItem>
               <asp:ListItem>金银器</asp:ListItem>
              </asp:DropDownList>
          <div style="margin-top: 15px;">         
                <span style="vertical-align: top;">
                    <asp:Label ID="Label3" runat="server" Text="(图文并茂，无字数限制！)" Font-Size="10" ForeColor="#555555"></asp:Label>
                </span>
                 <span class="tinymce">
                    <CKEditor:CKEditorControl ID="txtContent" runat="server" BasePath="../ckeditor/" DefaultLanguage="zh-cn" >
            </CKEditor:CKEditorControl>
                </span>
            </div>  
            <div style="margin-left: 500px; margin-top: 15px;">
               <asp:Button ID="AddNews" runat="server" Text="添加" CssClass="btn btn-primary" Width="50px" OnClick="AddNews_Click"/>
            </div>
       <div class="button">
         <div class="btnSubmit">
        <asp:Button ID="btnSubmit" runat="server" class="btn btn-info btn-lg" Text="完成编辑并上传" OnClick="btnSubmit_Click" />

        </div>
        <div class="btnBack">
            <%--<asp:Button ID="btnBack" runat="server" class="btn btn-info" Text="返回" OnClick="btnBack_Click" />--%>
            <a href="adminer.aspx" style="font-size:20px; margin-right:50px; font-family:'Microsoft YaHei'">返回</a>
        </div>
      </div>
    </div>
    </form>
</body>
</html>
