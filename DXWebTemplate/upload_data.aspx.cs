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
    public partial class upload_data : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                List_Request();
            }
            catch (Exception ex) { }
        }
        public void List_Request()
        {
            try
            {
                OdbcCommand command = new OdbcCommand("SELECT pi.id,up.number_device,up.dateupload,wa.title_name,wa.username,wa.lastname,up.status,up.details " +
                                                            "FROM tbl_upload_data up "+
                                                            "left join tbl_water_user_number wn on up.idwaterusernumber = wn.idwaterusernumber "+
                                                            "left join tbl_water_meter wm on wm.numberpetition = wn.numberpetition "+
                                                            "left join tbl_water_applicant wa on wm.idpetition = wa.idpetition " +
                                                             "left join tbl_petition_information pi on cast(wa.idpetition as integer) = pi.id " +
                                                            "where(wm.status='อนุมัติ')");
                DataTable dt = cls_command.SelectData(command);
                DataRow datarow;
                DataTable dt2 = new DataTable();
                dt2.Columns.Add("id", typeof(int));
                dt2.Columns.Add("number", typeof(string));
                dt2.Columns.Add("number_device", typeof(string));
                dt2.Columns.Add("dateupload", typeof(string));
                dt2.Columns.Add("username", typeof(string));
                dt2.Columns.Add("status", typeof(string));
                dt2.Columns.Add("details", typeof(string));
                int _number = 1;
                string spprove = "";
                for (int j = 0; j < dt.Rows.Count; j++)
                {
                    datarow = dt2.NewRow();
                    datarow["id"] = dt.Rows[j]["id"].ToString();
                    datarow["number"] = _number;
                    datarow["number_device"] = dt.Rows[j]["number_device"].ToString();
                    datarow["dateupload"] = dt.Rows[j]["dateupload"].ToString();
                    datarow["username"] = dt.Rows[j]["title_name"].ToString() + dt.Rows[j]["username"].ToString() + " " + dt.Rows[j]["lastname"].ToString();
                    datarow["status"] = dt.Rows[j]["status"].ToString();
                    datarow["details"] = dt.Rows[j]["details"].ToString();
                    dt2.Rows.Add(datarow);
                    _number = _number + 1;
                }


                ASPxGridView2.DataSource = dt2;
                ASPxGridView2.DataBind();
                ASPxGridView2.KeyFieldName = "id";


                int count = dt.Rows.Count;
            }
            catch (Exception ex) { }
        }
        protected void ASPxGridView2_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.VisibleIndex >= 0)
            {
                string id = ASPxGridView2.GetRowValues(Convert.ToInt32(e.VisibleIndex), "id").ToString();

                for (int i = 0; i <= 5; i++)
                {
                    e.Row.Cells[i].Attributes.Add("ondblclick", "window.open('details_water.aspx?prmviewapprove=" + id + "','newWindow', 'width=500,height=200,left=100,top=60,resizable=yes')");
                }
            }
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            GridExport.PageHeader.Left = "upload data";
            GridExport.FileName = "upload data";
            GridExport.WriteXlsToResponse();
        }
    }
}