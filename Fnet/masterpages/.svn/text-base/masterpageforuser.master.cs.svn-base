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

public partial class masterpages_masterpageforuser : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }



    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Cookies.Clear();
        FormsAuthentication.SignOut();
        Response.Redirect("Login.aspx");
    }
   
}
