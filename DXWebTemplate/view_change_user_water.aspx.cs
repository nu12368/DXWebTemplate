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
    public partial class view_change_user_water : System.Web.UI.Page
    {
        OdbcCommand command = null;
        DataTable dt = new DataTable("dt");

        string prm = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                result.Text = "";
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

            }
            catch (Exception ex) { }

        }

        public void ListViewUser(int id)
        {
            try
            {
                OdbcCommand command = new OdbcCommand("SELECT * FROM tbl_petition_information where id=" + id);
                DataTable dt = cls_command.SelectData(command);

                if (dt.Rows.Count > 0)
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

    }
}