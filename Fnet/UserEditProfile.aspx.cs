using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.IO;
using System.Drawing;
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
    public partial class UserEditProfile : Base
    {
        Fnet.UserWS.UserService userWS = new Fnet.UserWS.UserService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblUserName.Text = UserDetails.FirstName + " " + UserDetails.LastName;
                imgProfile.ImageUrl = ProfilePicUrl(USERID);
                LoadBasicInformation();
                LoadPersonalInterest();
            }
            imgProfileNew.ImageUrl = ProfilePicUrl(USERID);

        }

        #region Events
        protected void editBasicInfo_Click(object sender, EventArgs e)
        {
            userEditinfo.Visible = true;
        }
        protected void cancelEditBasicInfo_Click(object sender, EventArgs e)
        {
            userEditinfo.Visible = false;
        }
        protected void doneEditBasicInfo_Click(object sender, EventArgs e)
        {
            userEditinfo.Visible = false;
        }
        protected void cancelEditInterest_Click(object sender, EventArgs e)
        {
            userEditInterest.Visible = false;
        }
        protected void doneEditInterest_Click(object sender, EventArgs e)
        {
            userEditInterest.Visible = false;
        }

        protected void editInterest_Click(object sender, EventArgs e)
        {
            userEditInterest.Visible = true;
            result.Text = " ";
        }
        #endregion


        private void LoadBasicInformation()
        {
            String dob = UserDetails.Dob.ToString("dd MMM yyyy");

            lblFirstName.Text = UserDetails.FirstName;
            lblLastname.Text = UserDetails.LastName;
            lblState.Text = UserDetails.State;
            lblSuburb.Text = UserDetails.Suburb;
            lblCountry.Text = UserDetails.Country;
            lblAddress.Text = UserDetails.Address;
            lblEmail.Text = UserDetails.Email;
            lblDOB.Text = dob;
            lblPostalCode.Text = UserDetails.PostalCode;
            lblGender.Text = UserDetails.Gender;


            txtFirstName.Text = UserDetails.FirstName;
            txtLastName.Text = UserDetails.LastName;
            txtState.Text = UserDetails.State;
            txtSuburb.Text = UserDetails.Suburb;
            lstCountry.SelectedValue = UserDetails.Country;
            lstGender.SelectedValue = UserDetails.Gender;
            txtAddress.Text = UserDetails.Address;
            txtEmail.Text = UserDetails.Email;
            userEdateBirth.Text = dob.Substring(0, 2);
            userEyearBirth.Text = dob.Substring(7, 4);
            userEmonthBirth.SelectedValue = dob.Substring(3, 3); ;
            txtPostalCode.Text = UserDetails.PostalCode;

            //Load Profile Pic
            imgProfileNew.ImageUrl = ProfilePicUrl(USERID);
        }

        private void LoadPersonalInterest()
        {
            //Load Looking for Check box list
            DataTable dtLookingFor = userWS.GetLookingForList();
            chkLookingFor.DataSource = dtLookingFor;
            chkLookingFor.DataBind();

            //Load Interest list check box list
            DataTable dtInterestList = userWS.GetInterestList();
            chkInterest.DataSource = dtInterestList;
            chkInterest.DataBind();

            //*****************************Aaron Coding for Relationship START*************************************//
            DataTable AllRelationshipType = userWS.GetAllRelationshipType();
            RELATIONSHIP_TYPE.DataSource = AllRelationshipType;
            RELATIONSHIP_TYPE.DataBind();

            if (userWS.CheckRelationship(UserDetails.UserID).Equals("yes"))
            {
                DataTable relationshipWith = userWS.GetUserRelationshipWith(UserDetails.UserID);
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
                    if (!UserDetails.Gender.Equals(rTypeGender))
                    {
                        DataTable change = userWS.GetOppositeCategory(rTypeDescription, UserDetails.Gender);
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

                    result.Text += UserDetails.FirstName + " " + UserDetails.LastName + " ";
                    result.Text += rTypeName + " of ";
                    result.Text += rWithFirstName + " " + rWithLastName + "<br>";
                }
            }
            else
            {
                result.Text += UserDetails.FirstName + " " + UserDetails.LastName + " is not in a relationship.";
            }
            //*****************************Aaron Coding for Relationship END***************************************//

            
            SearchWS.SearchService searchWS = new SearchWS.SearchService();

            DataTable Friends = searchWS.GetFriendList(UserDetails.UserID);
            DataColumn NewColumn = new DataColumn("FriendFullName", typeof(System.String));
            Friends.Columns.Add(NewColumn);
            if (Friends.Rows.Count > 0)
            {
                for (int x = 0; x < Friends.Rows.Count; x++)
                {
                    int total = Friends.Rows.Count;
                    int FriendID = ToInt(Friends.Rows[x]["FRIEND_ID"]);

                    String UserFullName = userWS.GetUserFullname(FriendID);

                    Friends.Rows[x]["FriendFullName"] = UserFullName;
                }

                Friend_List.DataSource = Friends;
                Friend_List.DataBind();

            }
            else
            {
                RELATIONSHIP_TYPE.Visible = false;
                Friend_List.Visible = false;
                RequestButton.Visible = false;
                lblOf.Visible = false;
                lblResult.Text = "You currently do not have friend(s) to establish relationship with.";
            }

            //Load user looking for list
            DataTable dtUserLookingFor = userWS.GetUserLookingFor(UserDetails.UserID);
            lstLookingFor.DataSource = dtUserLookingFor;
            lstLookingFor.DataBind();

            //Set default checked value for looking for
            for (int i = 0; i < dtLookingFor.Rows.Count; i++)
            {
                for (int j = 0; j < dtUserLookingFor.Rows.Count; j++)
                {
                    if (ToInt(dtLookingFor.Rows[i]["LOOKING_FOR_ID"]) == ToInt(dtUserLookingFor.Rows[j]["LOOKING_FOR_ID"]))
                        chkLookingFor.Items[i].Selected = true;
                }

            }

            //load user interest list
            DataTable dtUserInterest = userWS.GetUserInterest(UserDetails.UserID);
            lstInterest.DataSource = dtUserInterest;
            lstInterest.DataBind();


            //Set default checked value for interest
            for (int i = 0; i < dtInterestList.Rows.Count; i++)
            {
                for (int j = 0; j < dtUserInterest.Rows.Count; j++)
                {
                    if (ToInt(dtInterestList.Rows[i]["HOBBY_ID"]) == ToInt(dtUserInterest.Rows[j]["HOBBY_ID"]))
                        chkInterest.Items[i].Selected = true;
                }

            }



        }

        private Boolean ValidFields()
        {

            lblGenderError.Text = "";
            lblDOBError.Text = "";
            lblEmailError.Text = "";

            int isValid = 0;


            if (lstGender.SelectedIndex == 0)
            {
                lblGenderError.Text = "Please select your gender.";
                isValid++;
            }

            if (!IsValidDate(userEdateBirth.Text.Trim() + "/" + userEmonthBirth.SelectedValue + "/" + userEyearBirth.Text.Trim()))
            {
                lblDOBError.Text = "Invalid date.";
                isValid++;
            }

          /*  if (!IsValidEmail(txtEmail.Text))
            {
                lblEmailError.Text = "Invalid email address";
                isValid++;
            }*/

            if (isValid == 0)
                return true;
            else
                return false;

        }

        protected void saveBasicInfo_Click(object sender, EventArgs e)
        {
            if (ValidFields())
            {
                _User user = new _User();
                user.UserName = UserDetails.UserName;
                user.UserID = UserDetails.UserID;
                user.Password = UserDetails.Password;
                user.FirstName = txtFirstName.Text;
                user.LastName = txtLastName.Text;
                user.PostalCode = txtPostalCode.Text;
                user.State = txtState.Text;
                user.Suburb = txtSuburb.Text;
                user.Address = txtAddress.Text;
                user.Email = txtEmail.Text;
                user.Gender = lstGender.SelectedValue;
                user.Country = lstCountry.SelectedValue;
                user.Dob = Convert.ToDateTime(userEdateBirth.Text.Trim() + "/" + userEmonthBirth.SelectedValue + "/" + userEyearBirth.Text.Trim());
                int rowAffected = userWS.UpdateUser(user);

                //Bind new data to session again
                if (rowAffected > 0)
                {
                    BindUserDetails();
                    lblUpdateBasicInformation.Text = "Update Sucessfully.";
                    LoadBasicInformation();
                }
            }

        }

        protected void saveEditInterest_Click(object sender, EventArgs e)
        {
            //Get selected list in Looking for
            ArrayList lookingForList = new ArrayList();
            for (int i = 0; i < chkLookingFor.Items.Count; i++)
            {
                if (chkLookingFor.Items[i].Selected)
                {
                    lookingForList.Add(chkLookingFor.Items[i].Value);
                }
            }
            //Update
            userWS.UpdateLookingFor(UserDetails.UserID, (Object[])lookingForList.ToArray(typeof(Object)));


            //Get selected list in Interest
            ArrayList interestList = new ArrayList();
            for (int i = 0; i < chkInterest.Items.Count; i++)
            {
                if (chkInterest.Items[i].Selected)
                {
                    interestList.Add(chkInterest.Items[i].Value);
                }
            }
            //Update
            userWS.UpdateInterest(UserDetails.UserID, (Object[])interestList.ToArray(typeof(Object)));

            LoadPersonalInterest();

            lblResult.Text = " ";
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            //set upload error msg to blank
            lblPicError.Text = "";

            // Declare variables
            string sSavePath;
            string sThumbExtension;
            int intThumbWidth;
            int intThumbHeight;

            // Set constant values
            sSavePath = "ProfilePic/";
            sThumbExtension = "_thumb";
            intThumbWidth = 160;
            intThumbHeight = 140;

            //If is empty
            if (uploadPic.PostedFile != null)
            {
                // Check file size 
                HttpPostedFile newPic = uploadPic.PostedFile;
                int nFileLen = newPic.ContentLength;
                if (nFileLen == 0)
                {
                    lblPicError.Text = "No profile picture was uploaded.";
                    return;
                }
                // Check file size exceed
                if (nFileLen > 4194304)
                {
                    lblPicError.Text = "File size exceed.";
                    return;
                }

                // Check file extension (must be JPG)
                String fileExtension = System.IO.Path.GetExtension(newPic.FileName).ToLower();
                if (fileExtension != ".jpg")
                {
                    lblPicError.Text = "The file must have an extension of JPG";
                    return;
                }

                // Read file into a data stream
                byte[] myData = new Byte[nFileLen];
                newPic.InputStream.Read(myData, 0, nFileLen);

                // Make sure a duplicate file doesn't exist.  If it does, keep on appending an 
                // incremental numeric until it is unique
                //string sFilename = System.IO.Path.GetFileName(newPic.FileName);
                //int file_append = 0;
                //while (System.IO.File.Exists(Server.MapPath(sSavePath + sFilename)))
                //{
                //    file_append++;
                //    sFilename = System.IO.Path.GetFileNameWithoutExtension(newPic.FileName)
                //                     + file_append.ToString() + fileExtension;
                //}

                string sFilename = "profilePic";

                //Create directory
                DirectoryInfo dir = new DirectoryInfo(Server.MapPath(sSavePath + "User_" + UserDetails.UserID));
                if (!dir.Exists)
                {
                    Directory.CreateDirectory(Server.MapPath(sSavePath + "User_" + UserDetails.UserID)); 
                }  

                // Save the stream to disk
                System.IO.FileStream newFile
                        = new System.IO.FileStream(dir + "/" +sFilename + fileExtension,
                                                   System.IO.FileMode.Create);
                newFile.Write(myData, 0, myData.Length);
                newFile.Close();

                // Check whether the file is really a JPEG by opening it
                System.Drawing.Image.GetThumbnailImageAbort myCallBack =
                               new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback);
               // imgProfileNew.ImageUrl = ProfilePicUrl(USERID);

                Bitmap myBitmap;
                try
                {
                    myBitmap = new Bitmap(dir + "/" + sFilename + fileExtension);

                    // If jpg file is a jpeg, create a thumbnail filename that is unique.

                    string sThumbFile = sFilename + sThumbExtension + fileExtension;

                    //file_append = 0;
                    //while (System.IO.File.Exists(Server.MapPath(sSavePath + sThumbFile)))
                    //{
                    //    file_append++;
                    //    sThumbFile = System.IO.Path.GetFileNameWithoutExtension(myFile.FileName) +
                    //                   file_append.ToString() + sThumbExtension + ".jpg";
                    //}

                    // Save thumbnail and output it onto the webpage
                    System.Drawing.Image myThumbnail
                            = myBitmap.GetThumbnailImage(intThumbWidth,
                                                         intThumbHeight, myCallBack, IntPtr.Zero);
                    myThumbnail.Save(dir + "/" + sThumbFile);

                    

                    // Displaying success information
                    lblPicError.Text = "File uploaded successfully!";
                    imgProfileNew.ImageUrl = ProfilePicUrl(USERID);
                    // Destroy objects
                    myThumbnail.Dispose();
                    myBitmap.Dispose();

                }
                catch (ArgumentException ex)
                {
                    // The file wasn't a valid jpg file
                    lblPicError.Text = "The file wasn't a valid jpg file.";
                    System.IO.File.Delete(Server.MapPath(sSavePath + sFilename));
                }

            }
            

        }


        public bool ThumbnailCallback()
        {
            return false;
        }

        protected void RequestButton_Click(object sender, EventArgs e)
        {
            String relationship = RELATIONSHIP_TYPE.Text;
            String friend = Friend_List.Text;

            String testresult = userWS.CheckDualRelationship(UserDetails.UserID, ToInt(friend), ToInt(relationship));

            if(userWS.CheckDualRelationship(UserDetails.UserID, ToInt(friend), ToInt(relationship)).Equals("no")){
                String result = userWS.RequestEstablishRelationship(UserDetails.UserID, ToInt(Friend_List.SelectedValue), ToInt(RELATIONSHIP_TYPE.SelectedValue));
                if (result.Equals("success"))
                {
                    //Email Stuffs
                    MessageWS.MessageService messageWS = new Fnet.MessageWS.MessageService();
                    String link = Request.Url.ToString();
                    link = link.Replace("UserEditProfile", "Activation");
                    String RequesterName = UserDetails.FirstName + " " + UserDetails.LastName;

                    int recieverID = ToInt(Friend_List.SelectedValue);
                    string recieverName = friend;

                    DataTable data = userWS.GetRelationshipName(ToInt(relationship));
                    String rName = data.Rows[0]["RELATION_TYPE_name"].ToString();
                    DataTable RelationNameID = userWS.GetUserRelationID(UserDetails.UserID, ToInt(recieverID), ToInt(relationship));
                    int rtID = ToInt(RelationNameID.Rows[0]["user_relation_id"]);

                    link = link + "?Type=RelationshipAccept&RelationNameID=" + rtID + "&RecieverID=" + recieverID + "";

                    String subject = "New Relationship request from " + RequesterName + " as " + rName;
                    String emailContent = Model.ClassList.EmailTemplate.RequestRelationship();
                    emailContent = emailContent.Replace("<NAME>", userWS.GetUserFullname(ToInt(friend)));
                    emailContent = emailContent.Replace("<REQUESTER>", RequesterName);
                    emailContent = emailContent.Replace("<LINK>", link);
                    emailContent = emailContent.Replace("<RELATIONSHIP>", rName);

                    messageWS.InsertMessage(USERID, recieverID, subject, emailContent);


                    //End Email Stuffs


                    lblResult.Text += "You have successfully requested for a relationship.";
                }
                else
                {
                    lblResult.Text = "Your request have failed.";
                    
                }
            }
            if(testresult.Equals("yes")){
                lblResult.Text = "Relationship already requested/exist! Please check again!";
            }
        }

    }
}
