using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace BrisbaneConnectServices.ClassList
{
    public class Message
    {
        private int messageID;

        public int MessageID
        {
            get { return messageID; }
            set { messageID = value; }
        }

        private string content;

        public string Content
        {
            get { return content; }
            set { content = value; }
        }
        private DateTime date;

        public DateTime Date
        {
            get { return date; }
            set { date = value; }
        }

        private int senderID;

        public int SenderID
        {
            get { return senderID; }
            set { senderID = value; }
        }

        private int userID;

        public int UserID
        {
            get { return userID; }
            set { userID = value; }
        }
    }


}
