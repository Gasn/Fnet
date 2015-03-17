using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using MessageService.DBOperationWS;
using Model.ClassList;
namespace MessageService
{
    /// <summary>
    /// Summary description for MessageService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/", Name = "Message Service")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class MessageService : System.Web.Services.WebService
    {
        DBServices dbContext = new DBServices();

        //Aaron created methods...//

        [WebMethod]
        public DataTable CheckUnreadMessage(int UserID)
        {
            DataTable dt = new DataTable("Table");
            String strSQL = "SELECT * FROM message_box WHERE RECEIVER_ID = " + UserID + " AND READ = '1' ORDER BY to_char(message_date, 'MONTH DD, YYYY, HH24:MI:SS') DESC";
            dt = dbContext.GetResultWithQuery(strSQL);
            return dt;
        }
        [WebMethod]
        public DataTable CheckAllMessage(int UserID)
        {
            DataTable dt = new DataTable("Table");
            String strSQL = "SELECT * FROM message_box WHERE RECEIVER_ID = "+UserID+" ORDER BY to_char(message_date, 'MONTH DD, YYYY, HH24:MI:SS') DESC";
            dt = dbContext.GetResultWithQuery(strSQL);
            return dt;
        }

        [WebMethod]
        public int InsertMessage(int userID, int receiverID, String subject, String message)
        {
            int result = 0;
            String strSQL = "INSERT INTO message_box(sender_id, receiver_id, content, message_date, [read], subject) VALUES (" + userID + ", " + receiverID + ", '" + message + "', convert(datetime,getdate(),103), 1, '"+subject+"')";
            result = dbContext.InsertWithQuery(strSQL);
            return result;
        }

        //End of Aaron created methods...//

        [WebMethod]
        public void InsertComment(Comment comment)
        {
            String date = DateTime.Now.ToString();
            dbContext.InsertWithArray("COMMENTS", new string[] { "CONTENT", "USER_ID", "COMMENT_DATE", "REPLY_ID", "COMMENT_ON_USER" },
                new string[] { comment.Content, comment.UserID.ToString(), date , comment.ReplyID.ToString(), comment.CommetOnUserID.ToString() });
        }

        [WebMethod]
        public void deleteReplyComment(int comment_id)
        {
            string sql = "Delete from comments where comment_id= " + comment_id;
            dbContext.DeleteWithQuery(sql);
            //dbContext.InsertWithArray("COMMENTS", new string[] { "CONTENT", "USER_ID", "COMMENT_DATE", "REPLY_ID", "COMMENT_ON_USER" },
             //   new string[] { comment.Content, comment.UserID.ToString(), date, comment.ReplyID.ToString(), comment.CommetOnUserID.ToString() });
        }
        [WebMethod]
        public void deleteComment(int comment_id)
        {
            string sql = "Delete from comments where comment_id=" + comment_id+" or reply_id="+comment_id;
            dbContext.DeleteWithQuery(sql);
            //dbContext.InsertWithArray("COMMENTS", new string[] { "CONTENT", "USER_ID", "COMMENT_DATE", "REPLY_ID", "COMMENT_ON_USER" },
            //   new string[] { comment.Content, comment.UserID.ToString(), date, comment.ReplyID.ToString(), comment.CommetOnUserID.ToString() });
        }

        [WebMethod]
        public DataTable GetMainCommentByID(int userID)
        {
            DataTable dt = new DataTable("Table");
            String strSQL = "Select  C.*,U.FIRST_NAME, U.LAST_NAME from COMMENTS C, USERS U WHERE C.USER_ID = U.USER_ID AND COMMENT_ON_USER  = " + userID + " AND REPLY_ID = 0 ORDER BY COMMENT_ID DESC";
            dt = dbContext.GetResultWithQuery(strSQL);
            return dt;
        }

        [WebMethod]
        public DataTable GetResponseCommentByID(int commentID)
        {
            DataTable dt = new DataTable("Table");
            String strSQL = "Select C.*, U.FIRST_NAME, U.LAST_NAME, U.EMAIL from COMMENTS C, USERS U WHERE C.USER_ID = U.USER_ID AND REPLY_ID = " + commentID + "  ORDER BY COMMENT_ID ";
            dt = dbContext.GetResultWithQuery(strSQL);
            return dt;
        }

        [WebMethod]
        public DataTable GetMessageByUserID(int userID)
        {
            DataTable dt = new DataTable("Table");
            String strSQL = "SELECT M.Message_ID, M.Sender_ID, M.Receiver_ID, M.[Content], M.Message_Date, M.[Read], M.Subject, U.First_Name, U.Last_Name AS NAME FROM Message_Box AS M INNER JOIN Users AS U ON M.Sender_ID = U.User_Id WHERE (M.Receiver_ID = " + userID + ")";
            dt = dbContext.GetResultWithQuery(strSQL);
            return dt;
        }

        [WebMethod]
        public DataTable GetTopUnreadByUserID(int userID)
        {
            DataTable dt = new DataTable("Table");
            String strSQL = "SELECT * FROM( SELECT M.*, U.FIRST_NAME, U.LAST_NAME AS NAME  FROM MESSAGE_BOX AS M INNER JOIN USERS AS U ON U.USER_ID = M.SENDER_ID WHERE M.RECEIVER_ID = " + userID + " order by M.READ DESC, M.MESSAGE_ID DESC) WHERE ROWNUM < 4  ";
            dt = dbContext.GetResultWithQuery(strSQL);
            return dt;
        }

        [WebMethod]
        public int GetUnreadMessageCount(int userID)
        {
            DataTable dt = new DataTable("Table");
            String strSQL = "SELECT * FROM MESSAGE_BOX WHERE [READ]= 1 AND RECEIVER_ID = " + userID + " order by MESSAGE_ID  DESC";
            dt = dbContext.GetResultWithQuery(strSQL);
            return dt.Rows.Count;
        }

        [WebMethod]
        public void UpdateReadMessage(int messageID)
        {
         
            String strSQL = "UPDATE MESSAGE_BOX SET [READ]=0 WHERE MESSAGE_ID = " + messageID;
            dbContext.UpdateWithQuery(strSQL);
         
        }

        [WebMethod]
        public void DeleteMessage(int messageID)
        {

            String strSQL = "DELETE FROM MESSAGE_BOX WHERE MESSAGE_ID = " + messageID;
            dbContext.DeleteWithQuery(strSQL);

        }
    }
}
