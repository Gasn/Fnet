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
using BrisbaneConnect.GroupWS;

namespace BrisbaneConnect
{
    public partial class CreateGroup : Base
    {
        GroupService groupWs = new GroupService();
        protected void Page_Load(object sender, EventArgs e)
        {
            ddlGroupCat.DataSource = groupWs.GetCatDetails();
            ddlGroupCat.DataTextField = "CAT_NAME";
            ddlGroupCat.DataValueField = "CAT_ID";
            ddlGroupCat.DataBind();
            //ddlGroupCat.Items.Insert(0, "OTHERS");
        }

        protected void reset_Click(object sender, EventArgs e)
        {
            txtGroupName.Text = "";
            txtGroupDes.Text = "";
            cblGroupType.Items.Clear();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
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
                    grpCatID = "";
                    grpDesc = txtGroupDes.Text;
                    createdDate = DateTime.Now;
                    fileSize = txtFileSizeLimit.Text;

                    if (panelNewCat.Visible == false)
                    {
                        grpType = cblGroupType.SelectedItem.Text;
                        grpCatID = ddlGroupCat.SelectedItem.Value.ToString();
                        groupWs.CreateGroupDefaultCat(userID, grpName, grpCatID, grpDesc, grpType, createdDate, fileSize);
                        Response.Write("<script>alert('Group created successfully.');location = 'CreateGroup.aspx';</script>");
                    }
                    else if (panelNewCat.Visible == true && txtCatDesc.Text != "" && txtNewCat.Text != "")
                    {
                        grpType = cblGroupType.SelectedItem.Text;
                        String catName = txtNewCat.Text;
                        String catDesc = txtCatDesc.Text;
                        groupWs.CreateGroupNewCat(catName, catDesc, userID, grpName, grpDesc, grpType, createdDate, fileSize);
                        Response.Write("<script>alert('Group created successfully.');location = 'CreateGroup.aspx';</script>");
                    }
                }
            }
            //else if (txtGroupName.Text == "")
            //{
                //lbl
            //}
                //else
                //{
                    //Response.Write("<script>alert('Error creating group! Please try again later.');location = 'CreateGroup.aspx';</script>");
                //}
        }

        protected void ddlGroupCat_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void linkBtnNewCat_Click(object sender, EventArgs e)
        {
            panelLblNewCat.Visible = true;
            panelNewCat.Visible = true;
            ddlGroupCat.Enabled = false;
        }

        protected void linkBtnBack_Click(object sender, EventArgs e)
        {
            panelLblNewCat.Visible = false;
            panelNewCat.Visible = false;
            ddlGroupCat.Enabled = true;
        }
    }
}
