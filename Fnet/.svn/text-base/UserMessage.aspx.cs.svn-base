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
using Fnet.UserWS;
using Fnet.MessageWS;
using Fnet.SearchWS;
namespace Fnet
{
    public partial class UserMessage : Base
    {
        int replyUserID;
        protected void Page_Load(object sender, EventArgs e)
        {
            replyUserID = ToInt(Request.QueryString["ReplyUserID"]);
            if (!IsPostBack)
            {
                lblUserName.Text = UserDetails.FirstName + " " + UserDetails.LastName;
                imgProfile.ImageUrl = ProfilePicUrl(USERID);
                if (replyUserID != 0)
                    LoadReceiverInfo();
            }
        }


        private void LoadReceiverInfo()
        {
            UserService userWS = new UserService();
            lblReceiver.Text = userWS.GetUserByID(replyUserID).FirstName + " " + userWS.GetUserByID(replyUserID).LastName;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (txtSubject.Text.Trim() == "" || txtContent.Text.Trim() == "")
            {
                lblMessage.Text = "Subject or message body cannot be empty.";
            }
            else
            {
                MessageService messageWS = new MessageService();
                messageWS.InsertMessage(USERID, replyUserID, txtSubject.Text, txtContent.Text);
                lblMessage.Text = "Message is sent.";
            }


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserInbox.aspx");
        }


    }
}
