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
using System.IO;
using System.Drawing;

namespace Fnet
{
    public partial class Group : Base
    {

        GroupService groupWS = new GroupService();
        protected void Page_Load(object sender, EventArgs e)
        {
            GROUPID = Request.QueryString["GroupID"];
            if (!IsPostBack)
            {
                CheckAccessRight();
                GetGroupDetails();

                //Loads Selected Group Members
                LoadGrpMembers();
                LoadMediaFile();
            }

        }

        private void LoadGrpMembers()
        {
            DataTable dtGrpMembers = new DataTable("GrpMembers");
            dtGrpMembers = groupWS.GetGroupMembers(ToInt(GROUPID));

            if (dtGrpMembers != null && dtGrpMembers.Rows.Count <= 5)
            {
                rptGrpMembers.DataSource = dtGrpMembers;
                rptGrpMembers.DataBind();
            }
            else if (dtGrpMembers != null && dtGrpMembers.Rows.Count > 5)
            {
                rptGrpMembers.DataSource = dtGrpMembers;
                rptGrpMembers.DataBind();
            }

        }

        private void CheckAccessRight()
        {
            try
            {
                Boolean isValidMember = groupWS.GetGroupAuthorisation(ToInt(USERID), ToInt(GROUPID));

                if (isValidMember)
                {
                    UserType userType = groupWS.GetUserType(ToInt(USERID), ToInt(GROUPID));
                    GroupUserType = userType.TypeID;

                    if (userType.TypeID == Model.ClassList.UserType.gOwner)
                    {
                        pnlAdmin.Visible = true;
                        pnlEdit.Visible = true;
                    }
                }
                else
                {
                    // Access denied
                    Response.Redirect("UserGroupProfile.aspx");
                }
            }
            catch
            {
                // Direct non-member/owner of group to ONLY view group page.
                pnlMember.Visible = false;
                //Response.Redirect("Group.aspx");
            }
        }

        private void GetGroupDetails()
        {

            //// Get group details...
            Fnet.GroupWS.Group group = groupWS.GetGroupDetails(GROUPID.ToString());
            String groupCategory = groupWS.GetCatDetailsByID(group.CatID);

            lblGroupName.Text = group.GroupName;
            lblDesc.Text = group.GroupDesc;
            lblGroupType.Text = group.GroupType;
            lblCategory.Text = groupCategory;
            lblCreatedDate.Text = group.CreatedDate.ToString("dd/MMM/yyyy");
            imgGroup.ImageUrl = GroupPicUrl(group.GroupID);

            //Bind board details.

            grdBoard.DataSource = groupWS.GetBoardTopics(group.GroupID);
            grdBoard.DataBind();

            //Assign group details to current group profile
            lblCurrentGroupName.Text = group.GroupName;
            lblCurrentGroupDesc.Text = group.GroupDesc;
            imgCurrentGroup.ImageUrl = GroupPicUrl(group.GroupID);
            lblCurrentGroupCat.Text = groupCategory;
            lblCurrentCreatedDate.Text = group.CreatedDate.ToString("dd/MMM/yyyy");

            //Retrieve Group's owner name
            DataTable dtGrpOwnerName = groupWS.GetGroupOwnerDetails(group.GroupID);
            try
            {
                lblCurrentGroupOwner.Text = dtGrpOwnerName.Rows[0][0].ToString();
            }
            catch { }

            //count number of topics for the group
            lblNumOfTopic.Text = grdBoard.Rows.Count.ToString();
        }

        protected void lnkNewTopic_Click(object sender, EventArgs e)
        {
            pnlTopic.Visible = false;
            pnlNewTopic.Visible = true;
        }

        protected void btnCancelTopic_Click(object sender, EventArgs e)
        {
            pnlTopic.Visible = true;
            pnlNewTopic.Visible = false;
            txtTopicDEsc.Text = "";
            txtTopicName.Text = "";
        }

