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
    public partial class Registration : Base
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region Event
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (ValidFields())
            {
                if (chkAgreement.Checked)
                {
                    //Generate Passowrd
                    String password = GeneratePasword();
                    UserService userWS = new UserService();
                    Fnet.UserWS._User _user = new Fnet.UserWS._User();

                    _user.FirstName = txtFirstName.Text;
                    _user.LastName = txtLastName.Text;
                    _user.Gender = lstGender.SelectedValue;
                    _user.Email = txtEmail.Text;
                    _user.Address = txtAddress.Text;
                    _user.Country = lstCountry.SelectedValue;
                    _user.Dob = Convert.ToDateTime(DOBDay.Text.Trim() + "/" + DOBMonth.SelectedValue + "/" + DOBYear.Text.Trim());
                    _user.Suburb = txtSuburb.Text;
                    _user.State = txtState.Text;
                    _user.PostalCode = txtPostalCode.Text;
                    _user.UserName = txtUserName.Text;
                    _user.Password = password;


                    // Send email.
                    SendMail(_user);

                    //Insert user Into Database
                    _user.Password = FormsAuthentication.HashPasswordForStoringInConfigFile(txtUserName.Text + password, "sha1");
                    userWS.AddUser(_user);

                    //Show message
                    pnlRegister.Visible = false;
                    pnlMessage.Visible = true;
                }
                else
                {
                    lblAgreementError.Text = "Please check for ensuring you had read the agreement.";
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
        #endregion

        #region validation and method
        private Boolean ValidFields()
        {
      
            lblGenderError.Text = "";
            lblDOBError.Text = "";
            lblEmailError.Text = "";

            int isValid = 0;
            //if (txtConfirmPassword.Text != txtPassword.Text)
            //{
            //    lblPasswordError.Text = "Passwords do not match.";
            //    isValid++;
            //}

            if (lstGender.SelectedIndex == 0)
            {
                lblGenderError.Text = "Please select your gender.";
                isValid++;
            }
            UserService userWS = new UserService();
            if (userWS.CheckUniqueUserName(txtUserName.Text.Trim()))
            {
                lblUserNameError.Text = "Duplicate User Name Found.";
                isValid++;
            }

            if (!IsValidDate(DOBDay.Text.Trim() + "/" + DOBMonth.SelectedValue + "/" + DOBYear.Text.Trim()))
            {
                lblDOBError.Text = "Invalid date.";
                isValid++;
            }

           /* if (!IsValidEmail(txtEmail.Text))
            {
                lblEmailError.Text = "Invalid email address";
                isValid++;
            }     */       

            if (isValid == 0)
                return true;
            else
                return false;

        }

        private  String GeneratePasword()
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
        #endregion

        

        
    }
}
