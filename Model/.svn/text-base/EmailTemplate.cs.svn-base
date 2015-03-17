using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model.ClassList
{
  public  class EmailTemplate
    {

        public static string RequestRelationship()
        {
            StringBuilder strContent = new StringBuilder();

            strContent.AppendLine("Dear <NAME>, ");
            strContent.AppendLine();
            strContent.AppendLine("You have a new relationship request from <REQUESTER> as <RELATIONSHIP> ");
            strContent.AppendLine("Please click the following link to accept.");
            strContent.AppendLine();
            strContent.AppendLine("<a href='<LINK>' target='_blank'>Click Here </a> ");
            strContent.AppendLine();
            strContent.AppendLine("Regards,");
            strContent.AppendLine("Fnet");

            strContent = strContent.Replace("'", "`");
            return strContent.ToString();
        }

        public static string UserComfirmation()
        {
            StringBuilder strContent = new StringBuilder();

            strContent.AppendLine("Dear <NAME>, ");
            strContent.AppendLine();           
            strContent.AppendLine("Thanks for registering Fnet.");
            strContent.AppendLine("Your login details shown as below.");
            strContent.AppendLine();
            strContent.AppendLine("User Name : <USER_NAME>");
            strContent.AppendLine("Password  : <PASSWORD>");
            strContent.AppendLine();
            strContent.AppendLine("Regards,");
            strContent.AppendLine("Fnet");

            strContent = strContent.Replace("'", "`");
            return strContent.ToString();
        }


        public static string InvitationToGroupFromAdmin()
        {
            StringBuilder strContent = new StringBuilder();

            strContent.AppendLine("Dear <NAME>, ");
            strContent.AppendLine();
            strContent.AppendLine("You are invited to join <GROUP>");
            strContent.AppendLine("Please click at the following link for confirmation.");
            strContent.AppendLine();
            strContent.AppendLine("<a href='<LINK>' target='_blank'>Click Here </a> ");
            strContent.AppendLine();
            strContent.AppendLine("Regards,");
            strContent.AppendLine("Group <GROUP> Admin");

            strContent = strContent.Replace("'", "`");
            return strContent.ToString();
        }


        public static string RequestForJoinGroup()
        {
            StringBuilder strContent = new StringBuilder();

            strContent.AppendLine("Dear Group Admin, ");
            strContent.AppendLine();
            strContent.AppendLine("You have a new request from user for joining your group <GROUPNAME>");
            strContent.AppendLine("Please check your group for more details.");
            strContent.AppendLine();   
            strContent.AppendLine();
            strContent.AppendLine("Regards,");
            strContent.AppendLine("Fnet");

            strContent = strContent.Replace("'", "`");
            return strContent.ToString();
        }


        public static string RequestForFriend()
        {
            StringBuilder strContent = new StringBuilder();

            strContent.AppendLine("Dear <NAME>, ");
            strContent.AppendLine();
            strContent.AppendLine("You have new friend request from <FRIENDNAME>");
            strContent.AppendLine("Please click at the following link for confirmation.");
            strContent.AppendLine();
            strContent.AppendLine("<a href='<LINK>' target='_blank'>Click Here </a> ");
            strContent.AppendLine();
            strContent.AppendLine("Regards,");
            strContent.AppendLine("Fnet");

            strContent = strContent.Replace("'", "`");
            return strContent.ToString();
        }
        public static string NotifyResetPassword()
        {
            StringBuilder strContent = new StringBuilder();

            strContent.AppendLine("Dear <NAME>, ");
            strContent.AppendLine();
            strContent.AppendLine("You Username is: <USER_NAME>.");
            strContent.AppendLine("Your new password is: <PASSWORD>.");
            strContent.AppendLine();
            strContent.AppendLine();
            strContent.AppendLine("Regards,");
            strContent.AppendLine("Fnet");

            strContent = strContent.Replace("'", "`");
            return strContent.ToString();
        }
    }
}
