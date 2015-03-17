<%@ Page Language="C#" MasterPageFile="~/masterpages/masterpageforgroup.master" AutoEventWireup="true"
    CodeBehind="Group.aspx.cs" Inherits="Fnet.Group" Title="Group" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="StyleSheet/Group.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheet/jquery-ui-1.7.2.custom.css" />

    <script type="text/javascript" src="Javascript/jquery-1.3.2.min.js"></script>

    <script type="text/javascript" src="Javascript/ui.core.js"></script>

    <script type="text/javascript" src="Javascript/ui.tabs.js"></script>

    <script type="text/javascript" src="Javascript/MyJavascript/FocusTextBox.js"></script>

    <script type="text/javascript" language="javascript">   
         $(function() {       
          $("#tabs").tabs({           
           show: function() {             
              var sel = $('#tabs').tabs('option', 'selected');            
                  $("#<%= hidLastTab.ClientID %>").val(sel); }, selected: <%= hidLastTab.Value %> 
                  });   
                   });
           
    </script>

    <style type="text/css">
        .style1
        {
            width: 159px;
        }
        .style2
        {
            width: 319px;
        }
        .style3
        {
            width: 353px;
        }
        .currentGroupProfile
        {
            width: 610px;
        }
        .style4
        {
            width: 440px;
        }
        .style5
        {
            width: 166px;
        }
        .style6
        {
            width: 74px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="group" runat="Server">
    <asp:HiddenField runat="server" ID="hidLastTab" Value="0" />
    <div id="contentGroup">
        <table id="groupFirstInfo" border="1">
            <tr>
                <td class="style1">
                    <ul>
                        <li><b>Group name:</b><br />
                            <asp:Label ID="lblGroupName" runat="server" Text=""></asp:Label></li>
                        <li>
                            <asp:Image ID="imgGroup" AlternateText="groupImages" runat="server" Height="100px" onerror="this.onerror=null;this.src='/Images/default_Group.jpg'"
                                Width="100px" /></li>
                    </ul>
                </td>
                <!-- GROUP INITIAL INFORMATION HERE ................................................................................................................-->
                <td class="generalGroupInfo">
                    <div class="groupInfo">
                        <b>Basic Info</b></div>
                    <ul class="groupInfo">
                        <li>Category:
                            <asp:Label ID="lblCategory" runat="server"></asp:Label></li>
                        <li>Description:
                            <asp:Label ID="lblDesc" runat="server"></asp:Label></li>
                        <li>Group Type:
                            <asp:Label ID="lblGroupType" runat="server"></asp:Label></li>
                        <li>Created Date:
                            <asp:Label ID="lblCreatedDate" runat="server"></asp:Label></li>
                    </ul>
                </td>
            </tr>
        </table>
        <br />
        <!-- GROUP ADMISTRATOR CORNER -->
        <asp:Panel ID="pnlAdmin" runat="server" Visible="false">
            <div align="center" valign="middle" style="height: 39px; background-color: #F5F5F5;">
                <a href="GroupAdmin.aspx" id="adminLink">GROUP ADMINISTRATOR CORNER</a>
                <br />
            </div>
        </asp:Panel>
        <br />
        <!-- GROUP TAG/ MENU IS HERE .......................................................................................................................-->
        <asp:Panel ID="pnlMember" runat="server" Visible="true">
            <div id="tabs">
                <ul>
                    <li><a href="#discussionBoard"><span>Discussion Board</span></a></li>
                    <li><a href="#fileSharing"><span>File Sharing</span></a></li>
                    <li><a href="#inviteFriend"><span>Invite Friends To Join</span></a></li>
                    <li><a href="#groupProfile"><span>Group Profile</span></a></li>
                    <li><a href="#groupMember"><span>Group Member</span></a></li>
                </ul>
                <!-- UPLOAD PROFILE INFO HERE ............................................................................................................-->
                <!-- DISCUSSION BROAD -->
                <div id="discussionBoard">
                    <asp:Panel ID="pnlTopic" runat="server" Visible="true">
                        <div class="welcome">
                            <p>
                                <b>&quot;Welcome to discussion board, please post your topic/comments to share knowledge
                                    and build communities with one another"</b></p>
                        </div>
                        <br />
                        <div>
                            <div class="highLight">
                                <h3 class="section">
                                    Discussion Board Topics --&gt;</h3>
                            </div>
                            <table width="100%">
                                <tr>
                                    <td>
                                        <b>Number of topics:</b>&nbsp;&nbsp;
                                        <asp:Label ID="lblNumOfTopic" runat="server"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <img src="Images/pencil.png" alt="picTopic1" />
                                        <img src="Images/document.png" alt="picTopic1" />
                                        <asp:LinkButton ID="lnkNewTopic" runat="server" OnClick="lnkNewTopic_Click">New Topic</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <br />
                        <div style="background-color: White;">
                            <%--   <table width="100%" border="1px">
                        <tr>
                            <td>No</td>
                            <td>Topic Name</td>
                            <td>Created by</td>
                            <td>Date</td>
                            <td>Deleted ?</td>
                        </tr>
                    </table>--%>
                            <asp:GridView ID="grdBoard" runat="server" CellPadding="4" Width="100%" ForeColor="#333333"
                                AutoGenerateColumns="false" DataKeyNames="BOARD_ID" 
                                OnRowCommand="grdBoard_RowCommand" BackColor="Black" BorderStyle="Solid" 
                                BorderWidth="1px">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:ButtonField HeaderStyle-HorizontalAlign="Left" HeaderText="Topic Name" DataTextField="BOARD_TOPIC" />
                                    <asp:BoundField Visible="false" DataField="BOARD_ID" />
                                    <asp:BoundField HeaderStyle-HorizontalAlign="Left" HeaderText="Created By" DataField="CREATER" />
                                    <asp:BoundField HeaderStyle-HorizontalAlign="Left" HeaderText="Date" DataFormatString="{0:d}" DataField="CREATED_DATE" />
                                </Columns>
                                <RowStyle BackColor="White" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="black" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#555555" />
                                <HeaderStyle BackColor="#FFCC99" Font-Bold="True" HorizontalAlign="Left" ForeColor="Black" />
                                <EditRowStyle BackColor="#2461BF" />
                                <AlternatingRowStyle BackColor="#F5FFFA" />
                            </asp:GridView>
                            <%-- <p>
                            Note: Display the topic following the date order, only admin can see the delete
                            the topic button and normal memebr can not . User can click into the Topic name
                            to link to the topic page and post their comments
                            <br />
                            if user create the new topic please looat the paper/DELETE
                        </p>--%>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlNewTopic" runat="server" Visible="false">
                        <div align="center" style="background-color: #F5FFFA;">
                            <br />
                            <div>
                                <img src="Images/pencil_2.png" alt="heart" />
                                <h3>
                                    CREATE YOUR OWN TOPIC...</h3>
                                <br />
                            </div>
                            <table class="newGroupTable">
                                <tr>
                                    <td>
                                        Topic Name:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTopicName" runat="server" Width="298px" onfocus="Change(this, event)"
                                            onblur="Change(this, event)"></asp:TextBox>
                                        <br />
                                        Maximum of 40 characters.
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Topic description:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTopicDEsc" runat="server" Width="298px" Rows="4" Height="60px"
                                            MaxLength="50" onfocus="Change(this, event)" onblur="Change(this, event)"></asp:TextBox>
                                        <br />
                                        Maximum of 60 characters.
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnAddTopic" runat="server" Text="Submit" BackColor="#FFCC99" OnClick="btnAddTopic_Click" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnCancelTopic" runat="server" Text="Cancel" BackColor="#FFCC99"
                                            OnClick="btnCancelTopic_Click" />
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <br />
                        </div>
                    </asp:Panel>
                    <br />
                </div>
                <!-- UPLOAD FILE SHARING -->
                <div id="fileSharing">
                    <br />
                    <!-- UPLOAD PHOTO -->
                    <div id="uploadPhotoOnly">
                        <div style="background-color: #F5FFFA;">
                            <h3>
                                PHOTO / VIDEO / OTHER FILES</h3>
                        </div>
                        <br />
                        <div align="center">
                            <table class="uploadF">
                                <tr>
                                    <td>
                                        Upload:
                                    </td>
                                    <td class="style2">
                                        <asp:FileUpload ID="uploadFile" runat="server" /><br />
                                        Size limit: 10 MB
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="right">
                                        <asp:Button ID="btnUpload" runat="server" BackColor="#FFCC99" Text="Upload" Width="88px"
                                            OnClick="btnUpload_Click" />
                                    </td>
                                </tr>
                            </table>
                            <!-- ADD PHOTO HERE -->
                            <br />
                            <br />
                            <div id="displayGroupFile" align="center">
                                <font style="color: Red;"><asp:Label ID="lblUploadError" runat="server" Text=""></asp:Label></font>
                            </div>
                            <br />
                        </div>
                    </div>
                    <div align="center">
                        <asp:GridView ID="grdFile" DataKeyNames="FILENAME,FILEPATH,FILESIZE" 
                            runat="server" CellPadding="4" AutoGenerateColumns="false"
                            ForeColor="#333333" GridLines="None" onrowcommand="grdFile_RowCommand" 
                            Width="564px" BorderStyle="Solid" BorderWidth="1px">
                            <Columns>
                                <asp:BoundField ItemStyle-Width="40%" DataField="FILENAME" 
                                    HeaderText="File Name" >
                                    <ItemStyle Width="40%" />
                                </asp:BoundField>
                                <asp:BoundField ItemStyle-Width="20%" DataField="FILEPATH" Visible="false" >
                                    <ItemStyle Width="20%" />
                                </asp:BoundField>
                                <asp:BoundField ItemStyle-Width="20%" DataField="FILESIZE" 
                                    DataFormatString="{0:#,### bytes}" HeaderText="File Size" >
                                    <ItemStyle Width="20%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="UPLOADDATE" DataFormatString="{0:d}" HeaderText="Upload Date" />
                                <asp:ButtonField ButtonType="Button" HeaderText="Action" Text="Download" />
                            </Columns>
                            <RowStyle BackColor="White" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#FFCC99" Font-Bold="True" ForeColor="Black" />
                            <EditRowStyle BackColor="#2461BF" />
                            <AlternatingRowStyle BackColor="#F5FFFA" />
                        </asp:GridView>
                    </div>
                </div>
                <!-- INVITE FRIEND INTO GROUP-->
                <div id="inviteFriend">
                    <div align="center" class="inviteFriendSection">
                        <br />
                        <div>
                            <asp:Panel ID="pnlInvite" runat="server">
                                <div align="center" class="inviteNewMemberSection">
                                    <br />
                                    <div align="center">
                                        <img src="Images/letter_big.png" alt="letter" /><br />
                                    </div>
                                    <div>
                                        <table class="adminSearch">
                                            <tr>
                                                <td>
                                                    Search for member:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtInvite" runat="server" Width="298px"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnSearchInvite" runat="server" Text="Search" BackColor="#FFCC99"
                                                        OnClick="btnSearchInvite_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <div align="center" id="Div3" style="background-color: White">
                                        <br />
                                        <asp:GridView ID="grdInvite" runat="server" CssClass="displayMemberSearchInfo" AutoGenerateColumns="false"
                                            DataKeyNames="USER_ID, NAME" CellPadding="4" ForeColor="#333333" GridLines="None"
                                            OnRowCommand="grdInvite_RowCommand" Width="493px" BorderStyle="Solid" BorderWidth="1px">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <img alt="" src="<%# GroupPicUrl(ToInt(Eval("USER_ID"))) %>" onerror="this.onerror=null;this.src='/Images/default_Group.jpg'"
                                                            height="50px" width="50px" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField Visible="false" DataField="USER_ID" />
                                                <asp:BoundField HeaderText="NAME" DataField="NAME" />
                                                <asp:BoundField HeaderText="EMAIL" DataField="EMAIL" />
                                                <asp:ButtonField ButtonType="Button" HeaderText="Add" ControlStyle-CssClass="adminButton"
                                                    Text="Add" >
                                                    <ControlStyle CssClass="adminButton" />
                                                </asp:ButtonField>
                                            </Columns>
                                            <RowStyle BackColor="White" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <HeaderStyle BackColor="#FFCC99" CssClass="displayMemberSearchInfo" Font-Bold="True"
                                                ForeColor="Black" />
                                            <EditRowStyle BackColor="#2461BF" />
                                            <AlternatingRowStyle BackColor="#F5FFFA" />
                                        </asp:GridView>
                                         <br />
                                        <br />
                                    </div>
                                   
                                    <div align="center">
                                       <font style="color: Red"><asp:Label ID="lblInviteMessage" runat="server" Text=""></asp:Label></font>
                                    </div>
                                    <br />
                                    <table>
                                        <tr>
                                            <td align="left" valign="top">
                                                To:
                                            </td>
                                            <td>
                                                <table>
                                                    <asp:Repeater ID="rptReciever" runat="server" OnItemCommand="rptReciever_ItemCommand"
                                                        OnItemDataBound="rptReciever_ItemDataBound">
                                                        <ItemTemplate>
                                                            <%# GetInviteTR() %>
                                                            <td style="border-width: 1px; border-style: dotted; border-color: #FFCC99;">
                                                                <%#DataBinder.Eval(Container.DataItem, "NAME")%>
                                                                &nbsp;&nbsp;
                                                                <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="Images/delete.png" />
                                                            </td>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style6">
                                                &nbsp;Subject:
                                            </td>
                                            <td align="left">
                                                Invitation for joining Group&nbsp; <b>
                                                    &nbsp;
                                                    <asp:Label ID="Label1" runat="server"></asp:Label></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <br />
                                                <asp:Image ID="imgSent" Visible="false" runat="server" />&nbsp;&nbsp;
                                                    <font style="color: Red"><asp:Label ID="lblSentMessage"
                                                    runat="server"></asp:Label>
                                                    </font>
                                                <br />
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style6">
                                            </td>
                                            <td>
                                                <asp:Button ID="sendInvitation" runat="server" Text="Send" BackColor="#FFCC99" Width="59px"
                                                    OnClick="sendInvitation_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <%-- <p>
                    Note: please notice admin has sucessful send email. /DELETE</p>--%>
                                </div>
                            </asp:Panel>
                            <br />
                            <br />
                        </div>
                    </div>
                </div>
                <!-- GROUP PROFILE -->
                <div id="groupProfile">
                    <br />
                    <div class="groupProfileSection" align="center">
                        <table class="currentGroupProfile">
                            <tr>
                                <td>
                                    Group name:
                                </td>
                                <td class="style3">
                                    <asp:Label ID="lblCurrentGroupName" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Group description:
                                </td>
                                <td class="style3">
                                    <asp:Label ID="lblCurrentGroupDesc" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Profile Picture:
                                </td>
                                <td class="style3">
                                    <asp:Image ID="imgCurrentGroup" AlternateText="groupImages" runat="server"  onerror="this.onerror=null;this.src='/Images/default_Group.jpg'" 
                                        Height="100px" Width="100px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Group category:
                                </td>
                                <td class="style3">
                                    <asp:Label ID="lblCurrentGroupCat" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Group create By:
                                </td>
                                <td class="style3">
                                    <asp:Label ID="lblCurrentGroupOwner" runat="server"></asp:Label>
                                    &nbsp;- Admin
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Created Date:
                                </td>
                                <td class="style3">
                                    <asp:Label ID="lblCurrentCreatedDate" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="pnlEdit" runat="server" Visible="False">
                            <br />
                            <asp:Button ID="editGroupProfile" runat="server" Text="Edit Group Information" BackColor="#FFCC99"
                                OnClick="editGroupProfile_Click" />
                            <br />
                            <br />
                            <!-- ADMIN EDIT GROUP INFO HERE -->
                            <asp:Panel ID="pnlAdminEditGroupInfo" runat="server" Visible="False">
                                <div class="adminEditGroupInfoSection">
                                    <br />
                                    <table class="currentGroupProfile">
                                        <tr>
                                            <td class="style5">
                                                Group name:
                                            </td>
                                            <td class="style4">
                                                <asp:TextBox ID="txtAdminEditGroupName" runat="server" Width="298px" onfocus="Change(this, event)"
                                                    onblur="Change(this, event)"></asp:TextBox>
                                                <br />
                                                Maximum of 50 characters
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style5">
                                                Group description:
                                            </td>
                                            <td class="style4">
                                                <asp:TextBox ID="txtAdminEditGroupDesc" runat="server" Text="" Width="298px" Rows=" 5"
                                                    Height="60px" MaxLength="50" onfocus="Change(this, event)" onblur="Change(this, event)"></asp:TextBox>
                                                <br />
                                                Maximum of 100 characters
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style5">
                                                Profile Picture:
                                            </td>
                                            <td class="style4">
                                                <asp:FileUpload ID="uploadPic" runat="server" />
                                                <asp:Label ID="lblPicError" runat="server" ForeColor="Red"></asp:Label>
                                                <br />
                                                Size limit: 4 MB<br />
                                                &nbsp;<br />
                                                <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Style="background-color: #FFCC99"
                                                    Text="Update" />
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                </div>
                                <br />
                            </asp:Panel>
                        </asp:Panel>
                    </div>
                    <br />
                </div>
                <!-- GROUP MEMBER LIST -->
                <div id="groupMember">
                    <br />
                    <div style="background-color: #F5FFFA;">
                        <h3>
                            GROUP MEMBER</h3>
                    </div>
                    <br />
                    <br />
                   
                    <div id="displayGroupMember">
                        <table class="memberInfo">
                            <tr>
                                <asp:Repeater ID="rptGrpMembers" runat="server">
                                    <ItemTemplate>
                                        <%# GetTR() %>
                                        <td>
                                            <a href="FriendProfile.aspx?FriendID=<%#Eval("USER_ID") %>">
                                                <img alt="Group Picture" onerror="this.onerror=null;this.src='Images/default_User.jpg'"
                                                    src="ProfilePic/User_<%#Eval("USER_ID") %>/ProfilePic_thumb.jpg" height="50px"
                                                    width="50px" />
                                                <br />
                                                <br />
                                                <%#DataBinder.Eval(Container.DataItem, "NAME")%>
                                        </td>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
