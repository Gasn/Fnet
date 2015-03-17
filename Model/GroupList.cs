using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model.ClassList
{
    public class GroupList
    {

        private int listID;
        private int status;
        private int groupID;
        private DateTime joinDate;
        private int userTypeID;
        private int userID;

        public GroupList()
        {
            this.joinDate = DateTime.MinValue;
            this.listID = 0;
            this.groupID = 0;
            this.status = 0;
            this.userTypeID = 0;
            this.userID = 0;
        }

        public int GroupID
        {
            get { return groupID; }
            set { groupID = value; }
        }

        public int ListID
        {
            get { return listID; }
            set { listID = value; }
        }


        public int UserTypeID
        {
            get { return userTypeID; }
            set { userTypeID = value; }
        }

        public int UserID
        {
            get { return userID; }
            set { userID = value; }
        }

        public DateTime JoinDate
        {
            get { return joinDate; }
            set { joinDate = value; }
        }


        public int Status
        {
            get { return status; }
            set { status = value; }
        }

    }
}
