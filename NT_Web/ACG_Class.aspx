<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="ACG_Class.aspx.cs" Inherits="WebApplication1.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <form runat="server">
    <!-- START PATH -->
    <div class="path one columns">
        <span><a href="ACG_Index.aspx">ACG </a>/ <a href="#">
            <asp:Label ID="classname" runat="server" Text=""></asp:Label>
        </a></span>
    </div>

   
    <!-- 右边 -->
    <div class="columns three-fourths">
        <div class="works">
            <asp:DataList ID="Acgview" runat="server" RepeatDirection="Horizontal" RepeatColumns="2">
               <%-- <LayoutTemplate>
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
                </GroupTemplate>--%>
                <ItemTemplate>
                    <div class="columns three">
                        
                             <div class="work">
                            <%-- <a href="images/images/walker_22.jpg" rel="prettyPhoto[a]" class="pretty" title="This is the description"><span></span>--%>
                            <a href='<%#"ACG_Read.aspx?pro_id="+Eval("Pro_ID") %>'>
                                <img src='<%#Eval("Pro_Img") %>' alt="cards"  /></a>
                            <h3><%# SplitChar(Eval("Pro_Title").ToString(),10) %></h3>
                            <%-- <h3><%# SplitChar(Eval("User_Name").ToString(),10) %></h3>--%>
                            <h4><%#Eval("Tally_Name") %>, <%#String.Format("{0:yyyy-MM-dd}",Eval("Pro_Time")) %></h4>
                            </a>
                        </div>
                       
                       
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>

    <!--右边-->
    <div class="columns four_last">
        <div class="sidebar">
            <!--热度列表-->
            <div class="title">热度排行榜</div>
            <ol>
                <asp:Repeater ID="Topacg" runat="server">
                    <ItemTemplate>
                        <li><a href='<%#"ACG_Read.aspx?pro_id="+Eval("Pro_ID") %>'><%#Eval("Pro_Title") %></a></li>
                    </ItemTemplate>
                </asp:Repeater>


            </ol>
            <!--标签列表-->
            <br />
            <br />
            <div class="title">标签</div>
            <ul>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <li><a href='<%#"ACG_Class.aspx?tally_name="+Eval("Tally_Name") %>'><%#Eval("Tally_Name") %></a></li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
            <div class="title">最新作品</div>
            <div class="tabs">
                <div class="tab tabActive">视频</div>
                <div class="tab">漫画</div>
                <div class="tab">插画</div>
                <div class="clear"></div>
                <!--视频列表-->
                <div class="content contentActive">
                    <asp:Repeater ID="newShiping" runat="server">
                        <ItemTemplate>
                            <div class="projects">
                                <h4><a href='<%#"ACG_Read.aspx?pro_id="+Eval("Pro_ID") %>'><%# SplitChar(Eval("Pro_Title").ToString(),6) %></a></h4>
                                <a href="#">
                                    <img src='<%#Eval("Pro_Img") %>' alt="book" /></a>
                                <p><%# SplitChar(Eval("Pro_Title").ToString(),12) %> <a href='<%#"ACG_Read.aspx?pro_id="+Eval("Pro_ID") %>'>[...]</a> </p>
                                <div class="clear"></div>
                            </div>

                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <!--漫画列表-->
                <div class="content">
                    <asp:Repeater ID="newManhua" runat="server">
                        <ItemTemplate>
                            <div class="projects">
                                <h4><a href='<%#"ACG_Read.aspx?pro_id="+Eval("Pro_ID") %>'><%# SplitChar(Eval("Pro_Title").ToString(),6) %></a></h4>
                                <a href="#">
                                    <img src='<%#Eval("Pro_Img") %>' alt="book" /></a>
                                <p><%# SplitChar(Eval("Pro_Title").ToString(),12) %> <a href='<%#"ACG_Read.aspx?pro_id="+Eval("Pro_ID") %>'>[...]</a> </p>
                                <div class="clear"></div>
                            </div>

                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <!--插画列表-->
                <div class="content">
                    <asp:Repeater ID="newChahua" runat="server">
                        <ItemTemplate>
                            <div class="projects">
                                <h4><a href='<%#"ACG_Read.aspx?pro_id="+Eval("Pro_ID") %>'><%# SplitChar(Eval("Pro_Title").ToString(),6) %></a></h4>
                                <a href="#">
                                    <img src='<%#Eval("Pro_Img") %>' alt="book" /></a>
                                <p><%# SplitChar(Eval("Pro_Title").ToString(),12) %> <a href='<%#"ACG_Read.aspx?pro_id="+Eval("Pro_ID") %>'>[...]</a> </p>
                                <div class="clear"></div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div class="title">功能需求</div>
            <p>支持用户以相关文物为主题，上传自己创作的视屏、漫画、插画和同人小说，其他用户可以对其作品进行评论和点赞。</p>
        </div>
    </div>
    <!--右边 结束-->
    <div class="clear"></div>
       </form> 
</asp:Content>
