using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.IO;
using System.Drawing;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace Fnet
{
    public partial class UserPhoto : Base
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblUserName.Text = UserDetails.FirstName + " " + UserDetails.LastName;
                imgProfile.ImageUrl = ProfilePicUrl(USERID);
                LoadPhoto();
            }
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
            sSavePath = "User_Photo/";
            sThumbExtension = "_thumb";
            intThumbWidth = 50;
            intThumbHeight = 50;

            //If is empty
            if (uploadPic.PostedFile != null)
            {
                // Check file size 
                HttpPostedFile myFile = uploadPic.PostedFile;
                int nFileLen = myFile.ContentLength;
                if (nFileLen == 0)
                {
                    lblPicError.Text = "No file was uploaded.";
                    return;
                }

                // Check file extension (must be JPG)

                if (System.IO.Path.GetExtension(myFile.FileName).ToLower() != ".jpg")
                {
                    lblPicError.Text = "The file must have an extension of JPG";
                    return;
                }

                // Read file into a data stream

                byte[] myData = new Byte[nFileLen];
                myFile.InputStream.Read(myData, 0, nFileLen);

                // Make sure a duplicate file doesn�t exist.  If it does, keep on appending an 

                // incremental numeric until it is unique

                string sFilename = System.IO.Path.GetFileName(myFile.FileName);
                int file_append = 0;
                while (System.IO.File.Exists(Server.MapPath(sSavePath + sFilename)))
                {
                    file_append++;
                    sFilename = System.IO.Path.GetFileNameWithoutExtension(myFile.FileName)
                                     + file_append.ToString() + ".jpg";
                }

                //Create directory
                DirectoryInfo dir = new DirectoryInfo(Server.MapPath(sSavePath + "User_" + UserDetails.UserID));
                if (!dir.Exists)
                {
                    Directory.CreateDirectory(Server.MapPath(sSavePath + "User_" + UserDetails.UserID));
                }

                // Save the stream to disk

                System.IO.FileStream newFile
                        = new System.IO.FileStream(Server.MapPath(sSavePath + "User_" + UserDetails.UserID + "/" + sFilename),
                                                   System.IO.FileMode.Create);
                newFile.Write(myData, 0, myData.Length);
                newFile.Close();

                // Check whether the file is really a JPEG by opening it

                System.Drawing.Image.GetThumbnailImageAbort myCallBack =
                               new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback);
                Bitmap myBitmap;
                try
                {
                    myBitmap = new Bitmap(dir + "/" + sFilename);

                    // If jpg file is a jpeg, create a thumbnail filename that is unique.

                    file_append = 0;
                    string sThumbFile = System.IO.Path.GetFileNameWithoutExtension(myFile.FileName)
                                                             + sThumbExtension + ".jpg";
                    while (System.IO.File.Exists(Server.MapPath(sSavePath + sThumbFile)))
                    {
                        file_append++;
                        sThumbFile = System.IO.Path.GetFileNameWithoutExtension(myFile.FileName) +
                                       file_append.ToString() + sThumbExtension + ".jpg";
                    }

                    // Save thumbnail and output it onto the webpage

                    System.Drawing.Image myThumbnail
                            = myBitmap.GetThumbnailImage(intThumbWidth,
                                                         intThumbHeight, myCallBack, IntPtr.Zero);
                    myThumbnail.Save(dir + "/" + sThumbFile);


                    // Displaying success information

                    lblPicError.Text = "File uploaded successfully!";

                    // Destroy objects

                    myThumbnail.Dispose();
                    myBitmap.Dispose();
                    Response.Redirect("UserPhoto.aspx");

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


        private void LoadPhoto()
        {
            String sSavePath = "User_Photo/";
            DataTable files = new DataTable();
            files.Columns.Add("FileName", typeof(string));
            files.Columns.Add("FileThumb", typeof(string));


            //Current directory
            try
            {
                string dir = Server.MapPath(sSavePath + "USER_" + USERID);
                foreach (string file in Directory.GetFiles(dir))
                {


                    String fileName = System.IO.Path.GetFileNameWithoutExtension(file);
                    FileStream sourceFile = new FileStream(file, FileMode.Open);

                    if (!fileName.Contains("_thumb"))
                    {
                        DataRow row = files.NewRow();
                        row["FileName"] = "User_Photo/User_" + USERID + "/" + fileName + ".jpg";
                        row["FileThumb"] = "User_Photo/User_" + USERID + "/" + fileName + "_thumb.jpg";
                        files.Rows.Add(row);
                    }


                }

                rptPhoto.DataSource = files;
                rptPhoto.DataBind();

            }
            catch (Exception)
            {

            }

        }
    }
}