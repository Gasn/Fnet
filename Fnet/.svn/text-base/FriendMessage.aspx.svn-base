<%@ Page Language="C#" MasterPageFile="~/masterpages/masterpageforfriend.master"
    AutoEventWireup="true" CodeBehind="FriendMessage.aspx.cs" Inherits="Fnet.FriendMessage"
    Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="StyleSheet/FriendMessage.css" />
     <script type="text/javascript" src="../Javascript/MyJavascript/FocusTextBox.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="friend" runat="Server">
    <div>
        <div>
            <div class="friendDisplay" align="center">
                <table class="friendNavigation">
                    <tr>
                        <!-- USER PICTURE IS HERE AND MENU IS HERE-->
                        <td class="colsPic">
                            <asp:Image ID="imgFriendPic" AlternateText="friendIamge" runat="server"   onerror="this.onerror=null;this.src='Images/default_User.jpg'"
                                Height="160px" Width="140px" />
                        </td>
                        <td>
                            <div align="center">
                                <font size="5">
                                    <asp:Label ID="lblUserName" runat="server" Text="Username"></asp:Label>
                                </font>
                                <br />
                                <br />
                                <div style="background-color: #F5FFFA;">
                                    <img src="Images/pencil.png" alt="friendImage" /><a href="FriendWall.aspx" rel="history"
                                        style="text-decoration: none">&nbsp;Wall &nbsp;&nbsp;&nbsp;&nbsp; </a>/ &nbsp;&nbsp;&nbsp;&nbsp;
                                    <img src="Images/clipboard.png" alt="view" /><a href="FriendProfile.aspx" rel="history"
                                        style="text-decoration: none">&nbsp;Profile </a>&nbsp;&nbsp;&nbsp;&nbsp; / &nbsp;&nbsp;&nbsp;&nbsp;
                                    <img src="Images/folder.png" alt="view" /><a href="FriendPhoto.aspx" rel="history"
                                        style="text-decoration: none">&nbsp;Photo </a>&nbsp;&nbsp;&nbsp;&nbsp; / &nbsp;&nbsp;&nbsp;&nbsp;
                                    <img src="Images/letter.png" alt="view" />&nbsp;Message
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <br />
            <br />
            <div>
                <!-- SEND FRIEND MESSAGE ....................................................................................................................-->
                <div id="toFriendMessage">
                    <br />
                    <div align="center">
                        <img src="Images/letter_big.png" alt="letter" /><br />
                    </div>
                    <br />
                    <div align="center" class="inviteFriendSection">
                        <br />
                        <div>
                            Please fill in the details and your message willl be send.</div>
                        <br />
                        <table class="sendFriendMessage">
                            <tr>
                                <td>
                                    To:
                                </td>
                                <td>
                                    <asp:Label ID="lblTo" runat="server" Text=""></asp:Label>&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Subject:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSubject" runat="server" Width="266px" onfocus="Change(this, event)"
                                        onblur="Change(this, event)"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Your Message:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtContent" runat="server" Width="298px" Rows=" 5" Height="60px"
                                        MaxLength="50" onfocus="Change(this, event)" onblur="Change(this, event)"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Image ID="imgSent" Visible="false" runat="server" />&nbsp;&nbsp;<font color="red"><asp:Label ID="lblSentMessage"
                                        runat="server"></asp:Label></font>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:Button ID="btnSend" runat="server" Text="Send" BackColor="#FFCC99" 
                                        Width="59px" onclick="btnSend_Click" />
                                </td>
                            </tr>
                        </table>
                        <br />
                       
                    </div>
                    <br />
                    <br />
                </div>
            </div>
        </div>
</asp:Content>
