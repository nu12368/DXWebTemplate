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
    public partial class approve_request : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Session["prmsend"] = "";

                if (Request["export"] != "" && Request["export"] != null)   //// Export เพราะใช้ method="POST" เลยเช็คตรงนี้
                {
                    ExportExcel();
                }

                if (Request["notinput"] != "" && Request["notinput"] != null)   //// ไม่ใส่ข้อมูลแล้วกดค้นหา
                {
                    return;
                }




                if (Request["prmsearch"] != "" && Request["prmsearch"] != null)
                {
                    List_Search(Request["prmsearch"].ToString());
                }
                else
                {
                    List_Request();
                }
               
            }
            catch (Exception ex) { }
        }

        public void List_Search(string listsearch)
        {
            try
            {

                DataTable dt = clsVar.jsontodatatable(listsearch);
                DataRow datarow;
                DataTable dt2 = new DataTable();
                dt2.Columns.Add("id", typeof(int));
                dt2.Columns.Add("number", typeof(string));
                dt2.Columns.Add("username", typeof(string));
                dt2.Columns.Add("address", typeof(string));
                dt2.Columns.Add("village", typeof(string));
                dt2.Columns.Add("district", typeof(string));
                dt2.Columns.Add("numbergauge", typeof(string));
                dt2.Columns.Add("numberpetition", typeof(string));
                dt2.Columns.Add("datepetition", typeof(string));
                dt2.Columns.Add("status", typeof(string));
                int _number = 1;

                for (int j = 0; j < dt.Rows.Count; j++)
                {
                    datarow = dt2.NewRow();
                    datarow["id"] = dt.Rows[j]["id"].ToString();
                    datarow["number"] = _number;
                    datarow["username"] = dt.Rows[j]["title_name"].ToString() + dt.Rows[j]["username"].ToString() + " " + dt.Rows[j]["lastname"].ToString();
                    datarow["address"] = dt.Rows[j]["address"].ToString();
                    datarow["village"] = dt.Rows[j]["village"].ToString();
                    datarow["district"] = dt.Rows[j]["district"].ToString();
                    datarow["numbergauge"] = dt.Rows[j]["numbergauge"];
                    datarow["numberpetition"] = dt.Rows[j]["numberpetition"];
                    datarow["datepetition"] = dt.Rows[j]["datepetition"].ToString();
                    datarow["status"] = dt.Rows[j]["status"].ToString();
                    dt2.Rows.Add(datarow);
                    _number = _number + 1;
                }
                ASPxGridView2.DataSource = dt2;
                ASPxGridView2.DataBind();
                ASPxGridView2.KeyFieldName = "id";
             
                int count = dt.Rows.Count;
            }
            catch (Exception ex) { }
            divsearch.Style.Add("display", "block");
        }
        public void List_Request()
        {
            try
            {
                OdbcCommand command = new OdbcCommand("SELECT pi.*,wm.numberpetition,wm.numbergauge,wm.status FROM tbl_petition_information pi " +
                                                        "left join " +
                                                        "tbl_water_meter wm on pi.id = cast(wm.idpetition as integer) " +
                                                            "where(wm.status='รออนุมัติ') order by pi.id desc");
                DataTable dt = cls_command.SelectData(command);
                DataRow datarow;
                DataTable dt2 = new DataTable();
                dt2.Columns.Add("id", typeof(int));
                dt2.Columns.Add("number", typeof(string));
                dt2.Columns.Add("username", typeof(string));
                dt2.Columns.Add("address", typeof(string));
                dt2.Columns.Add("village", typeof(string));
                dt2.Columns.Add("district", typeof(string));
                dt2.Columns.Add("numbergauge", typeof(string));
                dt2.Columns.Add("numberpetition", typeof(string));
                dt2.Columns.Add("datepetition", typeof(string));
                dt2.Columns.Add("status", typeof(string));
                int _number = 1;

                for (int j = 0; j < dt.Rows.Count; j++)
                {
                    datarow = dt2.NewRow();
                    datarow["id"] = dt.Rows[j]["id"].ToString();
                    datarow["number"] = _number;
                    datarow["username"] = dt.Rows[j]["title_name"].ToString() + dt.Rows[j]["username"].ToString() + " " + dt.Rows[j]["lastname"].ToString();
                    datarow["address"] = dt.Rows[j]["address"].ToString();
                    datarow["village"] = dt.Rows[j]["village"].ToString();
                    datarow["district"] = dt.Rows[j]["district"].ToString();
                    datarow["numbergauge"] = dt.Rows[j]["numbergauge"];
                    datarow["numberpetition"] = dt.Rows[j]["numberpetition"];
                    datarow["datepetition"] = dt.Rows[j]["datepetition"].ToString();
                    datarow["status"] = dt.Rows[j]["status"].ToString();
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

                for (int i = 0; i <= 8; i++)
                {
                    e.Row.Cells[i].Attributes.Add("ondblclick", "window.open('new_water.aspx?prmapprovetrue=" + id + "','newWindow', 'width=1024,height=700,left=100,top=60,resizable=yes')");
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
                GridExport.PageHeader.Left = "การอนุมัติติดตั้งน้ำประปา";
                GridExport.FileName = "การอนุมัติติดตั้งน้ำประปา";
                GridExport.WriteXlsToResponse();
            }
            catch (Exception ex)
            { }
        }

        protected void Unnamed_ServerClick1(object sender, EventArgs e)
        {
            string Str = Searchdatalist();

            List_Search(Str);
        }
        public string Searchdatalist()
        {
            string return_search = "";
            try
            {

                OdbcCommand command = new OdbcCommand("SELECT pi.*,wm.numberpetition,wm.numbergauge,wm.status " +
                                                        "FROM tbl_petition_information pi " +
                                                        "left join tbl_water_meter wm on pi.id = cast(wm.idpetition as integer) " +
                                                        "where wm.status='รออนุมัติ' " +
                                                        "and pi.username  LIKE'%" + Request["t1"] + "%' " +
                                                        "and pi.lastname LIKE'%" + Request["t2"] + "%' " +
                                                        "and pi.address LIKE'%" + Request["t3"] + "%' " +
                                                        "and pi.village LIKE'%" + Request["t4"] + "%' " +
                                                        "and pi.district LIKE'%" + Request["t5"] + "%' " +
                                                        "and pi.prefecture LIKE'%" + Request["t6"] + "%' " +
                                                        "and pi.province LIKE'%" + Request["t7"] + "%' " +
                                                        "order by pi.id desc");

                DataTable dt = cls_command.SelectData(command);
                if (dt.Rows.Count > 0)
                {
                    return_search = clsVar.datatableTojson(dt);
                }
                else
                {
                    return_search = "";
                }
            }
            catch (Exception ex) { }

            return return_search;
        }
    }
}