using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.Data.OleDb;
using System.Linq;
using System.Web;

namespace DXWebTemplate
{
    public class clsVar
    {
        public static OdbcConnection conpub { get; set; }
        public static string strview { get; set; }


        public static string datatableTojson(DataTable dt)
        {
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            string Json = serializer.Serialize(rows);

            return Json;
        }

        public static DataTable jsontodatatable(string _json)
        {
            try
            {
                var table = JsonConvert.DeserializeObject<DataTable>(_json);
                table.TableName = "t1";
                return table;
            }
            catch (Exception ex)
            {
                return null;
            }

        }

        public static string Generateidwaterusernumber()
        {
        j:
            Random random = new Random();
            string r = "";
            int i;
            for (i = 1; i < 11; i++)
            {
                r += random.Next(0, 9).ToString();
            }

            OdbcCommand command = new OdbcCommand("select * from  tbl_water_user_number where idwaterusernumber ='" + r + "'");
            DataTable dt = cls_command.SelectData(command);
            if (dt.Rows.Count > 0)
            {
                goto j;
            }
            else
            {
                return r;
            }

        }

    }
}