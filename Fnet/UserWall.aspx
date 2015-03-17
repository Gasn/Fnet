<%@ Page Language="C#" MasterPageFile="~/masterpages/masterpageforuser.master" AutoEventWireup="true"
    CodeBehind="UserWall.aspx.cs" Inherits="Fnet.webpages.User.UserWall"
    Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link href="StyleSheet/UserWall.css" rel="stylesheet" type="text/css" />
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
    <div id="contentUserWall">
        <div>
            <div id="Wall">
                <br />
                    <h3>What&#39;s in your mind?- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -</h3>
                    <br />
                    <div align="center" >
                        <br />
                        <table  class="mainPost">
                            <tr>
                                <td rowspan="2"> <img src="Images/pencil_2.png" alt="pencil" /></td>
                                <td>
                                    <br />
                                    <asp:TextBox ID="txtCommnet" runat="server" Width="403px" Height="39px" onfocus ="Change(this, event)" onblur ="Change(this, event)"></asp:TextBox>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                
                                <td align="right">
                                    <asp:Button ID="btnShoot" runat="server" Text="Share" OnClick="btnShoot_Click" BackColor="#FFCC99" />
                                    <br />
                                    <br />
                                    
                                </td>
                            </tr>
                        </table>
                        <br />
                    </div>
              
                <br />
             
                 <asp:Panel ID="pnlMessage" runat="server">
                        <h3>Previous Comments - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </h3>
                        <div>
                            <br />
                            <asp:Repeater ID="rptMainComment" runat="server" 
                                onitemcommand="rptMainComment_ItemCommand" 
                                onitemdatabound="rptMainComment_ItemDataBound">
                                <ItemTemplate>
                                    <table class="userCommentTable">
                                        <tr>
                                            <td class="commentCols1">
                                                <img alt="picTopic1" height="64px" 
                                                    src='ProfilePic/User_<%#DataBinder.Eval(Container.DataItem, "USER_ID")%>/profilePic_thumb.jpg' 
                                                    width="64px" />
                                            </td>
                                            <td class="commentCols2">
                                                <b><%#DataBinder.Eval(Container.DataItem, "FIRST_NAME")%>
                                                <%#DataBinder.Eval(Container.DataItem, "LAST_NAME")%>:</b>
                                                <%#DataBinder.Eval(Container.DataItem, "Content")%>
                                                <br />
                                                <div class="userFunctionOnWall" style="font-size:xx-small">
                                                    <%#DataBinder.Eval(Container.DataItem, "Comment_date")%> &nbsp;&nbsp;
                                                    <asp:LinkButton ID="HyperLink1" runat="server" 
                                                        CommandArgument='<%#DataBinder.Eval(Container.DataItem, "Comment_ID")%>' 
                                                        CommandName="deleteMain" Text="Delete?"> Delete?</asp:LinkButton>
                                                    <img alt="delete" height="8" src="Images/delete.png" width="8"  /> 
                                                     
                                                    
                                                </div>
                                            </td>
                                        </tr>
                                        <asp:Repeater ID="rptRespondComment" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td class="commentCols3">
                                                        <table class="reReplyComment">
                                                            <tr>
                                                                <td>
                                                                    <img alt="picTopic1" height="32px" 
                                                                        src='ProfilePic/User_<%#DataBinder.Eval(Container.DataItem, "USER_ID")%>/profilePic_thumb.jpg' 
                                                                        width="32px" /></td>
                                                                <td>
                                                                    <b><%#DataBinder.Eval(Container.DataItem, "FIRST_NAME")%>
                                                                    <%#DataBinder.Eval(Container.DataItem, "LAST_NAME")%> : </b>
                                                                    <%#DataBinder.Eval(Container.DataItem, "Content")%>
                                                                    <div class="userFunctionOnWall" style="font-size:xx-small">
                                                                        <%#DataBinder.Eval(Container.DataItem, "comment_date")%> &nbsp;&nbsp;
                                                                        <asp:LinkButton ID="HyperLink2" runat="server" 
                                                                            CommandArgument='<%#DataBinder.Eval(Container.DataItem, "Comment_Id")%>'  
                                                                            CommandName="deleteResponse" Text="Delete?"/>
                                                                        <img alt="delete" height="8" src="Images/delete.png" width="8" />
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </table>
                                    <div align="right">
                                        <asp:LinkButton ID="lnkComment" runat="server" CommandName="ShowPanel">Comment??</asp:LinkButton>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </div>
                                    <asp:Panel ID="pnlRespond" runat="server" Visible="false">
                                        <div class="reply">
                                            <table class="replyTable">
                                                <tr>
                                                    <td>
                                                        <img alt="pencil" src="Images/pencil_2.png" />&nbsp;&nbsp;Comment :</td>
                                                    <td>
                                                        <asp:TextBox ID="txtRespond" runat="server" CssClass="replyTextBox" 
                                                            onblur="Change(this, event)" onfocus="Change(this, event)" Text=""></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="lnkButtonRespond" runat="server" 
                                                            CommandArgument='<%#DataBinder.Eval(Container.DataItem, "Comment_ID")%>' 
                                                            CommandName="Respond" Text="Post" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                        </div>
                                    </asp:Panel>
                                    <hr style="color: #ddd; width: 650px;" />
                                    <br />
                                </ItemTemplate>
                            </asp:Repeater>
                            </div>
                 
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Col3" runat="Server">
</asp:Content>
