using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using UserService.DBOperationWS;
using Model.ClassList;

namespace UserService
{
    /// <summary>
    /// Summary description for UserService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/", Name = "User Service")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class UserService : System.Web.Services.WebService
    {

        DBServices dbContext = new DBServices();

        [WebMethod]
        public DataTable GetUserByPassword(String userName, String password)
        {
            DataTable dt = new DataTable("Table");
            dt = dbContext.GetResultParameters("USERS", new String[] { "USER_NAME", "PASSWORD" }, new string[] { userName, password });

            return dt;
        }

        [WebMethod]
        public DataTable GetUserByUserName(String userName)
        {
            string strSQL = "SELECT u.USER_NAME, u.FIRST_NAME, u.LAST_NAME, u.EMAIL, u.FIRST_NAME, u.LAST_NAME FROM USERS u WHERE u.USER_NAME ='" + userName + "'";
            DataTable dt = dbContext.GetResultWithQuery(strSQL);

            return dt;
        }

        [WebMethod]
        public _User GetUserByID(int ID)
        {
            DataTable dt = new DataTable("Table");
            dt = dbContext.GetResultParameters("USERS", new String[] { "USER_ID" }, new string[] { ID.ToString() });

            _User user = new _User();
            user.UserID = Convert.ToInt32(dt.Rows[0]["USER_ID"]);
            user.Password = dt.Rows[0]["PASSWORD"].ToString();
            user.UserName = dt.Rows[0]["USER_NAME"].ToString();
            user.UserTypeID = Convert.ToInt32(dt.Rows[0]["USER_TYPE_ID"]);
            user.FirstName = dt.Rows[0]["FIRST_NAME"].ToString();
            user.LastName = dt.Rows[0]["LAST_NAME"].ToString();
            user.LookingFor = Convert.ToInt32(dt.Rows[0]["LOOKING_FOR"]);
            user.Gender = dt.Rows[0]["GENDER"].ToString();
            user.Dob = (DateTime)dt.Rows[0]["DOB"];
            user.Email = dt.Rows[0]["EMAIL"].ToString();
            user.Address = dt.Rows[0]["ADDRESS"].ToString();
            user.Suburb = dt.Rows[0]["SUBURB"].ToString();
            user.State = dt.Rows[0]["STATE"].ToString();
            user.Status = Convert.ToInt32(dt.Rows[0]["STATUS"]);
            user.Country = dt.Rows[0]["COUNTRY"].ToString();
            user.PostalCode = dt.Rows[0]["POSTAL_CODE"].ToString();
            user.CreatedDate = (DateTime)dt.Rows[0]["CREATED_DATE"];
            user.ModifiedDate = (DateTime)dt.Rows[0]["MODIFIED_DATE"];

            return user;
        }


        [WebMethod]
        public DataTable GetUserTypeByID(int ID)
        {
            string strSQL = "SELECT ut.* FROM USER_TYPE ut, USERS u WHERE u.USER_TYPE_ID = yt.USER_TYPE_ID AND u.USER_ID =" + ID;
            DataTable dt = dbContext.GetResultWithQuery(strSQL);


            return dt;
        }


        [WebMethod]
        public Boolean CheckUniqueUserName(String userName)
        {
            DataTable dt = new DataTable("Table");
            dt = dbContext.GetResultWithQuery("SELECT USER_NAME FROM USERS WHERE USER_NAME = '" + userName + "'");

            if (dt.Rows.Count > 0)
                return true;
            else
                return false;

        }

        [WebMethod]
        public void AdminDeleteUser(String username)
        {
            String strSQL = "SELECT USER_ID FROM USERS WHERE USER_NAME='"+username+"'";
            DataTable dtDeleteUserID = dbContext.GetResultWithQuery(strSQL);

            String selDeleteUserID = dtDeleteUserID.Rows[0][0].ToString();

            String strSQL2 = "DELETE FROM USERS WHERE USER_ID='"+selDeleteUserID+"'";
            dbContext.DeleteWithQuery(strSQL2);
           
        }

        [WebMethod]
        public void AdminModifyUser(String userName, String firstName, String lastName, String email, String password)
        {
            String strSQL = "UPDATE USERS SET USER_NAME = '" + userName + "', FIRST_NAME = '" + firstName + "', LAST_NAME = '" + lastName + "', EMAIL = '" + email + "', PASSWORD = '" + password + "' WHERE USER_NAME = '" + userName + "'";
            dbContext.UpdateWithQuery(strSQL);
        }

        [WebMethod]
        public void AddUser(_User user)
        {
            String birthDate = user.Dob.ToString("dd/MM/yyyy");
         //   DateTime Dob = DateTime.Parse(birthDate);

            String today = DateTime.Now.ToString("dd/MM/yyyy");
            String strSQL = "INSERT INTO USERS ( USER_NAME, PASSWORD, EMAIL, FIRST_NAME, LAST_NAME, ADDRESS, SUBURB, STATE, POSTAL_CODE, COUNTRY, LOOKING_FOR, DOB, GENDER, STATUS, CREATED_DATE, MODIFIED_DATE, USER_TYPE_ID) VALUES ('" 
                                + user.UserName + "', '" + user.Password + "', '" + user.Email + "', '" + user.FirstName + "', '" + user.LastName + "', '"
                                + user.Address + "', '" + user.Suburb + "', '"
                                + user.State + "', '" + user.PostalCode + "', '" + user.Country + "', '"
                                + user.LookingFor + "',convert(datetime,'"+birthDate+"',103),'"+ user.Gender + "', '"
                                + _User.ACTIVE.ToString() + "', cast(convert(DateTime,'" + today + "',103)as datetime),  cast(convert(DateTime,'" + today + "',103)as datetime), '" + UserType.member + "')";


            dbContext.InsertWithQuery(strSQL);
            //return dbContext.InsertWithArray("USERS", new string[] { "USER_NAME", "PASSWORD", "EMAIL", "FIRST_NAME", "LAST_NAME", "ADDRESS", "SUBURB", "STATE",
            //"POSTAL_CODE", "COUNTRY", "LOOKING_FOR","DOB", "GENDER", "STATUS", "CREATED_DATE","MODIFIED_DATE" ,"USER_TYPE_ID"},
            //             new string[] { user.UserName,user.Password,user.Email,user.FirstName,user.LastName,user.Address, user.Suburb, user.State,
            //       user.PostalCode, user.Country, user.LookingFor.ToString(), user.Dob.ToString("dd/MMM/yyyy"),user.Gender,_User.PENDING.ToString(),today,today,UserType.MEMBER.ToString() });
        }


        [WebMethod]
        public DataTable GetLookingForList()
        {
            DataTable dt = new DataTable("Table");
            dt = dbContext.GetResultParameters("LOOKING_FOR", new String[] { }, new string[] { });

            return dt;
        }

        [WebMethod]
        public DataTable GetInterestList()
        {
            DataTable dt = new DataTable("Table");
            dt = dbContext.GetResultParameters("HOBBY", new String[] { }, new string[] { });

            return dt;
        }

        [WebMethod]
        public int UpdateUser(_User user)
        {
            String birthDate = user.Dob.ToString();
            String today = DateTime.Now.ToString("dd/MM/yyyy");
          /*  String strSQL = @"UPDATE USERS ( USER_NAME, PASSWORD, EMAIL, FIRST_NAME, LAST_NAME, ADDRESS, SUBURB, STATE, POSTAL_CODE, COUNTRY, LOOKING_FOR, DOB, GENDER, STATUS, CREATED_DATE, MODIFIED_DATE, USER_TYPE_ID) VALUES 
                            ('" + user.UserName + "', '" + user.Password + "', '" + user.Email + "', '" + user.FirstName + "', '" + user.LastName + "', '"
                                + user.Address + "', '" + user.Suburb + "', '"
                                + user.State + "', '" + user.PostalCode + "', '" + user.Country + "', '"
                                + user.LookingFor + "',convert(DateTime,'" + birthDate + "',103),'" + user.Gender + "', '"
                                + _User.ACTIVE.ToString() + "', convert(DateTime,'" + today + "',103),  convert(DateTime,'" + today + "',103), '" + UserType.member + "')";
           */
            String strSQL = "UPDATE USERS SET USER_NAME='" + user.UserName + "', PASSWORD='" + user.Password + "', EMAIL = '" + user.Email + "', " +
                   "FIRST_NAME = '" + user.FirstName + "', LAST_NAME = '" + user.LastName + "', ADDRESS = '" + user.Address + "', SUBURB='" + user.Suburb +
                       "', STATE='" + user.State + "', POSTAL_CODE='" + user.PostalCode + "', COUNTRY='" + user.Country + "', LOOKING_FOR='" + user.LookingFor +
                       "', DOB= convert(DateTime,'" + birthDate + "',103), GENDER='" + user.Gender + "', STATUS='" + user.Status + "', MODIFIED_DATE=convert(DateTime,'" + today + "',103)" +
                       "where USER_ID =" + user.UserID;

            return dbContext.UpdateWithQuery(strSQL);
        }

        [WebMethod]
        public DataTable GetUserLookingFor(int userID)
        {
            String strSQL = "SELECT l.* FROM LOOKING_FOR l, USER_LOOKING_FOR ul WHERE l.LOOKING_FOR_ID = ul.LOOKING_FOR_ID AND ul.USER_ID =" + userID;
            DataTable dt = new DataTable("Table");

            return dbContext.GetResultWithQuery(strSQL);

        }

        //*****************Aaron Coding START********************//

        [WebMethod]
        public String CheckDualRelationship(int RequestUserID, int RespondUserID, int RelationshipTypeID)
        {
            String result = "yes";
            String strSQL = "SELECT * FROM user_relationship WHERE relation_type_id = "+RelationshipTypeID+" AND (request_user_id = "+RequestUserID+" AND respond_user_id = "+RespondUserID+")";
            DataTable dt = dbContext.GetResultWithQuery(strSQL);
            if (dt.Rows.Count == 0)
            {
                result = "no";
            }
            return result;
        }

        [WebMethod]
        public String getGender(int userID)
        {
            String gender = "Something";
            String strSQL = "SELECT Gender FROM users WHERE user_id = " + userID + "";
            DataTable dt = new DataTable("Table");

            dt = dbContext.GetResultWithQuery(strSQL);

            gender = dt.Rows[0]["Gender"].ToString();

            return gender;
        }

        //Accept Relationship
        [WebMethod]
        public int AcceptRelationshipRequest(int relationshipType, int relationID, int responder)
        {
            String strSQL = "UPDATE user_relationship SET Status = 1 WHERE User_Relation_ID = "+relationID+"";
            return dbContext.InsertWithQuery(strSQL);
        }


        //Get User Relation ID
        [WebMethod]
        public DataTable GetUserRelationID(int RequestID, int RespondID, int RelationTypeID)
        {
            String strSQL = "SELECT user_relation_id FROM user_relationship WHERE Relation_Type_ID = "+RelationTypeID+" AND (Request_User_ID = "+RequestID+" AND Respond_User_ID ="+RespondID+") ORDER BY user_relation_id DESC";
            DataTable dt = new DataTable();
            return dbContext.GetResultWithQuery(strSQL);
        }

        //Get User's FullName
        [WebMethod]
        public String GetUserFullname(int userID)
        {
            String fullname = "";
            String strSQL = "SELECT First_Name, Last_Name FROM users WHERE user_id = "+userID+"";
            DataTable dt = new DataTable("Table");
            dt = dbContext.GetResultWithQuery(strSQL);

            fullname = dt.Rows[0]["First_Name"] + " " +dt.Rows[0]["Last_Name"];

            return fullname;
        }

        //Relationship Request
        [WebMethod]
        public String RequestEstablishRelationship(int userID, int RUserID, int RelationshipTypeID)
        {
            String result = "fail";
            String strSQL = "INSERT INTO USER_RELATIONSHIP(request_user_id, respond_user_id, status, relation_type_id) VALUES ("+userID+", "+RUserID+", 0, "+RelationshipTypeID+")";
            int i = dbContext.InsertWithQuery(strSQL);
                if(i >= 1){
                    result = "success";
                }
            return result;
        }


        //Get users from friend_list
        [WebMethod]
        public DataTable GetFriendList(int userID)
        {
            String strSQL = "SELECT * FROM friend_list where (status = 1) AND (respond_user_id = " + userID + " OR request_user_id = " + userID + ")";
            return dbContext.GetResultWithQuery(strSQL);
        }

        //Get Relationship Name from Relationship ID
        [WebMethod]
        public DataTable GetRelationshipName(int RelationshipID)
        {
            String strSQL = "SELECT RELATION_TYPE_name FROM relationship_type WHERE relation_type_id = '" + RelationshipID + "'";
            return dbContext.GetResultWithQuery(strSQL);
        }


        //Get Relationship ID from Relationship Name
        [WebMethod]
        public DataTable GetRelationshipID(String RelationshipName)
        {
            String strSQL = "SELECT RELATION_TYPE_ID FROM relationship_type WHERE relation_type_name = '" + RelationshipName + "'";
            return dbContext.GetResultWithQuery(strSQL) ;
        }
        //Do relationship establishing
        [WebMethod]
        public int RequestRelationship(int RequestUserID, int RespondUserID, String Relationship_Name)
        {
            int result = 0;
            String strSQL = "INSERT INTO user_relationship(request_user_id, respond_user_id, status, relation_type_id) VALUES ("+RequestUserID+", "+RespondUserID+", 0, (SELECT relation_type_id FROM relationship_type WHERE relation_type_name = '"+Relationship_Name+"')";
            result = dbContext.InsertWithQuery(strSQL);
            return result;
        }

        //Check for any relationship
        [WebMethod]
        public String CheckRelationship(int UserID)
        {
            String result = "no";

            String strSQL = "SELECT * FROM user_relationship WHERE request_user_id = " + UserID + " OR respond_user_id = " + UserID + "";
            DataTable db = dbContext.GetResultWithQuery(strSQL);
            if (db.Rows.Count >= 1)
            {
                result = "yes";
            }
            return result;
        }

        //Get all same category names
        [WebMethod]
        public DataTable GetOppositeCategory(String catName, String genderName)
        {
            String strSQL = "SELECT * FROM relationship_type WHERE relation_type_desc = '"+catName+"' AND relation_gender != '"+genderName+"'";
            DataTable dt = new DataTable("Table");
            return dbContext.GetResultWithQuery(strSQL);
        }
        //Get all relationship names
        [WebMethod]
        public DataTable GetAllRelationshipType()
        {
            String strSQL = "SELECT relation_type_name, relation_type_id FROM relationship_type";
            DataTable dt = new DataTable("Table");
            return dbContext.GetResultWithQuery(strSQL);
        }

        //Get all relationships of whom are associated with user and has status "1"
        [WebMethod]
        public DataTable GetUserRelationshipWith(int userID)
        {
            String strSQL = "SELECT * FROM user_relationship WHERE STATUS = 1 AND (REQUEST_USER_ID = "+userID+" OR RESPOND_USER_ID = "+userID+")";
            DataTable dt = new DataTable("Table");
            return dbContext.GetResultWithQuery(strSQL);
        }

        //Get Relationship Name and Description
        [WebMethod]
        public DataTable GetUserRelationshipType(int relationshipID)
        {
            String strSQL = "SELECT * FROM relationship_type WHERE relation_type_id = "+relationshipID+"";
            DataTable dt = new DataTable("Table");
            return dbContext.GetResultWithQuery(strSQL);
        }

        //Get names of people who are associated with user from id
        [WebMethod]
        public DataTable GetUsersName(int userID)
        {
            String strSQL = "SELECT first_name, last_name FROM users WHERE user_id = " + userID + "";
            DataTable dt = new DataTable("Table");
            return dbContext.GetResultWithQuery(strSQL);
        }
        //******************Aaron Coding END*********************//



        [WebMethod]
        public DataTable GetUserInterest(int userID)
        {
            String strSQL = "SELECT h.* FROM HOBBY h, HOBBY_LIST hl WHERE h.HOBBY_ID = hl.HOBBY_ID AND hl.USER_ID =" + userID;
            DataTable dt = new DataTable("Table");

            return dbContext.GetResultWithQuery(strSQL);

        }

        [WebMethod]
        public void UpdateLookingFor(int userID, Object[] lookingForList)
        {
            String strSQL = "DELETE FROM USER_LOOKING_FOR WHERE USER_ID=" + userID;
            dbContext.DeleteWithQuery(strSQL);
            for (int i = 0; i < lookingForList.Length; i++)
            {
                dbContext.InsertWithArray("USER_LOOKING_FOR", new string[] { "USER_ID", "LOOKING_FOR_ID" },
              new string[] { userID.ToString(), lookingForList[i].ToString() });
            }
        }


        [WebMethod]
        public void UpdateInterest(int userID, Object[] interestList)
        {
            String strSQL = "DELETE FROM HOBBY_LIST WHERE USER_ID=" + userID;
            dbContext.DeleteWithQuery(strSQL);
            for (int i = 0; i < interestList.Length; i++)
            {
                dbContext.InsertWithArray("HOBBY_LIST", new string[] { "USER_ID", "HOBBY_ID" },
              new string[] { userID.ToString(), interestList[i].ToString() });
            }
        }


        [WebMethod]
        public void InsertFriend(int userID, int friendID)
        {
            String strSQL = "INSERT INTO FRIEND_LIST(request_user_id,respond_user_id,status) VALUES (" + userID + "," + friendID+ ",0)";
            dbContext.InsertWithQuery(strSQL);
           
           
        }

        [WebMethod]
        public void UpdateFriendStatus(int requestID, int respondID)
        {
            String strSQL = "UPDATE  FRIEND_LIST SET STATUS = 1 WHERE REQUEST_USER_ID =" + requestID + " AND RESPOND_USER_ID =" + respondID;
            dbContext.UpdateWithQuery(strSQL);


        }

    }
}
