using System;
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

using Fnet.GroupWS;

namespace Fnet
{
    public partial class Activation : Base
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            String type = Request.QueryString["Type"];
           
          
            switch (type)
            {
                case "GROUPINVITE":
                    int groupID = ToInt(Request.QueryString["GroupID"]);
                    int requesterID = ToInt(Request.QueryString["RequesterID"]);
                    GroupService groupWS = new GroupService();
                    groupWS.InsertGroupMember(groupID, requesterID, USERID, Model.ClassList.UserGroupList.ACTIVE);
                    
                    Response.Write("<script language=javascript>window.alert('You have join the group'); </script>");
                    Response.Write("<script language=javascript> window.opener='x';window.close(); </script>");
                    Response.End();
                    break;

                case "RelationshipAccept":
                    int RelationType = ToInt(Request.QueryString["RelationshipType"]);
                    int RelationID = ToInt(Request.QueryString["RelationNameID"]);
                    int Responder = ToInt(Request.QueryString["RecieverID"]);
                    UserWS.UserService userWS = new UserWS.UserService();
                    int AffectedRow = userWS.AcceptRelationshipRequest(RelationType, RelationID, Responder);

                    if (AffectedRow >= 1)
                    {
                        Response.Write("<script language=javascript>window.alert('You have accepted the relationship!'); </script>");
                        Response.Write("<script language=javascript>window.opener='x';window.close(); </script>");
                        Response.End();
                    }
                    else
                    {
                        Response.Write("<script language=javascript>window.alert('Error! Please contact us!'); </script>");
                        Response.Write("<script language=javascript>window.operner='x';window.close(); </script>");
                        Response.End();
                    }
                    break;
                case "FRIENDREQUEST":
                    int userID = ToInt(Request.QueryString["USERID"]);
                    int friendID = ToInt(Request.QueryString["FRIENDID"]);
                    UserWS.UserService userWS1 = new UserWS.UserService();

                    userWS1.UpdateFriendStatus(userID, friendID);

                    Response.Write("<script language=javascript>window.alert('You have a new Friend'); </script>");
                    Response.Write("<script language=javascript> window.opener='x';window.close(); </script>");
                    break;
            }



      

        }
    }
}
