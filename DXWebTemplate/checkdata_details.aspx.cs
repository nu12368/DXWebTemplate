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
    public partial class checkdata_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                view_user_water(Request["prmviewapprove"].ToString());

                List_information_note_watermeter(Request["prmviewapprove"].ToString());

                t38.Disabled = true;
                t39.Disabled = true;
                t40.Disabled = true;
                t41.Disabled = true;
                t42.Disabled = true;
                t43.Disabled = true;
            }
            catch (Exception ex) { 
            
            }
        }

        public void view_user_water(string id)//// ทะเบัยนผู้ใช้น้ำ
        {
            string return_petition = "";
            try
            {
                OdbcCommand command = new OdbcCommand("SELECT pi.id,wn.idwaterusernumber,wa.applicanttype,wa.title_name,wa.username,wa.lastname,wa.idcard,wa.birthday,wa.old,wa.address, " +
                                                        "wa.village,wa.alley,wa.road,wa.district,wa.prefecture,wa.province,wa.zipcode,wa.tel,wa.email,wm.numbergauge,wm.status,ap.approve, " +
                                                        "d.detailstype,d.details,d.building,d.buildingstyle,d.waterpipe,d.dateinstallgauges,d.latitude,d.longitude " +
                                                        "FROM tbl_petition_information pi " +
                                                        "left join tbl_water_meter wm on pi.id = cast(wm.idpetition as integer) " +
                                                        "left join tbl_approve ap on pi.id = cast(ap.idpetition as integer) " +
                                                        "left join tbl_water_applicant wa on pi.id = cast(wa.idpetition as integer) " +
                                                        "left join tbl_details d on pi.id = cast(d.idpetition as integer) " +
                                                        "left join tbl_authorities ah on pi.id = cast(ah.idpetition as integer) " +
                                                        "left join tbl_water_user_number wn on wm.numberpetition = wn.numberpetition  " +
                                                        "where pi.id=" + id);

                DataTable dt = cls_command.SelectData(command);

                if (dt.Rows.Count > 0)
                {
                    //return_petition = dt.Rows[0]["idwaterusernumber"].ToString() + ":" + dt.Rows[0]["applicanttype"].ToString() + ":" + dt.Rows[0]["username"].ToString() + ":" + dt.Rows[0]["lastname"].ToString() + ":" + dt.Rows[0]["idcard"].ToString() + ":" + dt.Rows[0]["birthday"].ToString() +
                    //                 ":" + dt.Rows[0]["old"].ToString() + ":" + dt.Rows[0]["address"].ToString() + ":" + dt.Rows[0]["village"].ToString() + ":" +
                    //                 dt.Rows[0]["alley"].ToString() + ":" + dt.Rows[0]["road"].ToString() + ":" + dt.Rows[0]["district"].ToString() + ":" + dt.Rows[0]["prefecture"].ToString()
                    //                 + ":" + dt.Rows[0]["province"].ToString() + ":" + dt.Rows[0]["zipcode"].ToString() + ":" + dt.Rows[0]["tel"].ToString()
                    //                 + ":" + dt.Rows[0]["email"].ToString() + ":" + dt.Rows[0]["numbergauge"].ToString()
                    //                 + ":" + dt.Rows[0]["detailstype"].ToString() + ":" + dt.Rows[0]["details"].ToString()
                    //                 + ":" + dt.Rows[0]["building"].ToString() + ":" + dt.Rows[0]["buildingstyle"].ToString()
                    //                 + ":" + dt.Rows[0]["waterpipe"].ToString() + ":" + dt.Rows[0]["dateinstallgauges"].ToString()
                    //                 + ":" + dt.Rows[0]["latitude"].ToString() + ":" + dt.Rows[0]["longitude"].ToString();

                    t38.Value = dt.Rows[0]["idwaterusernumber"].ToString();
                    t39.Value = dt.Rows[0]["title_name"].ToString() + dt.Rows[0]["username"].ToString() + " " + dt.Rows[0]["lastname"].ToString();
                    t40.Value = dt.Rows[0]["numbergauge"].ToString();
                    t41.Value = "เลขที่ " + dt.Rows[0]["address"].ToString() + " " + "ม. " + dt.Rows[0]["village"].ToString()
                        + " " + "ซ. " + dt.Rows[0]["alley"].ToString() + " " + "ถ. " + dt.Rows[0]["road"].ToString()
                        + " " + "ต. " + dt.Rows[0]["district"].ToString() + " " + "อ. " + dt.Rows[0]["prefecture"].ToString()
                        + " " + "จ. " + dt.Rows[0]["province"].ToString();


                  
                }
                else
                {
                    return_petition = "";
                }
            }
            catch (Exception ex)
            {
            }
        }


        public void List_information_note_watermeter(string idpetition)
        {

            string information_note_watermeter = "";
            try
            {
                OdbcCommand command = new OdbcCommand("SELECT pi.id,ud.idwaterusernumber,ud.title_name,ud.username,ud.lastname,wm.numbergauge, " +
                                                        "ud.datethistime,ud.numberthistime,ud.datelasttime,ud.numberlasttime,ud.amountused, " +
                                                        "ud.waterbill,ud.maintenancefee,ud.overdue,ud.sum,ud.statuswaterbill,ud.invoicenumber, " +
                                                        "ud.latitude,ud.longitude " +
                                                        "FROM tbl_upload_data ud " +
                                                        "left join tbl_water_user_number wn on ud.idwaterusernumber = wn.idwaterusernumber " +
                                                        "left join tbl_water_meter wm  on wn.numberpetition = wm.numberpetition " +
                                                        "left join tbl_water_applicant wa on wm.idpetition = wa.idpetition " +
                                                        "left join tbl_petition_information pi on pi.id = cast(wm.idpetition as integer) " +
                                                        "where(wm.status='อนุมัติ') and pi.id=" + idpetition);
                DataTable dt = cls_command.SelectData(command);

                DataRow datarow;
                DataTable dt2 = new DataTable();
                dt2.Columns.Add("id", typeof(string));
                dt2.Columns.Add("datethistime", typeof(string));
                dt2.Columns.Add("numberthistime", typeof(string));
                dt2.Columns.Add("datelasttime", typeof(string));
                dt2.Columns.Add("numberlasttime", typeof(string));
                dt2.Columns.Add("amountused", typeof(string));
                dt2.Columns.Add("waterbill", typeof(string));
                dt2.Columns.Add("maintenancefee", typeof(string));
                dt2.Columns.Add("sum", typeof(string));
                dt2.Columns.Add("statuswaterbill", typeof(string));


                for (int j = 0; j < dt.Rows.Count; j++)
                {
                    t42.Value = dt.Rows[0]["invoicenumber"].ToString();
                    t43.Value = dt.Rows[0]["title_name"].ToString() + dt.Rows[0]["username"].ToString() + " " + dt.Rows[0]["lastname"].ToString();
                   


                    datarow = dt2.NewRow();
                    datarow["id"] = dt.Rows[j]["id"].ToString();
                    datarow["datethistime"] = dt.Rows[j]["datethistime"].ToString();
                    datarow["numberthistime"] = dt.Rows[j]["numberthistime"].ToString();
                    datarow["datelasttime"] = dt.Rows[j]["datelasttime"].ToString();
                    datarow["numberlasttime"] = dt.Rows[j]["numberlasttime"];
                    datarow["amountused"] = dt.Rows[j]["amountused"];
                    datarow["waterbill"] = dt.Rows[j]["waterbill"];
                    datarow["maintenancefee"] = dt.Rows[j]["maintenancefee"];
                    datarow["sum"] = dt.Rows[j]["sum"];
                    datarow["statuswaterbill"] = dt.Rows[j]["statuswaterbill"];
                    dt2.Rows.Add(datarow);

                }

                ASPxGridView2.DataSource = dt2;
                ASPxGridView2.DataBind();
                ASPxGridView2.KeyFieldName = "id";
            }
            catch (Exception ex)
            {
                information_note_watermeter = "";
            }

        }
    }
}