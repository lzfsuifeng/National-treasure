<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="News_Read.aspx.cs" Inherits="WebApplication1.WebForm10" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <link href="Bootstrao/css/bootstrap.min.css" rel="stylesheet" />
    <script src="Bootstrao/js/bootstrap.min.js"></script>
    <script src="Bootstrao/js/jquery-3.1.1.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <asp:Repeater ID="newsdetail" runat="server">
            <ItemTemplate>
      
         <div class="path one columns"> <asp:Label ID="newstitle" runat="server" Text='<%#Eval("News_Title") %>' Font-Size="21px"/><br />
             <asp:Label ID="newstime" runat="server" Text=' <%#string.Format("{0:yyyy-MM-dd HH:mm}",Eval("News_Time")) %>'></asp:Label>
         </div>
        <div class="slider"></div>

        <div class="columns one">

            <!-- 新闻内容 -->
            <div class="post">
                  <div class="image">   <img src='<%#Eval("News_Img") %>' alt="featured_image"/></div>
              <%--  <div class="postinfo">

                    <div class="clear"></div>
                    <p><b></b>
                        </p>
                </div>--%>
                   <p>
                        <asp:Label ID="newscontent" runat="server" Text='<%#Eval("News_Content") %>' /></p>
                <div class="resume" >
                    
                 
                   
                    <div class="clear"></div>
                </div>
            </div>
</ItemTemplate>
  </asp:Repeater>
            <h2>
                <asp:Label ID="num" runat="server" Text=""></asp:Label>留言</h2>
            <section id="comments">

                <ol class="commentlist">

                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:ListView ID="listView1" runat="server" OnItemDataBound="listView1_ItemDataBound">
                                <LayoutTemplate>
                                    <div id="itemPlaceholderContainer" runat="server">
                                        <div id="itemPlaceholder" runat="server">
                                        </div>
                                    </div>
                                    <div class="wp-pagenavi">
                                        <asp:DataPager ID="DataPager1" class="myPager" runat="server" PageSize="5">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="true" ShowNextPageButton="false"
                                                    ShowPreviousPageButton="true" FirstPageText="首页" NextPageText="下一页" PreviousPageText="上一页" LastPageText="尾页" />
                                                <asp:NumericPagerField ButtonCount="5" CurrentPageLabelCssClass="current" />
                                                <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True"
                                                    ShowNextPageButton="true" NextPageText="下一页" PreviousPageText="上一页" ShowPreviousPageButton="false" FirstPageText="首页" LastPageText="尾页" />

                                            </Fields>

                                        </asp:DataPager>

                                    </div>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <li>
                                        <div class="comment">
                                            <div class="line"></div>
                                            <div class="image">
                                                <img src='<%# Eval("User_Img") %>' alt="user" style="height: 80px; width: 60px" />
                                            </div>
                                            <div class="commentcontent">
                                                <div class="date">
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" OnClick="LinkButton1_Click">回复<span></span></asp:LinkButton>
                                                    <%#string.Format("{0:yyyy-MM-dd HH:mm}",Eval("Leavewords_Time")) %> 来自 <%#Eval("User_Name") %>
                                                </div>
                                                <p><%#Eval("Leavewords_Content") %></p>
                                            </div>
                                            <asp:Panel ID="Panel1" runat="server" Visible="false">
                                                <div class="js_replycontainer">
                                                    <div class="e_comment_r_expand js_replyroot">
                                                        <div class="q_comment_box js_q_comment_box">
                                                            <div class="textarea1">
                                                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("Leavewords_ID") %>' />
                                                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("Leavewords_ID") %>' Visible="false"></asp:Label>

                                                                <CKEditor:CKEditorControl ID="txtContent" runat="server" BasePath="../ckeditor/" DefaultLanguage="zh-cn" Height="150px"></CKEditor:CKEditorControl>

                                                            </div>
                                                            <div class="q_comment_box_btn">

                                                                <asp:Button ID="Button1" runat="server" CssClass="btn_comment js_btn_reply" CausesValidation="false" OnClick="huifu_Click" Text="回复" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </asp:Panel>
                                        </div>


                                        <%-- 评论回复--%>

                                        <ol>
                                            <asp:Repeater ID="Repeater2" runat="server">
                                                <ItemTemplate>
                                                    <li>
                                                        <div class="replay">
                                                            <div class="line"></div>
                                                            <div class="image">
                                                                <img src='<%# Eval("User_Img") %>' alt="user" style="height: 60px; width: 40px" /></div>
                                                            <div class="commentcontent">
                                                                <div class="date">
                                                                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="link_reply js_expand_reply" CausesValidation="false" OnClick="LinkButton1_Click">回复<span></span></asp:LinkButton><%#string.Format("{0:yyyy-MM-dd HH:mm}",Eval("ReplyLeavewords_Time")) %> 来自 <%#Eval("User_Name") %> </div>
                                                                <p><%#Eval("ReplyLeavewords_Comment") %></p>
                                                            </div>

                                                        </div>
                                                    </li>

                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </ol>
                                    </li>
                                    </div>
                                </ItemTemplate>
                            </asp:ListView>
                            <div style="margin-top: 15px; width: 100%;">
                                <span style="vertical-align: top;">
                                    <asp:Label ID="tishi" runat="server" Text="(图文并茂，无字数限制！)" Font-Size="15" ForeColor="#555555"></asp:Label>
                                </span>
                                <span>
                                    <CKEditor:CKEditorControl ID="txtContent" runat="server" BasePath="../ckeditor/" DefaultLanguage="zh-cn" Height="150px"></CKEditor:CKEditorControl>
                                </span>
                                <div style="float: right; margin-top: 10px;">
                                    <asp:Button ID="pinglun" runat="server" Text="评论" Height="33px" Style="margin-left: 0px" Width="71px" OnClick="pinglun_Click" />
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </ol>

            </section>
        </div>
        <!--左边-->
        <%-- <div class="columns four_last">
        <div class="sidebar">
            <!--热度列表-->
            <div class="title">热度排行榜</div>
             <div class="tabs">

                <div class="clear"></div>

                <div class="content contentActive">
                    <asp:Repeater ID="TopNews" runat="server">
                        <ItemTemplate>
                            <div class="projects">
                                <h4><a href='<%#"News_Read.aspx?id="+Eval("News_ID") %>'><%# SplitChar(Eval("News_Title").ToString(),10) %></a></h4>
                                <a href="#">
                                    <img src='<%#Eval("News_Img") %>' alt="book" /></a>
                                <p><%# SplitChar(Eval("News_Content").ToString(),20) %> <a href='<%#"News_Read.aspx?id="+Eval("News_ID") %>'>[...]</a> </p>
                                <div class="clear"></div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </div>
            <div class="title">最新作品</div>
            <div class="tabs">

                <div class="clear"></div>

                <div class="content contentActive">
                    <asp:Repeater ID="newNews" runat="server">
                        <ItemTemplate>
                            <div class="projects">
                                <h4><a href='<%#"News_Read.aspx?id="+Eval("News_ID") %>'><%# SplitChar(Eval("News_Title").ToString(),10) %></a></h4>
                                <a href="#">
                                    <img src='<%#Eval("News_Img") %>' alt="book" /></a>
                                <p><%# SplitChar(Eval("News_Content").ToString(),20) %> <a href='<%#"News_Read.aspx?id="+Eval("News_ID") %>'>[...]</a> </p>
                                <div class="clear"></div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </div>

        </div>
    </div>--%>
        <!--左边 结束-->
        <div class="clear"></div>
    </form>
</asp:Content>
