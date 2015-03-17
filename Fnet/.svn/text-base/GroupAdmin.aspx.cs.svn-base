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
using Fnet.GroupWS;

namespace Fnet
{
    public partial class GroupAdmin : Base
    {
        GroupService groupWS = new GroupService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }



        #region PANEL DISPLAY
        protected void lnkBanned_Click(object sender, EventArgs e)
        {
            pnlInvite.Visible = false;
            pnlPermission.Visible = false;
            pnlSearchMember.Visible = true;
            pnlDelegation.Visible = false;
        }

        protected void lnkPermission_Click(object sender, EventArgs e)
        {
            pnlInvite.Visible = false;
            pnlPermission.Visible = true;
            pnlSearchMember.Visible = false;
            pnlDelegation.Visible = false;
            LoadPendingList();
        }

        protected void lnkInvite_Click(object sender, EventArgs e)
        {
            pnlInvite.Visible = true;
            pnlPermission.Visible = false;
            pnlSearchMember.Visible = false;
            pnlDelegation.Visible = false;
        }

        protected void lnkDelegate_Click(object sender, EventArgs e)
        {
            pnlInvite.Visible = false;
            pnlPermission.Visible = false;
            pnlSearchMember.Visible = false;
            pnlDelegation.Visible = true;
            LoadModeratorList();
        }
        #endregion



        protected void btnSearchBan_Click(object sender, EventArgs e)
        {
            LoadBannedList();
        }



        protected void grdBaned_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            int listID = ToInt(grdBaned.DataKeys[index]["LIST_ID"].ToString());


            if (e.CommandName == "Ban")
            {
                groupWS.UpdateGroupMemeberStatus(listID, Model.ClassList.UserGroupList.BAN);
            }
            else
            {
                groupWS.UpdateGroupMemeberStatus(listID, Model.ClassList.UserGroupList.ACTIVE);
            }

