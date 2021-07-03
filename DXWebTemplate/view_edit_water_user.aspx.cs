using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DXWebTemplate
{
    public partial class view_edit_water_user : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                result.Text = "";
                if (Request["prmviewapprove"] != null && Request["prmviewapprove"] != "")
                {
                    ListViewUser(Int32.Parse(Request["prmviewapprove"].ToString()));
                }

                if (Request["prm"] != null && Request["prm"] != "")
                {
                    ListViewUser(Int32.Parse(Request["prm"].ToString()));
                }
            }
            catch (Exception ex) { }

        }
        public void ListViewUser(int id)
        {
            try
            {
                OdbcCommand command = new OdbcCommand("SELECT * FROM tbl_petition_information where id=" + id);
                DataTable dt = cls_command.SelectData(command);

                if (dt.Rows.Count > 0)
                {
                    iduser.Value = dt.Rows[0]["id"].ToString();
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}