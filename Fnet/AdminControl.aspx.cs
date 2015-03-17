using System;
using System.Text;
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
using Model.ClassList;
using System.Web.Configuration;

namespace Fnet
{
    public partial class AdminControl : Base
    {
        Fnet.UserWS.UserService userWS = new Fnet.UserWS.UserService();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSearchModify_Click(object sender, EventArgs e)
        {
            if (txtSearchUserName.Text != "")
            {
                getUserToModify();
                lblError.Text = "";
            }
            else
            {
                lblError.Text = "Please enter a username.";
            }
        }

        private void getUserToModify()
        {
            DataTable dt = userWS.GetUserByUserName(txtSearchUserName.Text);
            pnlModify.Visible = true;
            if (dt.Rows.Count > 0)
            {
                UserDetails.UserName = dt.Rows[0][0].ToString(); //For deletion

                txtNewUserName.Text = dt.Rows[0][0].ToString();
                txtFirstName.Text = dt.Rows[0][1].ToString();
                txtLastName.Text = dt.Rows[0][2].ToString();
                txtEmail.Text = dt.Rows[0][3].ToString();
                UserDetails.FirstName = dt.Rows[0][4].ToString();
                UserDetails.LastName = dt.Rows[0][5].ToString();
            }
            else 
            {
                lblError.Text = "This username does not exist!";
            }
        }

        private String GeneratePasword()
        {
            Random _random = new Random();
            StringBuilder builder = new StringBuilder();
            for (int i = 0; i < 10; i++)
            {
                //26 letters in the alfabet, ascii + 65 for the capital letters
                builder.Append(Convert.ToChar(Convert.ToInt32(Math.Floor(26 * _random.NextDouble() + 65))));

            }
            return builder.ToString();
        }

        protected void resetPassword_Click(object sender, EventArgs e)
        {
            UserService userWS = new UserService();

            String password = GeneratePasword();
            String hashedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(txtNewUserName.Text + password, "sha1");
            
            userWS.AdminModifyUser(txtNewUserName.Text, txtFirstName.Text, txtLastName.Text, txtEmail.Text, hashedPassword);

            
            Fnet.UserWS._User _user = new Fnet.UserWS._User();

            _user.FirstName = UserDetails.FirstName;
            _user.LastName = UserDetails.LastName;
            _user.UserName = UserDetails.UserName;
            _user.Email = txtEmail.Text;
            _user.Password = password;

            //Model.ClassList.EmailTemplate.NotifyResetPassword
            // Send email.
            SendResetPwdMail(_user);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (deleteConfirmation.Checked)
            {
                userWS.AdminDeleteUser(UserDetails.UserName);
            }
            else
            {
                lblErrorDelete.Text = "Please check to confirm the deletion of the user account.";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            FormsAuthentication.RedirectFromLoginPage(UserDetails.UserName, false);
            Response.Redirect("UserEditProfile.aspx");
        }
    }
}
