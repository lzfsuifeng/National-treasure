<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCull.aspx.cs" Inherits="NT_Web.Admin.AddCull" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
           <link href="css/addnews.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../ckeditor/ckeditor.js"></script> 
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
  <div class="main">
    <hr />
      <div class="NewsIcon">
            <p>发布文物宝鉴</p>
        </div>
        <div class="title">
            <asp:TextBox ID="txtTitle" runat="server" class="form-control" placeholder="标题" Display="Dynamic" Width="996px"></asp:TextBox>
            <%--<asp:RegularExpressionValidator ID="rfvTitle" runat="server" ControlToValidate="txtTitle" SetFocusOnError="true">请输入新闻标题</asp:RegularExpressionValidator>--%>
        </div>
         <div class="form-group" style="margin-top: 10px;">
             <label for="exampleInputFile" style="font-size: 14px;">封面照</label>
            <asp:FileUpload ID="FileUpload" runat="server" ValidationGroup="shangchuan"/>
           <asp:Button ID="btnUpload" CssClass="btn btn-info" runat="server" Text="上传" OnClick="btnUpload_Click" ValidationGroup="shangchuan" /><br />         
           路径：<asp:Label ID="Label2" runat="server" Text=""></asp:Label>

           </div>
        <div class="NewsContent">
            <p>内容</p>
        </div>
    <div class="text">
      <CKEditor:CKEditorControl ID="CKEditorControl1" runat="server" BasePath="ckeditor/" DefaultLanguage="zh-cn"></CKEditor:CKEditorControl>
    </div>
       <p>朝代</p>
      <asp:DropDownList ID="DropDownList1" runat="server">
          <asp:ListItem>史前时代</asp:ListItem>
          <asp:ListItem>夏商</asp:ListItem>
          <asp:ListItem>春秋战国</asp:ListItem>
          <asp:ListItem>秦汉</asp:ListItem>
          <asp:ListItem>魏晋南北朝</asp:ListItem>
          <asp:ListItem>隋唐</asp:ListItem>
          <asp:ListItem>五代十国</asp:ListItem>
          <asp:ListItem>宋</asp:ListItem>
          <asp:ListItem>元</asp:ListItem>
          <asp:ListItem>明清</asp:ListItem>
      </asp:DropDownList>
            <p>类别</p>
      <asp:DropDownList ID="DropDownList2" runat="server">
          <asp:ListItem>青铜器</asp:ListItem>
          <asp:ListItem>玉器</asp:ListItem>
          <asp:ListItem>陶瓷</asp:ListItem>
          <asp:ListItem>金银器</asp:ListItem>
          <asp:ListItem>钱币</asp:ListItem>
          <asp:ListItem>雕塑</asp:ListItem>
          <asp:ListItem>书画 </asp:ListItem>
          <asp:ListItem>漆器</asp:ListItem>
          <asp:ListItem>家具</asp:ListItem>
          <asp:ListItem>铜镜 </asp:ListItem>
          <asp:ListItem>织绣</asp:ListItem>
          <asp:ListItem>文房四宝</asp:ListItem>
          <asp:ListItem>紫砂器</asp:ListItem>
      </asp:DropDownList>
       <div class="button">
         <div class="btnSubmit">
        <asp:Button ID="btnSubmit" runat="server" class="btn btn-info btn-lg" Text="完成编辑并上传"  OnClick="btnSubmit_Click"/>
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
