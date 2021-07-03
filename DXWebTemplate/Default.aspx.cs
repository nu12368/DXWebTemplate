using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DXWebTemplate {
    public partial class _Default : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) 
        {
         //  Response.Redirect("min_group.aspx");
            lbCopyRight.Text = Server.HtmlDecode("WACINFOTECH.CO.,LTD ");
        }

        protected void uplImageEdit_FilesUploadComplete(object sender, DevExpress.Web.FilesUploadCompleteEventArgs e)
        {

        }

       
    }
}