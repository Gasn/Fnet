using System;
using System.Data;
using System.Configuration;


namespace Model.ClassList
{
    public class FileSharing
    {

        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        private int fileCount;

        public int FileCount
        {
            get { return fileCount; }
            set { fileCount = value; }
        }
    }
}
