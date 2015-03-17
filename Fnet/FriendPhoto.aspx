<%@ Page Language="C#" MasterPageFile="~/masterpages/masterpageforfriend.master"
    AutoEventWireup="true" CodeBehind="FriendPhoto.aspx.cs" Inherits="Fnet.FriendPhoto"
    Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="StyleSheet/FriendMessage.css" />

    <script type="text/javascript" src="../Javascript/jFrog/prototype.js"></script>

    <script type="text/javascript" src="../Javascript/jFrog/scriptaculous.js?load=effects"></script>

    <script type="text/javascript" src="../Javascript/jFrog/frog.js"></script>

    <style type="text/css">
        body
        {
            text-align: center;
            font-family: verdana, arial, sans-serif;
            font-size: .7em;
        }
        #FrogJS
        {
            width: 850px;
            height: 600px;
            margin: 0 auto;
        }
        #FrogJSCredit
        {
            text-align: right;
            font-size: 80%;
            color: #999;
            padding: 1px;
        }
        #FrogJSCaption
        {
            text-align: left;
            line-height: 140%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="friend" runat="Server">
    <div>
        <div>
            <div class="friendDisplay" align="center">
                <table class="friendNavigation">
                    <tr>
                        <!-- USER PICTURE IS HERE AND MENU IS HERE-->
                        <td class="colsPic">
                            <asp:Image ID="imgFriendPic" AlternateText="friendIamge" runat="server" onerror="this.onerror=null;this.src='Images/default_User.jpg'"
                                Height="160px" Width="140px" />
                        </td>
                        <td>
                            <div align="center">
                                <font size="5">
                                    <asp:Label ID="lblUserName" runat="server" Text="username"></asp:Label>
                                </font>
                                <br />
                                <br />
                                <div style="background-color: #F5FFFA;">
                                    <img src="Images/pencil.png" alt="friendImage" /><a href="FriendWall.aspx" rel="history"
                                        style="text-decoration: none">&nbsp;Wall &nbsp;&nbsp;&nbsp;&nbsp; </a>/ &nbsp;&nbsp;&nbsp;&nbsp;
                                    <img src="Images/clipboard.png" alt="view" /><a href="FriendProfile.aspx" rel="history"
                                        style="text-decoration: none">&nbsp;Profile </a>&nbsp;&nbsp;&nbsp;&nbsp; / &nbsp;&nbsp;&nbsp;&nbsp;
                                    <img src="Images/folder.png" alt="view" />&nbsp;Photo &nbsp;&nbsp;&nbsp;&nbsp; / &nbsp;&nbsp;&nbsp;&nbsp;
                                   <img src="Images/letter.png" alt="view" /><a href="FriendMessage.aspx" rel="history"
                                        style="text-decoration: none"> &nbsp;Message</a>
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
                        <asp:Panel ID="pnlPic" runat="server">
                            <table align="center" cellspacing="0" class="tableContent">
                                <tr>
                                    <td class="title">
                                        <h3>
                                            Photos</h3>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="imageCell">
                                        <br>
                                        <br>
                                        <div id="FrogJS">
                                            <asp:Repeater ID="rptPhoto" runat="server">
                                                <ItemTemplate>
                                                    <a href='<%#DataBinder.Eval(Container.DataItem, "FileName")%>' target="_blank">
                                                        <img class="image" src='<%#DataBinder.Eval(Container.DataItem, "FileThumb")%>'></a>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </div>
                    <br />
                </div>
            </div>
</asp:Content>
