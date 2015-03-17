<%@ Page Language="C#" MasterPageFile="~/masterpages/masterpageforuser.master" AutoEventWireup="true" CodeFile="UserFriendList.aspx.cs" Inherits="Fnet.UserFriendList" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <link rel="stylesheet" type="text/css" href="StyleSheet/UserFriendList.css" />
  <script type="text/javascript" src="Javascript/MyJavascript/FocusTextBox.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Col1" Runat="Server">
     <p>
        Username:<br />
        <asp:Label ID="lblUserName" runat="server"></asp:Label></p>
    <div id="Image">
        <asp:Image ID="imgProfile" AlternateText="Brackets" runat="server" onerror="this.onerror=null;this.src='/Images/default_User.jpg'" Height="160px"
            Width="140px" />
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Col2" Runat="Server">
    <div id="contentUserFriendList" align="center">
        <fieldset >
            <legend><h3>YOUR Friends</h3></legend>
            <br />
<!-- SEARCH FIELD ...................................................................................................................-->            
            <div id="searchContent">
                <asp:TextBox ID="txtSearch" runat="server" Width="323px"></asp:TextBox>
                &nbsp;
                <asp:Button ID="btnSearch" runat="server" Text="Search" BackColor="#FFCC99" 
                    onclick="btnSearch_Click" />
            </div>
            <br />
        </fieldset>
        
<!-- PANEL TO DISPLAY THE RESULT OF USER FRIEND SEARCH................................................................................-->
          <br />  <br />
        <asp:Panel runat="server" ID="pnlSearch"  Visible="true" align="center">    
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
             <table class="memberInfo">
                            <tr>
                                <asp:Repeater ID="rptFriend" runat="server">
                                    <ItemTemplate>
                                        <%# GetTR() %>
                                        <td >
                                            <a href="FriendProfile.aspx?friendID=<%#Eval("FRIEND_ID") %>">
                                                <img alt="Group Picture" onerror="this.onerror=null;this.src='Images/default_Group.jpg'"
                                                    src="ProfilePic/User_<%#Eval("FRIEND_ID") %>/ProfilePic_thumb.jpg" height="50px"
                                                    width="50px" />
                                                <br />
                                              <br />
                                                <%#DataBinder.Eval(Container.DataItem, "FIRST_NAME")%>   <%#DataBinder.Eval(Container.DataItem, "LAST_NAME")%>
                                        </td>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tr>
                        </table>
            
            
            <div id="FriendResult" style="background-color: #F5FFFA;" align="left">
            <br />
            <br />
            </div>
        </asp:Panel>
                    
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Col3" Runat="Server">
</asp:Content>

