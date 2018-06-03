<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="User_Index.aspx.cs" Inherits="WebApplication1.WebForm6" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">  
      <%--  样式--%>
     <style type="text/css">
         .top-title {
             margin-top: 20px;
             background-color: #3C86C5;
             padding: 5px;
             border-radius: 2px;
             background-position: -88px 0pt;
             color: #ffffff;
             width: 100%;
             text-align: center;
         }

         .table {
             margin-top: 50px;
             width: 90%;
             margin-left: auto;
         }

             .table .tr1 td {
                 font-size: 15px;
                 font-family: 'Microsoft YaHei';
             }

             .table .tr2 td {
                 font-size: 15px;
             }

         .sxy {
             text-align: center;
             margin-top: 35px;
         }
         .auto-style1 {
             width: 139px;
         }
         .auto-style2 {
             width: 112px;
         }
         .auto-style3 {
             width: 155px;
             height: 70px;
         }
         .auto-style4 {
             height: 54px;
         }
         .auto-style5 {
             width: 112px;
             height: 68px;
         }
         .auto-style6 {
             width: 155px;
             height: 68px;
         }
         .auto-style7 {
             height: 70px;
         }
         .auto-style8 {
             width: 112px;
             height: 70px;
         }
         .auto-style9 {
             height: 68px;
         }
     </style>  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <form runat="server"> 
     <asp:Panel ID="nologin" runat="server">
          <div class="works">
          <div class="columns three-fourths">
            <div class="sorry">请登录</div>
           </div>
          </div>
         </asp:Panel>
    <asp:Panel ID="overlogin" runat="server">
  
    <!-- 左边 -->
    <div class="columns four">
        <!--用户头像-->
        <div class="work">
            <a href="#" class="fade" title="This is the description"><span></span>
                <asp:Image ID="UserImg" runat="server" class="img-rounded" alt="140x140" /></a>
            <h3> <asp:Label ID="UserName" runat="server" name="website" Text=""/></h3>
            <h4><asp:Label ID="UserEmail" runat="server" Text=""></asp:Label></h4>
        </div>
        <!--个人中心导航-->
        <div class="rs_accordion">
            <div class="rs_accordion_item rs_accordion_item_active">
                <div class="rs_accordion_item_title"><a href="User_Index.aspx?menupanel=a1">个人信息</a> </div>

            </div>
            <div class="rs_accordion_item">
                <div class="rs_accordion_item_title">投稿管理</div>
                <div class="rs_accordion_item_content">
                    <ul style="list-style: none;">
                        <li><a href="User_Index.aspx?menupanel=b1">&nbsp;&nbsp;&nbsp;发表投稿</a></li>
                        <li><a href="User_Index.aspx?menupanel=b2">&nbsp;&nbsp;&nbsp;我的投稿</a></li>
                    </ul>
                </div>
            </div>
            <div class="rs_accordion_item">
                <div class="rs_accordion_item_title">收藏夹</div>
                <div class="rs_accordion_item_content">
                    <ul style="list-style: none;">
                        <li><a href="User_Index.aspx?menupanel=e1">&nbsp;&nbsp;&nbsp;收藏文物</a></li>
                        <li><a href="User_Index.aspx?menupanel=e2">&nbsp;&nbsp;&nbsp;点赞的作品</a></li>
                    </ul>
                </div>
            </div>
            <div class="rs_accordion_item">
                <div class="rs_accordion_item_title">圈子</div>
                <div class="rs_accordion_item_content">
                    <ul style="list-style: none;">
                        <li><a href="User_Index.aspx?menupanel=c1">&nbsp;&nbsp;&nbsp;我的留言</a></li>
                        <li><a href="User_Index.aspx?menupanel=c2">&nbsp;&nbsp;&nbsp;我的评论</a></li>
                        <li><a href="User_Index.aspx?menupanel=c3">&nbsp;&nbsp;&nbsp;回复他人的留言</a></li>
                        <li><a href="User_Index.aspx?menupanel=c4">&nbsp;&nbsp;&nbsp;回复他人的评论</a></li>
                    </ul>
                </div>
            </div>
            <div class="rs_accordion_item">
                <div class="rs_accordion_item_title"><a href="User_Index.aspx?menupanel=d1">作品被评论 </a></div>

            </div>
            <div class="rs_accordion_item">
                <div class="rs_accordion_item_title">关于我的</div>
                <div class="rs_accordion_item_content">

                    <ul style="list-style: none;">

                        <li><a href="User_Index.aspx?menupanel=d2">&nbsp;&nbsp;&nbsp;被回复</a></li>
                        <li><a href="User_Index.aspx?menupanel=d3">&nbsp;&nbsp;&nbsp;被留言</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--右边-->
    <div class="columns three-fourths_last">

        <div class="slider"></div>
         
        <div class="contactform">
            <div class="slider"></div>
            
                   <%-- 修改个人信息--%>
                <asp:Panel ID="a1" runat="server" Visible="true">
              
                    <table style="border-collapse: separate; border-spacing: 10px   50px;width: 357px;"">
                        <tr>
                            <td>
                                <p>头像</p>
                            </td>
                           
                            <td>
                                <asp:FileUpload ID="ChangImg" runat="server" Width="186px" />
                            </td>
                            <td></td>
                        </tr>

                        <tr>
                            <td>
                                <p>
                                    昵称
                                </p>
                            </td>
                            <td>
                                <asp:TextBox ID="ChangName" runat="server"></asp:TextBox>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <p>
                                    邮箱
                                </p>
                            </td>
                             <td>
                                <asp:TextBox ID="ChangEmail" runat="server"></asp:TextBox>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <p>
                                    电话
                                </p>
                            </td>
                            <td>
                                <asp:TextBox ID="ChangPhone" runat="server"></asp:TextBox>
                            </td>
                            <td></td>
                        </tr>
                       <tr>
                            <td class="auto-style2">
                                <p>
                                    修改密码
                                </p>
                            </td>
                            <td class="auto-style2">
                                <asp:TextBox ID="ChangMima" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style2"></td>
                        </tr>
                       <tr>
                            <td>
                                <p>
                                    确认密码
                                </p>
                            </td>
                            <td>
                                <asp:TextBox ID="ChangMima2" runat="server"></asp:TextBox>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td><a class="rs_button rs_button_large rs_button_blue rs_button_light rs_button_top" href="User_Index.aspx?queren=true">确认</a></td>
                        </tr>

                    </table>
             
               
                </asp:Panel>
                   <%-- 发布acg创作--%>
                <asp:Panel ID="b1" runat="server" Visible="false" >
                         <div class="grid_10">
           <div class="main">
    <hr />
        <div class="NewsIcon">
            <p>发布Acg</p>
        </div><br />
           <table style="width:95%">
                   <tr>
                       <td>标题：</td>
                       <td>   
                          
                           <asp:TextBox ID="txtTitle" runat="server" class="form-control" placeholder="标题" Display="Dynamic" Width="120px"></asp:TextBox></td>
                       <td class="auto-style2">
                           <asp:RegularExpressionValidator ID="rfvTitle" runat="server" ControlToValidate="txtTitle" SetFocusOnError="true">请输入课程标题</asp:RegularExpressionValidator>
                       </td>
                   </tr>
                   <tr>
                       <td class="auto-style7"> <label for="exampleInputFile" style="font-size: 14px;">封面照</label></td>
                       <td class="auto-style7"> <asp:FileUpload ID="FileUpload" runat="server" ValidationGroup="shangchuan"/>
                         <asp:Button ID="btnUpload" CssClass="btn btn-info" runat="server" Text="上传" OnClick="btnUpload_Click" ValidationGroup="shangchuan" /></td>
                       <td class="auto-style3">   路径：<asp:Label ID="Label2" runat="server" Text=""></asp:Label></td>
                   </tr>
                   <tr>
                       <td class="auto-style9"> <label for="exampleInputFile" style="font-size: 14px;">视频</label></td>
                       <td class="auto-style9"><asp:FileUpload ID="FileUpload1" runat="server" ValidationGroup="shangchuan"/>
                       <asp:Button ID="Button1" CssClass="btn btn-info" runat="server" Text="上传" OnClick="Button1_Click" ValidationGroup="shangchuan"  /></td>
                       <td class="auto-style6"> 路径：<asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
                   </tr>
                   <tr>
                       <td>  <p>分类</p></td>
                       <td>
                             <asp:DropDownList ID="DropDownList2" runat="server">
              <asp:ListItem>漫画</asp:ListItem>
              <asp:ListItem>插画</asp:ListItem>
              <asp:ListItem>视频</asp:ListItem>
          </asp:DropDownList>
                       </td>
                   </tr>
                   <tr>
                       <td> <p>标签</p></td>
                       <td>
                             <asp:DropDownList ID="DropDownList3" runat="server">
               <asp:ListItem>国家宝藏</asp:ListItem>
               <asp:ListItem>汉服</asp:ListItem>
               <asp:ListItem>青铜器</asp:ListItem>
               <asp:ListItem>瓷器</asp:ListItem>
               <asp:ListItem>金银器</asp:ListItem>
              </asp:DropDownList>
                       </td>
                   </tr>
               </table>           
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
               <asp:Button ID="btnSubmit" runat="server" class="btn btn-info btn-lg" Text="完成并上传" OnClick="btnSubmit_Click" />
            </div>
    
    </div>
                             </div>
                        </asp:Panel>
                   <%--ACG投稿管理 --%>
                 <asp:Panel ID="b2" runat="server" Visible="false">
                         <div class="top-title">
         <asp:Label ID="Label4" runat="server" Text="ACG管理" Font-Size="15" Font-Names="微软雅黑"></asp:Label>
    </div>
                          <table class="table" style="border-collapse:separate; border-spacing:0px 20px; ">
            <tr class="tr1">
                <td style="width:15%;">标题</td>
                <td style="width:22%;">创建时间</td>
                <td style="width:13%;">操作</td>
                <td style="width:10%;"></td>
            </tr>
                 <asp:ListView ID="UserIndex_Acg" runat="server">
                                        <ItemTemplate>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <asp:HyperLink ID="Pro_Title" runat="server" ForeColor="Black" CssClass="text" Text='<%# SplitChar(Eval("Pro_Title").ToString(),10) %>' NavigateUrl='<%# "ACG_Read.aspx?pro_id="+ Eval("Pro_ID") %>'></asp:HyperLink>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Pro_Time" runat="server" Text='<%# Eval("Pro_Time") %>'></asp:Label>
                                                    </td>

                                                    <td style="text-align: left">
                                                        <asp:HiddenField ID="HiddenField5" runat="server" Value='<%#Eval("Pro_ID")%>' />

                                                        <asp:HyperLink CssClass="btn btn-danger" ID="btnDelete" runat="server" Text="删除" NavigateUrl='<%#"User_Index.aspx?proid="+ Eval("Pro_ID")%>' OnClientClick="return confirm('确认删除？')" Height="25px" Font-Size="12px" />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </table>
                            
                      <div class="sxy">
                                共有<span id="totalRows" runat="server"></span>条   
 <span id="totalPage" runat="server"></span>
                                <asp:DataPager runat="server" PagedControlID="UserIndex_Acg" PageSize="4" ID="DDPager">
                                    <Fields>
                                        <asp:NextPreviousPagerField ShowFirstPageButton="true" FirstPageText="首页" PreviousPageText="上一页" ShowNextPageButton="false" />
                                        <asp:NumericPagerField ButtonCount="4" />
                                        <asp:NextPreviousPagerField ShowPreviousPageButton="false" LastPageText="最后一页" NextPageText="下一页" ShowNextPageButton="true" ShowLastPageButton="true" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                      

                    </asp:Panel>
                 <%--我的留言 --%>
                <asp:Panel ID="c1" runat="server" Visible="false">
                      <div class="top-title">
         <asp:Label ID="Label6" runat="server" Text="留言管理" Font-Size="15" Font-Names="微软雅黑"></asp:Label>
    </div>
    <table class="table" style="border-collapse:separate; border-spacing:0px 20px; ">
            <tr class="tr1">
                <td style="width:15%;">新闻标题</td>
                <td style="width:22%;">留言时间</td>
                <td style="width:27%;">内容</td>
                <td style="width:13%;">操作</td>
                <td style="width:10%;"></td>
            </tr>
                                    <asp:ListView ID="UserIndex_Leavewords" runat="server">
                                        <ItemTemplate>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <asp:HyperLink ID="Leavewords_Title" runat="server" ForeColor="Black" CssClass="text" Text='<%# SplitChar(Eval("News_Title").ToString(),10) %>' NavigateUrl='<%# "~/News_Read.aspx.aspx?newsid="+ Eval("News_ID") %>'></asp:HyperLink>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Leavewords_Time" runat="server" Text='<%# Eval("Leavewords_Time") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# SplitChar(Eval("Leavewords_Content").ToString(),10) %>'></asp:Label>
                                                    </td>
                                                    <td style="text-align: left">
                                                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("Leavewords_ID")%>' />

                                                        <%--<asp:HyperLink CssClass="btn btn-danger" ID="btnDelete" runat="server" Text="删除" NavigateUrl='<%#"~/User_Index.aspx?leavewordsid="+ Eval("Leavewords_ID")%>' OnClientClick="return confirm('确认删除？')" Height="25px" Font-Size="12px" />--%>
                                                        <asp:Button ID="btnDelete" runat="server" Text="删除" OnClick="btnDelete_Click"  OnClientClick="return confirm('确认删除？')"/>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </table>
                           
                            <div class="sxy">
                                共有<span id="Span3" runat="server"></span>条   
 <span id="Span4" runat="server"></span>
                                <asp:DataPager runat="server" PagedControlID="UserIndex_Leavewords" PageSize="4" ID="DataPager2">
                                    <Fields>
                                        <asp:NextPreviousPagerField ShowFirstPageButton="true" FirstPageText="首页" PreviousPageText="上一页" ShowNextPageButton="false" />
                                        <asp:NumericPagerField ButtonCount="4" />
                                        <asp:NextPreviousPagerField ShowPreviousPageButton="false" LastPageText="最后一页" NextPageText="下一页" ShowNextPageButton="true" ShowLastPageButton="true" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        
                    </asp:Panel>
                    <%--我的评论 --%>
                    <asp:Panel ID="c2" runat="server" Visible="false">
                        <div class="top-title">
         <asp:Label ID="Label7" runat="server" Text="评论管理" Font-Size="15" Font-Names="微软雅黑"></asp:Label>
       </div>
        <table class="table" style="border-collapse:separate; border-spacing:0px 20px; ">
            <tr class="tr1">
                <td style="width:15%;">评论内容</td>
                <td style="width:22%;">留言时间</td>
                <td style="width:13%;">操作</td>
                <td style="width:10%;"></td>
            </tr>
                                    <asp:ListView ID="UserIndex_Comments" runat="server">
                                        <ItemTemplate>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <asp:HyperLink ID="Comments_Content" runat="server" ForeColor="Black" CssClass="text" Text='<%# SplitChar(Eval("Comments_Content").ToString(),10) %>' NavigateUrl='<%# "../.aspx?comments="+ Eval("Comments_ID") %>'></asp:HyperLink>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Comments_Time" runat="server" Text='<%# Eval("Comments_Time") %>'></asp:Label>
                                                    </td>
                                                    <td>

                                                    </td>
                                                    <td style="text-align: left">
                                                        <asp:HiddenField ID="HiddenField2" runat="server" Value='<%#Eval("Comments_ID")%>' />

                                                       <%-- <asp:HyperLink CssClass="btn btn-danger" ID="btnDelete" runat="server" Text="删除" NavigateUrl='<%#"~/User_Index.aspx?=commentsid"+ Eval("Comments_ID")%>' OnClientClick="return confirm('确认删除？')" Height="25px" Font-Size="12px" />--%>
                                                         <asp:Button ID="btnDelete1" runat="server" Text="删除" OnClick="btnDelete1_Click"  OnClientClick="return confirm('确认删除？')"/>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </table>
                           
                            <div class="sxy">
                                共有<span id="Span1" runat="server"></span>条   
 <span id="Span2" runat="server"></span>
                                <asp:DataPager runat="server" PagedControlID="UserIndex_Comments" PageSize="4" ID="DataPager1">
                                    <Fields>
                                        <asp:NextPreviousPagerField ShowFirstPageButton="true" FirstPageText="首页" PreviousPageText="上一页" ShowNextPageButton="false" />
                                        <asp:NumericPagerField ButtonCount="4" />
                                        <asp:NextPreviousPagerField ShowPreviousPageButton="false" LastPageText="最后一页" NextPageText="下一页" ShowNextPageButton="true" ShowLastPageButton="true" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        

                    </asp:Panel>
                    <%--回复他人的留言 --%>
                    <asp:Panel ID="c3" runat="server" Visible="false">                   
        <table class="table" style="border-collapse:separate; border-spacing:0px 20px; ">
            <tr class="tr1">
                <td style="width:15%;">回复内容</td>
                <td style="width:22%;">回复时间</td>
                <td style="width:13%;">用户</td>
                <td style="width:10%;"></td>
            </tr>
                                    <asp:ListView ID="ListView1" runat="server">
                                        <ItemTemplate>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <asp:HyperLink ID="Leavewords_Title" runat="server" ForeColor="Black" CssClass="text" Text='<%# SplitChar(Eval("ReplyLeavewords_Comment").ToString(),10) %>' NavigateUrl='<%# "../.aspx?leavewordsid="+ Eval("ReplyLeavewords_ID") %>'></asp:HyperLink>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Leavewords_Time" runat="server" Text='<%# Eval("ReplyLeavewords_Time") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                         <asp:Label ID="Label4" runat="server" Text='<%# Eval("ReplyLeavewords_Time") %>'></asp:Label>
                                                    </td>
                                                    <td style="text-align: left">
                                                        <asp:HiddenField ID="HiddenField3" runat="server" Value='<%#Eval("ReplyLeavewords_ID")%>' />

                                                        <%--<asp:HyperLink CssClass="btn btn-danger" ID="btnDelete" runat="server" Text="删除" NavigateUrl='<%#"~/User_Index.aspx?leavewordsid="+ Eval("Leavewords_ID")%>' OnClientClick="return confirm('确认删除？')" Height="25px" Font-Size="12px" />--%>
                                                        <asp:Button ID="btnDelete2" runat="server" Text="删除" OnClick="btnDelete2_Click"  OnClientClick="return confirm('确认删除？')"/>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </table>
                           
                            <div class="sxy">
                                共有<span id="Span9" runat="server"></span>条   
 <span id="Span10" runat="server"></span>
                                <asp:DataPager runat="server" PagedControlID="UserIndex_Leavewords" PageSize="4" ID="DataPager5">
                                    <Fields>
                                        <asp:NextPreviousPagerField ShowFirstPageButton="true" FirstPageText="首页" PreviousPageText="上一页" ShowNextPageButton="false" />
                                        <asp:NumericPagerField ButtonCount="4" />
                                        <asp:NextPreviousPagerField ShowPreviousPageButton="false" LastPageText="最后一页" NextPageText="下一页" ShowNextPageButton="true" ShowLastPageButton="true" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        
                    </asp:Panel>
                    <%--回复他人的评论 --%>
                    <asp:Panel ID="c4" runat="server" Visible="false">
                                     <table class="table" style="border-collapse:separate; border-spacing:0px 20px; ">
            <tr class="tr1">
                <td style="width:15%;">回复内容</td>
                <td style="width:22%;">回复时间</td>
                <td style="width:13%;">用户</td>
                <td style="width:10%;"></td>
            </tr>
                                    <asp:ListView ID="ListView2" runat="server">
                                        <ItemTemplate>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <asp:HyperLink ID="Comments_Content" runat="server" ForeColor="Black" CssClass="text" Text='<%# SplitChar(Eval("Comments_Content").ToString(),10) %>' NavigateUrl='<%# "../.aspx?comments="+ Eval("Comments_ID") %>'></asp:HyperLink>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Comments_Time" runat="server" Text='<%# Eval("Comments_Time") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Comments_Time") %>'></asp:Label>
                                                    </td>
                                                    <td style="text-align: left">
                                                        <asp:HiddenField ID="HiddenField4" runat="server" Value='<%#Eval("Comments_ID")%>' />

                                                       <%-- <asp:HyperLink CssClass="btn btn-danger" ID="btnDelete" runat="server" Text="删除" NavigateUrl='<%#"~/User_Index.aspx?proid="+ Eval("Comments_ID")%>' OnClientClick="return confirm('确认删除？')" Height="25px" Font-Size="12px" />--%>
                                                         <asp:Button ID="btnDelete3" runat="server" Text="删除" OnClick="btnDelete3_Click"  OnClientClick="return confirm('确认删除？')"/>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </table>
                            
                            <div class="sxy">
                                共有<span id="Span11" runat="server"></span>条   
 <span id="Span12" runat="server"></span>
                                <asp:DataPager runat="server" PagedControlID="UserIndex_Comments" PageSize="4" ID="DataPager6">
                                    <Fields>
                                        <asp:NextPreviousPagerField ShowFirstPageButton="true" FirstPageText="首页" PreviousPageText="上一页" ShowNextPageButton="false" />
                                        <asp:NumericPagerField ButtonCount="4" />
                                        <asp:NextPreviousPagerField ShowPreviousPageButton="false" LastPageText="最后一页" NextPageText="下一页" ShowNextPageButton="true" ShowLastPageButton="true" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                       
                    </asp:Panel>
                    <%--作品被评论 --%>
                    <asp:Panel ID="d1" runat="server" Visible="false">
                        <div class="col-xs-9 banner-body-right">
                            <div>
                                     <table class="table" style="border-collapse:separate; border-spacing:0px 20px; ">
                                        <tr class="tr1">
                                     <td style="width:15%;">作品名</td>
                                     <td style="width:15%;">评论内容</td>
                                     <td style="width:22%;">评论时间</td>
                                       <td style="width:13%;">用户</td>
                                      <td style="width:10%;"></td>
                                         </tr>
                                    <asp:ListView ID="ListView3" runat="server">
                                        <ItemTemplate>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Black" CssClass="text" Text='<%# SplitChar(Eval("Pro_Title").ToString(),10) %>' NavigateUrl='<%# "ACG_Read.aspx?pro_id"+ Eval("Pro_ID") %>'></asp:HyperLink>
                                                    </td>
                                                    <td>
                                                        <asp:HyperLink ID="ReplyComments_Content" runat="server" ForeColor="Black" CssClass="text" Text='<%# SplitChar(Eval("Comments_Content").ToString(),10) %>' NavigateUrl='<%# "ACG_Read.aspx?pro_id"+ Eval("Pro_ID") %>'></asp:HyperLink>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="ReplyComments_Time" runat="server" Text='<%# Eval("Comments_Time") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Replay_User_Name" runat="server" Text='<%# Eval("User_Name") %>'></asp:Label>
                                                    </td>
                                                   <td>
                                                        <a class="rs_button rs_button_large rs_button_blue rs_button_light rs_button_top" href="ACG_Read.aspx?id=1">回复</a>
                                                    </td>
                                                   <td>
                                                       <asp:HyperLink CssClass="btn btn-danger" ID="btnDelete" runat="server" Text="删除" NavigateUrl='<%#"~/User_Index.aspx?proid="+ Eval("Comments_ID")%>' OnClientClick="return confirm('确认删除？')" Height="25px" Font-Size="12px" />
                                                   </td>

                                                </tr>
                                            </tbody>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </table>
                            </div>
                            <div class="sxy">
                                共有<span id="Span13" runat="server"></span>条   
 <span id="Span14" runat="server"></span>
                                <asp:DataPager runat="server" PagedControlID="UserIndex_replaycomments" PageSize="4" ID="DataPager7">
                                    <Fields>
                                        <asp:NextPreviousPagerField ShowFirstPageButton="true" FirstPageText="首页" PreviousPageText="上一页" ShowNextPageButton="false" />
                                        <asp:NumericPagerField ButtonCount="4" />
                                        <asp:NextPreviousPagerField ShowPreviousPageButton="false" LastPageText="最后一页" NextPageText="下一页" ShowNextPageButton="true" ShowLastPageButton="true" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        </div>
                    </asp:Panel>
                    <%--被评论 --%>
                    <asp:Panel ID="d2" runat="server" Visible="false">
                        <div class="col-xs-9 banner-body-right">
                            <div>
                                     <table class="table" style="border-collapse:separate; border-spacing:0px 20px; ">
                                        <tr class="tr1">
                              <td style="width:15%;">评论内容</td>
                                     <td style="width:22%;">评论时间</td>
                                       <td style="width:13%;">用户</td>
                                      <td style="width:10%;"></td>
                                         </tr>
                                    <asp:ListView ID="UserIndex_replaycomments" runat="server">
                                        <ItemTemplate>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <asp:HyperLink ID="ReplyComments_Content" runat="server" ForeColor="Black" CssClass="text" Text='<%# SplitChar(Eval("ReplyComments_Content").ToString(),10) %>' NavigateUrl='<%# "../.aspx?repaycommentid="+ Eval("a.ReplyComments_ID") %>'></asp:HyperLink>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="ReplyComments_Time" runat="server" Text='<%# Eval("ReplyComments_Time") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Replay_User_Name" runat="server" Text='<%# Eval("User_Name") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <a class="rs_button rs_button_large rs_button_blue rs_button_light rs_button_top" href="ACG_Read.aspx?id=1">回复</a>
                                                    </td>

                                                </tr>
                                            </tbody>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </table>
                            </div>
                            <div class="sxy">
                                共有<span id="Span5" runat="server"></span>条   
 <span id="Span6" runat="server"></span>
                                <asp:DataPager runat="server" PagedControlID="UserIndex_replaycomments" PageSize="4" ID="DataPager3">
                                    <Fields>
                                        <asp:NextPreviousPagerField ShowFirstPageButton="true" FirstPageText="首页" PreviousPageText="上一页" ShowNextPageButton="false" />
                                        <asp:NumericPagerField ButtonCount="4" />
                                        <asp:NextPreviousPagerField ShowPreviousPageButton="false" LastPageText="最后一页" NextPageText="下一页" ShowNextPageButton="true" ShowLastPageButton="true" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        </div>
                    </asp:Panel>
                    <%--被回复 --%>
                    <asp:Panel ID="d3" runat="server" Visible="false">
                        <div class="col-xs-9 banner-body-right">
                            <div>
                               <table class="table" style="border-collapse:separate; border-spacing:0px 20px; ">
                                        <tr class="tr1">
                              <td style="width:15%;">回复内容</td>
                                     <td style="width:22%;">评论时间</td>
                                       <td style="width:13%;">用户</td>
                                            <td style="width:13%;">留言内容</td>
                                      <td style="width:10%;"></td>
                                         </tr>
                                    <asp:ListView ID="UserIndex_replayleawords" runat="server">
                                        <ItemTemplate>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <asp:HyperLink ID="ReplyLeavewords_Content" runat="server" ForeColor="Black" CssClass="text" Text='<%# SplitChar(Eval("ReplyLeavewords_Comment").ToString(),10) %>' NavigateUrl='<%# "../.aspx?repaycommentid="+ Eval("Leavewords_ID") %>'></asp:HyperLink>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="ReplyLeavewords_Time" runat="server" Text='<%# Eval("ReplyLeavewords_Time") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Replay_User_Name" runat="server" Text='<%# Eval("User_Name") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Replay_Comments_Content" runat="server" Text='<%# Eval("Leavewords_Content") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <a class="rs_button rs_button_large rs_button_blue rs_button_light rs_button_top" href="News_Read.aspx?id=1">回复</a>
                                                    </td>

                                                </tr>
                                            </tbody>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </table>
                            </div>
                            <div class="sxy">
                                共有<span id="Span7" runat="server"></span>条   
 <span id="Span8" runat="server"></span>
                                <asp:DataPager runat="server" PagedControlID="UserIndex_replayleawords" PageSize="4" ID="DataPager4">
                                    <Fields>
                                        <asp:NextPreviousPagerField ShowFirstPageButton="true" FirstPageText="首页" PreviousPageText="上一页" ShowNextPageButton="false" />
                                        <asp:NumericPagerField ButtonCount="4" />
                                        <asp:NextPreviousPagerField ShowPreviousPageButton="false" LastPageText="最后一页" NextPageText="下一页" ShowNextPageButton="true" ShowLastPageButton="true" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        </div>
                    </asp:Panel>
            
            <div id="contactResult"></div>
        </div>

        <div class="clear"></div>
    </div>   
           </asp:Panel>
     </form>
   
</asp:Content>
