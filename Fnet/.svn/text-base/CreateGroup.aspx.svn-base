<%@ Page Language="C#" MasterPageFile="~/masterpages/masterpageforgroup.master" AutoEventWireup="true"
    CodeBehind="CreateGroup.aspx.cs" Inherits="BrisbaneConnect.CreateGroup" Title="Create Group" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="group" runat="server">
    <div class="groupInfo">
        <p>
            <b>1. Please enter your group details as below</b></p>
        <p>
            Note: Validation should be display here in red color. You possible creat invisbile
            panel and visible it when user type invalid input./DELETE</p>
        <table class="newGroup">
            <tr>
                <td class="groupRequiredDetails">
                    Group name:
                </td>
                <td>
                    <asp:TextBox ID="txtGroupName" runat="server" Width="298px"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="grpNameFieldValid" runat="server" 
                        ControlToValidate="txtGroupName" ErrorMessage="Please provide a group name."></asp:RequiredFieldValidator>
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
                    <br />
                    <br />
                </td>
                <td>
                    <p>
                        Note: Here should be a drop down liast which draw from table CAT for user to choose.<br />
                        the user may decide to chose to create the new category, if the user chose OTHER
                        in CAT<br />
                        we should pop down the new textbox for user to enter, admin should be notice .
                        <br />
                        &quot;YOUR HAS SUCCESSFULLY CREATED YOU GROUP&quot; MESSAGE displayed here after user
                        submited /DELETE
                    </p>
                    <asp:DropDownList ID="ddlGroupCat" runat="server" DataTextField="CAT_NAME" 
                        DataValueField="CAT_ID" 
                        onselectedindexchanged="ddlGroupCat_SelectedIndexChanged">
                    </asp:DropDownList>
                    <br />
                    <br />
                    Click
                    <asp:LinkButton ID="linkBtnNewCat" runat="server" onclick="linkBtnNewCat_Click">here</asp:LinkButton>
&nbsp;to add a new category or
                    <asp:LinkButton ID="linkBtnBack" runat="server" onclick="linkBtnBack_Click">back</asp:LinkButton>
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
                                    <asp:TextBox ID="txtNewCat" runat="server" MaxLength="20"></asp:TextBox>
                                    &nbsp;Maximum 20 characters
                                    <asp:Label ID="lblCatNameCheck" runat="server" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtCatDesc" runat="server" Height="69px" MaxLength="50" 
                                        TextMode="MultiLine" Width="292px"></asp:TextBox>
                                    <asp:Label ID="lblCatDescCheck" runat="server" ForeColor="Red"></asp:Label>
                                    <br />
                                    Maximum 50 characters</td>
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
                    <asp:TextBox ID="txtGroupDes" runat="server" Height="60px" MaxLength="50" Rows="4"
                        Width="298px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="grpDescFieldValid" runat="server" 
                        ControlToValidate="txtGroupDes" 
                        ErrorMessage="Please provide some group descriptions."></asp:RequiredFieldValidator>
                    <br />
                    Maximum 100 characters
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
                </td>
            </tr>
            <tr>
                <td class="groupRequiredDetails" valign="top">
                    File sharing size limit (Max 10MB):</td>
                <td>
                    <asp:TextBox ID="txtFileSizeLimit" runat="server" MaxLength="2"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="fileSizeFieldValid" runat="server" 
                        ControlToValidate="txtFileSizeLimit" 
                        ErrorMessage="Please state file size limit."></asp:RequiredFieldValidator>
                &nbsp;<asp:RangeValidator ID="rangeFieldValid" runat="server" 
                        ControlToValidate="txtFileSizeLimit" 
                        ErrorMessage="File size limit must be within range." MaximumValue="10" 
                        MinimumValue="1"></asp:RangeValidator>
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
                </td>
            </tr>
        </table>
        <br />
        <p>
            2. To enter your group page please select &quot;You are owner of&quot; tabs and
            click on your group name</p>
        <p>
            3. After creating your own group, you can invite others to join into group by select
            &quot;Invite New Member&quot; under &quot;Group Administrator Corner&quot; in group
            page</p>
    </div>
</asp:Content>
