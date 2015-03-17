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
using Fnet.MessageWS;
using Fnet.UserWS;

namespace Fnet
{
    public partial class FriendWall : Base
    {
        MessageService messageWS = new MessageService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                imgFriendPic.ImageUrl = ProfilePicUrl(FRIENDID);
                LoadMainComment();

            }
        }


        protected void btnShoot_Click(object sender, EventArgs e)
        {
            if (txtNewComment.Text.Trim() != "")
            {
                Comment comment = new Comment();
                comment.Content = txtNewComment.Text.Trim();
                comment.UserID = UserDetails.UserID;
                comment.CommetOnUserID = FRIENDID;
                InsertComment(comment);
                LoadMainComment();
            }
        }

        private void LoadMainComment()
        {
            DataSet ds = new DataSet();

            DataTable dtMainComment = new DataTable("MainComment");
            dtMainComment = messageWS.GetMainCommentByID(FRIENDID);

            if (dtMainComment != null)
            {
                rptMainComment.DataSource = dtMainComment;
                rptMainComment.DataBind();
            }

            UserService userWS = new UserService();
            _User user = userWS.GetUserByID(USERID);
            lblUserName.Text = UserDetails.FirstName + " " + UserDetails.LastName;
        }



        protected void rptMainComment_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            DataRowView dv = e.Item.DataItem as DataRowView;
            if (dv != null)
            {
                Repeater nestedRepeater = e.Item.FindControl("rptRespondComment") as Repeater;
                if (nestedRepeater != null)
                {
                    int commentID = ToInt(dv.Row[0]);
                    DataTable dtRespondComment = new DataTable("RespondComment");
                    dtRespondComment = messageWS.GetResponseCommentByID(commentID);
                    nestedRepeater.DataSource = dtRespondComment;
                    nestedRepeater.DataBind();
                }
            }
        }

        protected void rptMainComment_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Respond")
            {
                TextBox txtRespond = e.Item.FindControl("txtRespond") as TextBox;
                if (txtRespond.Text.Trim() != "")
                {
                    Comment comment = new Comment();
                    comment.ReplyID = ToInt(e.CommandArgument);
                    comment.Content = txtRespond.Text.Trim();
                    comment.UserID = UserDetails.UserID;
                    comment.CommetOnUserID = FRIENDID;
                    InsertComment(comment);
                    LoadMainComment();
                }
            }
            else if (e.CommandName == "ShowPanel")
            {
                Panel pnlRespond = e.Item.FindControl("pnlRespond") as Panel;
                if (pnlRespond.Visible == false)
                    pnlRespond.Visible = true;
                else
                    pnlRespond.Visible = false;

            }
        }


        private void InsertComment(Comment comment)
        {
            Comment newComment = new Comment();
            newComment.Content = comment.Content;
            newComment.UserID = comment.UserID;
            newComment.ReplyID = comment.ReplyID;
            newComment.CommetOnUserID = comment.CommetOnUserID;
            newComment.Date = DateTime.Now.ToString("dd-MMM-yyyy hh:mm:ss");
            messageWS.InsertComment(newComment);
            LoadMainComment();
        }


    }
}
