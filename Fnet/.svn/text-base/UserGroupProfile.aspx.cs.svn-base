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
    public partial class UserGroupProfile : Base
    {
        GroupService groupWs = new GroupService();
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                lblUserName.Text = UserDetails.FirstName + " " + UserDetails.LastName;
                imgProfile.ImageUrl = ProfilePicUrl(USERID);
                //For group owner tab
                LoadUserGrpOwner();

                //For group member tab
                LoadUserGrpMember();

                //For Create Group Tab
                ddlGroupCat.DataSource = groupWs.GetCatDetails();
                ddlGroupCat.DataTextField = "CAT_NAME";
                ddlGroupCat.DataValueField = "CAT_ID";
                ddlGroupCat.DataBind();
            }
        }

        protected void reset_Click(object sender, EventArgs e)
        {
            txtGroupName.Text = "";
            txtGroupDes.Text = "";
            cblGroupType.Items.Clear();
        }

        private void LoadUserGrpOwner()
        {
            DataTable dtUserGrpOwner = new DataTable("UserGrpOwner");
            dtUserGrpOwner = groupWs.UserGroupOwner(UserDetails.UserID.ToString());

            if (dtUserGrpOwner != null)
            {
                rptUserGrpOwner.DataSource = dtUserGrpOwner;
                rptUserGrpOwner.DataBind();
            }

        }

        private void LoadUserGrpMember()
        {
            DataTable dtUserGrpMember = new DataTable("UserGrpMember");

            dtUserGrpMember = groupWs.UserGroupMember(UserDetails.UserID.ToString());

            if (dtUserGrpMember != null)
            {
                rptUserGrpMember.DataSource = dtUserGrpMember;
                //rptUserGrpMember.DataMember = dtUserGrpMember.Columns["GROUPS.GROUP_ID"].ToString();
                rptUserGrpMember.DataBind();
            }

        }

        protected void lnkButtonLeave_Command(Object sender, CommandEventArgs e)
        {
            displayConfirmPanel();

            String grpID = e.CommandArgument.ToString();
            GROUPID = grpID;
            submitType.Value = "leave";

        }

        private void displayConfirmPanel()
        {
            panelCreateGrp.Visible = false;
            panelGrpMember.Visible = false;
            panelGrpOwner.Visible = false;
            panelGrpPicUpload.Visible = false;
            panelConfirmation.Visible = true;
        }

        private void resetMemberPanel()
        {
            panelCreateGrp.Visible = false;
            panelGrpMember.Visible = true;
            panelGrpOwner.Visible = false;
            panelGrpPicUpload.Visible = false;
            panelConfirmation.Visible = false;
            LoadUserGrpMember();
            Response.Redirect("UserGroupProfile.aspx#memberOf");
        }

        private void resetOwnerPanel()
        {
            panelCreateGrp.Visible = false;
            panelGrpMember.Visible = false;
            panelGrpOwner.Visible = true;
            panelGrpPicUpload.Visible = false;
            panelConfirmation.Visible = false;
            LoadUserGrpOwner();
            Response.Redirect("UserGroupProfile.aspx#ownerOf");
        }

        private void resetCreatePanel()
        {
            panelCreateGrp.Visible = true;
            panelGrpMember.Visible = false;
            panelGrpOwner.Visible = false;
            panelGrpPicUpload.Visible = false;
            panelConfirmation.Visible = false;
            Response.Redirect("UserGroupProfile.aspx#createNewGroup");
        }

        protected void lnkButtonDelete_Command(Object sender, CommandEventArgs e)
        {
            displayConfirmPanel();
            String grpID = e.CommandArgument.ToString();
            GROUPID = grpID;
            submitType.Value = "delete";
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            switch (submitType.Value)
            {
                case "leave":

                    groupWs.deleteUserFromGroup(UserDetails.UserID.ToString(), GROUPID);
                    resetMemberPanel();
                    
                    break;

                case "delete":

                    groupWs.deleteGroup(GROUPID);
                    resetOwnerPanel();
                    
                    break;

                case "create":

                    createOwnerGroup();

                    break;
            }
        }

        private void createOwnerGroup()
        {
            String userID, grpName, grpCatID, grpDesc, grpType, fileSize;
            grpType = "";
            DateTime createdDate;

            for (int i = 0; i < cblGroupType.Items.Count; i++)
            {
                if (!cblGroupType.Items[i].Selected)
                {
                    lblPublishTypeCheck.Text = "Please select a publish type.";
                }

                else
                {
                    userID = UserDetails.UserID.ToString();
                    grpName = txtGroupName.Text;
                    
                    grpDesc = txtGroupDes.Text;
                    createdDate = DateTime.Now;
                    fileSize = txtFileSizeLimit.Text;

                    if (ddlGroupCat.Enabled == true)
                    {
                        grpType = cblGroupType.SelectedItem.Text;
                        grpCatID = ddlGroupCat.SelectedItem.Value.ToString();
                        GROUPID = groupWs.CreateGroupDefaultCat(userID, grpName, grpCatID, grpDesc, grpType, createdDate, fileSize);
                        panelGrpMember.Visible = false;
                        panelGrpOwner.Visible = false;
                        panelCreateGrp.Visible = false;
                        panelGrpPicUpload.Visible = true;
                        panelConfirmation.Visible = false;
                        //Response.Write("<script>alert('Group created successfully.');location = 'GroupUserProfile.aspx';</script>");
                    }
                    else
                    {
                        grpType = cblGroupType.SelectedItem.Text;
                        String catName = txtNewCat.Text;
                        String catDesc = txtCatDesc.Text;
                        GROUPID = groupWs.CreateGroupNewCat(catName, catDesc, userID, grpName, grpDesc, grpType, createdDate, fileSize);
                        panelGrpMember.Visible = false;
                        panelGrpOwner.Visible = false;
                        panelCreateGrp.Visible = false;
                        panelGrpPicUpload.Visible = true;
                        panelConfirmation.Visible = false;
                        //Response.Write("<script>alert('Group created successfully.');location = 'GroupUserProfile.aspx';</script>");
                    }
                }

            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            panelGrpMember.Visible = false;
            panelGrpOwner.Visible = true;
            panelCreateGrp.Visible = true;
            panelConfirmation.Visible = false;
            Response.Redirect("UserGroupProfile.aspx#createNewGroup");

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            displayConfirmPanel();
            submitType.Value = "create";
        }

        protected void linkBtnNewCat_Click(object sender, EventArgs e)
        {
            panelCreateGrp.Visible = true;
            panelGrpMember.Visible = false;
            panelGrpOwner.Visible = false;
            panelGrpPicUpload.Visible = false;
            panelConfirmation.Visible = false;
            ddlGroupCat.Enabled = false;
            panelLblNewCat.Visible = true;
            panelNewCat.Visible = true;
        }

        protected void linkBtnBack_Click(object sender, EventArgs e)
        {
            panelCreateGrp.Visible = true;
            panelGrpMember.Visible = false;
            panelGrpOwner.Visible = false;
            panelGrpPicUpload.Visible = false;
            panelConfirmation.Visible = false;
            panelLblNewCat.Visible = false;
            panelNewCat.Visible = false;
            ddlGroupCat.Enabled = true;
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            UploadGroupPic(GROUPID.ToString());
            resetOwnerPanel();
        }

        public bool ThumbnailCallback()
        {
            return false;
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

    }
}
