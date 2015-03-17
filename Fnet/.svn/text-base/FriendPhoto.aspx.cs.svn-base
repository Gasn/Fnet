using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

namespace Fnet
{
    public partial class FriendPhoto : Base
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPhoto();
            }
        }


        private void LoadPhoto()
        {
            String sSavePath = "User_Photo/";
            DataTable files = new DataTable();
            files.Columns.Add("FileName", typeof(string));
            files.Columns.Add("FileThumb", typeof(string));

            int counter = 0;
            //Current directory
            try
            {

                string dir = Server.MapPath(sSavePath + "USER_" + FRIENDID);
                foreach (string file in Directory.GetFiles(dir))
                {


                    String fileName = System.IO.Path.GetFileNameWithoutExtension(file);
                    FileStream sourceFile = new FileStream(file, FileMode.Open);

                    if (!fileName.Contains("_thumb"))
                    {
                        counter++;
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

            if (counter == 0)
            {
                pnlPic.Visible = false;

            }

        }
    }
}