        protected void btnAddTopic_Click(object sender, EventArgs e)
        {
            int check = 0;
            check = groupWS.CreateNewGroupTopic(GROUPID.ToString(), UserDetails.UserID.ToString(), txtTopicName.Text, DateTime.Now);
            if (check == 1)
            {
                pnlTopic.Visible = true;
                pnlNewTopic.Visible = false;
                Fnet.GroupWS.Group group = groupWS.GetGroupDetails(GROUPID.ToString());
                grdBoard.DataSource = groupWS.GetBoardTopics(group.GroupID);
                grdBoard.DataBind();
            }
            else
            {
                Response.Redirect("Group.aspx");
            }
        }

        private void UploadGroupPic(String grpID)
        {
            //set upload error msg to blank
            lblPicError.Text = "";

            // Declare variables
            string sSavePath;
            string sThumbExtension;
            int intThumbWidth;
            int intThumbHeight;

            // Set constant values
            sSavePath = "GroupProfilePic/";
            sThumbExtension = "_thumb";
            intThumbWidth = 160;
            intThumbHeight = 140;

            //If is empty
            if (uploadPic.PostedFile != null)
            {
                // Check file size 
                HttpPostedFile newPic = uploadPic.PostedFile;
                int nFileLen = newPic.ContentLength;
                //if (nFileLen == 0)
                //{
                //    lblPicError.Text = "No profile picture was uploaded.";
                //    return;
                //}
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

                string sFilename = "GroupProfilePic";

                //Create directory
                DirectoryInfo dir = new DirectoryInfo(Server.MapPath(sSavePath + "Group_" + grpID));
                if (!dir.Exists)
                {
                    Directory.CreateDirectory(Server.MapPath(sSavePath + "Group_" + grpID));
                }

                // Save the stream to disk
                System.IO.FileStream newFile
                        = new System.IO.FileStream(dir + "/" + sFilename + fileExtension,
                                                   System.IO.FileMode.Create);
                newFile.Write(myData, 0, myData.Length);
                newFile.Close();

                // Check whether the file is really a JPEG by opening it
                System.Drawing.Image.GetThumbnailImageAbort myCallBack =
                               new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback);

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

                    //imgProfileNew.ImageUrl = ProfilePicUrl();

                    // Displaying success information
                    lblPicError.Text = "File uploaded successfully!";

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

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            groupWS.updateGroupDetails(GROUPID.ToString(), txtAdminEditGroupName.Text, txtAdminEditGroupDesc.Text);
            UploadGroupPic(GROUPID.ToString());
            GetGroupDetails();
        }

        protected void editGroupProfile_Click(object sender, EventArgs e)
        {
            pnlAdminEditGroupInfo.Visible = true;
        }

        //Counter for displaying groupmembers orderly in a repeater.
        private int counter1 = 0;
        protected string GetTR()
        {
            if (counter1 % 5 == 0 && counter1 != 0)
            {
                counter1++;
                return "<TR>";
            }
            else
            {
                counter1++;
                return "";
            }
        }

        protected void grdBoard_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            if (index >= 0)
            {
                BOARDID = grdBoard.DataKeys[index].Value.ToString();
                Response.Redirect("ViewDiscussionBoard.aspx");
            }
        }

        protected void btnSearchInvite_Click(object sender, EventArgs e)
        {
            LoadInviteList();
        }

        private void LoadInviteList()
        {
            lblGroupName.Text = groupWS.GetGroupDetails(GROUPID).GroupName;
            String input = txtInvite.Text.Trim();
            DataTable dt = groupWS.GetNonMemberByName(input, ToInt(GROUPID));
            if (dt == null || dt.Rows.Count == 0)
            {
                lblInviteMessage.Text = "No user found.";
                grdInvite.DataSource = null;
                grdInvite.DataBind();
            }
            else
            {
                lblInviteMessage.Text = "";
                grdInvite.DataSource = dt;
                grdInvite.DataBind();
            }
        }

