<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="Cull_Index.aspx.cs" Inherits="WebApplication1.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div class="slider"></div>
        <!--左边列表-->
    
           
        <div class="columns four">
          
            <div class="sidebar">
                 <div class="title">
                     <div style="width:70%;float:left"">
                          <asp:TextBox ID="txtCullname" runat="server" class="form-control"  value="文物搜索" Height="29px"/>
                     </div>
                     <div style="width:29%;float:left">
                          <asp:Button ID="select" runat="server" Text="查找" BackColor="Blue"   OnClick="select_Click" ForeColor="White" Height="29px" Width="48px" />
                     </div>           
              </div>
                 <div class="slider"></div>
                <div class="title">朝代</div>
                <ul>
                    <asp:Repeater ID="dynlist" runat="server">
                        <ItemTemplate>
                            <li><a href='<%#"Cull_Class.aspx?dynid="+Eval("Dyn_ID") %>'><%#Eval("Dyn_Name") %></a></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <div class="title">文物分类</div>
                <ul>
                    <asp:Repeater ID="classlist" runat="server">
                        <ItemTemplate>
                            <li><a href='<%#"Cull_Class.aspx?classid="+Eval("Class_ID") %>'><%#Eval("Class_Name") %></a></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        </div>
        <!--右边展示区-->
        <div class="columns three-fourths_last">
            <asp:Panel ID="cullpanel" runat="server" >
       <%--   <div class="slider"></div>--%>
            <!-- 唐-->
            <div class="works carousel">
                <div class="carouselNext"></div>
                <div class="carouselBack"></div>
                <div class="title">隋唐</div>
                <div class="clear"></div>
                <div class="titleline"></div>
                <div class="carouselView">
                    <div class="carouselContainer">
                        <asp:DataList ID="tanglist" runat="server" RepeatDirection="Horizontal" RepeatColumns="2">
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
                        </asp:DataList>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
            <!-- 唐 结束 -->

            <!-- 宋-->
            <div class="blogs carousel">
                <div class="carouselNext"></div>
                <div class="carouselBack"></div>
                <div class="title">宋</div>
                <div class="clear"></div>
                <div class="titleline"></div>
                <div class="carouselView">
                    <div class="carouselContainer">
                        <asp:DataList ID="songlist" runat="server" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <div class="columns four">
                                    <div class="work">
                                        <a href='<%#Eval("Cull_Img") %>' rel="prettyPhoto[a]" class="pretty" title='<%#Eval("Cull_Content")%>'><span></span>

                                            <img src='<%#Eval("Cull_Img") %>' alt="cards" /></a>
                                        <a href='<%#"News_Class.aspx?cull_id="+Eval("Cull_ID") %>'>
                                            <h3><%#Eval("Cull_Name") %></h3>
                                        </a>

                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>


                        <div class="clear"></div>
                    </div>
                </div>
            </div>


            <!-- 青铜器-->
            <div class="blogs carousel">
                <div class="carouselNext"></div>
                <div class="carouselBack"></div>
                <div class="title">青铜器</div>
                <div class="clear"></div>
                <div class="titleline"></div>
                <div class="carouselView">
                    <asp:DataList ID="qingtonglist" runat="server" RepeatDirection="Horizontal" RepeatColumns="2">
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
                    </asp:DataList>
                </div>
            </div>


            <!-- 书画-->
            <div class="blogs carousel">
                <div class="carouselNext"></div>
                <div class="carouselBack"></div>
                <div class="title">书画</div>
                <div class="clear"></div>
                <div class="titleline"></div>
                <div class="carouselView">
                    <div class="carouselContainer">
                        <asp:DataList ID="shuhualist" runat="server" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <div class="columns four">
                                    <div class="work">
                                        <a href='<%#Eval("Cull_Img") %>' rel="prettyPhoto[a]" class="pretty" title='<%#Eval("Cull_Content")%>'><span></span>

                                            <img src='<%#Eval("Cull_Img") %>' alt="cards" /></a>
                                        <a href='<%#"News_Class.aspx?cull_id="+Eval("Cull_ID") %>'>
                                            <h3><%#Eval("Cull_Name") %></h3>
                                        </a>

                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
                
            </asp:Panel>
              <asp:Panel ID="cullpanel2" runat="server"  >
                    <div class="blogs carousel">
                <div class="carouselNext"></div>
                <div class="carouselBack"></div>
                <div class="title">模糊搜索结果</div>
                <div class="clear"></div>
                <div class="titleline"></div>
                <div class="carouselView">
                    <div class="carouselContainer">
                        <asp:DataList ID="cullview" runat="server" RepeatDirection="Horizontal" RepeatColumns="2">
                   
                            <ItemTemplate>
                                <div class="columns four">
                                    <div class="work">
                                        <a href='<%#Eval("Cull_Img") %>' rel="prettyPhoto[a]" class="pretty" title='<%#Eval("Cull_Content")%>'><span></span>

                                            <img src='<%#Eval("Cull_Img") %>' alt="cards" /></a>
                                        <a href='<%#"News_Class.aspx?cull_id="+Eval("Cull_ID") %>'>
                                            <h3><%#Eval("Cull_Name") %></h3>
                                        </a>

                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>


                        <div class="clear"></div>
                    </div>
                </div>
            </div>
                  </asp:Panel>
        </div>
        <div class="clear"></div>
    </form>
</asp:Content>