            LoadBannedList();
        }



        private void LoadBannedList()
        {
            String input = txtSearchMember.Text.Trim();
            DataTable dt = groupWS.GetGroupMembersByName(ToInt(GROUPID), input);
            if (dt == null || dt.Rows.Count == 0)
            {
                lblBand.Text = "No member found.";
                grdBaned.DataSource = null;
                grdBaned.DataBind();
            }
            else
            {
                lblBand.Text = "";
                grdBaned.DataSource = dt;
                grdBaned.DataBind();
            }
        }

        private void LoadPendingList()
        {
            DataTable dt = groupWS.GetPendingGroupMembers(ToInt(GROUPID));
            if (dt == null || dt.Rows.Count == 0)
            {
                lblPending.Text = "No member found.";
                grdPending.DataSource = null;
                grdPending.DataBind();
            }
            else
            {
                lblPending.Text = "";
                grdPending.DataSource = dt;
                grdPending.DataBind();
            }
        }

        protected void grdPending_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            int listID = ToInt(grdPending.DataKeys[index]["LIST_ID"].ToString());

            if (e.CommandName == "Accept")
            {
                groupWS.UpdateGroupMemeberStatus(listID, Model.ClassList.UserGroupList.ACTIVE);
            }
            else
            {
                groupWS.UpdateGroupMemeberStatus(listID, Model.ClassList.UserGroupList.CANCEL);
            }
            LoadPendingList();
        }


        private void LoadModeratorList()
        {

            DataTable dt = groupWS.GetGroupModerator(ToInt(GROUPID));
            if (dt == null || dt.Rows.Count == 0)
            {
                lblUnassign.Text = "No moderator found.";
                grdUnassign.DataSource = null;
                grdUnassign.DataBind();
            }
            else
            {
                lblUnassign.Text = "";
                grdUnassign.DataSource = dt;
                grdUnassign.DataBind();
            }

        }

        private void LoadActiveMemberList()
        {
            String input = txtAssign.Text.Trim();
            DataTable dt = groupWS.GetGroupMembersByName(ToInt(GROUPID), input);
            if (dt == null || dt.Rows.Count == 0)
            {
                lblAssign.Text = "No member found.";
                grdAssign.DataSource = null;
                grdAssign.DataBind();
            }
            else
            {
                lblAssign.Text = "";
                grdAssign.DataSource = dt;
                grdAssign.DataBind();
            }
        }

        protected void grdUnassign_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            int listID = ToInt(grdUnassign.DataKeys[index]["LIST_ID"].ToString());

            groupWS.UpdateGroupMemberType(listID, Model.ClassList.UserType.gMember);

            LoadModeratorList();
        }

        protected void btnSearchAssign_Click(object sender, EventArgs e)
        {
            LoadActiveMemberList();
        }

        protected void grdAssign_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            int listID = ToInt(grdAssign.DataKeys[index]["LIST_ID"].ToString());

            groupWS.UpdateGroupMemberType(listID, Model.ClassList.UserType.gModerator);
            LoadActiveMemberList();
            LoadModeratorList();
        }

        protected void btnSearchInvite_Click(object sender, EventArgs e)
        {
            LoadInviteList();


        }


        private void LoadInviteList()
        {
            lblGroupName.Text = groupWS.GetGroupDetails(GROUPID).GroupName;
            String input = txtInvite.Text.Trim();
            DataTable dt = groupWS.GetNonMemberByName(input, ToInt(GROUPID));
            if (dt == null || dt.Rows.Count == 0)
            {
                lblInviteMessage.Text = "No user found.";
                grdInvite.DataSource = null;
                grdInvite.DataBind();
            }
            else
            {
                lblInviteMessage.Text = "";
                grdInvite.DataSource = dt;
                grdInvite.DataBind();
                
            }
        }


        protected void grdInvite_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            int newUserID = ToInt(grdInvite.DataKeys[index]["USER_ID"].ToString());
            String userName = grdInvite.DataKeys[index]["NAME"].ToString();
            rptReciever.DataSource = CreateInviteDataSource(userName, newUserID);
            rptReciever.DataBind();
           
            //LoadInviteList();
        }


        private DataTable CreateInviteDataSource(String userName, int userID)
        {

            if (Session["InviteUserList"] == null)
            {
                DataTable dt = new DataTable("InviteList");
                dt.Columns.Add("USER_ID", Type.GetType("System.Int32"));
                dt.Columns.Add("NAME", Type.GetType("System.String"));
                Session["InviteUserList"] = dt;
            }

            DataTable dtInvite = (DataTable)Session["InviteUserList"];

            DataRow dr = dtInvite.NewRow();
            dr[0] = userID;
            dr[1] = userName;
            dtInvite.Rows.Add(dr);

            return dtInvite;
        }


        private int counter1 = 0;
        protected string GetTR()
        {
            if (counter1 % 3 == 0 && counter1 != 0)
            {
                counter1++;
                return "<TR>";
            }
            else
            {
                counter1++;
                return "";
            }
        }

        protected void rptReciever_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            DataTable dtInvite = (DataTable)Session["InviteUserList"];
            dtInvite.Rows[index].Delete();

            rptReciever.DataSource = dtInvite;
            rptReciever.DataBind();

        }

        protected void rptReciever_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            ImageButton img = ((ImageButton)e.Item.FindControl("imgBtn"));// you should check the location of your imagebutton
            img.CommandArgument = e.Item.ItemIndex.ToString();
        }

        protected void sendInvitation_Click(object sender, EventArgs e)
        {
            DataTable dtInvite = (DataTable)Session["InviteUserList"];

            if (dtInvite != null && dtInvite.Rows.Count > 0)
            {

                MessageWS.MessageService messageWS = new Fnet.MessageWS.MessageService();
                String link = Request.Url.ToString();
                link = link.Replace("GroupAdmin", "Activation");
                string groupName = groupWS.GetGroupDetails(GROUPID).GroupName;
                String subject = "Invitation to group " + groupName;

                for (int i = 0; i < dtInvite.Rows.Count; i++)
                {

                    int recieverID = ToInt(dtInvite.Rows[i]["USER_ID"]);
                    string recieverName = dtInvite.Rows[i]["NAME"].ToString();


                    link = link + "?Type=GROUPINVITE&GroupID=" + GROUPID + "&RequesterID=" + USERID + "";

                    String emailContent = Model.ClassList.EmailTemplate.InvitationToGroupFromAdmin();
                    emailContent = emailContent.Replace("<LINK>", link);
                    emailContent = emailContent.Replace("<GROUP>", groupName);
                    emailContent = emailContent.Replace("<NAME>", recieverName);

                 messageWS.InsertMessage(USERID, recieverID, subject, emailContent);



                }
                Session["InviteUserList"] = null;                
                
                lblSentMessage.Text = "Invitation had been sent to selected user(s).";
                imgSent.Visible = true;
                imgSent.ImageUrl = "Images/tick.png";

                grdInvite.DataSource = null;
                grdInvite.DataBind();
                rptReciever.DataSource = null;
                rptReciever.DataBind();
            }
            else
            {
                lblSentMessage.Text = "No user is selected. No message is sent.";
                imgSent.Visible = true;
                imgSent.ImageUrl = "Images/delete.png";

            }
        }



    }
}
