using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DXWebTemplate
{
    public partial class View_Plan : System.Web.UI.Page
    {
        WebReference.WebService1 ws = new WebReference.WebService1();
        DataTable dt_status = new DataTable();
        DataTable dt_register = new DataTable();
        string serial_status = "";
        string serial_register = "";
        string count = "";
        string B = "";
        int i = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            dt_register = ws.ibecon_register();

            dt_status = ws.ibecon_report();

            B1.Text = "0";
            B2.Text = "0";
            B3.Text = "0";
            B4.Text = "0";

            foreach (DataRow row in dt_register.Rows)
            {
                serial_register = row["serial_ibecon"].ToString();
                foreach (DataRow row_2 in dt_status.Rows)
                {
                    serial_status = row_2["serial_ibecon"].ToString();

                    switch (serial_status)
                    {
                        case "AC:23:3F:A0:1F:63":
                            B1.Text = row_2["CountOf"].ToString();
                            break;
                        case "AC:23:3F:A0:32:92":
                            B2.Text = row_2["CountOf"].ToString();
                            break;
                        case "AC:23:3F:24:48:55":
                            B3.Text = row_2["CountOf"].ToString();
                            break;
                        case "AC:23:3F:24:03:63":
                            B4.Text = row_2["CountOf"].ToString();
                            break;
                    }


                }
            }


           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            

        }
    }
    
}