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
using System.Web.Configuration;

namespace Fnet
{
    public partial class Login : Base
    {
        UserWS.UserService userWs = new UserWS.UserService();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void signin_Click(object sender, EventArgs e)
        {
            String userName = txtUserName.Text.Trim();
            String password = txtPassword.Text;
 
            String hashedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(userName + password, FormsAuthPasswordFormat.SHA1.ToString());

            DataTable dt = userWs.GetUserByPassword(userName, hashedPassword);

            if (dt.Rows.Count > 0)
            {
                USERID = ToInt(dt.Rows[0]["USER_ID"]);
               
                BindUserDetails();

                if (UserDetails.UserTypeID == 1)
                {
                    FormsAuthentication.RedirectFromLoginPage(UserDetails.UserName, false);
                    Response.Redirect("AdminControl.aspx");
                }
                else
                {
                    FormsAuthentication.RedirectFromLoginPage(UserDetails.UserName, false);
                    Response.Redirect("UserEditProfile.aspx");
                }
            }
            else
            {
                lblMessage.Text = "Invalid Username or password. Please try again.";
            }
        }

      

    }
}
