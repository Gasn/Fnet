using System;
using System.Data;
using System.Configuration;


namespace Model.ClassList
{
    public class UserType
    {


        private int typeID;
        private string typeName;
        private string typeDesc;
        private int read;
        private int write;
        private int delete;
        private int edit;

        public UserType(int typeID, string typeName, string typeDesc, int read, int write, int delete, int edit)
        {
            this.typeID = typeID;
            this.typeName = typeName;
            this.typeDesc = typeDesc;
            this.read = read;
            this.edit = edit;
            this.delete = delete;
            this.write = write;

        }


        public UserType()
        {
            this.typeID = 0;
            this.typeName = "";
            this.typeDesc = "";
            this.read = 0;
            this.edit = 0;
            this.delete = 0;
            this.write = 0;

        }


        public int TypeID
        {
            get { return typeID; }
            set { typeID = value; }
        }

        public string TypeName
        {
            get { return typeName; }
            set { typeName = value; }
        }


        public string TypeDesc
        {
            get { return typeDesc; }
            set { typeDesc = value; }
        }
        public int Read
        {
            get { return read; }
            set { read = value; }
        }

        public int Write
        {
            get { return write; }
            set { write = value; }
        }

        public int Edit
        {
            get { return edit; }
            set { edit = value; }
        }

        public int Delete
        {
            get { return delete; }
            set { delete = value; }
        }

        public static int sysAdmin = 1;
        public static int member = 2;
        public static int gOwner = 3;
        public static int gMember = 4;
        public static int gModerator = 5;

    
    }

}
