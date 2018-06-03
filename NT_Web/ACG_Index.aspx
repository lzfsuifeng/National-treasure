<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="ACG_Index.aspx.cs" Inherits="WebApplication1.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- 头部 -->
    <!-- 首页活动轮播 -->
    <div class="skywalkerSlider">

        <!-- 图片轮播 -->
        <ul class="skywalkerSliderContent">
            <li class="skywalkerSliderContentItem skywalkerSliderContentActive">
                <img class="skywalkerSliderContentItemImage" src="Img/ACGImg/越王勾践剑与吴王夫差矛.jpg" alt="" />
                <div class="skywalkerSliderContentItemBox">
                    <div class="skywalkerSliderContentItemBoxPrev"></div>
                    <div class="skywalkerSliderContentItemBoxNext"></div>
                    <div class="skywalkerSliderContentItemBoxInfo">
                        <div class="skywalkerSliderContentItemBoxInfoTitle">
                            <div class="skywalkerSliderContentItemBoxInfoTitleBackground"></div>
                            <div class="skywalkerSliderContentItemBoxInfoTitleText"></div>
                        </div>
                        <div class="skywalkerSliderContentItemBoxInfoText">
                            <div class="skywalkerSliderContentItemBoxInfoTextBackground"><a href='<%#"ACG_Read.aspx?pro_id=65" %>'>越王勾践剑与吴王夫差矛 </a></div>
                            <div class="skywalkerSliderContentItemBoxInfoTextContent"><a href='<%#"ACG_Read.aspx?pro_id=65" %>'>让历史火起来</a>  </div>
                        </div>
                    </div>
                </div>
            </li>
            <asp:Repeater ID="lunbo2" runat="server">
                <ItemTemplate>
                    <li class="skywalkerSliderContentItem">
                        <img class="skywalkerSliderContentItemImage" src='<%#Eval("Pro_Img") %>' alt="" />
                        <div class="skywalkerSliderContentItemBox">
                            <div class="skywalkerSliderContentItemBoxPrev"></div>
                            <div class="skywalkerSliderContentItemBoxNext"></div>
                            <div class="skywalkerSliderContentItemBoxInfo">
                                <div class="skywalkerSliderContentItemBoxInfoTitle">
                                    <div class="skywalkerSliderContentItemBoxInfoTitleBackground"></div>
                                    <div class="skywalkerSliderContentItemBoxInfoTitleText"><a href='<%#"ACG_Read.aspx?pro_id="+Eval("Pro_ID") %>'><%# SplitChar(Eval("Pro_Title").ToString(),10) %></a></div>
                                </div>
                                <div class="skywalkerSliderContentItemBoxInfoText">
                                    <div class="skywalkerSliderContentItemBoxInfoTextBackground"></div>
                                    <div class="skywalkerSliderContentItemBoxInfoTextContent"><a href='<%#"ACG_Read.aspx?pro_id="+Eval("Pro_ID") %>'></a></div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>

        <ul class="skywalkerSliderPreview">
            <li class="skywalkerSliderPreviewItem skywalkerSliderPreviewActive">
                <img class="skywalkerSliderPreviewItemImage" src="Img/ACGImg/越王勾践剑与吴王夫差矛.jpg" alt="" />
                <div class="skywalkerSliderPreviewItemOpacity"></div>
            </li>
            <asp:Repeater ID="lunboAcg" runat="server">
                <ItemTemplate>
                    <li class="skywalkerSliderPreviewItem"><a href='<%#"ACG_Read.aspx?pro_id="+Eval("Pro_ID") %>'>
                        <img class="skywalkerSliderPreviewItemImage" src='<%#Eval("Pro_Img") %>' alt="" /></a>
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

    <!--左边-->
    <div class="columns three-fourths">
        <!-- 视频 -->
        <div class="works carousel">
            <div class="carouselNext"></div>
            <div class="carouselBack"></div>
            <div class="title"><a href="ACG_Class.aspx?acgclass=视频">视频</a></div>
            <div class="clear"></div>
            <div class="titleline"></div>
            <div class="carouselView">
                <asp:DataList ID="shipinglist" runat="server" RepeatDirection="Horizontal" RepeatColumns="3">
                    <ItemTemplate>
                        <div class="columns four">
                            <div class="work">
                                <%-- <a href="images/images/walker_22.jpg" rel="prettyPhoto[a]" class="pretty" title="This is the description"><span></span>--%>
                                <a href='<%#"ACG_Read.aspx?pro_id="+Eval("Pro_ID") %>'>
                                    <img src='<%#Eval("Pro_Img") %>' alt="cards" /></a>
                                <h3><%# SplitChar(Eval("Pro_Title").ToString(),10) %></h3>
                                <%--<h3><%# SplitChar(Eval("User_Name").ToString(),10) %></h3>--%>
                                <h3><%#Eval("Tally_Name") %>, <%#String.Format("{0:yyyy-MM-dd}",Eval("Pro_Time")) %></h3>
                                </a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
        <!-- -->

        <!-- 漫画 -->
        <div class="blogs carousel">
            <div class="carouselNext"></div>
            <div class="carouselBack"></div>
            <div class="title"><a href="ACG_Class.aspx?acgclass=漫画">漫画</a></div>
            <div class="clear"></div>
            <div class="titleline"></div>
            <div class="carouselView">
                <asp:DataList ID="manhualist" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table">
                    <ItemTemplate>
                        <div class="columns four">
                            <div class="work">
                                <%-- <a href="images/images/walker_22.jpg" rel="prettyPhoto[a]" class="pretty" title="This is the description"><span></span>--%>
                                <a href='<%#"ACG_Read.aspx?pro_id="+Eval("Pro_ID") %>'>
                                    <img src='<%#Eval("Pro_Img") %>' alt="cards" /></a>
                                <h3><%# SplitChar(Eval("Pro_Title").ToString(),10) %></h3>
                                <%--<h3><%# SplitChar(Eval("User_Name").ToString(),10) %></h3>--%>
                                <h4><%#Eval("Tally_Name") %>, <%#String.Format("{0:yyyy-MM-dd}",Eval("Pro_Time")) %></h4>
                                </a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
        <!-- 插画 -->
        <div class="blogs carousel">
            <div class="carouselNext"></div>
            <div class="carouselBack"></div>
            <div class="title"><a href="ACG_Class.aspx?acgclass=插画">插画</a></div>
            <div class="clear"></div>
            <div class="titleline"></div>
            <div class="carouselView">
                <asp:DataList ID="chahualist" runat="server" RepeatDirection="Horizontal" RepeatColumns="3">
                    <ItemTemplate>
                        <div class="columns four">
                            <div class="work">
                                <%-- <a href="images/images/walker_22.jpg" rel="prettyPhoto[a]" class="pretty" title="This is the description"><span></span>--%>
                                <a href='<%#"ACG_Read.aspx?pro_id="+Eval("Pro_ID") %>'>
                                    <img src='<%#Eval("Pro_Img") %>' alt="cards" /></a>
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
    </div>
    <!--左边 结束-->


    <!--右边-->
    <div class="columns four_last">
        <div class="sidebar">
            <!--热度列表-->
            <div class="title">
                <h3 style="color: red">周Top</h3>
                <a href="ACG_Top.aspx" style="text-align: left; color: blue;font-size:12px;">投票入口</a>
            </div>
            <ol>
                <asp:Repeater ID="Topacg" runat="server">
                    <ItemTemplate>
                        <li><a href='<%#"ACG_Read.aspx?pro_id="+Eval("Pro_ID") %>'><%#Eval("Pro_Title") %></a></li>
                    </ItemTemplate>
                </asp:Repeater>


            </ol>
            <!--标签列表-->
            <div class="copyrights"></div>
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
</asp:Content>
