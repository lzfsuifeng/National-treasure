<%@ Page Title="播放" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="ACG_Read.aspx.cs" Inherits="WebApplication1.WebForm4" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link href="Bootstrao/css/bootstrap.min.css" rel="stylesheet" />
    <script src="Bootstrao/js/bootstrap.min.js"></script>
    <script src="Bootstrao/js/jquery-3.1.1.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div class="slider"></div>
        <div class="columns one">

            <div class="post">
                <asp:Panel ID="shiping" runat="server" Visible="false">
                    <asp:Repeater ID="acgdetall" runat="server">
                        <ItemTemplate>
                            <div class="image">

                                <video src='<%#Eval("Pro_Content") %>' controls="controls" />

                            </div>

                            <div class="postinfo">
                                <div class="posttype">
                                    <asp:Image ID="userimg" runat="server" class="img-circle" Width="60px" Height="60px" ImageUrl='<%#Eval("User_Img") %>' />
                                    <p>
                                        <b>发布者：</b>
                                        <asp:Label ID="username" runat="server" Text='<%#Eval("User_Name") %>'></asp:Label>
                                    </p>
                                    <p>
                                        <b>标签：</b>
                                        <asp:Label ID="tallyname" runat="server" Text='<%#Eval("Tally_Name") %>'></asp:Label>
                                    </p>
                                </div>
                                <div class="clear"></div>

                            </div>
                            <div class="path one columns">
                                <asp:Label ID="newstitle" runat="server" Text='<%#Eval("Pro_Title") %>'> Font-Size="36px"></asp:Label>
                                <br />
                                <asp:Label ID="protime" runat="server" Text='<%#String.Format("{0:yyyy-MM-dd}",Eval("Pro_Time")) %>'></asp:Label>
                            </div>
                            <%--  <div class="resume">
                            
                        </div>
                       
                        </div>--%>
                        </ItemTemplate>
                    </asp:Repeater>
                </asp:Panel>
                <asp:Panel ID="otheracg" runat="server" Visible="false">
                    <asp:Repeater ID="Repeater2" runat="server">
                        <ItemTemplate>
                            <div class="image">

                                <asp:Label ID="protent" runat="server" Text='<%#Eval("Pro_Content") %>'></asp:Label>

                            </div>

                            <div class="postinfo">
                                <div class="posttype">
                                    <asp:Image ID="userimg" runat="server" class="img-circle" Width="60px" Height="60px" ImageUrl='<%#Eval("User_Img") %>' />
                                    <p>
                                        <b>发布者：</b>
                                        <asp:Label ID="username" runat="server" Text='<%#Eval("User_Name") %>'></asp:Label>
                                    </p>
                                    <p>
                                        <b>标签：</b>
                                        <asp:Label ID="tallyname" runat="server" Text='<%#Eval("Tally_Name") %>'></asp:Label>
                                    </p>
                                </div>
                                <div class="clear"></div>

                            </div>
                            <div class="path one columns">
                                <asp:Label ID="newstitle" runat="server" Text='<%#Eval("Pro_Title") %>'> Font-Size="36px"></asp:Label>
                                <br />
                                <asp:Label ID="protime" runat="server" Text='<%#String.Format("{0:yyyy-MM-dd}",Eval("Pro_Time")) %>'></asp:Label>
                            </div>


                        </ItemTemplate>
                    </asp:Repeater>
                </asp:Panel>
                <div class="resume">
                    <asp:Button ID="collectbutton" runat="server" Text="收藏" class="btn btn-primary btn-large" OnClick="collectbutton_Click"/>
                    <asp:Button ID="informbutton" runat="server" Text="举报" class="btn btn-danger btn-large" OnClick="informbutton_Click"/>
                    </div>
                    <div class="clear"></div>
                    <h2>
                        <asp:Label ID="num" runat="server" Text=""></asp:Label>评论</h2>
                    <div id="comments">

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
                                                            <%#string.Format("{0:yyyy-MM-dd HH:mm}",Eval("Comments_Time")) %> 来自 <%#Eval("User_Name") %>
                                                        </div>
                                                        <p><%#Eval("Comments_Content") %></p>
                                                    </div>
                                                    <asp:Panel ID="Panel1" runat="server" Visible="false">
                                                        <div class="js_replycontainer">
                                                            <div class="e_comment_r_expand js_replyroot">
                                                                <div class="q_comment_box js_q_comment_box">
                                                                    <div class="textarea1">
                                                                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("Comments_ID") %>' />
                                                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("Comments_ID") %>' Visible="false"></asp:Label>

                                                                        <CKEditor:CKEditorControl ID="txtContent" runat="server" BasePath="../ckeditor/" DefaultLanguage="zh-cn" Height="150px"></CKEditor:CKEditorControl>

                                                                    </div>
                                                                    <div class="q_comment_box_btn">

                                                                        <asp:Button ID="Button2" runat="server" CssClass="btn_comment js_btn_reply" CausesValidation="false" OnClick="huifu_Click" Text="回复" />
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
                                                                            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="link_reply js_expand_reply" CausesValidation="false" OnClick="LinkButton1_Click">回复<span></span></asp:LinkButton><%#string.Format("{0:yyyy-MM-dd HH:mm}",Eval("ReplyComments_Time")) %> 来自 <%#Eval("User_Name") %> </div>
                                                                        <p><%#Eval("ReplyComments_Content") %></p>
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

                    </div>
                </div>


            </div>
        <!--右边-->
        <%--  <div class="columns one">
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
    </div>--%>
        <!--右边 结束-->
        <div class="clear"></div>
    </form>
</asp:Content>
