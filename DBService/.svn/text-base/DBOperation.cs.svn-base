using System;
using System.Configuration;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;


namespace DBService
{
    public class DatabaseOperation
    {
        //Insert data by passing table, attribute and values in String array.
        #region Insert Query
        public static int insert(SqlConnection conn, string table, string[] fields, string[] values)
        {
            int length = fields.Length;
            string[] val = values;
            int rowAffected = 0;
            if (fields.Length != values.Length) throw new Exception("Fields num doesn't match values num");
            string create = "INSERT INTO " + table + " ( ";

            for (int i = 0; i < fields.Length; i++)
            {
                create += fields[i];
                if (i < fields.Length - 1)
                    create += ", ";
            }

            create += ") VALUES (";
            for (int i = 0; i < values.Length; i++)
            {
                create += "'" + values[i] + "'";
                if (i < values.Length - 1)
                    create += ", ";
            }
            create += ")";

            SqlCommand dbcmd = new SqlCommand(create, conn);

         /*   for (int i = 0; i < fields.Length; i++)
            {
                dbcmd.Parameters.AddWithValue(":" + fields[i], values[i]);
            }*/
            conn.Open();
            rowAffected = dbcmd.ExecuteNonQuery();

            dbcmd.Dispose();
            conn.Close();

            return rowAffected;
        }

        public static int insert(SqlConnection conn, string sql)
        {
            //String sq = "insert into hobby(hobby_name) values ('hh')";
            int rowAffected = 0;
            SqlCommand dbcmd = new SqlCommand(sql, conn);

            conn.Open();
            rowAffected = dbcmd.ExecuteNonQuery();
            dbcmd.Dispose();
            conn.Close();

            return rowAffected;
        }

        //Insert data by passing table, attribute and values in dictionary.
        //public static void insert(SQLConnection conn, string table, Dictionary<string, object> values)
        //{
        //    List<string> k = new List<string>(values.Keys);
        //    List<string> v = new List<string>();
        //    foreach (KeyValuePair<string, object> kv in values)
        //    {
        //        v.Add(kv.Value.ToString());
        //    }
        //    insert(conn, table, k.ToArray(), v.ToArray());
        //}



        #endregion

        #region Update Query

        //Update data by passing table, attribute and values in String array.
        public static int update(SqlConnection conn, string table, string[] fields, string[] values,
                                  string wherefield, string whereequal)
        {
            if (fields.Length != values.Length) throw new Exception("Fields num doesn't match values num");
            string[] strfields = new string[fields.Length];
            for (int i = 0; i < fields.Length; i++) strfields[i] = fields[i] + " = " + ":" + fields[i];
            string create = "UPDATE " + table + " SET ";
            create += string.Join(", ", strfields);
            create += " WHERE " + wherefield + " = :whereequal";
            SqlCommand dbcmd = new SqlCommand(create, conn);
            //dbcmd.CommandText = create;
            for (int i = 0; i < fields.Length; i++)
            {
                dbcmd.Parameters.AddWithValue(":" + fields[i], values[i]);
            }
            dbcmd.Parameters.AddWithValue(":whereequal", whereequal);
            conn.Open();
            int ret = dbcmd.ExecuteNonQuery();
            dbcmd.Dispose();
            conn.Close();
            return ret;
        }

        //Update data with normal Sql Query
        public static int update(SqlConnection conn, string sql)
        {
            SqlCommand dbcmd = new SqlCommand(sql, conn);

            conn.Open();
            int ret = dbcmd.ExecuteNonQuery();
            dbcmd.Dispose();
            conn.Close();
            return ret;
        }

        ////Update data by passing table, attribute and values in dictionary.
        //public static int update(SQLConnection conn, string table, Dictionary<string, object> values,
        //                          string wherefield, string whereequal)
        //{
        //    List<string> k = new List<string>(values.Keys);
        //    List<string> v = new List<string>();
        //    foreach (KeyValuePair<string, object> kv in values) v.Add(kv.Value.ToString());
        //    return update(conn, table, k.ToArray(), v.ToArray(), wherefield, whereequal);
        //}

        #endregion

        #region Delete Query
        //Delete data by passing table, attribute and values in String array.
        public static void delete(SqlConnection conn, string table, string wherefield, string whereequal)
        {
            string create = "DELETE FROM " + table + " WHERE " + wherefield + " = :whereequal";
            SqlCommand dbcmd = new SqlCommand(create, conn);
            dbcmd.Parameters.AddWithValue(":whereequal", whereequal);
            conn.Open();
            int ret = dbcmd.ExecuteNonQuery();
            dbcmd.Dispose();
            conn.Close();
        }

        //Delete data by passing table, attribute and values in Dictionary.
        public static void delete(SqlConnection conn, string table, string wherestring, string[] parameters)
        {
            string create = "DELETE FROM " + table + " WHERE " + wherestring;
            SqlCommand dbcmd = new SqlCommand(create, conn);
            for (int i = 0; i < parameters.Length; i++)
            {
                dbcmd.Parameters.AddWithValue(":" + i, parameters[i]);
            }
            conn.Open();
            int ret = dbcmd.ExecuteNonQuery();
            dbcmd.Dispose();
            conn.Close();
        }

        //Delete data by passing table, attribute and values in Dictionary.
        public static void delete(SqlConnection conn, string sql)
        {
            SqlCommand dbcmd = new SqlCommand(sql, conn);

            conn.Open();
            int ret = dbcmd.ExecuteNonQuery();
            dbcmd.Dispose();
            conn.Close();
        }

        #endregion

        #region Retrieve Query
        // Retrieve results with data table //
        public static DataTable getDataTableResult(SqlConnection conn, SqlCommand comm)
        {
            DataTable dt = new DataTable("Table");
            conn.Open();
            using (SqlDataReader reader = comm.ExecuteReader(CommandBehavior.CloseConnection))
            {
                dt.Load(reader);
            }


            /*   using (IDataReader result = comm.ExecuteReader(CommandBehavior.CloseConnection))
               {
                   dt.Load(result);
               }*/


            comm.Dispose();
            conn.Close();
            return dt;
        }

        public static DataTable getDataTableResult(SqlConnection conn, string query)
        {
            SqlCommand dbcmd = new SqlCommand(query, conn);

            return getDataTableResult(conn, dbcmd);
        }



        public static DataTable getDataTableResult(SqlConnection conn, string table, string[] fields, string[] parameters)
        {
            string strQuery = " SELECT * FROM " + table;

            if (fields.Length > 0)
            {
                strQuery += " WHERE ";
                for (int i = 0; i < fields.Length; i++)
                {

                    strQuery += fields[i] + " = '" + parameters[i] + "' ";
                    if (i < fields.Length - 1)
                        strQuery += " AND ";
                }
            }
            return getDataTableResult(conn, strQuery);
        }


        #endregion
    }
}
