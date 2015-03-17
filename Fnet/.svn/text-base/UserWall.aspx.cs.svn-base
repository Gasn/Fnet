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


namespace Fnet.webpages.User
{
    public partial class UserWall : Base
    {
        MessageService messageWS = new MessageService();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                lblUserName.Text = UserDetails.FirstName + " " + UserDetails.LastName;
                imgProfile.ImageUrl = ProfilePicUrl(USERID);
                LoadMainComment();
            }

        }

        protected void btnShoot_Click(object sender, EventArgs e)
        {
            if (txtCommnet.Text.Trim() != "")
            {
                Comment comment = new Comment();
                comment.Content = txtCommnet.Text.Trim();
                comment.UserID = UserDetails.UserID;
                comment.CommetOnUserID = UserDetails.UserID;
                InsertComment(comment);
                LoadMainComment();
            }
        }

        private void LoadMainComment()
        {
            DataSet ds = new DataSet();

            DataTable dtMainComment = new DataTable("MainComment");
            dtMainComment = messageWS.GetMainCommentByID(UserDetails.UserID);

            if (dtMainComment != null)
            {
                rptMainComment.DataSource = dtMainComment;
                rptMainComment.DataBind();
            }

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

        protected void rptRespondComment_ItemCommand(object source, RepeaterCommandEventArgs e) 
        {
            if (e.CommandName == "deleteResponse")
            {
                int comment_id = ToInt(e.CommandArgument);
                messageWS.deleteReplyComment(comment_id);
                LoadMainComment();

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
                    comment.CommetOnUserID = UserDetails.UserID;
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
            //Thao code
            else if (e.CommandName == "deleteMain" )
            {
                int comment_id = ToInt(e.CommandArgument);
                messageWS.deleteComment(comment_id);
                LoadMainComment();
            }
            
            //else if (e.CommandName == "deleteResponse")
            //{
            //    int comment_id = ToInt(e.CommandArgument);
            //    messageWS.deleteReplyComment(comment_id);
            //    LoadMainComment();
               
            //}
            
        }

        private void InsertComment(Comment comment)
        {
            Comment newComment = new Comment();
            
            newComment.Content = comment.Content;
            newComment.UserID = comment.UserID;
            newComment.ReplyID = comment.ReplyID;
            newComment.CommetOnUserID = comment.CommetOnUserID;
            newComment.Date = DateTime.Now.ToString();
            messageWS.InsertComment(newComment);
            LoadMainComment();
        }








    }
}
