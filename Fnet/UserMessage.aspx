<%@ Page Language="C#" MasterPageFile="~/masterpages/masterpageforuser.master" AutoEventWireup="true"
    CodeBehind="UserMessage.aspx.cs" Inherits="Fnet.UserMessage" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="StyleSheet/userMessage.css" />

    <script type="text/javascript" src="Javascript/MyJavascript/FocusTextBox.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Col1" runat="Server">
 <p>
        Username:<br />
        <asp:Label ID="lblUserName" runat="server"></asp:Label></p>
    <div id="Image">
        <asp:Image ID="imgProfile" AlternateText="Brackets" runat="server" Height="160px" onerror="this.onerror=null;this.src='/Images/default_User.jpg'"
            Width="140px" />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Col2" runat="Server">

   
    <div class="contentMessage">
        &nbsp;
        <br />
        &nbsp;&nbsp;&nbsp; <a href="UserInbox.aspx">Back to Inbox</a>
        <br />
        <br />
        <div align="center">
            <br />
            <h3>
                Compose New Message</h3>
            <br />
            <div align="center">
                <img src="Images/pencil_2.png" />&nbsp; ...
                <img src="Images/letter_big.png" />
                ...<br />
                <br />
            </div>
            <table class="readingInboxTable">
                <tr>
                    <td class="Rcols1">
                        Receiver:
                    </td>
                    <td class="Rcols2">
                        <asp:Label ID="lblReceiver" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Rcols1">
                        Subject
                    </td>
                    <td class="Rcols2">
                        <asp:TextBox ID="txtSubject" runat="server" Width="382px" onfocus="Change(this, event)"
                            onblur="Change(this, event)"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Rcols1" valign="top">
                        Message:
                    </td>
                    <td>
                        <asp:TextBox ID="txtContent" runat="server" Width="382px" Height="187px" 
                            Rows="10" onfocus="Change(this, event)"
                            onblur="Change(this, event)"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <!-- MESSAGE CONTENT IS HERE -->
                    <td colspan="2">
                        <font style="color: Red;"><asp:Label ID="lblMessage" runat="server" Text=""></asp:Label></font>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        **This Message is sent by internal mailbox system of Fnet.
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="buttonContent" align="center">
                        <br />
                        <asp:Button ID="Button1" runat="server" Text="Send" 
                            Style="background-color: #FFCC99" onclick="Button1_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button2" runat="server" Text="Cancel" 
                            Style="background-color: #FFCC99" onclick="Button2_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>
    
      
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Col3" runat="Server">
</asp:Content>
