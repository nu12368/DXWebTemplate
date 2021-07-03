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
    public partial class checkdata : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
               // if (!Page.IsPostBack)
               // {
                   
                        List_Request();
                   
                //}
            }
            catch (Exception ex) { }
        }
     
        public void List_Request()
        {
            try
            {
                OdbcCommand command = new OdbcCommand("SELECT pi.id,ud.idwaterusernumber,wa.title_name,wa.username,wa.lastname,wm.numbergauge, "+
                                                        "ud.datethistime,ud.numberthistime,ud.datelasttime,ud.numberlasttime,ud.amountused, "+
                                                        "ud.waterbill,ud.maintenancefee,ud.overdue,ud.sum,ud.statuswaterbill,ud.invoicenumber, "+
                                                        "ud.latitude,ud.longitude "+
                                                        "FROM tbl_upload_data ud "+
                                                        "left join tbl_water_user_number wn on ud.idwaterusernumber = wn.idwaterusernumber "+
                                                        "left join tbl_water_meter wm  on wn.numberpetition = wm.numberpetition "+
                                                        "left join tbl_water_applicant wa on wm.idpetition = wa.idpetition " +
                                                        "left join tbl_petition_information pi on pi.id = cast(wm.idpetition as integer) " +
                                                        "where(wm.status='อนุมัติ')");
                DataTable dt = cls_command.SelectData(command);
                DataRow datarow;
                DataTable dt2 = new DataTable();
                dt2.Columns.Add("id", typeof(int));
                dt2.Columns.Add("number", typeof(string));
                dt2.Columns.Add("idwaterusernumber", typeof(string));
                dt2.Columns.Add("username", typeof(string));
                dt2.Columns.Add("numbergauge", typeof(string));
                dt2.Columns.Add("datethistime", typeof(string));
                dt2.Columns.Add("numberthistime", typeof(string));
                dt2.Columns.Add("datelasttime", typeof(string));
                dt2.Columns.Add("numberlasttime", typeof(string));
                dt2.Columns.Add("amountused", typeof(string));
                dt2.Columns.Add("waterbill", typeof(string));
                dt2.Columns.Add("maintenancefee", typeof(string));
                dt2.Columns.Add("overdue", typeof(string));
                dt2.Columns.Add("sum", typeof(string));
                dt2.Columns.Add("statuswaterbill", typeof(string));
                dt2.Columns.Add("invoicenumber", typeof(string));
                dt2.Columns.Add("latitude", typeof(string));
                dt2.Columns.Add("longitude", typeof(string));
                int _number = 1;

                for (int j = 0; j < dt.Rows.Count; j++)
                {
                    datarow = dt2.NewRow();
                    datarow["id"] = dt.Rows[j]["id"].ToString();
                    datarow["number"] = _number;
                    datarow["idwaterusernumber"] = dt.Rows[j]["idwaterusernumber"];
                    datarow["username"] = dt.Rows[j]["title_name"].ToString() + dt.Rows[j]["username"].ToString() + " " + dt.Rows[j]["lastname"].ToString();
                    datarow["numbergauge"] = dt.Rows[j]["numbergauge"].ToString();
                    datarow["datethistime"] = dt.Rows[j]["datethistime"].ToString();
                    datarow["numberthistime"] = dt.Rows[j]["numberthistime"].ToString();
                    datarow["datelasttime"] = dt.Rows[j]["datelasttime"].ToString();
                    datarow["numberlasttime"] = dt.Rows[j]["numberlasttime"];
                    datarow["amountused"] = dt.Rows[j]["amountused"];
                    datarow["waterbill"] = dt.Rows[j]["waterbill"];
                    datarow["maintenancefee"] = dt.Rows[j]["maintenancefee"];
                    datarow["overdue"] = dt.Rows[j]["overdue"];
                    datarow["sum"] = dt.Rows[j]["sum"];
                    datarow["statuswaterbill"] = dt.Rows[j]["statuswaterbill"];
                    datarow["invoicenumber"] = dt.Rows[j]["invoicenumber"];
                    datarow["latitude"] = dt.Rows[j]["latitude"];
                    datarow["longitude"] = dt.Rows[j]["longitude"];
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

                for (int i = 0; i <= 14; i++)
                {
                    e.Row.Cells[i].Attributes.Add("ondblclick", "window.open('checkdata_details.aspx?prmviewapprove=" + id + "','newWindow', 'width=1000,height=600,left=100,top=100,resizable=yes')");
                }
            }
        }


        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            GridExport.PageHeader.Left = "ทะเบียนผู้ใช้น้ำ";
            GridExport.FileName = "ทะเบียนผู้ใช้น้ำ";
            GridExport.WriteXlsToResponse();
        }


    }
}