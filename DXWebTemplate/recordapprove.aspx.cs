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
    public partial class recordapprove : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Session["prmapprovetrue"] = "";
                Session["prmsend"] = "";


                if (Request["export"] != "" && Request["export"] != null)   //// Export เพราะใช้ method="POST" เลยเช็คตรงนี้
                {
                    ExportExcel();
                }

                if (Request["notinput"] != "" && Request["notinput"] != null)   //// ไม่ใส่ข้อมูลแล้วกดค้นหา
                {
                    return;
                }


                List_Request();
            }
            catch (Exception ex) { }
        }
        public void List_Request()
        {
            try
            {
                OdbcCommand command = new OdbcCommand("SELECT pi.*,wm.numberpetition,wm.numbergauge,wm.status,ap.dateapprove,ap.approve,ap.note FROM tbl_petition_information pi " +
                                                            "left join tbl_water_meter wm on pi.id = cast(wm.idpetition as integer) "+
                                                            "left join tbl_approve ap on pi.id = cast(ap.idpetition as integer) "+
                                                            "where(wm.status='อนุมัติ')");
                DataTable dt = cls_command.SelectData(command);
                DataRow datarow;
                DataTable dt2 = new DataTable();
                dt2.Columns.Add("id", typeof(int));
                dt2.Columns.Add("number", typeof(string));
                dt2.Columns.Add("username", typeof(string));
                dt2.Columns.Add("dateapprove", typeof(string));
                dt2.Columns.Add("approve", typeof(string));
                dt2.Columns.Add("note", typeof(string));
                int _number = 1;
                string spprove = "";
                for (int j = 0; j < dt.Rows.Count; j++)
                {
                    datarow = dt2.NewRow();
                    datarow["id"] = dt.Rows[j]["id"].ToString();
                    datarow["number"] = _number;
                    datarow["username"] ="admin";
                    datarow["dateapprove"] = dt.Rows[j]["dateapprove"].ToString();

                    if (dt.Rows[j]["approve"].ToString() == "approve")
                    {
                        spprove = "อนุมัติ";
                    }
                    else
                    {
                        spprove = "ไม่อนุมัติ";
                    }

                    datarow["approve"] = spprove;
                    datarow["note"] = dt.Rows[j]["note"].ToString();
                  
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

                for (int i = 0; i <= 4; i++)
                {
                   e.Row.Cells[i].Attributes.Add("ondblclick", "window.open('new_water.aspx?prmviewapprove=" + id + "','newWindow', 'width=1024,height=700,left=100,top=60,resizable=yes')");
                }
            }
        }

      
        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            ExportExcel();
        }

        public void ExportExcel()
        {
            try
            {
                GridExport.PageHeader.Left = "ประวัติการอนุมัติ";
                GridExport.FileName = "ประวัติการอนุมัติ";
                GridExport.WriteXlsToResponse();
            }
            catch (Exception ex)
            { }
        }
    }
}