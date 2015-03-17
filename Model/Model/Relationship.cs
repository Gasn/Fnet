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
    public class Relationship
    {
        private int relationID;

        public int RelationID
        {
            get { return relationID; }
            set { relationID = value; }
        }
        private string relationName;

        public string RelationName
        {
            get { return relationName; }
            set { relationName = value; }
        }
        private string relationDesc;

        public string RelationDesc
        {
            get { return relationDesc; }
            set { relationDesc = value; }
        }
    
    }


}
