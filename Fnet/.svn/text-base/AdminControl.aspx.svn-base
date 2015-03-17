<%@ Page Language="C#" MasterPageFile="~/masterpages/masterpageforadmin.master" AutoEventWireup="true" CodeBehind="AdminControl.aspx.cs" Inherits="Fnet.AdminControl" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="StyleSheet/adminPages.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="Javascript/MyJavascript/FocusTextBox.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="contentPage">
    <div class="contentAdminPage" align="center">
        <div>
            <div>LOOKING FOR A USER</div>
            <br />
            <!-- SEARCH FOR CERTAIN USER IS HERE -->
                                    <div align="center" __designer:mapid="2415">
                                        <img src="Images/letter_big.png" alt="letter" __designer:mapid="2416" /><br 
                                            __designer:mapid="2417" />
                                    </div>
                                    <div __designer:mapid="2418">
                                        <table class="adminSearch" __designer:mapid="2419">
                                            <tr __designer:mapid="241a">
                                                <td __designer:mapid="241b">
                                                    Search for member:
                                                </td>
                                                <td __designer:mapid="241c">
                                                    <asp:TextBox ID="txtSearchUserName" runat="server" Width="298px"></asp:TextBox>
                                                </td>
                                                <td __designer:mapid="241e">
                                                    <asp:Button ID="btnSearchModify" runat="server" Text="Search" BackColor="#FFCC99"
                                                        OnClick="btnSearchModify_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
            <br />
            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                Text="Go to homepage" />
            <br />
            <asp:Panel ID="pnlModify" runat="server" Visible="false">
                <p>
                    Note: Validation need to be check
                    the result will be display as below in order to help admin confirm more about user detail.
                    When admin press rest password the email will be automatic sending. Message successful sending need to be display. thank you ./DELETE</p>
                <br />
                <hr style="color: #eff; width: 800px;"/>
                <br />
            <!-- RESET PASSWORD TABLE IS HERE  -->
                <div class="warning">
                    <div align="left"><h3>1. MODIFICATION </h3></div>
                    <center>
                    <p> 
                        1. Please confirm with system user about below details before conducting reset password if possible.<br />
                        2. Admin need to make sure the user email is lated updated or availble by asking user.<br />
                        3. Password will be automatic send to user thourgh the current user's email address in database.<br />
                        4. Old password will be removed from system, please inform user if possible.
                    </p>
                      <br />
                    </center>
                </div>
                <table class="resetPassword">
                    <tr>
                        <td colspan="2"><center><img src="Images/default_User.jpg" /></center></td>
                    </tr>
                     <tr>
                        <td>Username: </td>
                        <td><asp:TextBox ID="txtNewUserName" runat="server" Width="266px" 
                                onfocus ="Change(this, event)" onblur ="Change(this, event)"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td>First name</td>
                        <td>
                            <asp:TextBox ID="txtFirstName" runat="server" Width="266px" 
                                onfocus ="Change(this, event)" onblur ="Change(this, event)"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td>Last name: </td>
                        <td>
                            <asp:TextBox ID="txtLastName" runat="server" Width="266px" 
                                onfocus ="Change(this, event)" onblur ="Change(this, event)"></asp:TextBox>
                       </td>
                    </tr>
                     <tr>
                        <td>Email: </td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server" Width="266px" 
                                onfocus ="Change(this, event)" onblur ="Change(this, event)"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td></td>
                        <td>
                            <br />
                            <asp:Button ID="resetPassword" runat="server" Text="Reset Password" 
                                BackColor="#FFCC99" onclick="resetPassword_Click" />
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <hr style="color: #eff; width: 800px;"/>
                <br />
                <br />
                <div class="warning">
                <div align="left"><h3>2. Account Deletion </h3></div>
                     <p> 
                        1. To perform delete user account action, simply click on "Delete Account" button below. <br />
                        2. Once the delete had been performed, the user's information will be removed from database and unrecoverable.<br />
                        3. If user are not banned, please confirm user request if it is possible.
                     </p>
                     <br />
                    <asp:CheckBox ID="deleteConfirmation" runat="server" Text=" &nbsp;&nbsp;&nbsp;&nbsp;I want this account to be deleted." ForeColor="black" />
                    &nbsp;&nbsp;
                    <img alt="delete&quot;" src="Images/delete.png" />
                    <asp:Label ID="lblErrorDelete" runat="server" ForeColor="Red"></asp:Label>
                    <br />
                    <br />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete Account" 
                        BackColor="#FFCC99" onclick="btnDelete_Click" />
                    <br />
                    </div>                  
             </asp:Panel>
        </div>
        <br />
        <br />
        <br />
        <br />
    </div>
 </div>
</asp:Content>
