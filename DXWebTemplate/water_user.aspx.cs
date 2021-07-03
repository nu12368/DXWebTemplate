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
    public partial class root : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //if (!Page.IsPostBack)
                //{
                    Session["prmviewapprove"] = "";
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
                        List_Search(Request["prmsearch"].ToString());  ////ค้นหา
                    }
                    else
                    {
                        List_Request(); /// โหลดข้อมูล
                    }
                //}

            }
            catch (Exception ex) { }
        }

       

        public void List_Search(string listsearch)////// ค้นหา
        {
            try
            {

                DataTable dt = clsVar.jsontodatatable(listsearch);
                DataRow datarow;
                DataTable dt2 = new DataTable();
                dt2.Columns.Add("id", typeof(int));
                dt2.Columns.Add("number", typeof(string));
                dt2.Columns.Add("idwaterusernumber", typeof(string));
                dt2.Columns.Add("username", typeof(string));
                dt2.Columns.Add("address", typeof(string));
                dt2.Columns.Add("village", typeof(string));
                dt2.Columns.Add("district", typeof(string));
                dt2.Columns.Add("detailstype", typeof(string));
                dt2.Columns.Add("numbergauge", typeof(string));
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
                    datarow["address"] = dt.Rows[j]["address"].ToString();
                    datarow["village"] = dt.Rows[j]["village"].ToString();
                    datarow["district"] = dt.Rows[j]["district"].ToString();
                    datarow["detailstype"] = dt.Rows[j]["detailstype"];
                    datarow["numbergauge"] = dt.Rows[j]["numbergauge"];
                    datarow["status1"] = "ปกติ";
                    datarow["status"] = "ปกติ";
                    dt2.Rows.Add(datarow);
                    _number = _number + 1;
                }
                Grid.DataSource = dt2;
                Grid.DataBind();
                Grid.KeyFieldName = "id";
             
                int count = dt.Rows.Count;
            }
            catch (Exception ex) { }
            divsearch.Style.Add("display", "block");
        }
        public void List_Request() //////// โหลดหน้าแรก
        {
            try
            {
                OdbcCommand command = new OdbcCommand("SELECT pi.id,wn.idwaterusernumber,wa.idpetition,wa.title_name,wa.username,wa.lastname, " +
                                                        "wa.address,wm.numberpetition,wa.village,wa.district, "+
                                                        "d.detailstype,wm.numbergauge,wm.status,ap.approve,ap.note "+
                                                        "FROM tbl_petition_information pi "+
                                                        "left join tbl_water_meter wm on pi.id = cast(wm.idpetition as integer) "+
                                                        "left join tbl_approve ap on pi.id = cast(ap.idpetition as integer) "+
                                                        "left join tbl_water_applicant wa on pi.id = cast(wa.idpetition as integer) "+
                                                        "left join tbl_details d on pi.id = cast(d.idpetition as integer) "+
                                                        "left join tbl_authorities ah on pi.id = cast(ah.idpetition as integer) "+
                                                        "left join tbl_water_user_number wn on wm.numberpetition = wn.numberpetition "+
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
                Grid.DataSource = dt2;
                Grid.DataBind();
                Grid.KeyFieldName = "id";
                int count = dt.Rows.Count;
               
            }
            catch (Exception ex) { }
        }

        protected void ASPxGridView2_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)////// ดับเบิลคลิก
        {
            if (!Page.IsPostBack)
            {
                if (e.VisibleIndex >= 0)
                {
                    string id = Grid.GetRowValues(Convert.ToInt32(e.VisibleIndex), "id").ToString();
                    for (int i = 0; i < 10; i++)
                    {
                        e.Row.Cells[i].Attributes.Add("ondblclick", "window.open('view_user_water.aspx?prmviewapprove=" + id + "','newWindow', 'width=1024,height=700,left=100,top=60,resizable=yes')");
                    }
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
                GridExport.PageHeader.Left = "ทะเบียนผู้ใช้น้ำ";
                GridExport.FileName = "ทะเบียนผู้ใช้น้ำ";
                GridExport.WriteXlsToResponse();
            }
            catch (Exception ex)
            { }
        }

        protected void Unnamed_ServerClick1(object sender, EventArgs e)
        {
         string Str =   Searchdatalist();

         List_Search(Str);
        }
        public string Searchdatalist()
        {
            string return_search = "";
            try
            {

                OdbcCommand command = new OdbcCommand("SELECT pi.id,wn.idwaterusernumber,wa.idpetition,wa.title_name,wa.username,wa.lastname,wa.address,wm.numberpetition,wa.village,wa.district,d.detailstype,wm.numbergauge,wm.status,ap.approve,ap.note " +
                                                        "FROM tbl_petition_information pi " +
                                                        "left join tbl_water_meter wm on pi.id = cast(wm.idpetition as integer) " +
                                                        "left join tbl_approve ap on pi.id = cast(ap.idpetition as integer) " +
                                                        "left join tbl_water_applicant wa on pi.id = cast(wa.idpetition as integer) " +
                                                        "left join tbl_details d on pi.id = cast(d.idpetition as integer) " +
                                                        "left join tbl_authorities ah on pi.id = cast(ah.idpetition as integer) " +
                                                        "left join tbl_water_user_number wn on wm.numberpetition = wn.numberpetition " +
                                                        "where((wm.status='อนุมัติ') " +
                                                        "and (wn.idwaterusernumber LIKE '%" + Request["t1"] + "%' " +
                                                        "and pi.username LIKE'%" + Request["t2"] + "%' " +
                                                        "and pi.lastname LIKE'%" + Request["t3"] + "%' " +
                                                        "and pi.village LIKE'%" + Request["t4"] + "%' " +
                                                        "and pi.district LIKE'%" + Request["t5"] + "%' " +
                                                        "and pi.prefecture LIKE'%" + Request["t6"] + "%' " +
                                                        "and pi.province LIKE'%" + Request["t7"] + "%'))");
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