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
    public partial class selectdata : System.Web.UI.Page
    {
        string prm = "";
        string Strpetition = "";
        string StrMeter = "";
        string Strwater_applicant = "";
        string Strdetails = "";
        string Strauthorities = "";
        string Str_return = "";
        string Str_approve = "";
        string Str_details_notewatermeter = "";
        string Str_view_user_water = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Session["prmsend"] = "";
                prm = Request["prm_id"];
                if (Request["prm_id"] != "" && Request["prm_id"] != null)
                {
                   Strpetition= List_petition_information(prm);
                   StrMeter = List_Meter(prm);
                   Strwater_applicant =  List_water_applicant(prm);
                   Strdetails = List_details(prm);
                   Strauthorities = List_authorities(prm);
                   Str_approve = List_approve(prm);
                   Str_view_user_water = view_user_water(prm);
                   Str_return = Strpetition + ";" + StrMeter + ";" + Strwater_applicant + ";" + Strdetails + ";" + Strauthorities + ";" + Str_approve + ";" + Str_view_user_water;
                }

                if (Request["prm_view"] != "" && Request["prm_view"] != null)
                {
                    Str_return = view_user_water(Request["prm_view"].ToString()); //// ทะเบัยนผู้ใช้น้ำ
                }
                


                if (Request["prm_edit_view"] != "" && Request["prm_edit_view"] != null) ///แก้ไขทะเบียนผู้ใช้น้ำ
                {
                    Str_return = edit_view_user_water(Request["prm_edit_view"].ToString());
                }


                if(Request["prm_viewupload"] != null && Request["prm_viewupload"]  !="")///Upload ข้อมูล	
                {
                   Str_return = List_water_applicant(Request["prm_viewupload"].ToString());
                }

            }
            catch (Exception ex)
            { 
            
            }

            Response.Write(Str_return);
        }

        public string edit_view_user_water(string id)////  แก้ไขทะเบียนผู้ใช้น้ำ
        {
            string return_petition = "";
            try
            {
                OdbcCommand command = new OdbcCommand("SELECT pi.id,wn.idwaterusernumber,wa.applicanttype,wa.title_name,wa.username, "+
                                                        "wa.lastname,wa.idcard,wa.birthday,wa.old,wa.address, wa.village, "+
                                                        "wa.alley,wa.road,wa.district,wa.prefecture,wa.province,wa.zipcode,wa.tel, "+
                                                        "wa.email,wm.status,ap.approve, d.detailstype,d.details, "+
                                                        "d.building,d.buildingstyle,d.class,wm.numbergauge,d.waterpipe,d.latitude,d.longitude,d.dateinstallgauges "+
                                                        "FROM tbl_petition_information pi "+
                                                        "left join tbl_water_meter wm on pi.id = cast(wm.idpetition as integer) "+
                                                        "left join tbl_approve ap on pi.id = cast(ap.idpetition as integer) "+
                                                        "left join tbl_water_applicant wa on pi.id = cast(wa.idpetition as integer) "+
                                                        "left join tbl_details d on pi.id = cast(d.idpetition as integer) "+
                                                        "left join tbl_authorities ah on pi.id = cast(ah.idpetition as integer) "+
                                                        "left join tbl_water_user_number wn on wm.numberpetition = wn.numberpetition  " +
                                                        "where pi.id=" + id);

                DataTable dt = cls_command.SelectData(command);

                if (dt.Rows.Count > 0)
                {
                    return_petition = dt.Rows[0]["idwaterusernumber"].ToString() + ":" + dt.Rows[0]["applicanttype"].ToString() + ":" + dt.Rows[0]["title_name"].ToString() + ":" + dt.Rows[0]["username"].ToString() + ":" + dt.Rows[0]["lastname"].ToString() + ":" + dt.Rows[0]["idcard"].ToString() + ":" + dt.Rows[0]["birthday"].ToString() +
                                     ":" + dt.Rows[0]["old"].ToString() + ":" + dt.Rows[0]["address"].ToString() + ":" + dt.Rows[0]["village"].ToString() + ":" +
                                     dt.Rows[0]["alley"].ToString() + ":" + dt.Rows[0]["road"].ToString() + ":" + dt.Rows[0]["district"].ToString() + ":" + dt.Rows[0]["prefecture"].ToString()
                                     + ":" + dt.Rows[0]["province"].ToString() + ":" + dt.Rows[0]["zipcode"].ToString() + ":" + dt.Rows[0]["tel"].ToString()
                                     + ":" + dt.Rows[0]["email"].ToString()
                                     + ":" + dt.Rows[0]["detailstype"].ToString() + ":" + dt.Rows[0]["details"].ToString()
                                     + ":" + dt.Rows[0]["building"].ToString() + ":" + dt.Rows[0]["buildingstyle"].ToString() + ":" + dt.Rows[0]["class"].ToString() + ":" + dt.Rows[0]["numbergauge"].ToString()
                                     + ":" + dt.Rows[0]["waterpipe"].ToString()
                                     + ":" + dt.Rows[0]["latitude"].ToString() + ":" + dt.Rows[0]["longitude"].ToString() + ":" + dt.Rows[0]["dateinstallgauges"].ToString();

                }
                else
                {
                    return_petition = "";
                }
            }
            catch (Exception ex)
            {
            }
            return return_petition;
        }
        public string view_user_water(string id)//// ทะเบัยนผู้ใช้น้ำ
        {
            string return_petition = "";
            try
            {
                OdbcCommand command = new OdbcCommand("SELECT pi.id,wn.idwaterusernumber,wa.applicanttype,wa.username,wa.title_name,wa.lastname,wa.idcard,wa.birthday,wa.old,wa.address, " +
                                                        "wa.village,wa.alley,wa.road,wa.district,wa.prefecture,wa.province,wa.zipcode,wa.tel,wa.email,wm.numbergauge,wm.status,ap.approve, "+
                                                        "d.detailstype,d.details,d.building,d.buildingstyle,d.waterpipe,d.dateinstallgauges,d.latitude,d.longitude " +
                                                        "FROM tbl_petition_information pi "+
                                                        "left join tbl_water_meter wm on pi.id = cast(wm.idpetition as integer) "+
                                                        "left join tbl_approve ap on pi.id = cast(ap.idpetition as integer) "+
                                                        "left join tbl_water_applicant wa on pi.id = cast(wa.idpetition as integer) "+
                                                        "left join tbl_details d on pi.id = cast(d.idpetition as integer) "+
                                                        "left join tbl_authorities ah on pi.id = cast(ah.idpetition as integer) "+
                                                        "left join tbl_water_user_number wn on wm.numberpetition = wn.numberpetition  " +
                                                        "where pi.id=" + id);
             
                DataTable dt = cls_command.SelectData(command);

                if (dt.Rows.Count > 0)
                {
                    return_petition = dt.Rows[0]["idwaterusernumber"].ToString() + ":" + dt.Rows[0]["applicanttype"].ToString() + ":" + dt.Rows[0]["title_name"].ToString() + ":" + dt.Rows[0]["username"].ToString() + ":" + dt.Rows[0]["lastname"].ToString() + ":" + dt.Rows[0]["idcard"].ToString() + ":" + dt.Rows[0]["birthday"].ToString() +
                                     ":" + dt.Rows[0]["old"].ToString() + ":" + dt.Rows[0]["address"].ToString() + ":" + dt.Rows[0]["village"].ToString() + ":" +
                                     dt.Rows[0]["alley"].ToString() + ":" + dt.Rows[0]["road"].ToString() + ":" + dt.Rows[0]["district"].ToString() + ":" + dt.Rows[0]["prefecture"].ToString()
                                     + ":" + dt.Rows[0]["province"].ToString() + ":" + dt.Rows[0]["zipcode"].ToString() + ":" + dt.Rows[0]["tel"].ToString()
                                     + ":" + dt.Rows[0]["email"].ToString() + ":" + dt.Rows[0]["numbergauge"].ToString()
                                     + ":" + dt.Rows[0]["detailstype"].ToString() + ":" + dt.Rows[0]["details"].ToString()
                                     + ":" + dt.Rows[0]["building"].ToString() + ":" + dt.Rows[0]["buildingstyle"].ToString()
                                     + ":" + dt.Rows[0]["waterpipe"].ToString() + ":" + dt.Rows[0]["dateinstallgauges"].ToString()
                                     + ":" + dt.Rows[0]["latitude"].ToString() + ":" + dt.Rows[0]["longitude"].ToString() + ":" + dt.Rows[0]["title_name"].ToString();

                }
                else
                {
                    return_petition = "";
                }
            }
            catch (Exception ex)
            {
            }
            return return_petition;
        }

        public string List_petition_information(string id)
        {
            string return_petition = "";
            try
            {
                OdbcCommand command = new OdbcCommand("SELECT * FROM tbl_petition_information where id=" + id);
                DataTable dt = cls_command.SelectData(command);

                if (dt.Rows.Count > 0)
                {
                    return_petition = dt.Rows[0]["title_name"].ToString() + ":" + dt.Rows[0]["username"].ToString() + ":" + dt.Rows[0]["lastname"].ToString() + ":" + dt.Rows[0]["idcard"].ToString() + ":" + dt.Rows[0]["birthday"].ToString() +
                                     ":" + dt.Rows[0]["old"].ToString() + ":" + dt.Rows[0]["address"].ToString() + ":" + dt.Rows[0]["village"].ToString() + ":" +
                                     dt.Rows[0]["alley"].ToString() + ":" + dt.Rows[0]["road"].ToString() + ":" + dt.Rows[0]["district"].ToString() + ":" + dt.Rows[0]["prefecture"].ToString()
                                     + ":" + dt.Rows[0]["province"].ToString() + ":" + dt.Rows[0]["zipcode"].ToString() + ":" + dt.Rows[0]["tel"].ToString()
                                     + ":" + dt.Rows[0]["email"].ToString() + ":" + dt.Rows[0]["datepetition"].ToString();
                }
                else
                {
                    return_petition = "";
                }
            }
            catch (Exception ex)
            {
            }
            return return_petition;
        }

        public string List_Meter(string idpetition)
        {
            string return_meter = "";
            try
            {
                OdbcCommand com = new OdbcCommand("SELECT * FROM tbl_water_meter  where idpetition='" + idpetition + "'");
                DataTable dt = cls_command.SelectData(com);

                if (dt.Rows.Count > 0)
                {
                    return_meter = dt.Rows[0]["numberpetition"].ToString() + ":" + dt.Rows[0]["numbergauge"].ToString();
                }
                else
                {
                    return_meter = "";
                }
            }
            catch (Exception ex) { }
            return return_meter;
        }

        public string List_water_applicant(string idpetition)
        {
            string return_water_applicant = "";
            try
            {
                OdbcCommand com = new OdbcCommand("SELECT * FROM tbl_water_applicant  where idpetition='" + idpetition + "'");
                DataTable dt = cls_command.SelectData(com);

                if (dt.Rows.Count > 0)
                {
                    return_water_applicant = dt.Rows[0]["applicanttype"].ToString() + ":" + 
                                             dt.Rows[0]["title_name"].ToString() + ":" + dt.Rows[0]["username"].ToString() + ":" + dt.Rows[0]["lastname"].ToString() + ":" + dt.Rows[0]["idcard"].ToString() + ":" + dt.Rows[0]["birthday"].ToString() +
                                     ":" + dt.Rows[0]["old"].ToString() + ":" + dt.Rows[0]["address"].ToString() + ":" + dt.Rows[0]["village"].ToString() + ":" +
                                     dt.Rows[0]["alley"].ToString() + ":" + dt.Rows[0]["road"].ToString() + ":" + dt.Rows[0]["district"].ToString() + ":" + dt.Rows[0]["prefecture"].ToString()
                                     + ":" + dt.Rows[0]["province"].ToString() + ":" + dt.Rows[0]["zipcode"].ToString() + ":" + dt.Rows[0]["tel"].ToString()
                                     + ":" + dt.Rows[0]["email"].ToString();
                }
                else
                {
                    return_water_applicant = "";
                }
            }
            catch (Exception ex) 
            { 
            }
            return return_water_applicant;
        }

        public string List_details(string idpetition)
        {
            string return_details = "";
            try
            {
                OdbcCommand com = new OdbcCommand("SELECT * FROM tbl_details  where idpetition='" + idpetition + "'");
                DataTable dt = cls_command.SelectData(com);

                if (dt.Rows.Count > 0)
                {
                    return_details = dt.Rows[0]["detailstype"].ToString() + ":" +
                                             dt.Rows[0]["details"].ToString() + ":" + dt.Rows[0]["building"].ToString() + ":" + dt.Rows[0]["buildingstyle"].ToString() + ":" + dt.Rows[0]["class"].ToString() + ":" + dt.Rows[0]["waterpipe"].ToString() +
                                     ":" + dt.Rows[0]["latitude"].ToString() + ":" + dt.Rows[0]["longitude"].ToString() + ":" + dt.Rows[0]["dateinstallgauges"].ToString() + ":" +
                                     dt.Rows[0]["fee"].ToString() + ":" + dt.Rows[0]["insurancefee"].ToString() + ":" + dt.Rows[0]["wage"].ToString() + ":" + dt.Rows[0]["revenuestamp"].ToString()
                                     + ":" + dt.Rows[0]["sum"].ToString();
                }
                else
                {
                    return_details = "";
                }
            }
            catch (Exception ex) 
            {
            }
            return return_details;
        }

        public string List_authorities(string idpetition)
        {
            string return_authorities = "";
            try
            {
                OdbcCommand com = new OdbcCommand("SELECT * FROM tbl_authorities  where idpetition='" + idpetition + "'");
                DataTable dt = cls_command.SelectData(com);

                if (dt.Rows.Count > 0)
                {
                    return_authorities = dt.Rows[0]["reviews"].ToString() + ":" +
                                             dt.Rows[0]["survey"].ToString() + ":" + dt.Rows[0]["proposal"].ToString() + ":" + dt.Rows[0]["command"].ToString() ;
                }
                else
                {
                    return_authorities = "";
                }
            }
            catch (Exception ex) 
            {
            
            }
            return return_authorities;
        }
  
         public string SearchResult()
        {
            string return_result = "";

          string address =   Request["t1"];///เลขที่ผู้ใช้น้ำ
          string name =   Request["t2"];///
            try
            {
                OdbcCommand command = new OdbcCommand("SELECT * FROM tbl_petition_information where address='"+ name +"'");
                DataTable dt = cls_command.SelectData(command);

                if (dt.Rows.Count > 0)
                {
                    return_result = dt.Rows[0]["title_name"].ToString() + ":" + dt.Rows[0]["username"].ToString() + ":" + dt.Rows[0]["lastname"].ToString() + ":" + dt.Rows[0]["idcard"].ToString() + ":" + dt.Rows[0]["birthday"].ToString() +
                                     ":" + dt.Rows[0]["old"].ToString() + ":" + dt.Rows[0]["address"].ToString() + ":" + dt.Rows[0]["village"].ToString() + ":" +
                                     dt.Rows[0]["alley"].ToString() + ":" + dt.Rows[0]["road"].ToString() + ":" + dt.Rows[0]["district"].ToString() + ":" + dt.Rows[0]["prefecture"].ToString()
                                     + ":" + dt.Rows[0]["province"].ToString() + ":" + dt.Rows[0]["zipcode"].ToString() + ":" + dt.Rows[0]["tel"].ToString()
                                     + ":" + dt.Rows[0]["email"].ToString() + ":" + dt.Rows[0]["datepetition"].ToString();
                }
                else
                {
                    return_result = "";
                }
            }
            catch (Exception ex)
            {
            }
            return return_result;
            
        }

         public string List_approve(string idpetition)
         {
             string return_approve = "";
             try
             {
                 OdbcCommand com = new OdbcCommand("SELECT * FROM tbl_approve  where idpetition='" + idpetition + "'");
                 DataTable dt = cls_command.SelectData(com);

                 if (dt.Rows.Count > 0)
                 {
                     return_approve = dt.Rows[0]["approve"].ToString() + ":" + dt.Rows[0]["note"].ToString() + ":" + dt.Rows[0]["dateapprove"].ToString();
                 }
                 else
                 {
                     return_approve = "";
                 }
             }
             catch (Exception ex) { }
             return return_approve;
         }


         //public string List_information_note_watermeter(string idpetition)
         //{

         //    string information_note_watermeter = "";
         //    try
         //    {
         //        OdbcCommand command = new OdbcCommand("SELECT pi.id,ud.idwaterusernumber,wa.title_name,wa.username,wa.lastname,wm.numbergauge, " +
         //                                                "ud.datethistime,ud.numberthistime,ud.datelasttime,ud.numberlasttime,ud.amountused, " +
         //                                                "ud.waterbill,ud.maintenancefee,ud.overdue,ud.sum,ud.statuswaterbill,ud.invoicenumber, " +
         //                                                "ud.latitude,ud.longitude " +
         //                                                "FROM tbl_upload_data ud " +
         //                                                "left join tbl_water_user_number wn on ud.idwaterusernumber = wn.idwaterusernumber " +
         //                                                "left join tbl_water_meter wm  on wn.numberpetition = wm.numberpetition " +
         //                                                "left join tbl_water_applicant wa on wm.idpetition = wa.idpetition " +
         //                                                "left join tbl_petition_information pi on pi.id = cast(wm.idpetition as integer) " +
         //                                                "where(wm.status='อนุมัติ') and pi.id="+ idpetition);
         //        DataTable dt = cls_command.SelectData(command);
         //        for (int j = 0; j < dt.Rows.Count; j++)
         //        {
         //            information_note_watermeter = dt.Rows[j]["datethistime"].ToString() + ":" + dt.Rows[j]["numberthistime"].ToString() + ":" +
         //                                           dt.Rows[j]["datelasttime"].ToString() + ":" + dt.Rows[j]["numberlasttime"].ToString() + ":" +
         //                                           dt.Rows[j]["amountused"].ToString() + ":" + dt.Rows[j]["waterbill"].ToString() + ":" +
         //                                           dt.Rows[j]["maintenancefee"].ToString() + ":" + dt.Rows[j]["sum"].ToString();
         //        }

         //    }
         //    catch (Exception ex) {
         //        information_note_watermeter = "";
         //    }

         //    return information_note_watermeter;
         //}

    }
}