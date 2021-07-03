using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DXWebTemplate
{
    public partial class chk_login : System.Web.UI.Page
    {
         string sp;
         string query = "";
  
        protected void Page_Load(object sender, EventArgs e)
        {
         
            Response.Write(1);
        }
    }
}