<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="Cull_Class.aspx.cs" Inherits="WebApplication1.WebForm8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        
        <div class="path one columns"> 
            <span><a href="Cull_Index.aspx">文物宝鉴/</a> <a href="#"><asp:Label ID="dyn" runat="server" Text="" >&nbsp;</asp:Label></a> <a href="#"><asp:Label ID="cullclass" runat="server" Text="" >&nbsp</asp:Label></a>

            </span>
           
        </div>
      

        <!--左边列表-->
        <div class="columns four">
            <div class="sidebar">
                <asp:Panel ID="dynpanel" runat="server" >
                    <div class="title">朝代</div>
                    <ul>
                        <asp:Repeater ID="dynlist" runat="server">
                            <ItemTemplate>
                                <li><a href='<%#"Cull_Class.aspx?dyn2="+Eval("Dyn_ID") %>'><%#Eval("Dyn_Name") %></a></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </asp:Panel>
                <asp:Panel ID="classpanel" runat="server" >
                    <div class="title">文物分类</div>
                    <ul>
                        <asp:Repeater ID="classlist" runat="server">
                            <ItemTemplate>
                                <li><a href='<%#"Cull_Class.aspx?class2="+Eval("Class_ID") %>'><%#Eval("Class_Name") %></a></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </asp:Panel>
            </div>
        </div>
        <!--右边展示区-->
        <div class="columns three-fourths_last">

            <!-- 数据绑定 -->
            <div class="works">
                <asp:ListView ID="cullview" runat="server" GroupItemCount="2">
                    <LayoutTemplate>
                        <div id="groupPlaceholder" runat="server">
                        </div>
                      <%--  <div id="pagination">
                            <asp:DataPager ID="DataPager1" class="myPager" runat="server" PageSize="8">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="true" ShowNextPageButton="false"
                                        ShowPreviousPageButton="true" FirstPageText="首页" NextPageText="下一页" PreviousPageText="上一页" LastPageText="尾页" />
                                    <asp:NumericPagerField ButtonCount="5" CurrentPageLabelCssClass="current" />
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True"
                                        ShowNextPageButton="true" NextPageText="下一页" PreviousPageText="上一页" ShowPreviousPageButton="false" FirstPageText="首页" LastPageText="尾页" />

                                </Fields>

                            </asp:DataPager>

                        </div>--%>
                    </LayoutTemplate>
                    <GroupTemplate>
                        <div id="itemPlaceholder" runat="server">
                        </div>
                    </GroupTemplate>
                    <ItemTemplate>
                        <div class="columns three">
                            <div class="work">
                                <a href='<%#Eval("Cull_Img") %>' rel="prettyPhoto[a]" class="pretty" title='<%#Eval("Cull_Content")%>'><span></span>

                                    <img src='<%#Eval("Cull_Img") %>' alt="cards" /></a>
                                <a href='<%#"News_Class.aspx?cull_id="+Eval("Cull_ID") %>'>
                                        <h3><%#Eval("Cull_Name") %></h3>
                                    </a>
                                   
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
                <div class="clear"></div>
            </div>

        </div>
    </form>
</asp:Content>
