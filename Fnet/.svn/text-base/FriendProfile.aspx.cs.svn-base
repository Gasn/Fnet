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
using Fnet.UserWS;
namespace Fnet
{
    public partial class FriendProfile : Base
    {
        UserService userWS = new UserService();
        protected void Page_Load(object sender, EventArgs e)
        {
            int newFriendID = ToInt(Request.QueryString["friendID"]);

            if (!IsPostBack)
            {
                if (newFriendID <= 0 && FRIENDID <= 0)
                {
                    pnlError.Visible = true;
                    pnlContent.Visible = false;
                }
                else
                {
                    if (newFriendID != 0 && FRIENDID != newFriendID)
                        FRIENDID = newFriendID;
                }

                if (newFriendID == USERID)
                    Response.Redirect("UserEditProfile.aspx");


                LoadFriendInformation();
            }

        }

        private void LoadFriendInformation()
        {
            if (FRIENDID > 0)
            {
               
                _User user = userWS.GetUserByID(FRIENDID);
               
                //Load Friend Information
                lblAddress.Text = user.Address; ;
                lblCountry.Text = user.Country;
                lblDOB.Text = user.Dob.ToString("dd/MMM/yyyy");
                lblEmail.Text =user.Email;
                lblName.Text = user.FirstName + " " + user.LastName;
                lblGender.Text = user.Gender;
                lblPostalCode.Text = user.PostalCode;
                lblJoinDate.Text = (user.CreatedDate).ToString("dd/MMM/yyyy");
                lblState.Text = user.State;
                lblSuburb.Text = user.Suburb;
                lblUserName.Text = user.FirstName + " " + user.LastName;
                
                //Load Friend Profile Pic
                friendImage.ImageUrl = ProfilePicUrl(FRIENDID);


                //Load Looking for Check box list
                DataTable dtUserLookingFor = userWS.GetUserLookingFor(FRIENDID);//UserDetails.UserID);
                lstLookingFor.DataSource = dtUserLookingFor;
                lstLookingFor.DataBind();

                //Load Interest list check box list
                DataTable dtUserInterest = userWS.GetUserInterest(FRIENDID);//UserDetails.UserID);
                lstInterest.DataSource = dtUserInterest;
                lstInterest.DataBind();

                //Load Relationship
            }
            else
            {
                pnlContent.Visible = false;
                pnlError.Visible = true;
            }


            //Coding for Relationship Establishment//

            //*****************************Aaron Coding for Relationship START*************************************//
            //DataTable AllRelationshipType = userWS.GetAllRelationshipType();
            //RELATIONSHIP_TYPE.DataSource = AllRelationshipType;
            //RELATIONSHIP_TYPE.DataBind();

            String FriendGender = userWS.getGender(FRIENDID);

            if (userWS.CheckRelationship(UserDetails.UserID).Equals("yes"))
            {
                //Getting all the relationship the friend has
                DataTable relationshipWith = userWS.GetUserRelationshipWith(FRIENDID);
                rList.DataSource = relationshipWith;

                for (int a = 0; a < relationshipWith.Rows.Count; a++)
                {
                    int rType = ToInt(relationshipWith.Rows[a]["RELATION_TYPE_ID"]);
                    int rReq = ToInt(relationshipWith.Rows[a]["RESPOND_USER_ID"]);
                    int rRes = ToInt(relationshipWith.Rows[a]["REQUEST_USER_ID"]);

                    DataTable rNumber = userWS.GetUserRelationshipType(rType);
                    String rTypeName = rNumber.Rows[0]["relation_type_name"].ToString();
                    String rTypeDescription = rNumber.Rows[0]["relation_type_desc"].ToString();
                    String rTypeGender = rNumber.Rows[0]["relation_gender"].ToString();

                    //Convert
                    if (!FriendGender.Equals(rTypeGender))
                    {
                        DataTable change = userWS.GetOppositeCategory(rTypeDescription, UserDetails.Gender);
                        String TestString = change.Rows[0]["relation_type_name"].ToString();
                        rTypeName = change.Rows[0]["relation_type_name"].ToString();

                    }

                    DataTable rNumber2 = new DataTable();
                    String rWithFirstName = "";
                    String rWithLastName = "";

                    if (UserDetails.UserID.ToString().Equals(rReq.ToString()))
                    {
                        rNumber2 = userWS.GetUsersName(rRes);
                        rWithFirstName = rNumber2.Rows[0]["first_name"].ToString();
                        rWithLastName = rNumber2.Rows[0]["last_name"].ToString();
                    }
                    else
                    {
                        rNumber2 = userWS.GetUsersName(rReq);
                        rWithFirstName = rNumber2.Rows[0]["first_name"].ToString();
                        rWithLastName = rNumber2.Rows[0]["last_name"].ToString();
                    }


                    //result.Text += UserDetails.FirstName + " " + UserDetails.LastName + " ";
                    //result.Text += rTypeName + " of ";
                    //result.Text += rWithFirstName + " " + rWithLastName + "<br>";

                    result.Text += userWS.GetUserFullname(FRIENDID)+" ";
                    result.Text += rTypeName + " of ";
                    result.Text += rWithFirstName + " " + rWithLastName + "<br>"; //UserDetails.FirstName + " " + UserDetails.LastName + "<br>";
                }
            }
            else
            {
                result.Text += userWS.GetUserFullname(FRIENDID);
                result.Text = result.Text +" is not in a relationship."; //UserDetails.FirstName + " " + UserDetails.LastName + " is not in a relationship.";
            }
            //*****************************Aaron Coding for Relationship END***************************************//

            //END Coding for Relationship Establishment//
        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserEditProfile.aspx");
        }


    }
}
