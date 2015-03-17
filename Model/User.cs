using System;
using System.Data;
using System.Text;
using System.Configuration;

namespace Model.ClassList
{
    public class _User
    {

        public static  int PENDING = 0;
        public static  int ACTIVE = 1;
        public static  int CANCEL = 2;
        public static  int BANNED = 3;
       
        #region variables
        private string userName;
        private string lastName;
        private string firstName;
        private string password;
        private string address;
        private string suburb;
        private string email;
        private string postalCode;
        private int userID;
        private DateTime createdDate;
        private DateTime modifiedDate;
        private string state;
        private string country;
        private DateTime dob;
        private int userTypeID;
        private int status;
        private string gender;
        private int lookingFor;

        #endregion

        #region constructor

        public _User()
        {
            this.userName = "";
            this.lastName = "";
            this.firstName = "";
            this.password = "";
            this.address = "";
            this.suburb = "";
            this.email = "";
            this.postalCode = "";
            this.userID = 0;
            this.modifiedDate = DateTime.MinValue;
            this.createdDate = DateTime.MinValue;
            this.state = "";
            this.country = "";
            this.dob = DateTime.MinValue;
            this.userTypeID = 0;
            this.gender = "";
            this.status = -1;
            this.lookingFor = 0;
        }


        public _User(int userID, string userName, string lastName, string firstName, string password, string suburb, string address, string state, string email,
            string postalCode, DateTime modifiedDate, DateTime createdDate, string country, DateTime dob, string gender, int status, int userTypeID, int lookingFor)
        {
            this.userName = userName;
            this.lastName = lastName;
            this.firstName = firstName;
            this.password = password;
            this.address = address;
            this.suburb = suburb;
            this.email = email;
            this.postalCode = postalCode;
            this.userID = userID;
            this.state = state;
            this.country = country;
            this.dob = dob;
            this.userTypeID = userTypeID;
            this.createdDate = createdDate;
            this.modifiedDate = modifiedDate;
            this.status = status;
            this.gender = gender;
            this.lookingFor = lookingFor;
        }

        #endregion
        public int UserID
        {
            get { return userID; }
            set { userID = value; }
        }

        public string UserName
        {
            get { return userName; }
            set { userName = value; }
        }

        public string Password
        {
            get { return password; }
            set { password = value; }
        }
        public string Email
        {
            get { return email; }
            set { email = value; }
        }


        public string FirstName
        {
            get { return firstName; }
            set { firstName = value; }
        }


        public string LastName
        {
            get { return lastName; }
            set { lastName = value; }
        }


        public string Address
        {
            get { return address; }
            set { address = value; }
        }


        public string Suburb
        {
            get { return suburb; }
            set { suburb = value; }
        }


        public string State
        {
            get { return state; }
            set { state = value; }
        }


        public string PostalCode
        {
            get { return postalCode; }
            set { postalCode = value; }
        }


        public string Country
        {
            get { return country; }
            set { country = value; }
        }


        public DateTime Dob
        {
            get { return dob; }
            set { dob = value; }
        }


        public DateTime CreatedDate
        {
            get { return createdDate; }
            set { createdDate = value; }
        }

        public DateTime ModifiedDate
        {
            get { return modifiedDate; }
            set { modifiedDate = value; }
        }

        public int UserTypeID
        {
            get { return userTypeID; }
            set { userTypeID = value; }

        }

        public int Status
        {
            get { return status; }
            set { status = value; }
        }


        public string Gender
        {
            get { return gender; }
            set { gender = value; }
        }

        public int LookingFor
        {
            get { return lookingFor; }
            set { lookingFor = value; }
        }

     
    }





}
