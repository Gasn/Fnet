using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using System.Data.SqlClient;

namespace DBService
{
    /// <summary>
    /// Summary description for DBOperationService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/", Name = "DBServices")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class DBOperationService : System.Web.Services.WebService
    {
        SqlConnection conn;

        public SqlConnection Connection
        {
            get { return conn; }
        }

        //Create Connection
        public DBOperationService()
        {
            string conInfo = ConfigurationManager.ConnectionStrings["FnetConnectionString"].ConnectionString;
            conn = new SqlConnection(conInfo);
        }

        #region Insert
        //Insert With String Array
        [WebMethod]
        public int InsertWithArray(string table, string[] fields, string[] values)
        {
            return DatabaseOperation.insert(conn, table, fields, values);
            //return 1;
        }

        //Insert With Normal Query
        [WebMethod]
        public int InsertWithQuery(string sql)
        {
            return DatabaseOperation.insert(conn, sql);
        }
        #endregion


        #region Update
        //Update with String Array
        [WebMethod]
        public int UpdateWithArray(string table, string[] fields, string[] values, string wherefield, string whereequal)
        {
            return DatabaseOperation.update(conn, table, fields, values, wherefield, whereequal);
        }

        //Update with Normal Query
        [WebMethod]
        public int UpdateWithQuery(string sql)
        {
            return DatabaseOperation.update(conn, sql);
        }
        #endregion



        [WebMethod]
        public void DeleteWithSingleValue(string table, string wherefield, string whereequal)
        {
            DatabaseOperation.delete(conn, table, wherefield, whereequal);
        }

        [WebMethod]
        public void DeleteWithMultipleValues(string table, string wherestring, string[] parameters)
        {
            DatabaseOperation.delete(conn, table, wherestring, parameters);
        }

        [WebMethod]
        public void DeleteWithQuery(string sql)
        {
            DatabaseOperation.delete(conn, sql);
        }


        [WebMethod]
        public DataTable GetResultWithQuery(string query)
        {
            DataTable dt = new DataTable("Table");
            dt = DatabaseOperation.getDataTableResult(conn, query);
            return dt;

        }

        [WebMethod]
        public DataTable GetResultParameters(string table, string[] fields, string[] parameters)
        {
            DataTable dt = new DataTable("Table");
            dt = DatabaseOperation.getDataTableResult(conn, table, fields, parameters);
            return dt;
        }



    }
}
