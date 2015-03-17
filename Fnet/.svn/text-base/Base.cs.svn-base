using System;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.SessionState;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Net.Mail;
using Fnet.UserWS;


namespace Fnet
{
    public class Base : System.Web.UI.Page
    {



        #region Sessions
        public int USERID
        {
            get { return ToInt(Session["USERID"]); }
            set { Session["USERID"] = value; }
        }

        public int FRIENDID
        {
            get { return ToInt(Session["FRIENDID"]); }
            set { Session["FRIENDID"] = value; }
        }

        public String GROUPID
        {
            get { return Session["GROUPID"].ToString(); }
            set { Session["GROUPID"] = value; }
        }

        public _User UserDetails
        {
            get { return (_User)Session["USERDETAILS"]; }
            set { Session["USERDETAILS"] = value; }
        }

        public int GroupUserType
        {
            get { return ToInt(Session["GROUPUSERTYPEID"]); }
            set { Session["GROUPUSERTYPEID"] = value; }
        }

        public String UserType
        {
            get { return (String)Session["USERTYPE"]; }
            set { Session["USERTYPE"] = value; }
        }

        public String BOARDID
        {
            get { return Session["BOARDID"].ToString(); }
            set { Session["BOARDID"] = value; }
        }
        #endregion

        #region Casting
        public int ToInt(Object input)
        {
            return Convert.ToInt32(input);
        }
        #endregion

        #region Binding Property

        public void BindUserDetails()
        {
            UserWS.UserService userWS = new UserWS.UserService();
            _User user = new _User();
            user = userWS.GetUserByID(USERID);

            UserDetails = user;

        }

        #endregion

        #region Validation
        public Boolean IsNumeric(String input)
        {
            Boolean isInteger = false;
            try
            {
                Convert.ToInt32(input);
                isInteger = true;
            }
            catch (Exception)
            {
                isInteger = false;
            }
            return isInteger;

        }


        public Boolean IsEmpty(String input)
        {
            Boolean isEmpty = false;
            if (input.Trim() == String.Empty)
                isEmpty = true;

            return isEmpty;
        }

        public Boolean IsValidDate(String input)
        {
            Boolean isDate = false;
            try
            {
                Convert.ToDateTime(input);
                isDate = true;
            }
            catch (Exception)
            {
                isDate = false;
            }
            return isDate;

        }

     /*   public Boolean IsValidEmail(String input)
        {
            EmailWS.XWebEmailValidation emailWS = new EmailWS.XWebEmailValidation();
            EmailWS.AuthHeader autheticate = new EmailWS.AuthHeader();
            autheticate.LoginName = "bugs_hw";
            autheticate.Password = "mangobird939";
            emailWS.AuthHeaderValue = autheticate;
            int val = emailWS.ValidateEmail(input.Trim());

            if (val == 1)
                return true;
            else
                return false;

        }*/

        #endregion

        #region Send Email
     /*   protected void SendMail(Fnet.UserWS._User user)
        {
            String link = Request.Url.ToString();
            link = link.Replace("Register", "Activation");

            String emailContent = Model.ClassList.EmailTemplate.UserComfirmation();
            emailContent = emailContent.Replace("<NAME>", user.FirstName + " " + user.LastName);
            emailContent = emailContent.Replace("<USER_NAME>", user.UserName);
            emailContent = emailContent.Replace("<PASSWORD>", user.Password);

            MailMessage sndEmail = new MailMessage();


            sndEmail.To.Add(user.Email);
            sndEmail.From = new MailAddress("s4190951@student.uq.edu.au");
            sndEmail.Subject = "Fnet Register Confirmation";

            sndEmail.Body = emailContent;

            sndEmail.IsBodyHtml = false;
            SmtpClient smtp = new SmtpClient("mailhub.itee.uq.edu.au", 25);

            smtp.Send(sndEmail);
        }*/
        protected void SendMail(Fnet.UserWS._User user) 
        {
            try
            {
                
                SmtpClient client = new SmtpClient();
                client.Host = "smtp.exchangelabs.com";
                MailMessage message = new MailMessage();
                message.Sender = new MailAddress("noreply@connect.com");
                message.From = new MailAddress("noreply@connect.com");
                message.To.Add(new MailAddress(user.Email));
                message.Subject = "Welcome to Fnet";
                message.Body = "Welcome to Fnet\n" + "Your username: " + user.UserName + "\n" +
                    "Your password:" + user.Password + "" + " ";
                client.Send(message);
            }
            catch (Exception e)
            {
 
            }
        }

       /* protected void SendResetPwdMail(Fnet.UserWS._User user)
        {
            String link = Request.Url.ToString();
            link = link.Replace("AdminControl", "ResetPassword");

            String emailContent = Model.ClassList.EmailTemplate.NotifyResetPassword();
            emailContent = emailContent.Replace("<NAME>", user.FirstName + " " + user.LastName);
            emailContent = emailContent.Replace("<USER_NAME>", user.UserName);
            emailContent = emailContent.Replace("<PASSWORD>", user.Password);

            MailMessage sndEmail = new MailMessage();


            sndEmail.To.Add(user.Email);
            sndEmail.From = new MailAddress("s4190951@student.uq.edu.au");
            sndEmail.Subject = "Fnet Register Confirmation";

            sndEmail.Body = emailContent;

            sndEmail.IsBodyHtml = false;
            SmtpClient smtp = new SmtpClient("mailhub.itee.uq.edu.au", 25);

            smtp.Send(sndEmail);
        }*/
        protected void SendResetPwdMail(Fnet.UserWS._User user)
        {
            try
            {

                SmtpClient client = new SmtpClient();
                client.Host = "smtp.exchangelabs.com";
                MailMessage message = new MailMessage();
                message.Sender = new MailAddress("noreply@connect.com");
                message.From = new MailAddress("noreply@connect.com");
                message.To.Add(new MailAddress(user.Email));
                message.Subject = "Reset password to Fnet";
                message.Body = "Reset password to Fnet\n" + "Your username: " + user.UserName + "\n" +
                    "Your new password:" + user.Password + "" + " ";
                client.Send(message);
            }
            catch (Exception e)
            {

            }
        }


        #endregion

        #region Defauld App setting
        protected String ProfileImagePath(int userID)
        {
            return "ProfilePic/User_" + userID + "/";

        }

        protected String ProfilePicUrl(int userID)
        {
            return ProfileImagePath(userID) + "profilePic_thumb.jpg";
        }

        protected String GroupImagePath(int groupID)
        {
            return "GroupProfilePic/Group_" + groupID + "/";

        }

        protected String GroupPicUrl(int groupID)
        {
            return GroupImagePath(groupID) + "GroupProfilePic_thumb.jpg";
        }

        #endregion

        #region Authorization

        #endregion


  
    }
}