        protected void sendInvitation_Click(object sender, EventArgs e)
        {
            
            DataTable dtInvite = (DataTable)Session["InviteUserList"];

            if (dtInvite != null && dtInvite.Rows.Count > 0)
            {

                MessageWS.MessageService messageWS = new Fnet.MessageWS.MessageService();
                String link = Request.Url.ToString();
                
                string groupName = groupWS.GetGroupDetails(GROUPID).GroupName;
                String subject = "Invitation to group " + groupName;
                String emailContent = "";

                for (int i = 0; i < dtInvite.Rows.Count; i++)
                {

                    int recieverID = ToInt(dtInvite.Rows[i]["USER_ID"]);
                    string recieverName = dtInvite.Rows[i]["NAME"].ToString();

                    
                    UserType  type = groupWS.GetUserType(USERID, ToInt(GROUPID));

                    if (type.TypeID == 4)
                    {
                        emailContent = Model.ClassList.EmailTemplate.InvitationToGroupFromAdmin();
                    }
                    else
                    {
                        link = link.Replace("Group.aspx", "Activation.aspx");
                        link = link + "&Type=GROUPINVITE&RecieverID=" + recieverID + "";
                        emailContent = Model.ClassList.EmailTemplate.InvitationToGroupFromAdmin();
                    }
                    emailContent = emailContent.Replace("<LINK>", link);
                    emailContent = emailContent.Replace("<GROUP>", groupName);
                    emailContent = emailContent.Replace("<NAME>", recieverName);

                    messageWS.InsertMessage(USERID, recieverID, subject, emailContent);



                }
                Session["InviteUserList"] = null;

                lblSentMessage.Text = "Invitation had been sent to selected user(s).";
                imgSent.Visible = true;
                imgSent.ImageUrl = "Images/tick.png";

                grdInvite.DataSource = null;
                grdInvite.DataBind();
                rptReciever.DataSource = null;
                rptReciever.DataBind();
            }
            else
            {
                lblSentMessage.Text = "No user is selected. No message is sent.";
                imgSent.Visible = true;
                imgSent.ImageUrl = "Images/delete.png";

            }
        }

