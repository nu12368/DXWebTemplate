using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.Linq;
using System.Web;

namespace DXWebTemplate
{
    public class cls_command
    {
        public static DataTable dt = new DataTable("DataTable");
        public static OdbcConnection cnn = new OdbcConnection("DSN=PostgreSQLWater;UID=postgres;PWD=password@1;");

        public static Boolean InsertData(OdbcCommand command)  // InsertDatabase
        {

            command.CommandType = CommandType.Text;
            command.Connection = cnn;
            try
            {
                cnn.Open();
                command.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                Console.Write(ex.Message);
                return false;
            }
            finally
            {
                cnn.Close();
            }
        }
        public static Boolean UpdateData(OdbcCommand command)  // UpdateDatabase
        {

            command.CommandType = CommandType.Text;
            command.Connection = cnn;
            try
            {
                cnn.Open();
                command.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                Console.Write(ex.Message);
                return false;
            }
            finally
            {
                cnn.Close();
            }
        }

        public static DataTable SelectData(OdbcCommand command)  // SelectDatabase 
        {
            OdbcDataAdapter da = new OdbcDataAdapter();
            command.CommandType = CommandType.Text;
            command.Connection = cnn;
            try
            {
                cnn.Open();
                da.SelectCommand = command;
                dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                cnn.Close();
                da.Dispose();
            }
        }

        public static Boolean DeleteData(OdbcCommand command)  // DeleteData
        {

            command.CommandType = CommandType.Text;
            command.Connection = cnn;
            try
            {
                cnn.Open();
                command.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                Console.Write(ex.Message);
                return false;
            }
            finally
            {
                cnn.Close();

            }
        }


    }
}