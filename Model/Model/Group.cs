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
    public class Group
    {
        public static int pending = 0;
        public static int active = 1;
        public static int close = 2;

        private int groupID;
        private string groupName;
        private int catID;
        private string groupDesc;
        private string groupType;
        private DateTime createdDate;
        private string status;


        public Group(int groupID, string groupName, int catID, string groupDesc, string groupType, DateTime createdDate, string status)
        {
            this.groupID = groupID;
            this.groupName = groupName;
            this.catID = catID;
            this.groupDesc = groupDesc;
            this.groupType = groupType;
            this.createdDate = createdDate;
            this.status = status;
        }

        public Group()
        {
            this.groupID = 0;
            this.groupName = "";
            this.catID = 0;
            this.groupDesc = "";
            this.groupType = "";
            this.createdDate = DateTime.MinValue;
            this.status = "";
        }


        public int GroupID
        {
            get { return groupID; }
            set { groupID = value; }
        }
    
        public string GroupName
        {
            get { return groupName; }
            set { groupName = value; }
        }
    

        public int CatID
        {
            get { return catID; }
            set { catID = value; }
        }


        public string GroupDesc
        {
            get { return groupDesc; }
            set { groupDesc = value; }
        }
       

        public string GroupType
        {
            get { return groupType; }
            set { groupType = value; }
        }
    

        public DateTime CreatedDate
        {
            get { return createdDate; }
            set { createdDate = value; }
        }
        

        public string Status
        {
            get { return status; }
            set { status = value; }
        }

    }
}
