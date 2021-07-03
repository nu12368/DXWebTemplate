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
    public partial class search_change_user_water : System.Web.UI.Page
    {
        string prm = "";
        string Str_return = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request["t1"] != "" || Request["t2"] != "" || Request["t3"] != "" || Request["t4"] != "" || Request["t5"] != "" || Request["t6"] != "" || Request["t7"] != "")
                {
                    Str_return = "";
                    Str_return = Searchdatalist();
                    Response.Redirect("change_user_water.aspx?prmsearch=" + Str_return + "");
                }
                else
                {
                    if (Request["SubmitSearch"] != "" && Request["SubmitSearch"] != null)
                    {
                        //// ไม่ใส่ข้อมูลแล้วกดค้นหา

                        Response.Redirect("change_user_water.aspx?notinput=" + "notinput");
                    }
                    else
                    {
                        ////// Response Export
                        Response.Redirect("change_user_water.aspx?export=" + "export");
                    }
                }
            }
            catch (Exception ex)
            {

            }


        }

        public string Searchdatalist()
        {
            string return_search = "";
            try
            {

                OdbcCommand command = new OdbcCommand("SELECT pi.id,wn.idwaterusernumber,wa.idpetition,wa.title_name,wa.username,wa.lastname, " +
                                                        "wa.address,wm.numberpetition,wa.village,wa.district, " +
                                                        "d.detailstype,wm.numbergauge,wm.status,ap.approve,ap.note,pi.datepetition " +
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