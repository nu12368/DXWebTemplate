using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DXWebTemplate
{
    public partial class main_group : System.Web.UI.Page
    {
        string query = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("view_menu.aspx");
         //   Loaddata();
        }

        public void Loaddata() {
           // query = "select * from tbl_register where  username  = '" + Session["USERNAME"] + "' and  password = '" + Session["PASSWORD"] + "'";
            //query = "select * from tbl_register";
            //OleDbCommand cmd = new OleDbCommand(query);
            //DataTable dt = cls_command.SelectData(cmd);
        
            //DataView.DataSource = dt;
            //DataView.DataBind();
        }
    }
}