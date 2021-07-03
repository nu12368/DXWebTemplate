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
    public partial class Search_requst_instal : System.Web.UI.Page
    {
        string prm = "";
        string Str_return = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request["t1"] != "" || Request["t2"] != "" || Request["t3"] != "" || Request["t4"] != "" || Request["t5"] != "" || Request["t6"] != "" || Request["t7"] != "")
                {
                    ///// ค้นหา 
                    Str_return = "";
                    Str_return = Searchdatalist();
                    Response.Redirect("request_instal.aspx?prmsearch=" + Str_return + "");
                }
                else
                {
                    if (Request["SubmitSearch"] != "" && Request["SubmitSearch"] != null)
                    {
                        //// ไม่ใส่ข้อมูลแล้วกดค้นหา

                        Response.Redirect("request_instal.aspx?notinput=" + "notinput");
                    }
                    else
                    {
                        ////// Response Export
                        Response.Redirect("request_instal.aspx?export=" + "export");
                    }
                }

                //if (Request["t1"] != "" || Request["t2"] != "" || Request["t3"] != "" || Request["t4"] != "" || Request["t5"] != "" || Request["t6"] != "" || Request["t7"] != "")
                //{
                //    Str_return = "";
                //    Str_return = Searchdatalist();
                //    Response.Redirect("request_instal.aspx?prmsearch=" + Str_return + "");
                //}
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
                OdbcCommand command = new OdbcCommand("SELECT pi.*,wm.numberpetition,wm.numbergauge "+
                                                        "FROM tbl_petition_information pi "+
                                                        "left join tbl_water_meter wm on pi.id = cast(wm.idpetition as integer) "+
                                                        "where wm.status='คำขอ' "+
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