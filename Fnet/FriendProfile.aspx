<%@ Page Language="C#" MasterPageFile="~/masterpages/masterpageforfriend.master"
    AutoEventWireup="true" CodeBehind="FriendProfile.aspx.cs" Inherits="Fnet.FriendProfile"
    Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="StyleSheet/FriendProfile.css" />

    <script type="text/javascript" src="Javascript/MyJavascript/FocusTextBox.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="friend" runat="Server">
    <asp:Panel ID="pnlContent" runat="server" Visible="true">
        <div class="contentFriend">
            <div class="friendDisplay" align="center">
                <table class="friendNavigation">
                    <tr>
                        <!-- USER PICTURE IS HERE AND MENU IS HERE-->
                        <td class="colsPic">
                            <asp:Image ID="friendImage" AlternateText="friendIamge" runat="server"  onerror="this.onerror=null;this.src='Images/default_User.jpg'"
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
                                    <img src="Images/clipboard.png" alt="view" />&nbsp;Profile &nbsp;&nbsp;&nbsp;&nbsp;
                                    / &nbsp;&nbsp;&nbsp;&nbsp;
                                    <img src="Images/folder.png" alt="view" /><a href="FriendPhoto.aspx" rel="history"
                                        style="text-decoration: none">&nbsp;Photo </a>&nbsp;&nbsp;&nbsp;&nbsp; / &nbsp;&nbsp;&nbsp;&nbsp;
                                    <img src="Images/letter.png" alt="view" /><a href="FriendMessage.aspx" rel="history"
                                        style="text-decoration: none">&nbsp;Message </a>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <br />
            <br />
            <!-- FRIEND PROFILE ................................................................................................................. -->
            <div id="friendProfile">
                <br />
                <br />
                <div class="FprofileSection">
                    <fieldset class="userinfofield">
                        <legend style="color: #F49500; font-weight: bold;">PERSONAL INFORMATION</legend>
                        <br />
                        <br />
                        <table align="center" style="width: 499px" cellpadding="5px">
                            <tr>
                                <td class="infocell">
                                    <div>
                                        Username:
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:Label ID="lblName" runat="server" ForeColor="Black"></asp:Label></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="infocell">
                                    <div>
                                        Birthday:
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:Label ID="lblDOB" runat="server" ForeColor="Black"></asp:Label></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="infocell">
                                    <div>
                                        Gender
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:Label ID="lblGender" runat="server" ForeColor="Black"></asp:Label></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="infocell">
                                    <div>
                                        Email address:
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:Label ID="lblEmail" runat="server" ForeColor="Black"></asp:Label></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="infocell">
                                    <div>
                                        Address:
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:Label ID="lblAddress" runat="server" ForeColor="Black"></asp:Label></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="infocell">
                                    <div>
                                        Suburb:
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:Label ID="lblSuburb" runat="server" ForeColor="Black"></asp:Label></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="infocell">
                                    <div>
                                        State:
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:Label ID="lblState" runat="server" ForeColor="Black"></asp:Label></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="infocell">
                                    <div>
                                        Postcode:
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:Label ID="lblPostalCode" runat="server" ForeColor="Black"></asp:Label></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="infocell">
                                    <div>
                                        Country:
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:Label ID="lblCountry" runat="server" ForeColor="Black"></asp:Label></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="infocell">
                                    <div>
                                        Join Date:
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:Label ID="lblJoinDate" runat="server" ForeColor="Black"></asp:Label></div>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </fieldset>
                </div>
                <div>
                    <br />
                    <fieldset class="userinfofield">
                        <legend style="color: #F49500; font-weight: bold;">PERSONAL INTEREST</legend>
                        <br />
                        <table align="center" style="width: 499px" cellpadding="5px" class="fTable">
                            <tr>
                                <td class="infocell">
                                    <div>
                                        Looking for:
                                    </div>
                                </td>
                                <td>
                                    <asp:BulletedList ForeColor="Black" ID="lstLookingFor" DataTextField="LOOKING_TYPE"
                                        runat="server">
                                    </asp:BulletedList>
                                </td>
                            </tr>
                            <tr>
                                <td class="infocell">
                                    <div>
                                        Interest in:
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:BulletedList ForeColor="Black" ID="lstInterest" DataTextField="HOBBY_NAME" runat="server">
                                        </asp:BulletedList>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="infocell">
                                    <div>
                                        Relationship status:
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:Label ID="result" runat="server"></asp:Label>
                                        <asp:BulletedList ID="rList" runat="server" DataTextField="Relation_Type_ID">
                                        </asp:BulletedList>
                                        <asp:BulletedList ID="rWith" runat="server">
                                        </asp:BulletedList>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                    </fieldset>
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlError" runat="server" Visible="false" Width="382px">
    
        <div align="center">
            <fieldset>
                <legend  style="color: #F49500; font-weight: bold;">Error </legend>
                <br />
                <div class="field" align="center">
                    <div align="center">
                     Error, User cannot be found.
                        <br />
                        <br />
                        <asp:Button ID="btnOk" runat="server" Text="OK" BackColor="#FFCC99" OnClick="btnOk_Click" />
                    </div>
                    <br />
                </div>
            </fieldset>
        </div>
    </asp:Panel>
</asp:Content>
