using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.XtraReports.UI;
using System.Data;
using System.Data.Odbc;
namespace DXWebTemplate
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          //  DataTable dt = new DataTable();
          //  dt = List_Request();
          ////  XtraReport3 report = new XtraReport3();

          //  foreach (DevExpress.XtraReports.Parameters.Parameter p in report.Parameters)
          //      p.Visible = false;
          //  report.StrValue(dt.Rows[0]["idwaterusernumber"].ToString(), dt.Rows[0]["username"].ToString());

          
          //  ASPxDocumentViewer1.Report = report;
          //  ASPxDocumentViewer1.DataBind();  
        }


        public DataTable List_Request() //////// โหลดหน้าแรก
        {
            try
            {
                OdbcCommand command = new OdbcCommand("SELECT pi.id,wn.idwaterusernumber,wa.idpetition,wa.title_name,wa.username,wa.lastname, " +
                                                        "wa.address,wm.numberpetition,wa.village,wa.district, " +
                                                        "d.detailstype,wm.numbergauge,wm.status,ap.approve,ap.note " +
                                                        "FROM tbl_petition_information pi " +
                                                        "left join tbl_water_meter wm on pi.id = cast(wm.idpetition as integer) " +
                                                        "left join tbl_approve ap on pi.id = cast(ap.idpetition as integer) " +
                                                        "left join tbl_water_applicant wa on pi.id = cast(wa.idpetition as integer) " +
                                                        "left join tbl_details d on pi.id = cast(d.idpetition as integer) " +
                                                        "left join tbl_authorities ah on pi.id = cast(ah.idpetition as integer) " +
                                                        "left join tbl_water_user_number wn on wm.numberpetition = wn.numberpetition " +
                                                        "where(wm.status='อนุมัติ')");
                DataTable dt = cls_command.SelectData(command);
                DataRow datarow;
                DataTable dt2 = new DataTable();
                dt2.Columns.Add("id", typeof(int));
                dt2.Columns.Add("number", typeof(string));
                dt2.Columns.Add("idwaterusernumber", typeof(string));
                dt2.Columns.Add("username", typeof(string));
                dt2.Columns.Add("addressinstal", typeof(string));
                dt2.Columns.Add("address", typeof(string));
                dt2.Columns.Add("village", typeof(string));
                dt2.Columns.Add("district", typeof(string));
                dt2.Columns.Add("detailstype", typeof(string));
                dt2.Columns.Add("numbergauge", typeof(string));
                dt2.Columns.Add("checkstatus", typeof(string));
                dt2.Columns.Add("status1", typeof(string));
                dt2.Columns.Add("status", typeof(string));
                int _number = 1;

                for (int j = 0; j < dt.Rows.Count; j++)
                {
                    datarow = dt2.NewRow();
                    datarow["id"] = dt.Rows[j]["id"].ToString();
                    datarow["number"] = _number;
                    datarow["idwaterusernumber"] = dt.Rows[j]["idwaterusernumber"];
                    datarow["username"] = dt.Rows[j]["title_name"].ToString() + dt.Rows[j]["username"].ToString() + " " + dt.Rows[j]["lastname"].ToString();
                    datarow["addressinstal"] = "";
                    datarow["address"] = dt.Rows[j]["address"].ToString();
                    datarow["village"] = dt.Rows[j]["village"].ToString();
                    datarow["district"] = dt.Rows[j]["district"].ToString();
                    datarow["detailstype"] = dt.Rows[j]["detailstype"];
                    datarow["numbergauge"] = dt.Rows[j]["numbergauge"];
                    datarow["checkstatus"] = "";
                    datarow["status1"] = "ปกติ";
                    datarow["status"] = "ปกติ";
                    dt2.Rows.Add(datarow);
                    _number = _number + 1;
                }

                return dt2;
            }
            catch (Exception ex) {
                return null;
            }
        }
    }
}