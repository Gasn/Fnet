using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using Fnet.SearchWS;

namespace Fnet
{

    public partial class UserFriendList : Base
    {
        SearchService searchWS = new SearchService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblUserName.Text = UserDetails.FirstName + " " + UserDetails.LastName;
                imgProfile.ImageUrl = ProfilePicUrl(USERID);
                LoadFriendList();
            }

        }

        private void LoadFriendList()
        {
            DataTable dt = new DataTable();
            if (txtSearch.Text.Trim() == "")
            {
                dt = searchWS.GetFriendList(USERID);
            }
            else
            {
                dt = searchWS.GetFriendListByName(USERID, txtSearch.Text.Trim());

            }
            rptFriend.DataSource = dt;
            rptFriend.DataBind();
           
        }

        private int counter = 0;
        protected string GetTR()
        {
            if (counter % 5 == 0)
            {
                counter++;
                return "<TR>";
            }
            else
            {
                counter++;
                return "";
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadFriendList();
        }
}
}