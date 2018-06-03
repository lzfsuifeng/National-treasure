<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="ACG_Top.aspx.cs" Inherits="WebApplication1.WebForm13" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
   <div class="works">
            <div class="carouselNext"></div>
            <div class="carouselBack"></div>
            <div class="title"><a href="ACG_Index.aspx">本周作品</a></div>
            <div class="clear"></div>
            <div class="titleline"></div>
            <div class="carouselView">
                <asp:DataList ID="Acgview" runat="server" RepeatDirection="Vertical" RepeatColumns="4">
                    <ItemTemplate>
                        <div class="columns four">
                            <div class="work">
                                <%-- <a href="images/images/walker_22.jpg" rel="prettyPhoto[a]" class="pretty" title="This is the description"><span></span>--%>
                                <a href='<%#"ACG_Read.aspx?pro_id="+Eval("Pro_ID") %>'>
                                    <img src='<%#Eval("Pro_Img") %>' alt="cards" /></a>
                                <h3><%# SplitChar(Eval("Pro_Title").ToString(),10) %></h3>
                                <h4><%#Eval("Tally_Name") %>, <%#String.Format("{0:yyyy-MM-dd}",Eval("Pro_Time")) %></h4>
                                <asp:Button ID="Button1" runat="server" Text="投票" BorderStyle="None" BackColor="blue" Height="30px" Width="50px" ForeColor="White" OnClick="Button1_Click" />
                                </a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
        <div class="clear"></div>
    </form>
</asp:Content>
