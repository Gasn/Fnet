using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using Fnet.UserWS;
using System.Web.Configuration;

namespace Fnet
{

    public partial class UserSetting : Base
    {
        UserWS.UserService userWS = new UserWS.UserService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblUserName.Text = UserDetails.FirstName + " " + UserDetails.LastName;
                imgProfile.ImageUrl = ProfilePicUrl(USERID);

            }
        }



        protected void btnChangeName_Click(object sender, EventArgs e)
        {
            if (UserNameValidation())
            {
                pnlUsernameMessage.Visible = true;
                pnlContent.Visible = false;
                
            }



        }
        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            if (PasswordFieldsValidation())
            {
                pnlPasswordMessage.Visible = true;
                pnlContent.Visible = false;
                String hashedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(UserDetails.UserName + txtConfirmPassword.Text.Trim(), FormsAuthPasswordFormat.SHA1.ToString());
                UserDetails.Password = hashedPassword;
            }
        }

        //Update password
        protected void btnOk_Click(object sender, EventArgs e)
        {

            userWS.UpdateUser(UserDetails);
            lblPasswordUpdated.Visible = true;

            pnlPasswordMessage.Visible = false;
            pnlContent.Visible = true;

        }


        //Cancel password update
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            pnlPasswordMessage.Visible = false;
            pnlContent.Visible = true;
        }


        //Update User Name
        protected void btnUserOK_Click(object sender, EventArgs e)
        {

            _User user = UserDetails;
            user.UserName = txtUserName.Text;
            userWS.UpdateUser(user);
            lblUsernameUpdate.Visible = true;

            pnlUsernameMessage.Visible = false;
            pnlContent.Visible = true;

        }

        //cancel User Name update
        protected void btnUserCancel_Click(object sender, EventArgs e)
        {
            pnlUsernameMessage.Visible = false;
            pnlContent.Visible = true;
        }

        private void ClearMessage()
        {
            lblUserNameError.Text = "";
            lblNewPasswordError.Text = "";
            lblConfirmPasswordError.Text = "";
            lblOldPassword.Text = "";
            lblPasswordUpdated.Visible = false;
            lblUsernameUpdate.Visible = false;
            pnlPasswordMessage.Visible = false;
            pnlUsernameMessage.Visible = false;
        }

        private Boolean PasswordFieldsValidation()
        {
            ClearMessage();
            int isValid = 0;
            if (IsEmpty(txtOldPassword.Text))
            {
                lblOldPassword.Text = "This field cannot be empty.";
                isValid++;
            }
            if (IsEmpty(txtNewPassword.Text))
            {
                lblNewPasswordError.Text = "This field cannot be empty.";
                isValid++;
            }
            if (IsEmpty(txtConfirmPassword.Text))
            {
                lblConfirmPasswordError.Text = "This field cannot be empty.";
                isValid++;
            }
            if (txtConfirmPassword.Text.Trim() != txtNewPassword.Text.Trim())
            {
                lblConfirmPasswordError.Text = "New passwords does not match.";
                isValid++;
            }

            String hashedOldPwd = FormsAuthentication.HashPasswordForStoringInConfigFile(UserDetails.UserName + txtOldPassword.Text.Trim(), FormsAuthPasswordFormat.SHA1.ToString());
            if (hashedOldPwd != UserDetails.Password)
            {
                lblOldPassword.Text = "Wrong password";
                isValid++;
            }

            if (isValid > 0)
                return false;
            else
                return true;

        }


        private Boolean UserNameValidation()
        {
            ClearMessage();
            int isValid = 0;
            String userName = txtUserName.Text.Trim();
            if (IsEmpty(userName))
            {
                lblUserNameError.Text = "This field cannot be empty.";
                isValid++;
            }
            else

                if (userWS.CheckUniqueUserName(userName))
                {
                    lblUserNameError.Text = "Duplicate user name found.";
                    isValid++;
                }

            if (isValid > 0)
                return false;
            else
                return true;
        }
    }
}