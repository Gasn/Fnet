using System;
using System.Data;
using System.Configuration;

namespace Model.ClassList
{
    public class Comment
    {

        private int commentID;
        private string content;
        private string date;
        private string create_date;
        private int userID;
        private int replyID;
        private int commentOnUserID;

        public int CommentID
        {
            get { return commentID; }
            set { commentID = value; }
        }
       

        public string Content
        {
            get { return content; }
            set { content = value; }
        } 
      

        public string Date
        {
            get { return date; }
            set { date = value; }
        }
        public string Create_date
        {
            get { return create_date; }
            set { create_date = value; }
        }
        public void setdate(string d) 
        {
            create_date = d;
        }
        public string getdate()
        {
            return create_date;
        }
        public int ReplyID
        {
            get { return replyID; }
            set { replyID = value; }
        }
       

        public int UserID
        {
            get { return userID; }
            set { userID = value; }
        }

        public int CommetOnUserID
        {
            get { return commentOnUserID; }
            set { commentOnUserID = value; }
        }

        #region Comment
        public Comment(int commentID, string content, string date, int replyID, int userID, int commetOnUserID)
        {
            this.commentID = commentID;
            this.content = content;
            this.date = date;
            this.replyID = replyID;
            this.userID = userID;
            this.commentOnUserID = commetOnUserID;
        }

        public Comment()
        {
            this.commentID = 0;
            this.content = "";
            this.date = "";
            this.create_date = "";
            this.replyID = 0;
            this.userID = 0;
            this.commentOnUserID = 0;
        }
        #endregion
    }
}
