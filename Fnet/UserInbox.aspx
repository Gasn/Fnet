<%@ Page Language="C#" MasterPageFile="~/masterpages/masterpageforuser.master" AutoEventWireup="true"
    CodeBehind="UserInbox.aspx.cs" Inherits="Fnet.UserInbox" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="StyleSheet/UserInbox.css" />
    <style type="text/css">
        .style1
        {
            width: 26px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Col1" runat="Server">
    <p>
        Username:<br />
        <asp:Label ID="lblUserName" runat="server"></asp:Label></p>
    <table class="userImg">
        <tr align="center">
            <td>
                <asp:Image ID="imgProfile" AlternateText="Brackets" runat="server" Height="159px"
                    onerror="this.onerror=null;this.src='/Images/default_User.jpg'" Width="140px" />
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
    </div>
    <div style="background-color: #ddd; border-bottom: solid 1px;">
        <br />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Col2" runat="Server">
    <div id="contentInbox">
        <center>
            <img src="Images/letter_big.png" /><br />
            <br />
        </center>
        <!-- MESSAGE INBOX LIST IS HERE -->
        <asp:GridView ID="grdInbox" runat="server" CellPadding="4" AutoGenerateColumns="false"
            CssClass="inboxTable" GridLines="None" DataKeyNames="NAME, SUBJECT, CONTENT, MESSAGE_ID, MESSAGE_DATE, READ, SENDER_ID"
            OnRowCommand="grdInbox_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="Read">
                    <ItemTemplate>
                        <img alt="" src='<%# Eval("READ").ToString().Equals("0") ? "Images/tick.png" : "Images/left.png" %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:ButtonField HeaderStyle-HorizontalAlign="Left" HeaderText="Sender" DataTextField="NAME"
                    ItemStyle-CssClass="cols1" />
                <asp:ButtonField HeaderStyle-HorizontalAlign="Left" HeaderText="Subject" DataTextField="SUBJECT"
                    ItemStyle-CssClass="cols2" />
                <asp:BoundField HeaderStyle-HorizontalAlign="Left" HeaderText="Sent" DataField="MESSAGE_DATE"
                    DataFormatString="{0:d}" ItemStyle-CssClass="cols3" />
                <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="CONTENT" Visible="false" />
                <asp:BoundField DataField="MESSAGE_ID" Visible="false" />
                <asp:BoundField DataField="READ" Visible="false" />
                <asp:BoundField DataField="SENDER_ID" Visible="false" />
                <asp:ButtonField Text="Delete" HeaderText="Action" CommandName="Delete" />
            </Columns>
            <RowStyle BackColor="#EFF3FB" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle CssClass="Tableheader" ForeColor="#F49500" HorizontalAlign="Left"/>
            <EditRowStyle CssClass="mailList" />
            <AlternatingRowStyle CssClass="mailList" />
        </asp:GridView>
        <div align="center">
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label></div>
        <!-- MESSAGE DISPLAY IS HERE -->
        <br />
        <br />
        <br />
        <hr style="color: #eed; width: 600px;" />
        <br />
        <br />
        <br />
        <div align="center">
            <table class="readingInbocTable">
                <tr>
                    <td class="Rcols1">
                        Sender:
                    </td>
                    <td class="Rcols2">
                        <asp:Label ID="lblSender" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Rcols1">
                        Subject:</td>
                    <td class="Rcols2">
                        <asp:Label ID="lblSubject" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Rcols1">
                        Sent:</td>
                    <td class="Rcols2">
                        <asp:Label ID="lblDate" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Rcols1">
                        Message:
                    </td>
                    <td class="Rcols2">
                    </td>
                </tr>
                <tr>
                    <!-- MESSAGE CONTENT IS HERE -->
                    <td colspan="2" class="messageCellDetail">
                        <div class="messageDetails">
                            <asp:Label ID="lblContent" runat="server" Text=""></asp:Label>
                        </div>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="right">
                        <asp:HyperLink ID="lnkReply" NavigateUrl="UserMessage.aspx" runat="server">Reply</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        **This Message is sent by internal mailbox system of Fnet.
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <br />
        <br />
        <br />
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Col3" runat="Server">
</asp:Content>
