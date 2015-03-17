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


namespace Fnet
{
    public partial class UserInbox : Base
    {
        MessageService messageWS = new MessageService();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                lblUserName.Text = UserDetails.FirstName + " " + UserDetails.LastName;
                imgProfile.ImageUrl = ProfilePicUrl(USERID);
                LoadInbox();

            }
        }


        private void LoadInbox()
        {
            DataTable dt = messageWS.GetMessageByUserID(USERID);

            if (dt == null || dt.Rows.Count <= 0)
            {
                lblMessage.Text = "Empty Mail Box.";

            }
            else
            {
                grdInbox.DataSource = dt;
                grdInbox.DataBind();
            }
        }
        protected void grdInbox_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            int index = Convert.ToInt32(e.CommandArgument);

            String userName = grdInbox.DataKeys[index]["NAME"].ToString();
            String subject = grdInbox.DataKeys[index]["SUBJECT"].ToString();
            String date = grdInbox.DataKeys[index]["MESSAGE_DATE"].ToString();
            String content = grdInbox.DataKeys[index]["CONTENT"].ToString();
            int read = ToInt(grdInbox.DataKeys[index]["READ"]);
            int messageID = ToInt(grdInbox.DataKeys[index]["MESSAGE_ID"]);
            int senderID = ToInt(grdInbox.DataKeys[index]["SENDER_ID"]);

            content = content.Replace("`", "'");

            if (e.CommandName.ToLower() != "delete")
            {
                content = content.Replace("\n", "<br>");

                lblContent.Text = content;
                lblDate.Text = date;
                lblSubject.Text = subject;
                lblSender.Text = userName;

                if (read != 0)
                {
                    messageWS.UpdateReadMessage(messageID);

                }

                lnkReply.NavigateUrl = "UserMessage.aspx?ReplyUserID=" + senderID;
            }
            else
            {
                messageWS.DeleteMessage(messageID);
                Response.Redirect("UserInbox.aspx");
            }

            LoadInbox();

        }

        protected void grdInbox_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

    }
}
