<%@ Page Language="C#" MasterPageFile="~/masterpages/masterpageforuser.master" AutoEventWireup="true"
    CodeBehind="UserSearch.aspx.cs" Inherits="Fnet.UserSearch" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="StyleSheet/UserSearch.css" />

    <script type="text/javascript" src="Javascript/MyJavascript/FocusTextBox.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Col1" runat="server">
    <p>
        Username:<br />
        <asp:Label ID="lblUserName" runat="server"></asp:Label></p>
    <div id="Image">
        <asp:Image ID="imgProfile" AlternateText="Brackets" onerror="this.onerror=null;this.src='/Images/default_User.jpg'" runat="server" Height="160px"
            Width="140px" />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Col2" runat="server">
    <div id="contentSearch">
        <div id="searchfield">
            <!-- CHOOSE SEARCH FOR FRIEND OR GROUP -->
            <p class="searchStep">
                1. Search for:</p>
            <asp:RadioButtonList ID="lstSearchFor" runat="server" CssClass="searchInfo" AutoPostBack="True"
                OnSelectedIndexChanged="lstSearchFor_SelectedIndexChanged">
                <asp:ListItem Value="user" Selected="true"> Fnet User</asp:ListItem>
                <asp:ListItem Value="group"> Group</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <!-- CHOOSE SEARCH BY USERNAME OR EMAIL -->
            <p class="searchStep">
                2. Search by:</p>
            <asp:Panel ID="pnlSearchByGroup" Visible="false" runat="server">
                <asp:RadioButtonList ID="lstSearcByGroup" runat="server" CssClass="searchInfo">
                    <asp:ListItem Value="name" Selected="True"> Group name</asp:ListItem>
                    <asp:ListItem Value="Type"> Group Category</asp:ListItem>
                </asp:RadioButtonList>
            </asp:Panel>
            <asp:Panel ID="pnlSearchByUser" runat="server">
                <asp:RadioButtonList ID="lstSearcByUser" runat="server" CssClass="searchInfo">
                     <asp:ListItem Value="name" Selected="True"> Name</asp:ListItem>
                     <asp:ListItem Value="email" > Email</asp:ListItem>
                   
                </asp:RadioButtonList>
            </asp:Panel>
            <br />
            <!-- TEXTBOX FOR SEARCH DETAILS -->
            <p class="searchStep">
                3. Details:</p>
            <br />
            <asp:TextBox ID="txtSearch" runat="server" Width="382px" CssClass="searchInfo" onfocus="Change(this, event)"
                onblur="Change(this, event)"></asp:TextBox>
            &nbsp;&nbsp;
            <asp:Button ID="btnSearch" runat="server" Text="search" BackColor="#FFCC99" Width="61px"
                OnClick="btnSearch_Click" />
            <br />
            <asp:Label ID="lblSearch" runat="server" ForeColor="Red" />
        </div>
        <br />
        <br />
        <asp:Panel ID="pnlSearchUserResult" runat="server" visiable="true">
            <div id="result">
                <table class="groupList">
                    <asp:Repeater ID="rptUser" runat="server" OnItemCommand="rptUser_ItemCommand" OnItemDataBound="rptUser_ItemDataBound">
                        <ItemTemplate>
                            <tr>
                                <td class="col1">
                                    <%# Container.ItemIndex + 1%>
                                </td>
                                <td class="col2">
                                    <a href="FriendProfile.aspx?friendID=<%#DataBinder.Eval(Container.DataItem, "USER_ID")%>">
                                        <img alt="imgProfile" onerror="this.onerror=null;this.src='Images/default_User.jpg'" src="ProfilePic/User_<%#DataBinder.Eval(Container.DataItem, "USER_ID")%>/profilePic_thumb.jpg"
                                            height="50px" width="50px" /></a>
                                </td>
                                <td class="col3">
                                    <ul>
                                        <asp:Label ID="lblFriendID" Visible="false" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "USER_ID")%>'>
                                        </asp:Label>
                                        <li><b>Name:&nbsp;&nbsp;</b><asp:Label ID="lblFirstName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "FIRST_NAME")%>'></asp:Label> 
                                            <asp:Label ID="lblLastName" runat="server" Text=' <%#DataBinder.Eval(Container.DataItem, "LAST_NAME")%>'></asp:Label></li>
                                        <li><b>Gender:&nbsp;&nbsp;</b><%#DataBinder.Eval(Container.DataItem, "GENDER")%></li>
                                        <li><b>Hometown:&nbsp;&nbsp;</b><%#DataBinder.Eval(Container.DataItem, "STATE")%>,
                                            <%#DataBinder.Eval(Container.DataItem, "COUNTRY")%></li>
                                    </ul>
                                </td>
                                <td valign="bottom">
                                    <asp:LinkButton ID="lnkAddFriend" CommandName="Add" runat="server">Add as Friend</asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
        </asp:Panel>
        <asp:Panel ID="pnlSearchGroupRsult" runat="server" visiable="true">
            <div id="Div1">
                <table class="groupList">
                    <asp:Repeater ID="rptGroup" runat="server" OnItemCommand="rptGroup_ItemCommand" OnItemDataBound="rptGroup_ItemDataBound">
                        <ItemTemplate>
                            <tr>
                                <td class="col1">
                                    <%# Container.ItemIndex + 1%>
                                </td>
                                <td class="col2">
                                    <a href="Group.aspx?GroupID=<%#Eval("GROUP_ID") %>">
                                        <img alt="Group Picture" onerror="this.onerror=null;this.src='Images/default_Group.jpg'" src="GroupProfilePic/Group_<%#Eval("GROUP_ID") %>/GroupProfilePic_thumb.jpg"
                                            height="50px" width="50px" />
                                </td>
                                <td class="col3">
                                    <ul>
                                        <li><b>Group Name:&nbsp;&nbsp;</b>
                                            <asp:Label ID="lblGroupID" Visible="false" Text=' <%#DataBinder.Eval(Container.DataItem, "GROUP_ID")%>'
                                                runat="server">
                                            </asp:Label>
                                            <asp:Label ID="lblGroupName"  Text=' <%#DataBinder.Eval(Container.DataItem, "GROUP_NAME")%>'
                                                runat="server">
                                            </asp:Label>
                                            <li><b>Category:&nbsp;&nbsp;</b>
                                                <%#DataBinder.Eval(Container.DataItem, "CAT_NAME")%></li>
                                            <li><b>Description:&nbsp;&nbsp;</b>
                                                <%#DataBinder.Eval(Container.DataItem, "CAT_DESC")%></li>
                                            <li><b>Group type:&nbsp;&nbsp;</b>
                                                <%#DataBinder.Eval(Container.DataItem, "GROUP_TYPE")%></li>
                                    </ul>
                                    <td valign="bottom">
                                        <asp:LinkButton ID="lnkAddGroup" CommandName="Add" runat="server">Join Group</asp:LinkButton>
                                    </td>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
        </asp:Panel>
        <br />
        <asp:Panel ID="pnlMessageGroup" runat="server" Visible="false">
            <div style="width: 683px">
                <!-- YOUR USERNAME AND PASSWORD -->
                <fieldset>
                    <legend style="color: #F49500; font-weight: bold;">Confirmation </legend>
                    <br />
                    <div class="field">
                        <div align="center">
                            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                            <br />
                            <br />
                            <asp:Button ID="btnOk" runat="server" Text="OK" BackColor="#FFCC99" 
                                Width="49px" onclick="btnOk_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" BackColor="#FFCC99" 
                                Width="58px" onclick="btnCancel_Click" />
                        </div>
                        <br />
                </fieldset>
            </div>
        </asp:Panel>
        <asp:Panel ID="pnlMessageUser" runat="server" Visible="false">
            <div style="width: 683px">
                <!-- YOUR USERNAME AND PASSWORD -->
                <fieldset>
                    <legend style="color: #F49500; font-weight: bold;">Confirmation </legend>
                    <br />
                    <div class="field">
                        <div align="center">
                            <asp:Label ID="lblFriendMessage" runat="server" Text=""></asp:Label>
                            <br />
                            <br />
                            <asp:Button ID="btnFriendOK" runat="server" Text="OK" BackColor="#FFCC99" 
                                Width="49px" onclick="btnFriendOK_Click"  />&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnFriendCancel" runat="server" Text="Cancel" BackColor="#FFCC99" 
                                Width="58px" onclick="btnFriendCancel_Click"  />
                        </div>
                        <br />
                </fieldset>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Col3" runat="server">
</asp:Content>
