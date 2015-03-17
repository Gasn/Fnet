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
    public partial class ViewDiscussionBoard : Base
    {
        GroupService groupWS = new GroupService();
        String userGroupTypeID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //LoadData();
            if (!Page.IsPostBack)
            {  
                LoadData();

                lblInsertError.Text = groupWS.GetUserTypeID(GROUPID);

                lblDiscussionTopic.Text = groupWS.GetGroupDetails(GROUPID).GroupName;
                if (UserDetails.UserTypeID != 3)
                {

                }
            }
        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int insertStatus = 0;
            insertStatus = groupWS.InsertBoardContent(ToInt(BOARDID), UserDetails.UserID, txtComment.Text, DateTime.Now);
            if (insertStatus == 1)
            {
                Response.Redirect("ViewDiscussionBoard.aspx");
            }
            else
            {
                lblInsertError.Text = "Error inserting comment! Please try again.";
            }
        }

        protected void lnkButtonDelete_Command(Object sender, CommandEventArgs e)
        {
            int deleteStatus = 0;
            String boardContentID = e.CommandArgument.ToString();
            deleteStatus = groupWS.DeleteBoardContent(boardContentID);
            if (deleteStatus == 1)
            {
                Response.Redirect("ViewDiscussionBoard.aspx");
            }
            else
            {
                lblInsertError.Text = "Error deleting post! Please try again.";
            }
        }

        protected void lnkBtnEdit_Command(Object sender, CommandEventArgs e)
        {
            String boardContentID = e.CommandArgument.ToString();
            Session["boardContentID"] = boardContentID;
            DataTable dt = groupWS.RetrieveBoardContent(boardContentID);
            if (dt != null)
            {
                //Response.Redirect("ViewDiscussionBoard.aspx");
                txtComment.Text = dt.Rows[0][0].ToString();
                btnEdit.Visible = true;
                btnAdd.Visible = false;
            }
            else
            {
                lblInsertError.Text = "Error editing post! Please try again.";
            }
        }

        #region Paging for Repeater
        public int PageNumber
        {
            get
            {
                if (ViewState["PageNumber"] != null)
                    return Convert.ToInt32(ViewState["PageNumber"]);
                else
                    return 0;
            }
            set
            {
                ViewState["PageNumber"] = value;
            }
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            rptPages.ItemCommand +=
               new RepeaterCommandEventHandler(rptPages_ItemCommand);
        }

        private void LoadData()
        {
            DataTable dt = groupWS.GetDiscussionBoardContent(BOARDID);
            PagedDataSource pgitems = new PagedDataSource();
            DataView dv = new DataView(dt);
            pgitems.DataSource = dv;
            pgitems.AllowPaging = true;
            pgitems.PageSize = 10;
            pgitems.CurrentPageIndex = PageNumber;
            if (pgitems.PageCount >= 1)
            {
                rptPages.Visible = true;
                ArrayList pages = new ArrayList();
                for (int i = 0; i < pgitems.PageCount; i++)
                    pages.Add((i + 1).ToString());
                rptPages.DataSource = pages;
                rptPages.DataBind();
                rptdiscussionBoard.DataSource = pgitems;
                rptdiscussionBoard.DataBind();
                
            }
            else
            {
                rptPages.Visible = false;
            }
        }
        void rptPages_ItemCommand(Object Sender, RepeaterCommandEventArgs e)
        {
            PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
            LoadData();
        }

        #endregion

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            int check = 0;
            check = groupWS.UpdateBoardContent(Session["boardContentID"].ToString(), txtComment.Text);
            if (check == 1)
            {
                btnAdd.Visible = true;
                btnEdit.Visible = false;
                Response.Redirect("ViewDiscussionBoard.aspx");
            }
            else
            {
                lblInsertError.Text = "Error editing post.";
            }
        }

        protected void lnkBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Group.aspx?GroupID=" + GROUPID);
        }
    }
}
