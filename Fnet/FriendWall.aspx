<%@ Page Language="C#" MasterPageFile="~/masterpages/masterpageforfriend.master" AutoEventWireup="true" CodeBehind="FriendWall.aspx.cs" Inherits="Fnet.FriendWall" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="StyleSheet/FriendWall.css" />
    <script type="text/javascript" src="../Javascript/MyJavascript/FocusTextBox.js"></script>
      <link href="StyleSheet/UserWall.css" rel="stylesheet" type="text/css" />
 
    
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="friend" Runat="Server">
    <div class="contentFriend">
    
<!-- FREIND WALL.......................................................................................................................-->
            <div>
                <div class="friendDisplay" align="center">
                    <table class="friendNavigation">
                        <tr>
                         <!-- USER PICTURE IS HERE AND MENU IS HERE-->
                            <td class="colsPic">
                                 <asp:Image ID="imgFriendPic" AlternateText="friendIamge" runat="server"   onerror="this.onerror=null;this.src='Images/default_User.jpg'" Height="159px" Width="140px" />
                            </td>
                            <td>
                                <div align="center">
                                    <font size="5">
                                        <asp:Label ID="lblUserName" runat="server" Text="username"></asp:Label>
                                    </font>
                                    <br />
                                    <br />
                                    <div style="background-color: #F5FFFA;">
                                        <img src="Images/pencil.png" alt="friendImage" />&nbsp;Wall &nbsp;&nbsp;&nbsp;&nbsp;/ &nbsp;&nbsp;&nbsp;&nbsp;
                                    <img src="Images/clipboard.png" alt="view" /><a href="FriendProfile.aspx" rel="history"
                                        style="text-decoration: none">&nbsp;Profile  </a>&nbsp;&nbsp;&nbsp;&nbsp;
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
                 <div>
                   
        <!-- POSTING COMMENT IS HERE .......................................................................................................-->
                    <div id="friendWall">
                        <h3>LEAVE YOUR COMMENTS</h3>
                        <br />
                        <div align="center" class="commentSection">
                            <table id="postNewComments">
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtNewComment" runat="server" Width="400px" Rows="4" MaxLength="80" Height="30px" Style="background-color: #eee;" onfocus ="Change(this, event)" onblur ="Change(this, event)"></asp:TextBox>
                                        <br />
                                        <br />
                                        <div align="right">
                                            <asp:Button ID="btnShoot" runat="server" Text="Post Comment"  
                                                BackColor="#FFCC99" onclick="btnShoot_Click" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </div>
                        <br />
                        <br />
                        <div id="previousComments" align="center">
                     <asp:Panel ID="pnlMessage" runat="server">
                        <h3>Previous Comments - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </h3>
                        <div>
                            <br />
                            <asp:Repeater ID="rptMainComment" runat="server" 
                                onitemcommand="rptMainComment_ItemCommand" 
                                onitemdatabound="rptMainComment_ItemDataBound">
                                <ItemTemplate>
                                    <table class="userCommentTable">
                                        <tr>
                                            <td class="commentCols1">
                                               <img src="ProfilePic/User_<%#DataBinder.Eval(Container.DataItem, "USER_ID")%>/profilePic_thumb.jpg" alt="picTopic1" height="64px" width="64px" />
                                            </td>
                                            <td class="commentCols2">
                                                <b>    <%#DataBinder.Eval(Container.DataItem, "FIRST_NAME")%> <%#DataBinder.Eval(Container.DataItem, "LAST_NAME")%> :</b>
                                                <%#DataBinder.Eval(Container.DataItem, "Content")%>
                                                <br />
                                                <div class="userFunctionOnWall">
                                                    Fri, 15/10/2010, 8: 00: 00 &nbsp;&nbsp;
                                                    <asp:HyperLink ID="HyperLink1" runat="server">Delete?
                                                    <img src="Images/delete.png" alt="delete" width="8" height="8"/></asp:HyperLink>
                                                </div>
                                            </td>
                                        </tr>
                                        <asp:Repeater ID="rptRespondComment" runat="server" >
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td class="commentCols3">
                                                         <table class="reReplyComment">
                                                                <tr>
                                                                    <td><img src="ProfilePic/User_<%#DataBinder.Eval(Container.DataItem, "USER_ID")%>/profilePic_thumb.jpg" alt="picTopic1" onerror="this.onerror=null;this.src='Images/default_User.jpg'" height="32px" width="32px" /></td>
                                                                    <td> 
                                                                        <b>
                                                                        <%#DataBinder.Eval(Container.DataItem, "FIRST_NAME")%>
                                                                        <%#DataBinder.Eval(Container.DataItem, "LAST_NAME")%> :
                                                                        </b>
                                                                        <%#DataBinder.Eval(Container.DataItem, "Content")%>
                                                                        <br />
                                                                        <br />
                                                                        <div class="userFunctionOnWall">
                                                                            Fri, 15/10/2010, 8: 00: 00 &nbsp;&nbsp;
                                                                            <asp:HyperLink ID="HyperLink1" runat="server">Delete?</asp:HyperLink>
                                                                           <img src="Images/delete.png" alt="delete" width="8" height="8"/>
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
                                        <asp:LinkButton ID="lnkComment" CommandName="ShowPanel" runat="server" >Comment??</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </div>
                                    
                                    <asp:Panel ID="pnlRespond" runat="server" Visible="false">
                                        <div class="reply">
                                            <table class="replyTable">
                                                <tr>
                                                    <td><img src="Images/pencil_2.png" alt="pencil" />&nbsp;&nbsp;Comment :</td>
                                                    <td><asp:TextBox ID="txtRespond" runat="server" Text="" CssClass="replyTextBox"  onfocus ="Change(this, event)" onblur ="Change(this, event)"></asp:TextBox></td>
                                                    <td>
                                                        
                                                        <asp:LinkButton ID="lnkButtonRespond" Text='Post' CommandName="Respond" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "Comment_ID")%>'
                                                        runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                        </div>
                                    </asp:Panel>
                                    
                                     <hr style="color: #ddd; width: 750px;"/>
                                    <br />
                                </ItemTemplate>
                            </asp:Repeater>
                            </div>
                 
                </asp:Panel>
                     <br />
                     <br />
                  </div>
          </div>
      </div>
  </div>
       
</asp:Content>
