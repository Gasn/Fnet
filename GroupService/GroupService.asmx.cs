using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using GroupService.DBOperationWS;
using Model.ClassList;
namespace GroupService
{
    /// <summary>
    /// Summary description for GroupService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class GroupService : System.Web.Services.WebService
    {
        DBServices dbContext = new DBServices();

        [WebMethod]
        public String CreateGroupDefaultCat(String userID, String grpName, String grpCatID, String grpDesc, String grpType, DateTime createdDate, String fileSize)
        {
            String strSQL4 = "INSERT INTO FILE_SHARING(file_sharing_count) VALUES ('" + fileSize + "')";
            dbContext.InsertWithQuery(strSQL4);

            String strSQL5 = "SELECT MAX(FILE_SHARING_ID) FROM FILE_SHARING";
            DataTable selFileSharingID = dbContext.GetResultWithQuery(strSQL5);

            String strSelFileSharingID = selFileSharingID.Rows[0][0].ToString();

            String strSQL = "INSERT INTO GROUPS(group_name,cat_id,group_desc,group_type,created_date,status,file_sharing_id) VALUES ('" + grpName + "','" + grpCatID + "','" + grpDesc + "','" + grpType + "',convert(datetime,getdate(),103),'1','" + strSelFileSharingID + "')";
            dbContext.InsertWithQuery(strSQL);

            String strSQL2 = "SELECT MAX(GROUP_ID) FROM GROUPS";
            DataTable selGroupID = dbContext.GetResultWithQuery(strSQL2);

            String strSelGrpID = selGroupID.Rows[0][0].ToString();

            String strSQL3 = "INSERT INTO USER_GROUP_LIST(join_date, status, group_id,user_type_id,user_id,request_user_id) VALUES (convert(datetime,getdate(),103),'1','" + strSelGrpID + "','3','" + userID + "',0)";
            dbContext.InsertWithQuery(strSQL3);

            return strSelGrpID;
        }

        [WebMethod]
        public int CreateNewGroupTopic(String groupID, String userID, String topicName, DateTime createdDate)
        {
            int check = 0;

            String strSQL = "INSERT INTO DISCUSSION_BOARD(board_topic,status,created_by,created_date,group_id) VALUES ('" + topicName + "',1,'" + userID + "',convert(datetime,getdate(),103),'"+groupID+"')";
            check = dbContext.InsertWithQuery(strSQL);

            return check;
        }

        [WebMethod]
        public String CreateGroupNewCat(String catName, String catDesc, String userID, String grpName, String grpDesc, String grpType, DateTime createdDate, String fileSize)
        {
            //Insert new category
            String strSQL = "INSERT INTO CATEGORY(cat_name,cat_desc) VALUES ('" + catName + "','" + catDesc + "')";
            dbContext.InsertWithQuery(strSQL);

            //Get new category ID
            String strSQL2 = "SELECT MAX(CAT_ID) FROM CATEGORY";
            DataTable dtCatID = dbContext.GetResultWithQuery(strSQL2);

            String newCatID = dtCatID.Rows[0][0].ToString(); //store new category ID into string

            String strSQL6 = "INSERT INTO FILE_SHARING(file_sharing_count) VALUES ('" + fileSize + "')";
            dbContext.InsertWithQuery(strSQL6);

            String strSQL7 = "SELECT MAX(FILE_SHARING_ID) FROM FILE_SHARING";
            DataTable selFileSharingID = dbContext.GetResultWithQuery(strSQL7);

            String strSelFileSharingID = selFileSharingID.Rows[0][0].ToString();

            //Insert new group
            String strSQL3 = "INSERT INTO GROUPS(group_name,cat_id,group_desc,group_type,created_date,status,file_sharing_id) VALUES ('" + grpName + "','" + newCatID + "','" + grpDesc + "','" + grpType + "',convert(datetime,getdate(),103),'1','" + strSelFileSharingID + "')";
            dbContext.InsertWithQuery(strSQL3);

            //Get new group ID
            String strSQL4 = "SELECT MAX(GROUP_ID) FROM GROUPS";
            DataTable selGroupID = dbContext.GetResultWithQuery(strSQL4); //store new group ID into string

            String strSelGrpID = selGroupID.Rows[0][0].ToString();

            //Insert new user_group_list
            String strSQL5 = "INSERT INTO USER_GROUP_LIST(join_date, status, group_id,user_type_id,user_id,request_user_id) VALUES (convert(datetime,getdate(),103),'1','" + strSelGrpID + "','3','" + userID + "',0)";
            dbContext.InsertWithQuery(strSQL5);

            return strSelGrpID;
        }

        [WebMethod]
        public DataTable UserGroupOwner(String userID)
        {
            //Get user's group(s) owner
            String strSQL = "SELECT groups.group_name, groups.group_id, groups.group_desc, groups.group_type, CATEGORY.CAT_NAME FROM GROUPS INNER JOIN USER_GROUP_LIST ON GROUPS.GROUP_ID = USER_GROUP_LIST.GROUP_ID INNER JOIN CATEGORY ON GROUPS.CAT_ID=CATEGORY.CAT_ID WHERE USER_ID = '" + userID + "' AND USER_GROUP_LIST.STATUS = 1 AND (USER_GROUP_LIST.USER_TYPE_ID=3 OR USER_GROUP_LIST.USER_TYPE_ID=5 )";
            DataTable dtUserGrp = dbContext.GetResultWithQuery(strSQL);

            return dtUserGrp;
        }

        [WebMethod]
        public DataTable UserGroupMember(String userID)
        {
            //Get user's group(s) member
            String strSQL = "SELECT groups.group_name, groups.group_id, groups.group_desc, groups.group_type, CATEGORY.CAT_NAME FROM GROUPS INNER JOIN USER_GROUP_LIST ON GROUPS.GROUP_ID = USER_GROUP_LIST.GROUP_ID INNER JOIN CATEGORY ON GROUPS.CAT_ID=CATEGORY.CAT_ID WHERE USER_ID = '" + userID + "' AND USER_GROUP_LIST.STATUS = 1 AND  USER_GROUP_LIST.USER_TYPE_ID=4";
            DataTable dtUserGrp = dbContext.GetResultWithQuery(strSQL);

            return dtUserGrp;
        }



        [WebMethod]
        public Group GetGroupDetails(String groupID)
        {
            DataTable dt = dbContext.GetResultParameters("groups", new String[] { "group_ID" }, new String[] { groupID });
            Group group = new Group();
            group.GroupID = Convert.ToInt32(dt.Rows[0]["GROUP_ID"]);
            group.GroupName = dt.Rows[0]["GROUP_NAME"].ToString();
            group.GroupType = dt.Rows[0]["GROUP_TYPE"].ToString();
            group.Status = Convert.ToInt32(dt.Rows[0]["STATUS"]);
            group.GroupDesc = dt.Rows[0]["GROUP_DESC"].ToString();
            group.CatID = Convert.ToInt32(dt.Rows[0]["CAT_ID"]);
            group.CreatedDate = Convert.ToDateTime(dt.Rows[0]["CREATED_DATE"]);
            group.FileSharingID = Convert.ToInt32(dt.Rows[0]["FILE_SHARING_ID"]);

            return group;

        }

        [WebMethod]
        public DataTable GetCatDetails()
        {
            String strSQL = "SELECT CAT_ID, CAT_NAME FROM CATEGORY";
            DataTable dtCat = dbContext.GetResultWithQuery(strSQL);

            return dtCat;
        }

        [WebMethod]
        public String GetCatDetailsByID(int catID)
        {
            String strSQL = "SELECT CAT_ID, CAT_NAME FROM CATEGORY WHERE CAT_ID =" + catID;
            DataTable dtCat = dbContext.GetResultWithQuery(strSQL);

            return dtCat.Rows[0]["CAT_NAME"].ToString();
        }

        [WebMethod]
        public void deleteUserFromGroup(String userID, String grpID)
        {
            String strSQL = "DELETE FROM USER_GROUP_LIST WHERE USER_ID = '" + userID + "' AND GROUP_ID = '" + grpID + "' AND USER_TYPE_ID = '4'";
            dbContext.DeleteWithQuery(strSQL);
        }

        [WebMethod]
        public void deleteGroup(String grpID)
        {
            String strSQL = "DELETE FROM GROUPS WHERE GROUP_ID = '" + grpID + "'";
            dbContext.DeleteWithQuery(strSQL);
        }

        [WebMethod]
        public void updateGroupDetails(String grpID, String grpName, String grpDesc)
        {
            String strSQL = "UPDATE GROUPS SET GROUP_NAME = '" + grpName + "', GROUP_DESC = '" + grpDesc + "' WHERE GROUP_ID = '" + grpID + "'";
            dbContext.UpdateWithQuery(strSQL);
        }

        [WebMethod]
        public int UpdateBoardContent(String boardContentID, String boardDesc)
        {
            int check = 0;
            String strSQL = "UPDATE BOARD_CONTENT SET BOARD_DETAIL = '" + boardDesc + "' WHERE BOARD_CONTENT_ID = '" + boardContentID + "'";
            check = dbContext.UpdateWithQuery(strSQL);
            return check;
        }

        [WebMethod]
        public DataTable RetrieveBoardContent(String boardContentID)
        {
            String strSQL = "SELECT BOARD_DETAIL FROM BOARD_CONTENT WHERE BOARD_CONTENT_ID = '" + boardContentID + "'";
            DataTable dt = dbContext.GetResultWithQuery(strSQL);

            return dt;
        }

        [WebMethod]
        public String GetUserTypeID(String groupID)
        {
            String strSQL = "SELECT USER_TYPE_ID FROM USER_GROUP_LIST WHERE GROUP_ID = '" + groupID + "'";
            DataTable dt = dbContext.GetResultWithQuery(strSQL);

            String userTypeID = dt.Rows[0][0].ToString();

            return userTypeID;
        }

        [WebMethod]
        public Boolean GetGroupAuthorisation(int userID, int groupID)
        {
            String strSQL = "SELECT COUNT(*) FROM GROUPS g, USER_GROUP_LIST gl WHERE gl.GROUP_ID = g.GROUP_ID AND g.GROUP_ID =" +
                groupID + " AND gl.USER_ID =" + userID;
            DataTable dt = dbContext.GetResultWithQuery(strSQL);

            if (dt.Rows.Count > 0)
                return true;
            else
                return false;
        }

        [WebMethod]
        public UserType GetUserType(int userID, int groupID)
        {
            String strSQL = "SELECT ut.* FROM GROUPS g, USER_GROUP_LIST gl, USER_TYPE ut WHERE ut.USER_TYPE_ID = gl.USER_TYPE_ID AND gl.GROUP_ID = g.GROUP_ID AND g.GROUP_ID =" +
                groupID + " AND gl.USER_ID =" + userID;
            DataTable dt = dbContext.GetResultWithQuery(strSQL);

            UserType userType = new UserType();
            userType.TypeName = dt.Rows[0]["USER_TYPE_NAME"].ToString();
            userType.TypeID = Convert.ToInt32(dt.Rows[0]["USER_TYPE_ID"]);
            userType.Write = Convert.ToInt32(dt.Rows[0]["WRITE_ACSESS"]);
            userType.Read = Convert.ToInt32(dt.Rows[0]["READ_ACCESS"]);
            userType.Edit = Convert.ToInt32(dt.Rows[0]["EDIT_ACCESS"]);
            userType.Delete = Convert.ToInt32(dt.Rows[0]["DELETE_ACCESS"]);

            return userType;
        }


        [WebMethod]
        public DataTable GetBoardTopics(int groupID)
        {
            String strSQL = "SELECT DB.*, U.FIRST_NAME ,' ' , U.LAST_NAME AS CREATER FROM DISCUSSION_BOARD DB INNER JOIN USERS U ON U.USER_ID = DB.CREATED_BY WHERE DB.GROUP_ID = " + groupID;
            DataTable dt = dbContext.GetResultWithQuery(strSQL);

            return dt;
        }

        [WebMethod]
        public DataTable GetGroupOwnerDetails(int groupID)
        {
            //Get group owner's details
            String strSQL = "SELECT USER_NAME, FIRST_NAME , ' ' , LAST_NAME AS NAME, USERS.USER_ID, GROUPS.GROUP_NAME FROM USERS INNER JOIN USER_GROUP_LIST ON USERS.USER_ID = USER_GROUP_LIST.USER_ID INNER JOIN GROUPS ON GROUPS.GROUP_ID = USER_GROUP_LIST.GROUP_ID WHERE USER_GROUP_LIST.USER_TYPE_ID = '3' AND USER_GROUP_LIST.GROUP_ID = '" + groupID + "'";
            DataTable dtOwnerDetails = dbContext.GetResultWithQuery(strSQL);

            return dtOwnerDetails;
        }

        [WebMethod]
        public DataTable GetGroupMembers(int groupID)
        {
            //Get group owner's details
            String strSQL = "SELECT l.*, U.FIRST_NAME , ' ' , U.LAST_NAME AS NAME, u.EMAIL FROM USERS u INNER JOIN USER_GROUP_LIST l ON u.USER_ID = l.USER_ID WHERE u.USER_ID = l.USER_ID AND GROUP_ID = " + groupID + " AND l.USER_TYPE_ID = 4";
            DataTable dt = dbContext.GetResultWithQuery(strSQL);

            return dt;
        }



        [WebMethod]
        public DataTable GetGroupMembersByName(int groupID, string name)
        {
            //Get group owner's details
            String strSQL = "SELECT l.*, U.FIRST_NAME , ' ' , U.LAST_NAME AS NAME, u.EMAIL FROM USERS u INNER JOIN USER_GROUP_LIST l ON u.USER_ID = l.USER_ID WHERE u.USER_ID = l.USER_ID AND GROUP_ID = "
                + groupID + " AND l.USER_TYPE_ID = 4 AND (LOWER(U.FIRST_NAME) LIKE '%" + name + "%' OR LOWER(U.LAST_NAME) LIKE '%" + name + "%') ORDER BY l.STATUS DESC, U.FIRST_NAME, U.LAST_NAME ";
            DataTable dt = dbContext.GetResultWithQuery(strSQL);

            return dt;
        }

        [WebMethod]
        public DataTable GetPendingGroupMembers(int groupID)
        {
            //Get group owner's details
          /*  String strSQL = "SELECT l.*, U.FIRST_NAME , ' ' , U.LAST_NAME AS NAME, u.EMAIL, (SELECT k.FIRST_NAME , ' ' , k.LAST_NAME AS confusedNAME FROM USERS k WHERE k.USER_ID = l.REQUEST_USER_ID ) REQUEST_USER FROM USERS u, USER_GROUP_LIST l  WHERE u.USER_ID = l.USER_ID AND u.USER_ID = l.USER_ID AND GROUP_ID = "
                + groupID + " AND l.STATUS = 0 "; */
            String strSQL = "SELECT inf.List_ID, inf.Join_Date, inf.First_Name, ' ', inf.Last_Name AS request_user, u.First_Name, ' ', u.Last_Name AS NAME,u.Email FROM(SELECT l.List_ID, l.Join_Date, l.Group_ID, l.User_Type_ID, l.User_ID, l.Request_User_ID, l.Status, k.First_Name, k.Last_Name FROM User_Group_List AS l INNER JOIN Users AS k ON l.Request_User_ID = k.User_Id) AS inf INNER JOIN Users AS u ON inf.User_ID = u.User_Id WHERE (inf.Status = 0) AND (inf.Group_ID = " + groupID + " )";
           
            DataTable dt = dbContext.GetResultWithQuery(strSQL);

            return dt;
        }


        [WebMethod]
        public int UpdateGroupMemeber(UserGroupList userGroupList)
        {
            int rowAffected = 0;

            string strSQL = "UPDATE USER_GROUP_LIST SET STATUS = " + userGroupList.Status + ", JOIN_DATE = '" + userGroupList.JoinDate.ToString("dd/MMM/yyyy")
                + "', REQUEST_USER_ID = " + userGroupList.RequestUserID + ", GROUP_ID = " + userGroupList.GroupID + "  where LIST_ID = "
                + userGroupList.ListID;

            rowAffected = dbContext.UpdateWithQuery(strSQL);

            return rowAffected;
        }

        [WebMethod]
        public int UpdateGroupMemeberStatus(int listID, int status)
        {
            int rowAffected = 0;
            string strSQL = "";


            strSQL = "UPDATE USER_GROUP_LIST SET STATUS = " + status + "  where LIST_ID = "
                    + listID;

            rowAffected = dbContext.UpdateWithQuery(strSQL);

            return rowAffected;
        }


        [WebMethod]
        public DataTable GetGroupModerator(int groupID)
        {
            //Get group owner's details
            String strSQL = "SELECT l.*, U.FIRST_NAME , ' ' , U.LAST_NAME AS NAME, u.EMAIL FROM USERS u, USER_GROUP_LIST l WHERE  u.USER_ID = l.USER_ID AND u.USER_ID = l.USER_ID AND GROUP_ID = " + groupID + " AND l.USER_TYPE_ID = 5";
            DataTable dt = dbContext.GetResultWithQuery(strSQL);

            return dt;
        }


        [WebMethod]
        public int UpdateGroupMemberType(int listID, int userType)
        {
            int rowAffected = 0;

            string strSQL = "UPDATE USER_GROUP_LIST SET USER_TYPE_ID = " + userType + "  where LIST_ID = "
                    + listID;

            rowAffected = dbContext.UpdateWithQuery(strSQL);

            return rowAffected;
        }


        [WebMethod]
        public DataTable GetNonMemberByName(string name, int groupID)
        {


          /* string strSQL = @"SELECT u.USER_ID, u.EMAIL, u.FIRST_NAME , ' ' , u.LAST_NAME AS NAME FROM  USERS u WHERE USER_ID NOT IN 
                            (SELECT l.USER_ID FROM USER_GROUP_LIST l WHERE l.GROUP_ID = " + groupID + ") AND u.Status = 1 AND (LOWER(u.FIRST_NAME) LIKE '%" + name.ToLower() + "%' OR LOWER(u.LAST_NAME) LIKE '%" + name.ToLower() + "%')";
            */

            string strSQL = @"SELECT k.USER_ID, k.EMAIL, k.FIRST_NAME , ' ' , k.LAST_NAME AS NAME FROM  USERS k WHERE k.USER_ID NOT IN
                              (SELECT     u.User_Id
                               FROM         User_Group_List AS l INNER JOIN Users AS u ON l.User_ID = u.User_Id
                               WHERE     (l.Group_ID = " + groupID + @" ) AND (LOWER(u.First_Name) LIKE '%" + name.ToLower() + @"%' 
                                                          OR   LOWER(u.Last_Name) LIKE '%"+name.ToLower()+@"%'))
                              AND k.status =1";
            DataTable dt = dbContext.GetResultWithQuery(strSQL);


            return dt;
        }

        [WebMethod]
        public DataTable GetDiscussionBoardContent(String boardID)
        {
            string strSQL = "SELECT u.USER_ID, u.FIRST_NAME , ' ' , u.LAST_NAME AS NAME, b.BOARD_DETAIL, db.BOARD_TOPIC, b.BOARD_CONTENT_ID FROM DISCUSSION_BOARD db INNER JOIN BOARD_CONTENT b ON b.BOARD_ID = db.BOARD_ID INNER JOIN USERS u ON u.USER_ID = b.USER_ID WHERE db.BOARD_ID = " + boardID ;

            DataTable dt = dbContext.GetResultWithQuery(strSQL);

            return dt;
        }

        [WebMethod]
        public int InsertGroupMember(int groupID, int requestUserID, int userID, int status)
        {
            String strSQL = "INSERT INTO USER_GROUP_LIST(join_date,status,group_id,user_type_id,user_id,request_user_id) VALUES (convert(datetime,getdate(),103),"
                + status + ",'" + groupID + "'," + UserType.gMember + "," + userID + ", " + requestUserID + ")";
                 

            return dbContext.InsertWithQuery(strSQL);


        }

        [WebMethod]
        public int InsertBoardContent(int boardID,int userID, String boardDetails, DateTime createdDate)
        {
            String strSQL = "INSERT INTO BOARD_CONTENT(board_detail,Created_date,board_id,user_id) VALUES ('" + boardDetails + "',convert(datetime,getdate(),103)," + boardID + "," + userID + ")";

            return dbContext.InsertWithQuery(strSQL);
        }

        [WebMethod]
        public int DeleteBoardContent(String boardContentID)
        {
            String strSQL = "DELETE FROM BOARD_CONTENT WHERE BOARD_CONTENT_ID = '" + boardContentID + "'";

            return dbContext.InsertWithQuery(strSQL);
        }

        /*[WebMethod]
        public DataTable GetSearchUser()
        {
        }

        [WebMethod]
        public DataTable GetSearchGroup()
        {
        }*/
    }
}
