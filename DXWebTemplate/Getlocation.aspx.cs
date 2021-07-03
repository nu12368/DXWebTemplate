using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DXWebTemplate
{
    public partial class Getlocation : System.Web.UI.Page
    {
        WebReference.WebService2 ws = new WebReference.WebService2();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Response.Write(ws.ViewGps_Location());

            }
            catch (Exception ex) { 
            
            }
        }
    }
}