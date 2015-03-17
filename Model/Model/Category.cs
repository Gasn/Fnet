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
    public class Category
    {
        private int catID;

        public int CatID
        {
            get { return catID; }
            set { catID = value; }
        }
        private string catName;

        public string CatName
        {
            get { return catName; }
            set { catName = value; }
        }
        private string catDesc;

        public string CatDesc
        {
            get { return catDesc; }
            set { catDesc = value; }
        }
        
    }
}
