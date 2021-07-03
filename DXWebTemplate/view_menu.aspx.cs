using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DXWebTemplate
{
    public partial class view_menu : System.Web.UI.Page
    {
        NavBarGroup navBar = new NavBarGroup();
        NavBarItem navItem = new NavBarItem();
        string query = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                LoadMenu();
            }
        }

        public void LoadMenu()
        {
            OdbcCommand com = new OdbcCommand("SELECT * FROM tbl_list_menu order by id asc");
            DataTable dt = cls_command.SelectData(com);

           

            DataView dv = new DataView(dt);
            dv.RowFilter = "m_id=0";
            int i = 0;
            foreach (DataRowView row in dv)
            {
                navBar = new NavBarGroup(row.Row["menu"].ToString());
                DataView dtviewSub = new DataView(dt);
                dtviewSub.RowFilter = "m_id=" + row.Row["id"].ToString();
                foreach (DataRowView rov in dtviewSub)
                {
                    string icon = "";

                    if (dtviewSub.Table.Rows.Count != 0)
                    {
                        icon = "images/menu_icon/" + rov.Row["menu_icon"].ToString();
                    }
                    else
                    {
                        icon = "images/menu_icon/no.png";
                    }
                    i = i + 1;
                    navItem = new NavBarItem(rov.Row["menu"].ToString(),
                                              rov.Row["menu"].ToString(), icon,
                                              "javascript:CallLink('" + rov.Row["menu_url"].ToString() + "','','" + rov.Row["menu"].ToString() + "');");
                    navBar.Items.Add(navItem);
                }
                ASPxNavBar1.Groups.Add(navBar);
            }


            try
            {
                if (dt.Rows.Count != 0)
                {
                    lbChkUser.Text = "water_user.aspx";
                }
                ASPxNavBar1.Groups[0].NavBar.Items[0].Selected = true;
            }
            catch (Exception ex)
            {

            }

        }
    }
}