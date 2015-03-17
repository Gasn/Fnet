<%@ Page Language="C#" MasterPageFile="~/masterpages/masterpageforuser.master" AutoEventWireup="true"
    CodeBehind="UserGroupProfile.aspx.cs" Inherits="Fnet.UserGroupProfile"
    Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="StyleSheet/GroupSelect.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheet/jquery-ui-1.7.2.custom.css" />

    <script type="text/javascript" src="Javascript/jquery-1.3.2.min.js"></script>

    <script type="text/javascript" src="Javascript/ui.core.js"></script>

    <script type="text/javascript" src="Javascript/ui.tabs.js"></script>

    <script type="text/javascript" src="Javascript/MyJavascript/FocusTextBox.js"></script>

    <script type="text/javascript">
        $(document).ready(function(){
            $('#tabs').tabs();
          });
    </script>

    <style type="text/css">
        .style1
        {
            height: 58px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Col1" runat="Server">
    <p>
        Username:<br />
        <asp:Label ID="lblUserName" runat="server"></asp:Label></p>
    <div id="Image">
        <asp:Image ID="imgProfile" AlternateText="Brackets" onerror="this.onerror=null;this.src='/Images/default_User.jpg'"  runat="server" Height="160px"
            Width="140px" />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Col2" runat="Server">
    <div id="contentSelectGroup">
        <div id="tabs">
            <ul>
                <li><a href="#memberOf"><span>Your joined groups</li>
                <li><a href="#ownerOf"><span>Your own groups</span></a></li>
                <li><a href="#createNewGroup"><span>Create New Group</span></a></li>
            </ul>
            <!-- GROUP LIST WILL BE DISPLAY IN # COLUMS INFO HERE.................................................................................-->
            <asp:Panel ID="panelGrpMember" runat="server">
                <div id="memberOf">
                    <br />
                    <br />
                    <div class="groupInfo">
                        <div>
                            <table class="groupList">
                                <asp:Repeater ID="rptUserGrpMember" runat="server" DataMember="lnkButtonLeave">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="col1">
                                                <%#Container.ItemIndex +1%>.
                                            </td>
                                            <td class="col2">
                                                <ul>
                                                    <li><a href="Group.aspx?GroupID=<%#Eval("GROUP_ID") %>"><b>
                                                        <%#DataBinder.Eval(Container.DataItem, "GROUP_NAME")%></b></a></li>
                                                    <li><a href="Group.aspx?GroupID=<%#Eval("GROUP_ID") %>">
                                                        <img alt="Group Picture" onerror="this.onerror=null;this.src='/Images/default_Group.jpg'" src="GroupProfilePic/Group_<%#Eval("GROUP_ID") %>/GroupProfilePic_thumb.jpg"
                                                            height="50px" width="50px" /> </li>
                                                </ul>
                                            </td>
                                            <td class="col3">
                                                <ul>
                                                    <li><b>Category:</b>
                                                        <%#DataBinder.Eval(Container.DataItem, "CAT_NAME")%></li>
                                                    <li><b>Description:</b>
                                                        <%#DataBinder.Eval(Container.DataItem, "GROUP_DESC")%></li>
                                                    <li><b>Group type:</b>
                                                        <%#DataBinder.Eval(Container.DataItem, "GROUP_TYPE")%></li>
                                                </ul>
                                                <div class="leaveGroup" align="right">
                                                    <asp:LinkButton ID="lnkButtonLeave" Text='Leave Group' CommandName="Leave" OnCommand="lnkButtonLeave_Command"
                                                        CommandArgument='<%#DataBinder.Eval(Container.DataItem, "GROUP_ID")%>' runat="server" /></div>
                                                </div>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                            </table>
                        </div>
                    </div>
                    <br />
                    <br />
                </div>
            </asp:Panel>
            <!-- YOUR OWN GROUP HERE............................................................................................................. -->
            <asp:Panel ID="panelGrpOwner" runat="server">
                <div id="ownerOf">
                    <br />
                    <br />
                    <div class="groupInfo">
                        <!-- GROUP LIST WILL BE DISPLAY IN # COLUMS INFO HERE  -->
                            <div>
                                <table class="groupList">
                                    <asp:Repeater ID="rptUserGrpOwner" runat="server" DataMember="GROUP_ID">
                                        <ItemTemplate>
                                            <tr>
                                                <td class="col1">
                                                    <%#Container.ItemIndex +1%>.
                                                </td>
                                                <td class="col2">
                                                    <ul>
                                                        <li><a href="Group.aspx?GroupID=<%#Eval("GROUP_ID") %>"><b>
                                                            <%#DataBinder.Eval(Container.DataItem, "GROUP_NAME")%></b></a></li>
                                                        <li><a href="Group.aspx?GroupID=<%#Eval("GROUP_ID") %>">
                                                            <img alt="Group Picture" onerror="this.onerror=null;this.src='/Images/default_Group.jpg'" src="GroupProfilePic/Group_<%#Eval("GROUP_ID") %>/GroupProfilePic_thumb.jpg"
                                                                height="50px" width="50px" /> </li>
                                                    </ul>
                                                </td>
                                                <td class="col3">
                                                    <ul>
                                                        <li><b>Category:</b>
                                                            <%#DataBinder.Eval(Container.DataItem, "CAT_NAME")%></li>
                                                        <li><b>Description:</b>
                                                            <%#DataBinder.Eval(Container.DataItem, "GROUP_DESC")%></li>
                                                        <li><b>Group type:</b>
                                                            <%#DataBinder.Eval(Container.DataItem, "GROUP_TYPE")%></li>
                                                    </ul>
                                                    <div class="leaveGroup" align="right">
                                                        <asp:LinkButton ID="lnkButtonDelete" Text='Delete Group' CommandName="Delete" OnCommand="lnkButtonDelete_Command"
                                                            CommandArgument='<%#DataBinder.Eval(Container.DataItem, "GROUP_ID")%>' runat="server" /></div>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </table>
                            </div>
                    </div>
                    <br />
                    <br />
                </div>
            </asp:Panel>
            <!-- CREATE NEW GROUP............................................................................................................. -->
            <asp:Panel ID="panelCreateGroup" runat="server">
                <div id="createNewGroup">
                    <asp:Panel ID="panelCreateGrp" runat="server">
                        <div class="groupInfo">
                            <p>
                                <b>1. Please enter your group details as below</b></p>
                                <br />
                            <table class="newGroup">
                                <tr>
                                    <td class="groupRequiredDetails"  valign="top">
                                        Group name:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtGroupName" runat="server" Width="298px" onfocus ="Change(this, event)" onblur ="Change(this, event)"></asp:TextBox>
                                        &nbsp;
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="groupRequiredDetails" valign="top">
                                        Group category:
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                             
                                  
                                    </td>
                                    <td  valign="top">
                                        <asp:DropDownList ID="ddlGroupCat" runat="server" DataTextField="CAT_NAME" DataValueField="CAT_ID">
                                        </asp:DropDownList>
                                        <br />
                                        <br />
                                        Click
                                        <asp:LinkButton ID="linkBtnNewCat" runat="server" OnClick="linkBtnNewCat_Click">here</asp:LinkButton>
                                        &nbsp;to add a new category or
                                        <asp:LinkButton ID="linkBtnBack" runat="server" OnClick="linkBtnBack_Click">back</asp:LinkButton>
                                        &nbsp;to choose a default category.<br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="groupRequiredDetails" valign="top">
                                        <asp:Panel ID="panelLblNewCat" runat="server" Visible="False">
                                            <table class="style1">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblNewCat" runat="server" Text="New Category Name:"></asp:Label>
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label1" runat="server" Text="Category Description:"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                    <td>
                                        <asp:Panel ID="panelNewCat" runat="server" Visible="False">
                                            <table class="style1">
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtNewCat" runat="server" MaxLength="20" onfocus ="Change(this, event)" onblur ="Change(this, event)"></asp:TextBox>
                                                        &nbsp;Maximum 20 characters
                                                        <asp:Label ID="lblCatNameCheck" runat="server" ForeColor="Red"></asp:Label>
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtCatDesc" runat="server" Height="69px" MaxLength="50" TextMode="MultiLine"
                                                            Width="292px" onfocus ="Change(this, event)" onblur ="Change(this, event)"></asp:TextBox>
                                                        <asp:Label ID="lblCatDescCheck" runat="server" ForeColor="Red"></asp:Label>
                                                        <br />
                                                        Maximum 50 characters
                                                        <br />
                                                        <br />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="groupRequiredDetails" valign="top">
                                        Group description:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtGroupDes" runat="server" Height="60px" MaxLength="50" Rows="4" onfocus ="Change(this, event)" onblur ="Change(this, event)"
                                            Width="298px"></asp:TextBox>
                                        <br />
                                        Maximum 100 characters
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="groupRequiredDetails" valign="top">
                                        Group published type:
                                    </td>
                                    <td>
                                        <asp:CheckBoxList ID="cblGroupType" runat="server">
                                            <asp:ListItem Value="public"> Public</asp:ListItem>
                                            <asp:ListItem Value="private"> Private</asp:ListItem>
                                        </asp:CheckBoxList>
                                        <asp:Label ID="lblPublishTypeCheck" runat="server" ForeColor="Red"></asp:Label>
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="groupRequiredDetails" valign="top">
                                        File sharing size limit (Max 10MB):
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFileSizeLimit" runat="server" MaxLength="2" onfocus ="Change(this, event)" onblur ="Change(this, event)"></asp:TextBox>
                                        &nbsp;<asp:RangeValidator ID="rangeFieldValid" runat="server" ControlToValidate="txtFileSizeLimit"
                                            ErrorMessage="File size limit must be within range." MaximumValue="10" MinimumValue="1"></asp:RangeValidator>
                                        <br />
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnSubmit" runat="server" Height="27px" OnClick="btnSubmit_Click"
                                            Style="background-color: #FFCC99" Text="Submit" Width="74px" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="reset" runat="server" Height="27px" OnClick="reset_Click" Style="background-color: #FFCC99"
                                            Text="Reset" Width="74px" />
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
            </asp:Panel>
            <asp:Panel ID="panelGrpPicUpload" runat="server" Visible="False" >
                <table class="newGroup" align="center">
                    <tr>
                        <td class="groupRequiredDetails" valign="top">
                            <br />
                            <br />
                            Upload Group image:
                        </td>
                        <td>
                            <br />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:FileUpload ID="uploadPic" runat="server" />
                            &nbsp;&nbsp;
                            <asp:Label ID="lblPicError" runat="server" ForeColor="Red"></asp:Label>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Size limit: 4 MB<br />
&nbsp;<br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" 
                                Style="background-color: #FFCC99" Text="Upload" />
                            &nbsp;&nbsp;&nbsp;
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="panelConfirmation" runat="server" Visible="false">
                <div style="width: 683px">
                <br />
                    <br />
                    <!-- Confirmation -->
                    <fieldset style="margin-left: 90px; width: 500px;">
                        <legend style="color: #F49500; font-weight: bold;">Confirmation </legend>
                        <br />
                        <div class="field">
                            <div align="center">
                                <br />
                                Please confirm your changes<br />
                                <br />
                                <br />
                                <asp:Button ID="btnConfirm" runat="server" BackColor="#FFCC99" 
                                    OnClick="btnConfirm_Click" Text="Confirm" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnCancel" runat="server" BackColor="#FFCC99" 
                                    OnClick="btnCancel_Click" Text="Cancel" />
                                <br />
                                <br />
                            </div>
                            <br />
                    </fieldset>
                    <br />
                    <div align="center">
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                    </div>
                </div>
            </asp:Panel>
            <asp:HiddenField ID="submitType" runat="server" Value="" />
            <%--<p __designer:mapid="40b">
                2. To enter your group page please select &quot;You are owner of&quot; tabs and
                click on your group name</p>
            <p __designer:mapid="40c">
                3. After creating your own group, you can invite others to join into group by select
                &quot;Invite New Member&quot; under &quot;Group Administrator Corner&quot; in group
                page</p>--%>
            <br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Col3" runat="Server">
</asp:Content>
