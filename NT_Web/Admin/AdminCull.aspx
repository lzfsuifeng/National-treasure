<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminCull.aspx.cs" Inherits="NT_Web.Admin.AdminCull" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
       <style type="text/css">
         .top-title {
    
    margin-top: 20px; 
    background-color:#3C86C5; 
    padding:5px; border-radius:2px; 
    background-position:-88px 0pt; 
    color:#ffffff;
    width:100%;
    text-align:center;
}
          .table{
             margin-top:50px;
             width:90%;
             margin-left:auto;

         }
         .table .tr1 td{
             font-size:15px;
             font-family:'Microsoft YaHei';
         }
         .table .tr2 td{           
             font-size:15px;
         }
         .sxy{
             text-align:center;
             margin-top:35px;
         }
         </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <div class="top-title">
         <asp:Label ID="Label4" runat="server" Text="文物宝鉴管理" Font-Size="15" Font-Names="微软雅黑"></asp:Label>
    </div>
    <table class="table" style="border-collapse:separate; border-spacing:0px 20px; ">
            <tr class="tr1">
                <td style="width:15%;">文物名</td>
                <td style="width:22%;">文物简介</td>
                <td style="width:27%;">朝代</td>
                <td style="width:13%;">类别</td>
                <td style="width:13%;">操作</td>
                <td style="width:10%;"></td>
            </tr>
            <asp:ListView ID="ListView1" runat="server">
                <ItemTemplate>                                
            <tr class="tr2">
                    <td> <asp:HyperLink ID="HyperLink2" runat="server" Font-Names="微软雅黑" ToolTip='<%#"点击增加前世今生："+ Eval("Cull_Name") %>' Font-Size="12" NavigateUrl='<%#"AddNews.aspx?id="+Eval("Cull_ID") %>' ForeColor="#2b2b2b" Font-Underline="false" Text='<%#Eval("Cull_Name") %>' onmouseover="this.style.textDecoration='underline';this.style.color='steelblue';" onmouseout="this.style.textDecoration='none';this.style.color='#2b2b2b'"></asp:HyperLink></td>
                    <td><asp:Label ID="AssID" runat="server" Text='<%#SplitChar(Eval("Cull_Content").ToString(),10) %>'></asp:Label></td>                    
                    <td ><asp:Label ID="acttime" runat="server" Text='<%#Eval("Dyn_Name") %>'></asp:Label></td>     
                    <td ><asp:Label ID="endtime" runat="server" Text='<%#Eval("Class_Name") %>'></asp:Label></td>            
                    <td>
                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("Cull_ID")%>' />
                        <asp:Button ID="btnDelete" runat="server" Text="删除"  OnClick="btnDelete_Click"  OnClientClick="return confirm('确认删除？')"/>
                    </td>
            </tr>
              </ItemTemplate>
            </asp:ListView>
        </table>
         <div class="sxy">
                        共有<span id="totalRows" runat="server"></span>位   
                      <span id="totalPage" runat="server"></span>
                        <asp:DataPager runat="server" PagedControlID="ListView1" PageSize="6" ID="DDPager">
                            <Fields>
                                <asp:NextPreviousPagerField ShowFirstPageButton="true" FirstPageText="首页" PreviousPageText="上一页" ShowNextPageButton="false" />
                                <asp:NumericPagerField ButtonCount="4" />
                                <asp:NextPreviousPagerField ShowPreviousPageButton="false" LastPageText="最后一页" NextPageText="下一页" ShowNextPageButton="true" ShowLastPageButton="true" />
                            </Fields>
                        </asp:DataPager>
               </div>
    </div>
    </form>
</body>
</html>
