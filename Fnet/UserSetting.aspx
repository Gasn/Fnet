<%@ Page Language="C#" MasterPageFile="~/masterpages/masterpageforuser.master" AutoEventWireup="true"
    CodeFile="UserSetting.aspx.cs" Inherits="Fnet.UserSetting" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="StyleSheet/UserSetting.css" />

    <script type="text/javascript" src="Javascript/prototype.js"></script>

    <script type="text/javascript" src="Javascript/scriptaculous.js"></script>

  <!--  <script type="text/javascript" src="Javascript/accordion.js"></script> -->

    <script type="text/javascript" src="Javascript/MyJavascript/FocusTextBox.js"></script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Col1" runat="Server">
    <p>
        Username:<br />
        <asp:Label ID="lblUserName" runat="server"></asp:Label></p>
    <div id="Image">
        <asp:Image ID="imgProfile" AlternateText="Brackets" runat="server" Height="160px" onerror="this.onerror=null;this.src='/Images/default_User.jpg'"
            Width="140px" />
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Col2" runat="Server">
    <br />
    <asp:Panel ID="pnlContent" runat="server">
        <div id="contentUserSetting">
            <h2>
                SETTING</h2>
            <br />
        <!--    <div id="test-accordion" class="accordion">
                <!-- CHANGE NAME 
                <div class="accordion-toggle" style="height: 22px;">
                    First Name and Last Name Change</div>
                <div class="accordion-content">
                    <ul class="resetPasswordInfo">
                        <li>Please input your new user name.</li>
                    </ul>
                    <div style="background-color: #F5FFFA;">
                        <div id="changename">
                            <br />
                            <div>
                                UserName:</div>
                            <div>
                                <asp:TextBox ID="txtUserName" runat="server" Width="192px" onfocus="Change(this, event)"
                                    onblur="Change(this, event)"></asp:TextBox>&nbsp;(required)</div>
                            <asp:Label ID="lblUserNameError" runat="server" ForeColor="Red"></asp:Label>
                            <br />
                            <br />
                            <asp:Button ID="btnChangeName" runat="server" Text="Change User Name" BackColor="#FFCC99"
                                OnClick="btnChangeName_Click" />
                            <br />
                        </div>
                    </div>
                    <br />
                    <br />
                    <div align="center">
                        <asp:Label ID="lblUsernameUpdate" Visible="false" runat="server" CssClass="sucesschangenameview"> * Your user name has been updated to your profile. *</asp:Label>
                    </div>
                    <br />
                </div>
                <br />
                <!-- RESET PASSWORD 
                <div class="accordion-toggle" style="height: 22px;"> 
                    Password Change</div>
                <div class="accordion-content"> -->
                    <ul class="resetPasswordInfo">
                        <li>Do not use the same or repeated password that you use for other accounts.</li>
                        <li>New password should be at least 8 characters in length.</li>
                        <li>Recommend using a combination of letters, numbers, and punctuation. - avoid the
                            CAPSLOCK.</li>
                    </ul>
                    <div style="background-color: #F5FFFA;">
                        <div id="resetPassword">
                            <div>
                                <asp:Label ID="Label1" runat="server" Text="Old Password: "></asp:Label></div>
                            <div>
                                <asp:TextBox ID="txtOldPassword" runat="server" Width="192px" TextMode="Password"
                                    onfocus="Change(this, event)" onblur="Change(this, event)"></asp:TextBox>&nbsp;(required)<br />
                                <asp:Label ID="lblOldPassword" runat="server" ForeColor="Red"></asp:Label></div>
                            <br />
                            <div>
                                <asp:Label ID="Pword" runat="server" Text="New Password: "></asp:Label></div>
                            <div>
                                <asp:TextBox ID="txtNewPassword" runat="server" Width="192px" TextMode="Password"
                                    onfocus="Change(this, event)" onblur="Change(this, event)"></asp:TextBox>&nbsp;(required)
                                <br />
                                <asp:Label ID="lblNewPasswordError" runat="server" ForeColor="Red" /></div>
                            <br />
                            <div>
                                <asp:Label ID="CPword" runat="server" Text="Please re-enter new password: "></asp:Label></div>
                            <div>
                                <asp:TextBox ID="txtConfirmPassword" runat="server" Width="192px" TextMode="Password"
                                    onfocus="Change(this, event)" onblur="Change(this, event)"></asp:TextBox>
                                &nbsp;(required)
                                <br />
                                <asp:Label ID="lblConfirmPasswordError" runat="server" ForeColor="Red" /></div>
                            <br />
                            <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" BackColor="#FFCC99"
                                OnClick="btnChangePassword_Click" />
                            <br />
                        </div>
                    </div>
                    <br />
                    <br />
                    <div align="center">
                        <asp:Label ID="lblPasswordUpdated" Visible="false" runat="server" CssClass="sucesschangenameview"> * Your password has been updated to your profile. *</asp:Label>
                    </div>
            <!--    </div> -->
                <br />
                <!-- RESET BACKGROUND -->
                <%-- <div class="accordion-toggle" style="height:22px;">Background Setting Change</div>
	    <div class="accordion-content">--%>
                <%--   </div>--%>
                <br />
                <br />
            </div>
    </asp:Panel>
    <asp:Panel ID="pnlPasswordMessage" runat="server" Visible="false">
        <div style="background-color: #F5FFFA;" align="center">
            <br />
            <!-- YOUR USERNAME AND PASSWORD -->
            <fieldset style="width: 500px;">
                <legend style="color: #F49500; font-weight: bold;">Confirmation</legend>
                <br />
                <div class="field">
                    <div align="center">
                        Are you sure for changing your password?
                        <br />
                        <br />
                        <asp:Button ID="btnOk" runat="server" Text="OK" BackColor="#FFCC99" OnClick="btnOk_Click"
                            Height="26px" Width="54px" />
                        &nbsp; &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" BackColor="#FFCC99" OnClick="btnCancel_Click" />
                    </div>
                    <br />
            </fieldset>
            <br />
            <br />
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlUsernameMessage" runat="server" Visible="false">
        <div style="background-color: #F5FFFA;" align="center">
            <br />
            <!-- YOUR USERNAME AND PASSWORD -->
            <fieldset style="width: 500px;">
                <legend style="color: #F49500; font-weight: bold;">Confirmation</legend>
                <br />
                <div class="field">
                    <div align="center">
                        Are you sure for changing your username?
                        <br />
                        <br />
                        <asp:Button ID="btnUserOK" runat="server" Text="OK" BackColor="#FFCC99" Height="26px"
                            Width="54px" OnClick="btnUserOK_Click" />
                        &nbsp; &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnUserCancel" runat="server" Text="Cancel" BackColor="#FFCC99" OnClick="btnUserCancel_Click" />
                    </div>
                    <br />
            </fieldset>
            <br />
            <br />
            <br />
        </div>
    </asp:Panel>
    <br />
    <br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Col3" runat="Server">
</asp:Content>
