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


namespace Fnet
{
    public partial class FriendMessage : Base
    {
        MessageService messageWS = new MessageService();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                imgFriendPic.ImageUrl = ProfilePicUrl(FRIENDID);
                LoadBasicInformation();
            }

        }


        private void LoadBasicInformation()
        {
            UserService userWS = new UserService();
            _User user = userWS.GetUserByID(FRIENDID);
            lblUserName.Text = user.FirstName + " " + user.LastName;

            lblTo.Text = user.FirstName + " " + user.LastName; ;

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            imgSent.Visible = true;
            if (IsEmpty(txtContent.Text.Trim()) || IsEmpty(txtSubject.Text.Trim()))
            {
               
                lblSentMessage.Text = "Content or subject cannot be blank.";
                imgSent.ImageUrl = "Images/delete.png";
            }
            else
            {

                messageWS.InsertMessage(USERID, FRIENDID, txtSubject.Text, txtContent.Text);
                lblSentMessage.Text = "Message is sent.";
                imgSent.ImageUrl = "Images/tick.png";
            }
        }

       

        
    }
}
