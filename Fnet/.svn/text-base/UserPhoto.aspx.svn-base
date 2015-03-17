<%@ Page Language="C#" MasterPageFile="~/masterpages/masterpageforuser.master" AutoEventWireup="true"
    CodeFile="UserPhoto.aspx.cs" Inherits="Fnet.UserPhoto" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="StyleSheet/UserPhoto.css" />

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
<asp:Content ID="Content2" ContentPlaceHolderID="Col1" runat="Server">
    <p>
        Username:
        <br />
        <asp:Label ID="lblUserName" runat="server"></asp:Label></p>
    <table class="userImg">
        <tr align="center">
            <td>
                <asp:Image ID="imgProfile" AlternateText="Brackets" runat="server" onerror="this.onerror=null;this.src='/Images/default_User.jpg'"
                    Height="159px" Width="140px" />
            </td>
        </tr>
    </table>
    <br />
    <div style="background-color: #ddd; border-bottom: solid 1px;">
        <br />
    </div>
    <div class="inboxSection">
        <!-- MailBox link is here  -->
        <table width="100%">
            <tr>
                <td>
                    <img src="Images/letter.png" alt="mailbox" />&nbsp;
                    <asp:LinkButton ID="linktoMailBox" runat="server">
                    MailBox:</asp:LinkButton>
                </td>
                <td class="cols2Message" valign="bottom">
                    <div align="right">
                        New messages (<asp:Label ID="numberUnreadMessage" runat="server" Text="2"></asp:Label>)
                    </div>
                </td>
            </tr>
        </table>
        <!-- Lastest MESSAGE LIST IS HERE -->
        <br />
        <div>
            <div class="lastestMessages">
                <table class="messageTable">
                    <tr>
                        <td class="cols1Message">
                            Nguyen
                        </td>
                    </tr>
                    <tr>
                        <td class="cols2Message">
                            Sub:
                            <asp:Label ID="messageSub" runat="server" Text="How are you doing ?"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="lastestMessages">
                <table class="messageTable">
                    <tr>
                        <td class="cols1Message">
                            Long
                        </td>
                    </tr>
                    <tr>
                        <td class="cols2Message">
                            Sub:
                            <asp:Label ID="Label1" runat="server" Text="Are you mad with exams, dude?"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <br />
        <!-- compose message link -->
        <div>
            <img src="Images/pencil.png" alt="mailbox" />
            <asp:LinkButton ID="linkToComposeMessage" runat="server">Send a Message</asp:LinkButton>
        </div>
        <br />
    </div>
    <div style="background-color: #ddd; border-bottom: solid 1px;">
        <br />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Col2" runat="Server">
    <br />
    <div>
        <div align="center">
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
        </div>
        <asp:Panel Width="100%" ID="pblUpload" runat="server">
            <table class="uploadF">
                <tr>
                    <td>
                        Upload:
                    </td>
                    <td class="style2">
                        <asp:FileUpload ID="uploadPic" runat="server" /><br />
                        Size limit: 4 MB
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="right">
                        <asp:Button ID="btnUpload" runat="server" BackColor="#FFCC99" Text="Upload" Width="88px"
                            OnClick="btnUpload_Click" />
                    </td>
                </tr>
            </table>
            <div align="center">
                <asp:Label ID="lblPicError" runat="server" Text=""></asp:Label></div>
        </asp:Panel>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Col3" runat="Server">
</asp:Content>
