<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebApplication1.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <!-- 引言 -->
        <div class="quote one columns">
            希望能通过线上的宣传让更多人了解国家的文物与历史，同时希望更多的年轻人参与到保护传统文化和以传统文化为基础的新时代流行文化的创作中来，提升民族自豪感和文化自信！

        </div>
        <!-- 引言 结束 -->

        <div class="copyrights"></div>
        <!-- 首页活动轮播 -->
        <div class="skywalkerSlider">

            <!-- 图片轮播 -->
            <ul class="skywalkerSliderContent">
                <li class="skywalkerSliderContentItem skywalkerSliderContentActive">
                    <img class="skywalkerSliderContentItemImage" src="Img/ActionImg/国宝复活计划.png" alt="" />
                    <div class="skywalkerSliderContentItemBox">
                        <div class="skywalkerSliderContentItemBoxPrev"></div>
                        <div class="skywalkerSliderContentItemBoxNext"></div>
                        <div class="skywalkerSliderContentItemBoxInfo">
                            <div class="skywalkerSliderContentItemBoxInfoTitle">
                                <div class="skywalkerSliderContentItemBoxInfoTitleBackground"></div>
                                <div class="skywalkerSliderContentItemBoxInfoTitleText"><a href="ACG_Top.aspx">每周TOP</a></div>
                            </div>
                            <div class="skywalkerSliderContentItemBoxInfoText">
                                <div class="skywalkerSliderContentItemBoxInfoTextBackground"></div>
                                <div class="skywalkerSliderContentItemBoxInfoTextContent"><a href="ACG_Top.aspx">请为您喜欢的作品投上一票</a></div>
                            </div>
                        </div>
                    </div>
                </li>
                <asp:Repeater ID="lunbo2" runat="server">
                    <ItemTemplate>
                        <li class="skywalkerSliderContentItem">
                            <img class="skywalkerSliderContentItemImage" src='<%#Eval("Act_Img") %>' alt="" />
                            <div class="skywalkerSliderContentItemBox">
                                <div class="skywalkerSliderContentItemBoxPrev"></div>
                                <div class="skywalkerSliderContentItemBoxNext"></div>
                                <div class="skywalkerSliderContentItemBoxInfo">
                                    <div class="skywalkerSliderContentItemBoxInfoTitle">
                                        <div class="skywalkerSliderContentItemBoxInfoTitleBackground"></div>
                                        <div class="skywalkerSliderContentItemBoxInfoTitleText"><a href='<%#"Act_Read.aspx?act_id="+Eval("Act_ID") %>'><%# SplitChar(Eval("Act_Title").ToString(),10) %></a></div>
                                    </div>
                                    <div class="skywalkerSliderContentItemBoxInfoText">
                                        <div class="skywalkerSliderContentItemBoxInfoTextBackground"></div>
                                        <div class="skywalkerSliderContentItemBoxInfoTextContent"><a href='<%#"Act_Read.aspx?act_id="+Eval("Act_ID") %>'>国宝拟人形象征集<%--<%# SplitChar(Eval("Act_Content").ToString(),10) %>--%></a></div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>

            <ul class="skywalkerSliderPreview">
                <li class="skywalkerSliderPreviewItem skywalkerSliderPreviewActive">
                    <img class="skywalkerSliderPreviewItemImage" src="Img/ActionImg/国宝复活计划.png" alt="" />
                    <div class="skywalkerSliderPreviewItemOpacity"></div>
                </li>
                <asp:Repeater ID="lunbo1" runat="server">
                    <ItemTemplate>
                        <li class="skywalkerSliderPreviewItem"><a href='<%#"Act_Read.aspx?act_id="+Eval("Act_ID") %>'>
                            <img class="skywalkerSliderPreviewItemImage" src='<%#Eval("Act_Img") %>' alt="" /></a>
                            <div class="skywalkerSliderPreviewItemOpacity"></div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>

            <div class="skywalkerSliderMarker"></div>
            <div class="skywalkerSliderResponsiveLeft"></div>
            <div class="skywalkerSliderResponsiveRight"></div>

        </div>
        <!-- 首页轮播 结束 -->

        <!-- 文物宝鉴栏 -->
        <div class="works carousel">
            <div class="carouselNext"></div>
            <div class="carouselBack"></div>

            <div class="title"><a href="Cull_Index.aspx">文物宝鉴</a></div>
            <div class="clear"></div>
            <div class="titleline"></div>
            <div class="carouselView">
                <div class="carouselContainer">
                    <asp:DataList ID="cullview" runat="server" RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <div class="columns four">
                                <div class="work">
                                    <a href='<%#Eval("Cull_Img") %>' rel="prettyPhoto[a]" class="pretty" title='<%#Eval("Cull_Content")%>  '><span></span>

                                        <img src='<%#Eval("Cull_Img") %>' alt="cards" /></a>
                                    <a href='<%#"News_Class.aspx?cull_id="+Eval("Cull_ID") %>'>
                                        <h3><%#Eval("Cull_Name") %></h3>
                                    </a>
                                    <h4><%#Eval("Dyn_Name")%>,<%#Eval("Class_Name")%></h4>

                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
        </div>
        <!-- 文物宝鉴栏 结束 -->

        <!-- 前世今生栏 -->
        <div class="blogs carousel">
            <div class="carouselNext"></div>
            <div class="carouselBack"></div>
            <div class="title"><a href="News_Index.aspx">前世今生</a></div>
            <div class="clear"></div>
            <div class="titleline"></div>
            <div class="carouselView">
                <div class="carouselContainer">
                    <asp:DataList ID="news" runat="server" RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <div class="columns four">
                                <div class="newpost">
                                    <div class="viewpost"><a href='<%#"News_Read.aspx?id="+Eval("News_ID") %>'><%#String.Format("{0:yyyy-MM-dd}",Eval("News_Time")) %></a></div>
                                    <%--<a href='<%#"~/NewsDetail.aspx?id="+Eval("News_ID") %>' class="fade" title="This is the description"><span></span>--%>
                                    <a href='<%#"News_Read.aspx?id="+Eval("News_ID") %>'>
                                        <img src='<%#Eval("News_Img") %>' alt="cards" /></a>
                                    <div class="postvideo"></div>
                                    <h2><%# SplitChar(Eval("News_Title").ToString(),10) %></h2>
                                    <p><%# SplitChar(Eval("News_Content").ToString(),20) %></p>
                                    </a>
                                 <p><b>标签</b> <%#Eval("Cull_Name") %></p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>

                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <!-- 前世今生栏  结束-->

        <!-- ACG-->
        <div class="works">
            <div class="carouselNext"></div>
            <div class="carouselBack"></div>
            <div class="title"><a href="ACG_Index.aspx">ACG创作</a></div>
            <div class="clear"></div>
            <div class="titleline"></div>
            <div class="carouselView">
                <asp:DataList ID="acgview" runat="server" RepeatDirection="Vertical" RepeatColumns="3">
                    <ItemTemplate>
                        <div class="columns three">
                            <div class="work">
                                <%-- <a href="images/images/walker_22.jpg" rel="prettyPhoto[a]" class="pretty" title="This is the description"><span></span>--%>
                                <a href='<%#"ACG_Read.aspx?pro_id="+Eval("Pro_ID") %>'>
                                    <img src='<%#Eval("Pro_Img") %>' alt="cards" /></a>
                                <h3><%# SplitChar(Eval("Pro_Title").ToString(),10) %></h3>
                                <h4><%#Eval("Tally_Name") %>, <%#String.Format("{0:yyyy-MM-dd}",Eval("Pro_Time")) %></h4>
                                </a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
        <!-- END ACG-->
    </form>
</asp:Content>
