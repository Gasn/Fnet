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
    public class DiscussionBoard
    {

        private int boardID;

        public int BoardID
        {
            get { return boardID; }
            set { boardID = value; }
        }
        private string topic;

        public string Topic
        {
            get { return topic; }
            set { topic = value; }
        }
        private string status;

        public string Status
        {
            get { return status; }
            set { status = value; }
        }
       
        private DateTime createdDate;

        public DateTime CreatedDate
        {
            get { return createdDate; }
            set { createdDate = value; }
        }

        private int createdBy;

        public int CreatedBy
        {
            get { return createdBy; }
            set { createdBy = value; }
        }
    }
}
