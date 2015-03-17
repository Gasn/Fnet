<%@ Page Language="C#" MasterPageFile="~/masterpages/masterpageforgroup.master" AutoEventWireup="true" CodeBehind="BoardTopic.aspx.cs" Inherits="Fnet.BoardTopic" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="StyleSheet/BoardTopic.css" />
    <script type="text/javascript" src="Javascript/jquery-latest.js"></script>
    <script type="text/javascript" src="Javascript/MyJavascript/FocusTextBox.js"></script>
     <script type="text/javascript">
          $(document).ready(function(){
            
            $("postNewComment").click(function () {
              if ($("newComment:first").is(":hidden")) {
                $("newComment").slideDown("slow");
              } else {
                $("newComment").hide();
              }
            });
    });
  </script>
    <style type="text/css">
        .style1
        {
            width: 131px;
            height: 60px;
        }
        .style2
        {
            width: 133px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="group" Runat="Server">
    <div id="contentGroupTopic">
        <div style="height: 30px">
            <img src="Images/left.png" alt="groupPage" />
            <a href="#">Back</a>
        </div>
        <br />
        <br />
        <!-- TOPIC NAME DISPLAY HERE -->
        <div id="topicNameSection">
            Topic:&nbsp;&nbsp;&nbsp;&nbsp; 
            <font color="#F49500"><b><asp:Label ID="topicName" runat="server" Text="Welcome!!!! You found our first topic!"></asp:Label></b></font>
        </div>
        <!-- NUMBER OF POST IS HERE -->
        <div>
            <table width="100%" id="tableTopicInfo">
                <tr>
                    <td>
                        Number post:&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="numberPostForTopic" runat="server" Text=""></asp:Label> 
                    </td>
                    <td>
                        Lastest Time Post
                        <img src="Images/clock.png" alt="groupPage" />:
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lastTimePost" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <p>** Here is topic information from member who create topic.</p>
        <!-- INITIAL POST : -->
        <div id="contentInfo" align="center">
            <table id="initialTopicInfo">
                <tr>
                    <!-- MEMBER WHO CRAETED THE TOPIC PIC HERE -->
                    <td class="style2" >
                        <div style="width: 118px" align="center">
                            <img src="Images/pencil.png" alt="groupPage" />
                            <b>Created By: </b>
                            &nbsp;
                            <asp:Label ID="memberCreatedTopic" runat="server" Text="Sang"></asp:Label>
                            <br />
                            <img src="Images/default_User.jpg" alt="groupPage" />
                        </div>
                   </td>
                    <td>
                        <b>Topic Description:</b><br />
                        <asp:Label ID="topicDescription" runat="server" Text="Hi all!!! Hope you'll enjoy our site <3"></asp:Label>
                    </td>
                </tr>
            </table>
        <br />
        </div>
        <br />
        <div align="center">
            <a href="#" id="postNewComment">
                <img src="Images/pencil.png" alt="groupPage" />
                    Post new comment
            </a>
        <br /> 
        </div>
        <!-- NEW COMMENT IS POST HERE -->
        <asp:Panel ID="Panel1" runat="server">
            <br />
            <p>Note: this panel will be invisible until the user press post new comment links 
                /DELETE</p>
            
            <div id="newComment" align="center">
                <br />
                <div align="left" style="width: 299px">
                    Enter your comment:
                    <br />
                    <asp:TextBox ID="TextBox1" runat="server" Width="298px" Rows="4" Height="91px" 
                        MaxLength="50"  onfocus ="Change(this, event)" 
                        onblur ="Change(this, event)"></asp:TextBox>
                    <br />
                    (Maximum of 100 characters.)                    
                </div>
                <br />
                <asp:Button ID="Button1" runat="server" Text="Post It!" BackColor="#FFCC99" />
                <br />
            </div>
            
            <br />
            <br />
        </asp:Panel>
        <br />
        <!-- OTHER USER COMMENTS IS HERE -->
        <div id="otherMemberComment">
            <div align="center">
                <table class="comments">
                    <tr>
                        <td class="style1"> 
                            <center>
                                <b>Commented By: </b>
                                <br />
                                <asp:Label ID="memberWhoComment" runat="server" Text="Long"></asp:Label>
                                &nbsp;&nbsp;
                                <img src="Images/bubble.png" alt="TopicPage" />
                                <br />
                                <img src="Images/default_User.jpg" alt="Topic" />
                            </center>
                        </td>
                        <td>
                            <div>
                                <asp:Label ID="CommentContent" runat="server" Text="Hello, Nice to meet you!"></asp:Label>
                                <br />
                                <br />
                                Really love it :D Keep going!
                            </div>
                            <div class="timeCommentPost" align="right">
                                <asp:Label ID="commentPostTime" runat="server" Text="Fri, 15/10/2010, 8: 00: 00"></asp:Label>
                            </div>
                            <asp:Panel ID="forAdminOnly" runat="server">
                                <p>Note: Please invisble this panel when it is not admin and visible it  when the user is admin. 
                                    when the admin press the delete the post will be remove/DELETE
                                </p>
                                <div align="right"><img src="Images/delete.png" alt="groupPage" /><a href="#"> 
                                   Delete</a></div>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1"> 
                            <center>
                                <b>Commented By: </b>
                                <br />
                                <asp:Label ID="Label1" runat="server" Text="somebody"></asp:Label>
                                &nbsp;&nbsp;
                                <img src="Images/bubble.png" alt="TopicPage" />
                                <br />
                                <img src="Images/default_User.jpg" alt="Topic" />
                            </center>
                        </td>
                        <td>
                            <div>
                                <asp:Label ID="Label2" runat="server" Text="Hey there!"></asp:Label></br></br>
                                Hehehehe
                                <br />
                                </div>
                            <div class="timeCommentPost" align="right">
                                <asp:Label ID="Label3" runat="server" Text="Fri, 15/10/2010, 9: 00: 00"></asp:Label>
                            </div>
                            <asp:Panel ID="Panel2" runat="server">
                                <div align="right"><img src="Images/delete.png" alt="groupPage" /><a href="#">&nbsp; 
                                    Delete</a></div>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>


