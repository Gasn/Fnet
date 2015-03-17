using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace BrisbaneConnectServices.ClassList
{
    public class Comment
    {

        private int commentID;

        public int CommentID
        {
            get { return commentID; }
            set { commentID = value; }
        }
        private string content;

        public string Content
        {
            get { return content; }
            set { content = value; }
        }
       
        private DateTime date;

        public DateTime Date
        {
            get { return date; }
            set { date = value; }
        }
        private int replyID;

        public int ReplyID
        {
            get { return replyID; }
            set { replyID = value; }
        }

        private int userID;

        public int UserID
        {
            get { return userID; }
            set { userID = value; }
        }

        #region Comment
        public Comment(int commentID, string content, DateTime date, int replyID, int userID)
        {
            this.commentID = commentID;
            this.content = content;
            this.date = date;
            this.replyID = replyID;
            this.userID = userID;
        }

        public Comment()
        {
            this.commentID = 0;
            this.content = "";
            this.date = DateTime.MinValue;
            this.replyID = 0;
            this.userID = 0;
        }
        #endregion
    }
}
