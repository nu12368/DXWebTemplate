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
    public partial class insertdata : System.Web.UI.Page
    {
        string StrSubmit = "";
        string title_name = "";
        string birthdate = "";
        string _result = "";
        string datepetition = "";
        string _type = "";
        string strbuilding = "";
        string strbuildingstyle = "";
        string dateinstall = "";
        int sum = 0;
        string strapprove = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
               
                if (Request["Submit"] != null) //// บันทึก
                {
                    if (Session["prmsend"] == null || Session["prmsend"] == "") /////// ขอติดตั้งน้ำประปาใหม่
                    {
                        if (Request["iduser"] == null || Request["iduser"] == "")
                        {
                            Submit(); ////// ขอติดตั้งน้ำประปาใหม่
                        }
                        else
                        {
                            Submitmeter(Request["iduser"]); //// ข้อมูล มิเตอร์ เลขคำขอ
                            Submitwaterapplicant(Request["iduser"]); // ข้อมูลขอใช้น้ำ
                            Submitdetails(Request["iduser"]); /// รายละเอียด
                            Summitauthorities(Request["iduser"]); /// สำหรับเจ้าหน้าที่
                            _result = Request["iduser"];
                        }
                    }
                }

                if (Request["Send"] != null) //// ส่งอนุมัติ
                {
                    Sendapprove(Request["iduser"]); //// ส่งคำร้อง
                    Session["Sendapprove"] = Request["iduser"];
                    _result = "true";
                    Session["prmsend"] = "";
                }
                if (Request["cancel"] != null) //// ยกเลิก
                {

                }


                if (Request["Sendapprove"] != null)
                {
                    Submitapprove(Request["iduser"]);  //// อนุมัติ
                    approve(Request["iduser"]); //// อนุมัติ

                }



                if (Request["Edit_Submit"] != null) //// แก้ไขทะเบียนผู้ใช้น้ำ
                {
                    Submitwaterapplicant(Request["iduser"]); // ข้อมูลขอใช้น้ำ
                    _result = Request["iduser"];
                    Response.Redirect("view_edit_water_user.aspx?prm=" + _result + "");
                }else
                {

                    Response.Redirect("new_water.aspx?prm=" + _result + "");
                }

            }
            catch (Exception ex)
            { 
            
            }
        }

        public string Submit()///// ขอติดตั้งน้ำประปาใหม่
        {
            try
            {
                if (Request["c1"] != null) { title_name = Request["c1"]; } ///// คำนำหน้า
                if (Request["c2"] != null) { title_name = Request["c2"]; }
                if (Request["c3"] != null) { title_name = Request["c3"]; }
                if (Request["c4"] != null) { title_name = Request["c4"]; }

                birthdate = Request["birthdateday"].PadLeft(2, '0') + "-" + Request["birthdatemonth"].PadLeft(2, '0') + "-" + Request["birthdateyear"]; //// วันเดือนปีเกิด

                datepetition = Request["petitionday"].PadLeft(2, '0') + "-" + Request["petitionmonth"].PadLeft(2, '0') + "-" + Request["petitionyear"]; //// วันที่รับคำขอ
                using (OdbcCommand command = cls_command.cnn.CreateCommand())
                {
                    command.CommandText = "INSERT INTO tbl_petition_information (title_name, username, lastname, idcard, birthday, old, address,village,alley,road,district,prefecture,province,zipcode,tel,email,datepetition,dateinsert,dateupdate) " +
                                            "VALUES " +
                                            "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                    command.Parameters.Add("@title_name", OdbcType.VarChar, 200).Value = title_name;
                    command.Parameters.Add("@username", OdbcType.VarChar, 200).Value = Request["t1"];
                    command.Parameters.Add("@lastname", OdbcType.VarChar, 200).Value = Request["t2"];
                    command.Parameters.Add("@idcard", OdbcType.VarChar, 200).Value = Request["t3"];
                    command.Parameters.Add("@birthday", OdbcType.VarChar, 200).Value = birthdate;
                    command.Parameters.Add("@old", OdbcType.VarChar, 200).Value = Request["t4"];
                    command.Parameters.Add("@address", OdbcType.VarChar, 200).Value = Request["t5"];
                    command.Parameters.Add("@village", OdbcType.VarChar, 200).Value = Request["t6"];
                    command.Parameters.Add("@alley", OdbcType.VarChar, 200).Value = Request["t7"];
                    command.Parameters.Add("@road", OdbcType.VarChar, 200).Value = Request["t8"];
                    command.Parameters.Add("@district", OdbcType.VarChar, 200).Value = Request["t9"];
                    command.Parameters.Add("@prefecture", OdbcType.VarChar, 200).Value = Request["t10"];
                    command.Parameters.Add("@province", OdbcType.VarChar, 200).Value = Request["t11"];
                    command.Parameters.Add("@zipcode", OdbcType.VarChar, 200).Value = Request["t12"];
                    command.Parameters.Add("@tel", OdbcType.VarChar, 200).Value = Request["t13"];
                    command.Parameters.Add("@email", OdbcType.VarChar, 200).Value = Request["t14"];
                    command.Parameters.Add("@datepetition", OdbcType.VarChar, 200).Value = datepetition;
                    command.Parameters.Add("@dateinsert", OdbcType.VarChar, 200).Value = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                    command.Parameters.Add("@dateupdate", OdbcType.VarChar, 200).Value = "";
                  bool check_result = cls_command.InsertData(command);

                  if (check_result == true)
                  {
                     /// _result = "true";

                      command.CommandText = "select id from tbl_petition_information order by id desc limit 1";
                      DataTable dt = cls_command.SelectData(command);

                      if (dt.Rows.Count > 0)
                      {
                          Submitmeter(dt.Rows[0]["id"].ToString()); //// ข้อมูล มิเตอร์ เลขคำขอ
                          Submitwaterapplicant(dt.Rows[0]["id"].ToString()); // ข้อมูลขอใช้น้ำ
                          Submitdetails(dt.Rows[0]["id"].ToString()); /// รายละเอียด
                          Summitauthorities(dt.Rows[0]["id"].ToString()); /// สำหรับเจ้าหน้าที่
                          _result = dt.Rows[0]["id"].ToString();
                         
                      }
                  }
                  else
                  {
                      _result = "false";
                  }
                }

               
            }
            catch (Exception ex) { }

            return _result;
        }

        public string Submitmeter(string id_petition) //////// เลขที่คำขอ เลขมาตรวัด
        {
            try
            {
                OdbcCommand com = new OdbcCommand("SELECT * FROM tbl_water_meter  where idpetition='" + id_petition + "'");
                 DataTable dt = cls_command.SelectData(com);

                if (dt.Rows.Count > 0)
                {
                    using (OdbcCommand command = cls_command.cnn.CreateCommand())
                    {
                        command.CommandText = String.Format("UPDATE tbl_water_meter SET numberpetition = '{0}',numbergauge = '{1}',dateupdate='{2}' WHERE idpetition = '{3}'", Request["t38"], Request["t26"], DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"), id_petition);
                        bool check_result = cls_command.UpdateData(command);
                        if (check_result == true)
                        {
                            _result = "true";
                        }
                        else
                        {
                            _result = "false";
                        }
                        return _result;
                    }

                }
                using (OdbcCommand command = cls_command.cnn.CreateCommand())
                {
                    command.CommandText = "INSERT INTO tbl_water_meter (idpetition, numberpetition, numbergauge, status, dateinsert ,dateupdate) " +
                                            "VALUES " +
                                            "(?,?,?,?,?,?)";
                    command.Parameters.Add("@idpetition", OdbcType.VarChar, 200).Value = id_petition;
                    command.Parameters.Add("@numberpetition", OdbcType.VarChar, 200).Value = Request["t38"];
                    command.Parameters.Add("@numbergauge", OdbcType.VarChar, 200).Value = Request["t26"];
                    command.Parameters.Add("@status", OdbcType.VarChar, 200).Value = "คำขอ";
                    command.Parameters.Add("@dateinsert", OdbcType.VarChar, 200).Value = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                    command.Parameters.Add("@dateupdate", OdbcType.VarChar, 200).Value = "";
                    bool check_result = cls_command.InsertData(command);

                    if (check_result == true)
                    {
                        _result = "true";

                       
                    }
                    else
                    {
                        _result = "false";
                    }
                }
            }
            catch (Exception ex) { }
            return _result;
        }

        public string Submitwaterapplicant(string id_petition) ////ข้อมูลขอใช้น้ำ
        {
            try
            {

                OdbcCommand com = new OdbcCommand("SELECT * FROM tbl_water_applicant  where idpetition='" + id_petition + "'");
                DataTable dt = cls_command.SelectData(com);


                if (Request["c5"] != null) { _type = Request["c5"]; } ///// ประเภทผู้ใช้น้ำ
                if (Request["c6"] != null) { _type = Request["c6"]; }


                if (Request["c01"] != null) { title_name = Request["c01"]; } ///// คำนำหน้า
                if (Request["c02"] != null) { title_name = Request["c02"]; }
                if (Request["c03"] != null) { title_name = Request["c03"]; }
                if (Request["c04"] != null) { title_name = Request["c04"]; }


                if (Request["Edit_Submit"] != null)
                {
                    birthdate = Request["t_editdate"]; //// วันเดือนปีเกิด แก้ไขทะเบียนผู้ใช้น้ำ ไม่ได้ให้เลือก
                }
                else
                {
                    birthdate = Request["1birthdateday"].PadLeft(2, '0') + "-" + Request["1birthdatemonth"].PadLeft(2, '0') + "-" + Request["1birthdateyear"]; //// วันเดือนปีเกิด
                }
                if (dt.Rows.Count > 0)
                {
                    using (OdbcCommand command = cls_command.cnn.CreateCommand())
                    {
                        command.CommandText = String.Format("UPDATE tbl_water_applicant SET applicanttype = '{0}',title_name = '{1}',username='{2}', "+
                                                            "lastname = '{3}',idcard = '{4}',birthday='{5}' ,old = '{6}',address='{7}'," +
                                                              "village = '{8}',alley = '{9}',road='{10}' ,district = '{11}',prefecture='{12}'," +
                                                               "province = '{13}',zipcode = '{14}',tel='{15}' ,email = '{16}',dateupdate='{17}' " +
                                                            "WHERE idpetition = '{18}'", _type,title_name,
                                                            Request["t01"], Request["t02"], Request["t03"], birthdate,
                                                            Request["t04"],Request["t15"], Request["t16"], Request["t17"], Request["t18"],
                                                             Request["t19"], Request["t20"], Request["t21"], Request["t22"], Request["t23"], Request["t24"],DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"), id_petition);
                        bool check_result = cls_command.UpdateData(command);
                        if (check_result == true)
                        {
                            _result = "true";
                        }
                        else
                        {
                            _result = "false";
                        }
                        return _result;
                    }
                }

                using (OdbcCommand command = cls_command.cnn.CreateCommand())
                {
                    command.CommandText = "INSERT INTO tbl_water_applicant (idpetition,applicanttype,title_name, username, lastname, idcard, birthday, old, address,village,alley,road,district,prefecture,province,zipcode,tel,email,dateinsert,dateupdate) " +
                                            "VALUES " +
                                            "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                    command.Parameters.Add("@idpetition", OdbcType.VarChar, 200).Value = id_petition;  ///////// id ผู้ร้องขอ
                    command.Parameters.Add("@applicanttype", OdbcType.VarChar, 200).Value = _type;
                    command.Parameters.Add("@title_name", OdbcType.VarChar, 200).Value = title_name;
                    command.Parameters.Add("@username", OdbcType.VarChar, 200).Value = Request["t01"];
                    command.Parameters.Add("@lastname", OdbcType.VarChar, 200).Value = Request["t02"];
                    command.Parameters.Add("@idcard", OdbcType.VarChar, 200).Value = Request["t03"];
                    command.Parameters.Add("@birthday", OdbcType.VarChar, 200).Value = birthdate;
                    command.Parameters.Add("@old", OdbcType.VarChar, 200).Value = Request["t04"];
                    command.Parameters.Add("@address", OdbcType.VarChar, 200).Value = Request["t15"];
                    command.Parameters.Add("@village", OdbcType.VarChar, 200).Value = Request["t16"];
                    command.Parameters.Add("@alley", OdbcType.VarChar, 200).Value = Request["t17"];
                    command.Parameters.Add("@road", OdbcType.VarChar, 200).Value = Request["t18"];
                    command.Parameters.Add("@district", OdbcType.VarChar, 200).Value = Request["t19"];
                    command.Parameters.Add("@prefecture", OdbcType.VarChar, 200).Value = Request["t20"];
                    command.Parameters.Add("@province", OdbcType.VarChar, 200).Value = Request["t21"];
                    command.Parameters.Add("@zipcode", OdbcType.VarChar, 200).Value = Request["t22"];
                    command.Parameters.Add("@tel", OdbcType.VarChar, 200).Value = Request["t23"];
                    command.Parameters.Add("@email", OdbcType.VarChar, 200).Value = Request["t24"];
                    command.Parameters.Add("@dateinsert", OdbcType.VarChar, 200).Value = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                    command.Parameters.Add("@dateupdate", OdbcType.VarChar, 200).Value = "";
                    bool check_result = cls_command.InsertData(command);

                    if (check_result == true)
                    {
                        _result = "true";
                    }
                    else
                    {
                        _result = "false";
                    }
                }

            }
            catch (Exception ex)
            { 
            }
            return _result;
        }

        public string Submitdetails(string id_petition) ////ข้อมูลขอใช้น้ำ
        {
            try
            {
                OdbcCommand com = new OdbcCommand("SELECT * FROM tbl_details where  idpetition='" + id_petition + "'");
                DataTable dt = cls_command.SelectData(com);

                if (Request["c8"] != null) { strbuilding = Request["c8"]; } /////ประเภทสิ่งก่อสร้าง
                if (Request["c9"] != null) { strbuilding = Request["c9"]; }
                if (Request["c10"] != null) { strbuildingstyle = Request["c10"]; } /////ประเภทสิ่งก่อสร้าง
                if (Request["c11"] != null) { strbuildingstyle = Request["c11"]; }
                if (Request["c12"] != null) { strbuildingstyle = Request["c12"]; }


                dateinstall = Request["dateinstallday"].PadLeft(2, '0') + "-" + Request["dateinstallmonth"].PadLeft(2, '0') + "-" + Request["dateinstallyear"]; //// วันเดือนปีเกิด

                if ((Request["t29"] != null && Request["t29"] != "") && (Request["t30"] != null && Request["t30"] != "") && (Request["t31"] != null && Request["t31"] != "") && (Request["t32"] != null && Request["t32"] != ""))
                {
                    sum = Int32.Parse(Request["t29"]) + Int32.Parse(Request["t30"]) + Int32.Parse(Request["t31"]) + Int32.Parse(Request["t32"]);
                }

                if (dt.Rows.Count > 0)
                {
                    using (OdbcCommand command = cls_command.cnn.CreateCommand())
                    {
                        command.CommandText = String.Format("UPDATE tbl_details SET detailstype = '{0}',details = '{1}',building='{2}', " +
                                                            "buildingstyle = '{3}',class = '{4}',waterpipe='{5}' ,latitude = '{6}',longitude='{7}'," +
                                                              "dateinstallgauges = '{8}',fee = '{9}',insurancefee='{10}' ,wage = '{11}',revenuestamp='{12}'," +
                                                               "sum = '{13}',dateupdate = '{14}' " +
                                                            "WHERE idpetition = '{15}'", Request["txtcombo1"], Request["txtcombo2"],
                                                            strbuilding, strbuildingstyle, Request["t25"],
                                                            Request["txtcombo3"], Request["t27"], Request["t28"], dateinstall, Request["t29"],
                                                             Request["t30"], Request["t31"], Request["t32"], sum.ToString(), DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"), id_petition);
                        bool check_result = cls_command.UpdateData(command);
                        if (check_result == true)
                        {
                            _result = "true";
                        }
                        else
                        {
                            _result = "false";
                        }
                        return _result;
                    }
                }

                using (OdbcCommand command = cls_command.cnn.CreateCommand())
                {
                    command.CommandText = "INSERT INTO tbl_details (idpetition,detailstype,details, building, buildingstyle, class, waterpipe, latitude, longitude,dateinstallgauges,fee ,insurancefee,wage,revenuestamp,sum,dateinsert,dateupdate) " +
                                            "VALUES " +
                                            "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                    command.Parameters.Add("@idpetition", OdbcType.VarChar, 200).Value = id_petition;  ///////// id ผู้ร้องขอ
                    command.Parameters.Add("@detailstype", OdbcType.VarChar, 200).Value = Request["txtcombo1"];
                    command.Parameters.Add("@details", OdbcType.VarChar, 200).Value = Request["txtcombo2"];
                    command.Parameters.Add("@building", OdbcType.VarChar, 200).Value = strbuilding;
                    command.Parameters.Add("@buildingstyle", OdbcType.VarChar, 200).Value = strbuildingstyle;
                    command.Parameters.Add("@class", OdbcType.VarChar, 200).Value = Request["t25"];
                    command.Parameters.Add("@waterpipe", OdbcType.VarChar, 200).Value = Request["txtcombo3"];
                    command.Parameters.Add("@latitude", OdbcType.VarChar, 200).Value = Request["t27"];
                    command.Parameters.Add("@longitude", OdbcType.VarChar, 200).Value = Request["t28"];
                    command.Parameters.Add("@dateinstallgauges", OdbcType.VarChar, 200).Value = dateinstall;
                    command.Parameters.Add("@fee", OdbcType.VarChar, 200).Value = Request["t29"];
                    command.Parameters.Add("@insurancefee", OdbcType.VarChar, 200).Value = Request["t30"];
                    command.Parameters.Add("@wage", OdbcType.VarChar, 200).Value = Request["t31"];
                    command.Parameters.Add("@revenuestamp", OdbcType.VarChar, 200).Value = Request["t32"];
                    command.Parameters.Add("@sum", OdbcType.VarChar, 200).Value = sum.ToString();
                    command.Parameters.Add("@dateinsert", OdbcType.VarChar, 200).Value = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                    command.Parameters.Add("@dateupdate", OdbcType.VarChar, 200).Value = "";
                    bool check_result = cls_command.InsertData(command);

                    if (check_result == true)
                    {
                        _result = "true";
                    }
                    else
                    {
                        _result = "false";
                    }
                }

            }
            catch (Exception ex)
            {
            }
            return "";
        }

        public string Summitauthorities(string id_petition)
        {
            try
            {
                OdbcCommand com = new OdbcCommand("SELECT * FROM tbl_authorities  where idpetition='" + id_petition + "'");
                DataTable dt = cls_command.SelectData(com);

                if (dt.Rows.Count > 0)
                {

                    using (OdbcCommand command = cls_command.cnn.CreateCommand())
                    {
                        command.CommandText = String.Format("UPDATE tbl_authorities SET reviews = '{0}',survey = '{1}', proposal='{2}', " +
                                                            "command = '{3}', dateupdate = '{4}' " +
                                                            "WHERE idpetition = '{5}'", Request["t34"], Request["t35"],
                                                            Request["t36"], Request["t37"], DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"), id_petition);
                        bool check_result = cls_command.UpdateData(command);
                        if (check_result == true)
                        {
                            _result = "true";
                        }
                        else
                        {
                            _result = "false";
                        }
                        return _result;
                    }

                }

                using (OdbcCommand command = cls_command.cnn.CreateCommand())
                {
                    command.CommandText = "INSERT INTO tbl_authorities (idpetition, reviews, survey, proposal, command,dateinsert ,dateupdate) " +
                                            "VALUES " +
                                            "(?,?,?,?,?,?,?)";
                    command.Parameters.Add("@idpetition", OdbcType.VarChar, 200).Value = id_petition;
                    command.Parameters.Add("@reviews", OdbcType.VarChar, 200).Value = Request["t34"];
                    command.Parameters.Add("@survey", OdbcType.VarChar, 200).Value = Request["t35"];
                    command.Parameters.Add("@proposal", OdbcType.VarChar, 200).Value = Request["t36"];
                    command.Parameters.Add("@command", OdbcType.VarChar, 200).Value = Request["t37"];
                    command.Parameters.Add("@dateinsert", OdbcType.VarChar, 200).Value = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                    command.Parameters.Add("@dateupdate", OdbcType.VarChar, 200).Value = "";
                    bool check_result = cls_command.InsertData(command);

                    if (check_result == true)
                    {
                        _result = "true";
                    }
                    else
                    {
                        _result = "false";
                    }
                }
            }
            catch (Exception ex) { }
            return _result;
        }

        public string Sendapprove(string id_petition) //////// เลขที่คำขอ เลขมาตรวัด
        {
            try
            {
                using (OdbcCommand command = cls_command.cnn.CreateCommand())
                {
                    command.CommandText = String.Format("UPDATE tbl_water_meter SET status = '{0}' WHERE idpetition = '{1}'", "รออนุมัติ", id_petition);
                    bool check_result = cls_command.UpdateData(command);
                    
                    if (check_result == true)
                    {
                        _result = "true";
                    }
                    else
                    {
                        _result = "false";
                    }
                }
            }
            catch (Exception ex) { }
            return _result;
        }

        public string Submitapprove(string id_petition) //////// เลขที่คำขอ เลขมาตรวัด
        {
            try
            {

                OdbcCommand com = new OdbcCommand("SELECT * FROM tbl_approve where idpetition='" + id_petition + "'");
                DataTable dt = cls_command.SelectData(com);

                if (dt.Rows.Count > 0)
                {
                    return _result;
                }

                if (Request["approve"] != null) { strapprove = Request["approve"]; } /////ประเภทสิ่งก่อสร้าง
                if (Request["notapprove"] != null) { strapprove = Request["notapprove"]; }


                dateinstall = Request["dateapproveday"].PadLeft(2, '0') + "-" + Request["dateapprovemonth"].PadLeft(2, '0') + "-" + Request["dateapproveyear"]; //// dateapprove

                using (OdbcCommand command = cls_command.cnn.CreateCommand())
                {
                    command.CommandText = "INSERT INTO tbl_approve (idpetition, approve, note, dateapprove, dateinsert ,dateupdate) " +
                                            "VALUES " +
                                            "(?,?,?,?,?,?)";
                    command.Parameters.Add("@idpetition", OdbcType.VarChar, 200).Value = id_petition;
                    command.Parameters.Add("@approve", OdbcType.VarChar, 200).Value = strapprove;
                    command.Parameters.Add("@note", OdbcType.VarChar, 200).Value = Request["t39"];
                    command.Parameters.Add("@dateapprove", OdbcType.VarChar, 200).Value = dateinstall;
                    command.Parameters.Add("@dateinsert", OdbcType.VarChar, 200).Value = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                    command.Parameters.Add("@dateupdate", OdbcType.VarChar, 200).Value = "";
                    bool check_result = cls_command.InsertData(command);

                    if (check_result == true)
                    {
                        _result = "true";
                    }
                    else
                    {
                        _result = "false";
                    }
                }
            }
            catch (Exception ex) { }
            return _result;
        }

        public string approve(string id_petition) //////// อนุมัติ
        {
            try
            {
                using (OdbcCommand command = cls_command.cnn.CreateCommand())
                {
                    command.CommandText = String.Format("UPDATE tbl_water_meter SET status = '{0}' WHERE idpetition = '{1}'", "อนุมัติ", id_petition);
                    bool check_result = cls_command.UpdateData(command);

                    if (check_result == true)
                    {
                        _result = "true";

                         OdbcCommand com = new OdbcCommand("SELECT * FROM tbl_water_meter  where idpetition='" + id_petition + "'");
                         DataTable dt = cls_command.SelectData(com);

                         if (dt.Rows.Count > 0)
                         {
                             waterusernumber(dt.Rows[0]["numberpetition"].ToString());
                         }

                    }
                    else
                    {
                        _result = "false";
                    }
                }
            }
            catch (Exception ex) { }
            return _result;
        }
        public string waterusernumber(string numberpetition)
        {
            try
            {
                string stridwaterusernumber = clsVar.Generateidwaterusernumber();
                using (OdbcCommand command = cls_command.cnn.CreateCommand())
                {
                    command.CommandText = "INSERT INTO tbl_water_user_number (numberpetition, idwaterusernumber, dateinsert ,dateupdate) " +
                                            "VALUES " +
                                            "(?,?,?,?)";
                    command.Parameters.Add("@numberpetition", OdbcType.VarChar, 200).Value = numberpetition;
                    command.Parameters.Add("@idwaterusernumber", OdbcType.VarChar, 200).Value = stridwaterusernumber;
                    command.Parameters.Add("@dateinsert", OdbcType.VarChar, 200).Value = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                    command.Parameters.Add("@dateupdate", OdbcType.VarChar, 200).Value = "";
                    bool check_result = cls_command.InsertData(command);

                    if (check_result == true)
                    {
                        _result = "true";
                    }
                    else
                    {
                        _result = "false";
                    }
                }
            }
            catch (Exception ex) { }
            return _result;
        }
    }
}