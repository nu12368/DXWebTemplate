using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace DXWebTemplate
{
    public partial class view : System.Web.UI.Page
    {
        OdbcCommand command = null;
        DataTable dt = new DataTable("dt");

        string prm = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
               // ASPxDateEdit3.Date = DateTime.Today;
                //string _date = DateTime.Now.ToString("MM-dd-yyyy");
                //string[] sp = _date.Split('-');
                //ASPxDateEdit3.Value = sp[1] + "/" + sp[0] + "/" + (Int32.Parse(sp[2]) - 543).ToString();

                //if (datepetition.Value != "")
                //{
                //    ASPxDateEdit3.Value = datepetition.Value;
                //}
                result.Text = "";
              if (Request["prm"] != null && Request["prm"] != "")
              {
                  if (Request["prm"] == "true") /// ไม่เข้า เรา return id มาเพื่อแสดงข้อมูล
                  {
                      ///result.Text = "บันทึกสำเร็จ";
                      ListViewUser(Int32.Parse(Session["Sendapprove"].ToString())); ////// ส่ง id ไป where
                      ListViewUserapprove(Int32.Parse(Session["Sendapprove"].ToString())); ////// ส่ง id ไป where
                      Session["Sendapprove"] = "";
                  }
                  else
                  {
                      if (Request["prm"] == "false") ////บันทึกไม่สำเร็จ
                      {
                          result.Text = "บันทึกไม่สำเร็จ";
                          result.ForeColor = System.Drawing.Color.Red;
                      }else
                      {
                          result.Text = "บันทึกสำเร็จ";
                          ///////////////// โหลดข้อมูลมาแสดง
                          ListViewUser(Int32.Parse(Request["prm"])); ////// ส่ง id ไป where

                      }
                  }
              }

                //////////////////////////  ดับเบิลคลิกมาจาก gridview
              if ((Request["prmsend"] != null && Request["prmsend"] != "" )|| (Session["prmsend"] != null && Session["prmsend"] != "")) ///// ส่งอนุมัต
              {
                  if (Session["prmsend"] == null || (Session["prmsend"] == "")) //// กดบันทึก มา ไม่กดส่ง
                  {
                      Session["prmsend"] = Request["prmsend"];
                  }

                  ListViewUser(Int32.Parse(Request["prmsend"].ToString())); ////// ส่ง id ไป where
              }



              //////////////////////////  ดับเบิลคลิกมาจาก gridview
              if ((Request["prmapprove"] != null && Request["prmapprove"] != "") || (Session["prmapprove"] != null && Session["prmapprove"] != "")) ///// ส่งอนุมัต
              {
                  if (Session["prmapprove"] == null || (Session["prmapprove"] == "")) //// กดบันทึก มา ไม่กดส่ง
                  {
                      Session["prmapprove"] = Request["prmapprove"];
                  }

                  ListViewUser(Int32.Parse(Request["prmapprove"].ToString())); ////// ส่ง id ไป where
              }



                 //////////////////////////  ดับเบิลคลิกมาจาก gridview  อนุมัติคำขอ
              if ((Request["prmapprovetrue"] != null && Request["prmapprovetrue"] != "") || (Session["prmapprovetrue"] != null && Session["prmapprovetrue"] != "")) ///// ส่งอนุมัต
              {
                  if (Session["prmapprovetrue"] == null || (Session["prmapprovetrue"] == "")) //// กดบันทึก มา ไม่กดส่ง
                  {
                      Session["prmapprovetrue"] = Request["prmapprovetrue"];
                  }
                  ListViewUser(Int32.Parse(Request["prmapprovetrue"].ToString())); ////// ส่ง id ไป where
                  ListViewUserapprove(Int32.Parse(Request["prmapprovetrue"].ToString())); ////// ส่ง id ไป where
              }

              //////////////////////////  ดับเบิลคลิกมาจาก gridview ประวัติการอนุมัติ  /////	ทะเบียนผู้ใช้น้ำ

              if ((Request["prmviewapprove"] != null && Request["prmviewapprove"] != "") || (Session["prmviewapprove"] != null && Session["prmviewapprove"] != "")) ///// ส่งอนุมัต
              {
                  if (Session["prmviewapprove"] == null || (Session["prmviewapprove"] == "")) //// กดบันทึก มา ไม่กดส่ง
                  {
                      Session["prmviewapprove"] = Request["prmviewapprove"];
                  }

                  ListViewUser(Int32.Parse(Request["prmviewapprove"].ToString())); ////// ส่ง id ไป where
                  ListViewUserapprove(Int32.Parse(Request["prmviewapprove"].ToString())); ////// ส่ง id ไป where

                  txtapprove.Value = "approve";
              }

            }catch(Exception ex){}
           
            //ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('ลงทะเบียนเสร็จแล้ว');", true);
        }
       
        public void ListViewUser(int id)
        {
            try
            {
                OdbcCommand command = new OdbcCommand("SELECT * FROM tbl_petition_information where id="+ id);
                DataTable dt = cls_command.SelectData(command);
               
                if(dt.Rows.Count  > 0)
                {
                 iduser.Value = dt.Rows[0]["id"].ToString();
                }
            }
            catch (Exception ex) 
            { 
            
            }
        }

        public void ListViewUserapprove(int id)
        {
            try
            {
                OdbcCommand command = new OdbcCommand("SELECT * FROM tbl_petition_information where id=" + id);
                DataTable dt = cls_command.SelectData(command);

                if (dt.Rows.Count > 0)
                {
                    txtnumberpetition.Value = dt.Rows[0]["id"].ToString();
                }
            }
            catch (Exception ex)
            {

            }
        }

        //public void Viewapprove(int idpetition)
        //{
        //    try
        //    {
        //        OdbcCommand command = new OdbcCommand("SELECT * FROM tbl_approve where idpetition=" + idpetition);
        //        DataTable dt = cls_command.SelectData(command);

        //        if (dt.Rows.Count > 0)
        //        {
        //            txtnumberpetition.Value = dt.Rows[0]["idpetition"].ToString();
        //        }
        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //}
    }
}