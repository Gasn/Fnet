<%@ Page Language="C#" MasterPageFile="~/masterpages/masterpageforgroup.master" AutoEventWireup="true"
    CodeBehind="GroupAdmin.aspx.cs" Inherits="Fnet.GroupAdmin" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="Stylesheet/GroupAdminCorner.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="group" runat="Server">
    <div id="contentAdminGroup">
        <div>
            <asp:HyperLink ID="lnkReply" NavigateUrl="#" runat="server">Back to Group page</asp:HyperLink>
            <!-- BAN / REJOINED -->
            <br />
            <br />
            <br />
            <br />
            <div style="background-color: #F1FAF1;">
             <h3><asp:LinkButton ID="lnkBanned" runat="server" OnClick="lnkBanned_Click">Ban / Rejoin member</asp:LinkButton></h3>
            </div>
            <br />
            <asp:Panel ID="pnlSearchMember" runat="server">
                <div align="center">
                    <table class="adminSearch">
                        <tr>
                            <td>
                                Search for member:
                            </td>
                            <td>
                                <asp:TextBox ID="txtSearchMember" runat="server" Width="298px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="btnSearchBan" runat="server" Text="Search" BackColor="#FFCC99" OnClick="btnSearchBan_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
                <br />
                <br />
                <div align="center" id="displayMemberToAdmin">
                    <!-- MEMBER INFO DISPLAYED HERE -->
                    <asp:GridView ID="grdBaned" runat="server" DataKeyNames="LIST_ID" CssClass="displayMemberSearchInfo"
                        AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333" GridLines="None"
                        OnRowCommand="grdBaned_RowCommand">
                        <Columns>
                            <asp:BoundField Visible="false" DataField="LIST_ID" />
                            <asp:BoundField HeaderText="NAME" DataField="NAME" />
                            <asp:BoundField HeaderText="EMAIL" DataField="EMAIL" />
                            <asp:BoundField HeaderText="JOIN DATE" DataFormatString="" DataField="JOIN_DATE" />
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:Button CommandArgument="<%# Container.DataItemIndex %>" Text='<%# Eval("STATUS").ToString().Equals("3") ? "Active" : "Ban" %>'
                                        runat="server" CssClass="adminButton" CommandName='<%# Eval("STATUS").ToString().Equals("3") ? "Active" : "Ban" %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle BackColor="#EFF3FB" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" CssClass="displayMemberSearchInfo" Font-Bold="True"
                            ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <div>
                        <asp:Label ID="lblBand" runat="server" Text=""></asp:Label>
                    </div>
                    <br />
            </asp:Panel>
            <%-- <p>
                Note: Please set the button with cssClass: adminButton. thank you. /DELETE</p>
            <br />--%>
        </div>
        <!-- USER WAIT FOR PERMISSION TO JOIN IN GROUP -->
        <div>
            <div style="background-color: #F1FAF1;">
                <h3>
                    <asp:LinkButton ID="lnkPermission" runat="server" OnClick="lnkPermission_Click">New member wait for permission to join this group</asp:LinkButton></h3>
            </div>
            <asp:Panel ID="pnlPermission" runat="server" Visible="false">
                <br />
                <%--   <p>
            Note: this panel only display when it is private group, else invisble.
            <br />
            userName should be link when the admin can access the user
        </p>--%>
                <div align="center">
                    <asp:GridView ID="grdPending" runat="server" CssClass="displayMemberSearchInfo" AutoGenerateColumns="false"
                        CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="LIST_ID" OnRowCommand="grdPending_RowCommand">
                        <Columns>
                            <asp:BoundField Visible="false" DataField="LIST_ID" />
                            <asp:BoundField HeaderText="NAME" DataField="NAME" />
                            <asp:BoundField HeaderText="INVITE BY" DataField="REQUEST_USER" />
                            <asp:BoundField HeaderText="JOIN DATE" DataField="JOIN_DATE" />
                            <asp:ButtonField HeaderText="Accept" ButtonType="Button" Text="Accept" CommandName="Accept"
                                ControlStyle-CssClass="adminButton" />
                            <asp:ButtonField HeaderText="Denied" ButtonType="Button" Text="Denied" CommandName="Denied"
                                ControlStyle-CssClass="adminButton" />
                        </Columns>
                        <RowStyle BackColor="#EFF3FB" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" CssClass="displayMemberSearchInfo" Font-Bold="True"
                            ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <div>
                        <asp:Label ID="lblPending" runat="server" Text=""></asp:Label>
                    </div>
                    <br />
                </div>
            </asp:Panel>
        </div>
        <!-- INVITE NEW MEMBER FROM ADMIN -->
        <br />
        <div style="background-color: #F1FAF1;">
            <h3>
                <asp:LinkButton ID="lnkInvite" runat="server" OnClick="lnkInvite_Click">Invite New Member from Admin</asp:LinkButton></h3>
        </div>
        <asp:Panel ID="pnlInvite" runat="server" Visible="false">
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
                <div align="center" id="Div3">
                    <asp:GridView ID="grdInvite" runat="server" CssClass="displayMemberSearchInfo" AutoGenerateColumns="false"
                        DataKeyNames="USER_ID, NAME" CellPadding="4" ForeColor="#333333" GridLines="None"
                        OnRowCommand="grdInvite_RowCommand" >
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
                                Text="Add" />
                        </Columns>
                        <RowStyle BackColor="#EFF3FB" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" CssClass="displayMemberSearchInfo" Font-Bold="True"
                            ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </div>
                <div align="center">
                    <asp:Label ID="lblInviteMessage" runat="server" Text=""></asp:Label>
                </div>
                <br />
                <table class="inviteMemberByAdmin">
                    <tr>
                        <td>
                            To:
                        </td>
                        <td>
                            <table>
                                <asp:Repeater ID="rptReciever" runat="server" 
                                    onitemcommand="rptReciever_ItemCommand" 
                                    onitemdatabound="rptReciever_ItemDataBound">
                                    <ItemTemplate>
                                        <%# GetTR() %>
                                        <td style="border-width: 1px; border-style: dotted; border-color: #FFCC99;">
                                            <%#DataBinder.Eval(Container.DataItem, "NAME")%> &nbsp;&nbsp;
                                            <asp:ImageButton ID="imgBtn"  runat="server" ImageUrl="Images/delete.png" />
                                        </td>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;Subject:
                        </td>
                        <td>
                            Invitation for joining Group 
                           <b> <asp:Label ID="lblGroupName" runat="server"></asp:Label></b></td>
                    </tr>
                        <tr>
                        <td colspan="2">                       
                            <asp:Image ID="imgSent" Visible="false" runat="server" />&nbsp;&nbsp;<asp:Label ID="lblSentMessage" runat="server"
                                ></asp:Label> </td> 
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:Button ID="sendInvitation" runat="server" Text="Send" BackColor="#FFCC99" 
                                Width="59px" onclick="sendInvitation_Click" />
                        </td>
                    </tr>
                </table>
                <br />
                <%-- <p>
                    Note: please notice admin has sucessful send email. /DELETE</p>--%>
            </div>
        </asp:Panel>
        <br />
        <div>
            <!-- BAN / REJOINED -->
            <div style="background-color: #F1FAF1;">
                <h3>
                    <asp:LinkButton ID="lnkDelegate" runat="server" OnClick="lnkDelegate_Click">Group Moderator Delegator</asp:LinkButton></h3>
            </div>
            <asp:Panel ID="pnlDelegation" runat="server" Visible="false">
                <br />
                <div align="center" id="Div2">
                    <asp:GridView ID="grdUnassign" runat="server" CssClass="displayMemberSearchInfo"
                        AutoGenerateColumns="false" DataKeyNames="LIST_ID" CellPadding="4" ForeColor="#333333"
                        GridLines="None" OnRowCommand="grdUnassign_RowCommand">
                        <Columns>
                            <asp:BoundField Visible="false" DataField="LIST_ID" />
                            <asp:BoundField HeaderText="NAME" DataField="NAME" />
                            <asp:BoundField HeaderText="EMAIL" DataField="EMAIL" />
                            <asp:BoundField HeaderText="JOIN DATE" DataField="JOIN_DATE" />
                            <asp:ButtonField ButtonType="Button" HeaderText="Action" ControlStyle-CssClass="adminButton"
                                Text="Unassign" />
                        </Columns>
                        <RowStyle BackColor="#EFF3FB" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" CssClass="displayMemberSearchInfo" Font-Bold="True"
                            ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </div>
                <div align="center">
                    <asp:Label ID="lblUnassign" runat="server" Text=""></asp:Label>
                </div>
                <br />
                <div align="center">
                    <h4>
                        Search the group member fot delegating moderator to manage the group.</h4>
                </div>
                <div align="center">
                    <table class="adminSearch">
                        <tr>
                            <td>
                                Search for member:
                            </td>
                            <td>
                                <asp:TextBox ID="txtAssign" runat="server" Width="298px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="btnSearchAssign" runat="server" Text="Search" BackColor="#FFCC99"
                                    OnClick="btnSearchAssign_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
                <br />
                <br />
                <div align="center" id="Div1">
                    <asp:GridView ID="grdAssign" runat="server" CssClass="displayMemberSearchInfo" AutoGenerateColumns="false"
                        CellPadding="4" DataKeyNames="LIST_ID" ForeColor="#333333" GridLines="None" OnRowCommand="grdAssign_RowCommand">
                        <Columns>
                            <asp:BoundField Visible="false" DataField="LIST_ID" />
                            <asp:BoundField HeaderText="NAME" DataField="NAME" />
                            <asp:BoundField HeaderText="EMAIL" DataField="EMAIL" />
                            <asp:BoundField HeaderText="JOIN DATE" DataField="JOIN_DATE" />
                            <asp:ButtonField ButtonType="Button" HeaderText="Action" ControlStyle-CssClass="adminButton"
                                Text="Assign" />
                        </Columns>
                        <RowStyle BackColor="#EFF3FB" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" CssClass="displayMemberSearchInfo" Font-Bold="True"
                            ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </div>
                <div align="center">
                    <asp:Label ID="lblAssign" runat="server" Text=""></asp:Label>
                </div>
                <br />
            </asp:Panel>
        </div>
        <br />
    </div>
</asp:Content>
