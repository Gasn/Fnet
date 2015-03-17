using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using SearchService.DBOperationWS;
using Model.ClassList;
namespace SearchService
{
    /// <summary>
    /// Summary description for SearchService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/", Name = "Search Service")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class SearchService : System.Web.Services.WebService
    {
        DBServices dbContext = new DBServices();
        [WebMethod]
        public DataTable GetUsersByEmail(String email)
        {
            DataTable dt = new DataTable("Table");
            dt = dbContext.GetResultParameters("USERS", new string[] { "Email" }, new string[] { email.Trim() });

            return dt;

        }


        [WebMethod]
        public DataTable GetUsersByName(String name)
        {
            string strSQL = "SELECT * FROM USERS WHERE LOWER(FIRST_NAME) LIKE '%" + name.ToLower() + "%' OR LOWER(LAST_NAME) LIKE '%" + name.ToLower() + "%' ORDER BY FIRST_NAME";
            DataTable dt = new DataTable("Table");
            dt = dbContext.GetResultWithQuery(strSQL);

            return dt;

        }

        [WebMethod]
        public DataTable GetGroupByCategory(String category)
        {
            string strSQL = "SELECT C.CAT_NAME, CAT_DESC, G.* FROM CATEGORY C, GROUPS G WHERE  C.CAT_ID = G.CAT_ID AND LOWER(C.CAT_NAME) LIKE '%" + category.ToLower() + "%' ORDER BY  C.CAT_NAME";
            DataTable dt = new DataTable("Table");
            dt = dbContext.GetResultWithQuery(strSQL);

            return dt;

        }

        [WebMethod]
        public DataTable GetGroupByName(String name)
        {
            string strSQL = "SELECT C.CAT_NAME, CAT_DESC, G.* FROM CATEGORY C, GROUPS G WHERE  C.CAT_ID = G.CAT_ID AND LOWER(G.GROUP_NAME) LIKE '%" + name.ToLower() + "%' ORDER BY  C.CAT_NAME";
            DataTable dt = new DataTable("Table");
            dt = dbContext.GetResultWithQuery(strSQL);

            return dt;

        }


        [WebMethod]
        public DataTable GetFriendList(int userID)
        {
            DataTable dt = new DataTable("Table");
            string strSQL = @"SELECT FRIEND.FRIEND_ID, FRIEND.USER_ID, USERS.* FROM 
                                (SELECT f1.REQUEST_USER_ID FRIEND_ID, f1.RESPOND_USER_ID USER_ID FROM FRIEND_LIST f1
                                WHERE f1.respond_user_id = " + userID + @" AND STATUS = 1
                                UNION
                                SELECT f1.RESPOND_USER_ID FRIEND_ID, f1.REQUEST_USER_ID USER_ID    FROM FRIEND_LIST f1
                                WHERE f1.REQUEST_USER_ID = " + userID + @" AND STATUS = 1 ) FRIEND 
                                , USERS  WHERE FRIEND.FRIEND_ID = USERS.USER_ID";

            dt = dbContext.GetResultWithQuery(strSQL);

            return dt;
        }   

        [WebMethod]
        public DataTable GetFriendListByName(int userID, string input)
        {
            DataTable dt = new DataTable("Table");
            string strSQL = @"SELECT FRIEND.FRIEND_ID, FRIEND.USER_ID, USERS.* FROM 
                                (SELECT f1.REQUEST_USER_ID FRIEND_ID, f1.RESPOND_USER_ID USER_ID FROM FRIEND_LIST f1
                                WHERE f1.respond_user_id = " + userID + @" AND STATUS = 1
                                UNION
                                SELECT f1.RESPOND_USER_ID FRIEND_ID, f1.REQUEST_USER_ID USER_ID    FROM FRIEND_LIST f1
                                WHERE f1.REQUEST_USER_ID = " + userID + @" AND STATUS = 1 ) FRIEND 
                                , USERS  WHERE FRIEND.FRIEND_ID = USERS.USER_ID AND (LOWER(USERS.FIRST_NAME) LIKE '%" + input.ToLower() + "%' OR LOWER(USERS.LAST_NAME) LIKE '%" + input.ToLower() + "%')";

            dt = dbContext.GetResultWithQuery(strSQL);

            return dt;
        }
    }
}
