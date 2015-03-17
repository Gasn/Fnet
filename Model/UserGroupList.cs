using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model.ClassList
{
    public class UserGroupList
    {
        private int listID;

    
        private DateTime joinDate;
        private int status;
        private int groupID;
        private int userTypeID;
        private int userID;
        private int requestUserID;


        public UserGroupList()
        {
            listID = 0;
            joinDate = DateTime.MinValue;
            status = -1;
            groupID = 0;
            userTypeID = 0;
            userID = 0;
            requestUserID = 0;

        }

        public int ListID
        {
            get { return listID; }
            set { listID = value; }
        }


        public int GroupID
        {
            get { return groupID; }
            set { groupID = value; }
        }

        public int Status
        {
            get { return status; }
            set { status = value; }
        }

        public int UserID
        {
            get { return userID; }
            set { userID = value; }
        }

        public int UserTypeID
        {
            get { return userTypeID; }
            set { userTypeID = value; }
        }

        public int RequestUserID
        {
            get { return requestUserID; }
            set { requestUserID = value; }
        }
        public DateTime JoinDate
        {
            get { return joinDate; }
            set { joinDate = value; }
        }


        public static int PENDING_ADMIN_CONFIRM = 0;
        public static int BAN = 3;
        public static int CANCEL = 2;
        public static int ACTIVE = 1;
        public static int PENDING_USER_CONFIRM = 4;

     

    }
}
