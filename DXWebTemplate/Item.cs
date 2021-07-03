using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.Linq;
using System.Text;

namespace DXWebTemplate
{
    public class Item
    {
           // const string str = "การขอติดตั้งน้ำประปา";
            public string idwaterusernumber { get; set; }
            public string username { get; set; }
            public string address { get; set; }
            public string village { get; set; }
            public string district { get; set; }
            public string numbergauge { get; set; }
            public string Text { get; set; }
            public string datepetition { get; set; }
            public string numberpetition { get; set; }
            public string status { get; set; }
            public string detailstype { get; set; }
            public string statusvip { get; set; }
            public string statusOverdue { get; set; }



            /// <summary>
            /// ///
            ///////////////////////  การขอติดตั้งน้ำประปา		
            /// </summary>
            /// <returns></returns>
              public static List<Item> GetData()
            {
                try
                {
                    DataTable dtt = List_Request();

                    List<Item> listnewitem = new List<Item>();
                    int i = 0;

                  //  listnewitem.Insert(0, new Item() { Text = str });
                    foreach (DataRow row in dtt.Rows)
                    {

                        listnewitem.Insert(i, new Item()
                        {
                            idwaterusernumber = row["idwaterusernumber"].ToString(),
                            username = row["username"].ToString(),
                            address = row["address"].ToString(),
                            village = row["village"].ToString(),
                            district = row["district"].ToString(),
                            numbergauge = row["numbergauge"].ToString(),
                            numberpetition = row["numberpetition"].ToString(),
                            datepetition = row["datepetition"].ToString(),
                            status = row["status"].ToString()
                        });
                        i = i + 1;
                    }

                    return listnewitem;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
            public static DataTable List_Request() //////// โหลดหน้าแรก
            {
                try
                {
                    OdbcCommand command = new OdbcCommand("SELECT pi.id,wn.idwaterusernumber,wa.idpetition,wa.title_name,wa.username,wa.lastname, " +
                                                            "wa.address,wm.numberpetition,wa.village,wa.district, pi.datepetition, " +
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
                    dt2.Columns.Add("numberpetition", typeof(string));
                    dt2.Columns.Add("datepetition", typeof(string));
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
                        datarow["numberpetition"] = dt.Rows[j]["numberpetition"].ToString();
                        datarow["detailstype"] = dt.Rows[j]["detailstype"];
                        datarow["numbergauge"] = dt.Rows[j]["numbergauge"];
                        datarow["datepetition"] = dt.Rows[j]["datepetition"];

                        datarow["checkstatus"] = "";
                        datarow["status1"] = "ปกติ";
                        datarow["status"] = dt.Rows[j]["status"];
                        dt2.Rows.Add(datarow);
                        _number = _number + 1;
                    }

                    return dt2;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }



        /// <summary>
        /// ///
        ///////////////////////  ทะเบียนผู้ใช้น้ำ
        /// </summary>
        /// <returns></returns>
            public static List<Item> GetData_list_water_user()
            {
                try
                {
                    DataTable dtt = list_water_user();
                    List<Item> listnewitem = new List<Item>();
                    int i = 0;

                  //  listnewitem.Insert(0, new Item() { Text = str });
                    foreach (DataRow row in dtt.Rows)
                    {

                        listnewitem.Insert(i, new Item()
                        {
                            idwaterusernumber = row["idwaterusernumber"].ToString(),
                            username = row["username"].ToString(),
                            address = row["address"].ToString(),
                            village = row["village"].ToString(),
                            district = row["district"].ToString(),
                            detailstype = row["detailstype"].ToString(),
                            numbergauge = row["numbergauge"].ToString(),
                            status = row["status"].ToString(),
                            statusvip = row["statusvip"].ToString(),
                            statusOverdue = row["statusOverdue"].ToString()
                        });
                        i = i + 1;
                    }

                    return listnewitem;
                }
                catch (Exception ex) {
                    return null;
                }
            }
            public static DataTable list_water_user() 
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
                    dt2.Columns.Add("address", typeof(string));
                    dt2.Columns.Add("village", typeof(string));
                    dt2.Columns.Add("district", typeof(string));
                    dt2.Columns.Add("detailstype", typeof(string));
                    dt2.Columns.Add("numbergauge", typeof(string));
                    dt2.Columns.Add("status", typeof(string));
                    dt2.Columns.Add("statusvip", typeof(string));
                    dt2.Columns.Add("statusOverdue", typeof(string));
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
                        datarow["status"] = "ปกติ";
                        datarow["statusvip"] = "ปกติ";
                        datarow["statusOverdue"] = "ปกติ";
                        dt2.Rows.Add(datarow);
                        _number = _number + 1;
                    }

                    return dt2;
                }
                catch (Exception ex) {
                    return null;
                }
            }






            /// <summary>
            /// ///
            /////////////////////// อนุมัติติดตั้งน้ำประปา
            /// </summary>
            /// <returns></returns>
            /// 

            public static List<Item> GetData_List_approve_request()
            {
                try
                {
                    DataTable dtt = List_approve_request();
                    List<Item> listnewitem = new List<Item>();
                    int i = 0;

                    //  listnewitem.Insert(0, new Item() { Text = str });
                    foreach (DataRow row in dtt.Rows)
                    {

                        listnewitem.Insert(i, new Item()
                        {
                            username = row["username"].ToString(),
                            address = row["address"].ToString(),
                            village = row["village"].ToString(),
                            district = row["district"].ToString(),
                            numbergauge = row["numbergauge"].ToString(),
                            numberpetition = row["numberpetition"].ToString(),
                            datepetition = row["datepetition"].ToString(),
                            status = row["status"].ToString()
                        });
                        i = i + 1;
                    }

                    return listnewitem;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }

            public static DataTable List_approve_request()
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

                    return dt2;
                }
                catch (Exception ex) {
                    return null;
                }
            }
    }
}