        protected void grdInvite_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            int newUserID = ToInt(grdInvite.DataKeys[index]["USER_ID"].ToString());
            String userName = grdInvite.DataKeys[index]["NAME"].ToString();
            rptReciever.DataSource = CreateInviteDataSource(userName, newUserID);
            rptReciever.DataBind();
           // DataTable dtOwners = groupWS.UserGroupOwner(USERID);
           // groupWS.InsertGroupMember(ToInt(GROUPID), USERID, newUserID);
           // LoadInviteList();
        }


        private DataTable CreateInviteDataSource(String userName, int userID)
        {

            if (Session["InviteUserList"] == null)
            {
                DataTable dt = new DataTable("InviteList");
                dt.Columns.Add("USER_ID", Type.GetType("System.Int32"));
                dt.Columns.Add("NAME", Type.GetType("System.String"));
                Session["InviteUserList"] = dt;
            }

            DataTable dtInvite = (DataTable)Session["InviteUserList"];

            DataRow dr = dtInvite.NewRow();
            dr[0] = userID;
            dr[1] = userName;
            dtInvite.Rows.Add(dr);

            return dtInvite;
        }

        private int counter = 0;
        protected string GetInviteTR()
        {
            if (counter % 3 == 0 && counter1 != 0)
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

        protected void rptReciever_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            DataTable dtInvite = (DataTable)Session["InviteUserList"];
            dtInvite.Rows[index].Delete();

            rptReciever.DataSource = dtInvite;
            rptReciever.DataBind();

        }

        protected void rptReciever_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            ImageButton img = ((ImageButton)e.Item.FindControl("imgBtn"));// you should check the location of your imagebutton
            img.CommandArgument = e.Item.ItemIndex.ToString();
        }




        protected void btnUpload_Click(object sender, EventArgs e)
        {
            //set upload error msg to blank
            lblUploadError.Text = "";

            // Declare variables
            string sSavePath;
            string sFilename = "";
            // Set constant values
            sSavePath = "GroupMedia/";

            try
            {

                //If is empty
                if (uploadFile.PostedFile != null)
                {
                    // Check file size 
                    HttpPostedFile newFile = uploadFile.PostedFile;
                    int nFileLen = newFile.ContentLength;
                    if (nFileLen == 0)
                    {
                        lblUploadError.Text = "No file was uploaded.";
                        return;
                    }
                    // Check file size exceed
                    if (nFileLen > 10485760)
                    {
                        lblUploadError.Text = "File size exceed.";
                        return;
                    }

                    //Create directory
                    DirectoryInfo dir = new DirectoryInfo(Server.MapPath(sSavePath + "Group_" + GROUPID));
                    if (!dir.Exists)
                    {
                        Directory.CreateDirectory(Server.MapPath(sSavePath + "Group_" + GROUPID));
                    }
                    sSavePath = sSavePath + "Group_" + GROUPID;
                    // get file extension and file name
                    sFilename = System.IO.Path.GetFileName(newFile.FileName);
                    String fileExtension = System.IO.Path.GetExtension(newFile.FileName).ToLower();

                    // Read file into a data stream
                    byte[] myData = new Byte[nFileLen];
                    newFile.InputStream.Read(myData, 0, nFileLen);

                    // Make sure a duplicate file doesn't exist.  If it does, keep on appending an 
                    // incremental numeric until it is unique

                    int file_append = 0;
                    while (System.IO.File.Exists(Server.MapPath(sSavePath + "/" + sFilename)))
                    {
                        file_append++;
                        sFilename = System.IO.Path.GetFileNameWithoutExtension(newFile.FileName)
                                         + file_append.ToString() + fileExtension;
                    }

                    // Save the stream to disk
                    System.IO.FileStream file
                            = new System.IO.FileStream(dir + "/" + sFilename,
                                                       System.IO.FileMode.Create);
                    file.Write(myData, 0, myData.Length);
                    file.Close();
                }

                LoadMediaFile();

            }
            catch (ArgumentException ex)
            {
                // The file wasn't a valid jpg file
                lblUploadError.Text = "The file wasn't upload.";
                System.IO.File.Delete(Server.MapPath(sSavePath + sFilename));
            }


        }

        private void LoadMediaFile()
        {
            String sSavePath = "GroupMedia/";
            DataTable files = new DataTable();
            files.Columns.Add("FileName", typeof(string));
            files.Columns.Add("FilePath", typeof(string));
            files.Columns.Add("UploadDate", typeof(DateTime));
            files.Columns.Add("FileSize", typeof(long));

            //Current directory
            try
            {
                string dir = Server.MapPath(sSavePath + "Group_" + GROUPID);
                foreach (string file in Directory.GetFiles(dir))
                {
                    DataRow row = files.NewRow();

                    String fileName = System.IO.Path.GetFileName(file);
                    FileStream sourceFile = new FileStream(file, FileMode.Open);

                    row["FileName"] = fileName;
                    row["FilePath"] = file;
                    row["UploadDate"] = File.GetCreationTime(file);
                    row["FileSize"] = sourceFile.Length;
                    files.Rows.Add(row);
                }

                grdFile.DataSource = files;
                grdFile.DataBind();

            }
            catch (Exception)
            {
               
            }

        }

        protected void grdFile_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = ToInt(e.CommandArgument);

            string fileName = grdFile.DataKeys[index]["FILENAME"].ToString();
            string filePath = grdFile.DataKeys[index]["FILEPATH"].ToString();
           
            FileStream sourceFile = new FileStream(filePath, FileMode.Open);
            long FileSize; FileSize = sourceFile.Length;
            byte[] getContent = new byte[(int)FileSize]; 
            sourceFile.Read(getContent, 0, (int)sourceFile.Length); sourceFile.Close();
            Response.ContentType = sourceFile.ToString();
            Response.AddHeader("content-disposition", "attachment;filename=" + fileName + ""); 
            Response.BinaryWrite(getContent);

        }


    }
}
