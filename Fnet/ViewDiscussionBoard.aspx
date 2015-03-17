<%@ Page Language="C#" MasterPageFile="~/masterpages/masterpageforgroup.master" AutoEventWireup="true"
    CodeBehind="ViewDiscussionBoard.aspx.cs" Inherits="Fnet.ViewDiscussionBoard"
    Title="View Discussion Board" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="StyleSheet/BoardTopic.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheet/jquery-ui-1.7.2.custom.css" />
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="group" runat="server">
    <div id="discussionBoard">
        <div class="contentDiscussion">
        <div class="highLight">
            <h3 class="section" >
                <asp:Label Text="" ID="lblDiscussionTopic" runat="server"></asp:Label>
            </h3>
              <div align="right">
            <asp:LinkButton ID="lnkBack" runat="server" onclick="lnkBack_Click">Back To Discussion Board</asp:LinkButton>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
        </div>
        <br />
        <h3 style="color: Black">
            new Post - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
            - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </h3>
        <br />
        <div align="center">
      
            <br />
            <table class="mainPost">
                <tr>
                    <td rowspan="2">
                        <img alt="pencil" src="Images/pencil_64.png" />
                    </td>
                    <td>
                        <br />
                        <asp:TextBox ID="txtComment" runat="server" Height="39px" Width="403px"></asp:TextBox>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="lblInsertError" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                        <asp:Button ID="btnAdd" runat="server" BackColor="#FFCC99" OnClick="btnAdd_Click"
                            Text="Post" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;<asp:Button ID="btnEdit" runat="server" BackColor="#FFCC99"
                            Text="Edit" Visible="False" onclick="btnEdit_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
            <br />
        </div>
        <h3 style="color: Black">
            Previous Posts - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
            - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </h3>
        <br />
            <table class="groupInfo">
                <asp:Repeater ID="rptdiscussionBoard" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td class="col2" align="center">
                                <ul>
                                    <li><a href="#"><b>
                                        <%#DataBinder.Eval(Container.DataItem, "NAME")%></b></a></li>
                                    <li><a href="FriendProfile.aspx?UserID=<%#Eval("USER_ID") %>">
                                        <img alt="User Picture" onerror="this.onerror=null;this.src='Images/default_User.jpg'"
                                            src="UserProfilePic/User_<%#Eval("User_ID") %>/UserProfilePic_thumb.jpg" height="50px"
                                            width="50px" /> </li>
                                </ul>
                            </td>
                            <td class="col3">
                                <ul>
                                    <li><b>Board Content:</b></li>
                                    <li>
                                        <p>
                                            <%#DataBinder.Eval(Container.DataItem, "BOARD_DETAIL")%></p>
                                    </li>
                                </ul>
                                <div class="leaveGroup" align="right">
                                    <% if (lblInsertError.Text == "3" || lblInsertError.Text == "5")
                                       {%>
                                    <asp:LinkButton ID="lnkButtonDelete" Text='Delete' CommandName="Delete" OnCommand="lnkButtonDelete_Command"
                                        CommandArgument='<%#DataBinder.Eval(Container.DataItem, "BOARD_CONTENT_ID")%>'
                                        runat="server" />
                                    <asp:LinkButton ID="LinkBtnEdit" Text='Edit' CommandName="Edit" OnCommand="lnkBtnEdit_Command"
                                        CommandArgument='<%#DataBinder.Eval(Container.DataItem, "BOARD_CONTENT_ID")%>'
                                        runat="server" />
                                    <% } %>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Repeater ID="rptPages" runat="server">
                    <ItemTemplate>
                        &nbsp;
                        <asp:LinkButton ID="btnPage" CommandName="Page" CommandArgument="<%#
                         Container.DataItem %>" runat="server"><%# Container.DataItem %>
                        </asp:LinkButton>&nbsp;
                    </ItemTemplate>
                </asp:Repeater>
            </table>
         </div>
         <br />
         <br />
         <br />
         <br />
    </div>
</asp:Content>
