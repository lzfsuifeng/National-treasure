<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="Act_Read.aspx.cs" Inherits="WebApplication1.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
         <div class="path one columns"> <asp:Label ID="newstitle" runat="server" Text="Label" Font-Size="21px"/>
             <br />
             <asp:Label ID="newstime" runat="server" Text="Label" Font-Size="12px"/>
         </div>
      
        <div class="columns three-fourths">
            <!-- 新闻内容 -->
            <div class="post">                
              
                <div class="resume" >
                    
                    <p>
                        <asp:Label ID="newscontent" runat="server" Text="Label" /></p>
                   
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <!--左边-->
         <div class="columns four_last">
        <div class="sidebar">
            <!--热度列表-->
            <div class="title">历次活动</div>
             <div class="tabs">

                <div class="clear"></div>

                <div class="content contentActive">
                    <asp:Repeater ID="action" runat="server">
                        <ItemTemplate>
                            <div class="projects">
                                <h4><a href='<%#"Act_Read.aspx?act_id="+Eval("Act_ID") %>'><%# SplitChar(Eval("Act_Title").ToString(),10) %></a></h4>
                               
                                <div class="clear"></div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </div>
          

        </div>
    </div>
        <!--左边 结束-->
        <div class="clear"></div>
    </form>
</asp:Content>
