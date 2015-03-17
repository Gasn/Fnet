using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using Fnet.SearchWS;
using Fnet.GroupWS;

namespace Fnet
{
    public partial class UserSearch : Base
    {
        SearchService searchWS = new SearchService();
        GroupService groupWS = new GroupService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblUserName.Text = UserDetails.FirstName + " " + UserDetails.LastName;
                imgProfile.ImageUrl = ProfilePicUrl(USERID);

            }
        }

        protected void lstSearchFor_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (pnlSearchByUser.Visible == true)
            {
                pnlSearchByUser.Visible = false;
                pnlSearchByGroup.Visible = true;
            }
            else
            {
                pnlSearchByUser.Visible = true;
                pnlSearchByGroup.Visible = false;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtSearch.Text.Trim() == String.Empty)
            {
                lblSearch.Text = "This field cannot be empty.";

            }
            else
            {

                if (lstSearchFor.SelectedValue == "user")
                {
                    SeachUser(lstSearcByUser.SelectedValue);
                    pnlSearchUserResult.Visible = true;
                    pnlSearchGroupRsult.Visible = false;
                }
                else
                {
                    SeachGroup(lstSearcByGroup.SelectedValue);
                    pnlSearchUserResult.Visible = false;
                    pnlSearchGroupRsult.Visible = true;
                }
            }
        }

        private void SeachUser(String type)
        {
            String input = txtSearch.Text.Trim().ToLower();
            if (type.ToLower() == "name")
            {
                rptUser.DataSource = searchWS.GetUsersByName(input);
            }
            else
            {
                rptUser.DataSource = searchWS.GetUsersByEmail(input);
            }

            rptUser.DataBind();
        }


        private void SeachGroup(String type)
        {
            String input = txtSearch.Text.Trim().ToLower();
            if (type.ToLower() == "name")
            {
                rptGroup.DataSource = searchWS.GetGroupByName(input);
            }
            else
            {
                rptGroup.DataSource = searchWS.GetGroupByCategory(input);
            }

            rptGroup.DataBind();
        }

        // Check the user is the member of the group
        private Boolean IsJoinGroup(int groupID)
        {
            Boolean isJoin = false;
            DataTable dtOwner = groupWS.UserGroupOwner(USERID.ToString());
            DataTable dtMember = groupWS.UserGroupMember(USERID.ToString());

            for (int i = 0; i < dtOwner.Rows.Count; i++)
            {
                int existGroupID = ToInt(dtOwner.Rows[i]["GROUP_ID"]);
                if (existGroupID == groupID)
                    isJoin = true;
            }

            for (int i = 0; i < dtMember.Rows.Count; i++)
            {
                int existGroupID = ToInt(dtMember.Rows[i]["GROUP_ID"]);
                if (existGroupID == groupID)
                    isJoin = true;
            }

            return isJoin;

        }

        // Check the user's friend
        private Boolean IsFriend(int friendID)
        {
            Boolean isFriend = false;
            DataTable dtFriend = searchWS.GetFriendList(USERID);


            for (int i = 0; i < dtFriend.Rows.Count; i++)
            {
                int existFriendID = ToInt(dtFriend.Rows[i]["FRIEND_ID"]);
                if (existFriendID == friendID)
                    isFriend = true;
            }
            return isFriend;

        }




        protected void rptGroup_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            Label lblGroupID = e.Item.FindControl("lblGroupID") as Label;
            int groupID = ToInt(lblGroupID.Text);



            if (e.CommandName.ToUpper() == "VIEW")
            {
                Response.Redirect("Group.aspx?GroupID=" + groupID);
            }
            else if (e.CommandName.ToUpper() == "ADD")
            {
                HideAllPanel();
                pnlMessageGroup.Visible = true;
                Fnet.GroupWS.Group gr = groupWS.GetGroupDetails(lblGroupID.Text);
                String type = gr.GroupType;

                //Find Group Name
                Label lblGroupName = e.Item.FindControl("lblGroupName") as Label;

                if(type.Trim() == "Public")
                {
                    
                    Session["GROUPID"] = groupID;
                    groupWS.InsertGroupMember(groupID, USERID, USERID, 1);
                    Response.Redirect("Group.aspx?GroupID=" + groupID);

                }
                else
                   {


                

                //set message text
                lblMessage.Text = "Will you like to join  group <b>" + lblGroupName.Text
                    + "</b>?<br> If yes, request message will be send to group admin for approval.";
                Session["REQUESTGROUPID"] = groupID;
                    }
            }


        }

        protected void rptUser_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Label lblFriendID = e.Item.FindControl("lblFriendID") as Label;
            int friendID = ToInt(lblFriendID.Text);


            if (e.CommandName.ToUpper() == "VIEW")
            {
                Response.Redirect("FriendProfile.aspx?friendID=" + friendID);
            }
            else if (e.CommandName.ToUpper() == "ADD")
            {
                HideAllPanel();
                pnlMessageUser.Visible = true;

            
                //set message text
                lblFriendMessage.Text = "Will you like to be my friend? I'm <b>" + UserDetails.FirstName + " " + UserDetails.LastName
                    + "</b>?<br> If yes, request message will be send to user for approval.";
                Session["REQUESTFRIENDID"] = friendID;
            }

        }

        protected void rptUser_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            LinkButton link = ((LinkButton)e.Item.FindControl("lnkAddFriend"));// 



            if (e.Item.ItemType == ListItemType.Item ||
               e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblFriendID = e.Item.FindControl("lblFriendID") as Label;
                int friendID = ToInt(lblFriendID.Text);

                if (IsFriend(friendID) || USERID == friendID)
                {
                    link.Text = "View Friend";
                    link.CommandName = "View";
                }

            }


        }

        protected void rptGroup_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            LinkButton link = ((LinkButton)e.Item.FindControl("lnkAddGroup"));

            if (e.Item.ItemType == ListItemType.Item ||
               e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblGroupID = e.Item.FindControl("lblGroupID") as Label;
                int groupID = ToInt(lblGroupID.Text);

                if (IsJoinGroup(groupID))
                {
                    link.Text = "View Group";
                    link.CommandName = "View";
                }

            }


        }


        private void HideAllPanel()
        {
            pnlMessageGroup.Visible = false;
            pnlSearchByGroup.Visible = false;
            pnlSearchByUser.Visible = false;
            pnlSearchGroupRsult.Visible = false;
            pnlSearchUserResult.Visible = false;
            pnlMessageUser.Visible = false;

        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            MessageWS.MessageService messageWS = new Fnet.MessageWS.MessageService();

            //Get group
            int groupID = ToInt(Session["REQUESTGROUPID"]);

            DataTable dt = groupWS.GetGroupOwnerDetails(groupID);

            String groupName = dt.Rows[0]["GROUP_NAME"].ToString();
            int groupUserID = ToInt(dt.Rows[0]["USER_ID"]);

            String subject = "New user request to join your group " + groupName;
            String content = Model.ClassList.EmailTemplate.RequestForJoinGroup();

            content = content.Replace("<GROUPNAME>", groupName);

            messageWS.InsertMessage(USERID, groupUserID, subject, content);
            groupWS.InsertGroupMember(groupID, USERID, USERID, Model.ClassList.UserGroupList.PENDING_ADMIN_CONFIRM);


            HideAllPanel();
            pnlSearchByGroup.Visible = true;
            pnlSearchGroupRsult.Visible = true;

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            HideAllPanel();
            pnlSearchByGroup.Visible = true;
            pnlSearchGroupRsult.Visible = true;
        }

        protected void btnFriendOK_Click(object sender, EventArgs e)
        {
            UserWS.UserService userWS = new Fnet.UserWS.UserService();

            //Get group
            int friendID = ToInt(Session["REQUESTFRIENDID"]);
            String link = Request.Url.ToString();
            link = link.Replace("UserSearch", "Activation");

            UserWS._User user = userWS.GetUserByID(friendID);

            String subject = "New friend request from " + UserDetails.FirstName + " " + UserDetails.LastName;
            String content = Model.ClassList.EmailTemplate.RequestForFriend();

            link = link + "?Type=FRIENDREQUEST&USERID=" + USERID + "&FRIENDID=" + friendID + "";
            content = content.Replace("<LINK>", link);
            content = content.Replace("<NAME>", user.FirstName + " " + user.LastName);
            content = content.Replace("<FRIENDNAME>", UserDetails.FirstName + " " + UserDetails.LastName);

            MessageWS.MessageService messageWS = new Fnet.MessageWS.MessageService();
            messageWS.InsertMessage(USERID, friendID, subject, content);


            userWS.InsertFriend(USERID, friendID);
            HideAllPanel();
            pnlSearchByUser.Visible = true;
            pnlSearchUserResult.Visible = true;
        }

        protected void btnFriendCancel_Click(object sender, EventArgs e)
        {
            HideAllPanel();
            pnlSearchByUser.Visible = true;
            pnlSearchUserResult.Visible = true;
        }


    }
}
