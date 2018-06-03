<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="News_Class.aspx.cs" Inherits="WebApplication1.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <form runat="server"> <asp:Repeater ID="Repeater1" runat="server">
             <ItemTemplate>
         <div class="path one columns"> 讲述
                 <%#Eval("Cull_Name") %>
             
              的故事！ </div></ItemTemplate>
                                           </asp:Repeater>
    <div class="slider"></div>
    <!-- 右边 -->
    <div class="columns three-fourths">
        <asp:ListView ID="Newsview" runat="server" GroupItemCount="2">
            <LayoutTemplate>
                <div id="groupPlaceholder" runat="server">
                </div>
                <div id="pagination" class="pagination">
                    <asp:DataPager ID="DataPager1" class="myPager" runat="server" PageSize="8">
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
            <GroupTemplate>
                <div id="itemPlaceholder" runat="server">
                </div>
            </GroupTemplate>
            <ItemTemplate>
                <div class="post">
                    <div class="image">
                        <img src='<%#Eval("News_Img") %>' alt="featured_image" />

                    </div>
                    <div class="postinfo">

                        <div class="clear"></div>
                        <p><b>发布</b> <%#String.Format("{0:yyyy-MM-dd}",Eval("News_Time")) %></p>
                        <p><b>标签</b> <%#Eval("Cull_Name") %></p>

                    </div>
                    <div class="resume">
                        <h3><%# SplitChar(Eval("News_Title").ToString(),10) %></h3>
                        <p><%# SplitChar(Eval("News_Content").ToString(),20) %></p>
                        <div class="viewlink"><a href='<%#"News_Read.aspx?id="+Eval("News_ID") %>'>详情&rarr;</a></div>
                        <div class="clear"></div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>

    </div>
    <!--左边-->
    <div class="columns four_last">
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
    </div>
    <!--左边 结束-->
    <div class="clear"></div></form>
</asp:Content>
