using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.Linq;
using System.Web;

namespace DXWebTemplate
{
    public class create_table
    {
        public static OdbcCommand cmd = new OdbcCommand();
        public static OdbcConnection cn = new OdbcConnection("DSN=PostgreSQL64;UID=postgres;PWD=password@1;");
       public static void createtable()
       {
           try
           {
               OdbcCommand cmd = new OdbcCommand();
               cmd = new OdbcCommand("SELECT * FROM tbl_treeview", cn);

               bool exists = true;
               try
               {
                   var x = cmd.ExecuteScalar();
               }
               catch (Exception ex)
               {
                   exists = false;
               }
               cmd.Dispose();
               cmd = null;

               if (exists == false)
               {
                   string query = "CREATE TABLE tbl_treeview (id serial PRIMARY KEY, " +
                                    "requestid VARCHAR (50) NULL, " +
                                    "name VARCHAR (50) NULL" +
                                    ");";
                   cmd = new OdbcCommand(query, cn);
                   cn.Open();
                   cmd.ExecuteNonQuery();
                   cmd.Dispose();
                   cmd = null;
                   cn.Close();
               }






               cmd = new OdbcCommand("SELECT * FROM tbl_treeview_sub", cn);

                exists = true;
               try
               {
                   var x = cmd.ExecuteScalar();
               }
               catch (Exception ex)
               {
                   exists = false;
               }
               cmd.Dispose();
               cmd = null;

               if (exists == false)
               {
                   string query = "CREATE TABLE tbl_treeview_sub (id serial PRIMARY KEY, " +
                                    "id_view VARCHAR (50) NULL, " +
                                    "name VARCHAR (50) NULL" +
                                    ");";
                   cmd = new OdbcCommand(query, cn);
                   cn.Open();
                   cmd.ExecuteNonQuery();
                   cmd.Dispose();
                   cmd = null;
                   cn.Close();

                   // สร้าง root treeview เป็นอันดับแรก ค่าเริ่มต้น
                   cmd = new OdbcCommand("insert INTO tbl_treeview (name)values('root')");
                   cls_command.InsertData(cmd);
                   cmd.Dispose();
                   cmd = null;
                   cn.Close();


                   OdbcCommand command = new OdbcCommand("SELECT * FROM tbl_treeview");
                   DataTable dt = cls_command.SelectData(command);

                   // สร้าง sub ของ root treeview เป็นอันดับแรก ค่าเริ่มต้น
                   cmd = new OdbcCommand("insert INTO tbl_treeview_sub (id_view,name)values('" + dt.Rows[0][0].ToString() + "','sub')");
                   cls_command.InsertData(cmd);
                   cmd.Dispose();
                   cmd = null;
                   cn.Close();




                   cmd = new OdbcCommand("SELECT * FROM tbl_treeviewgroup", cn);

                    exists = true;
                   try
                   {
                       var x = cmd.ExecuteScalar();
                   }
                   catch (Exception ex)
                   {
                       exists = false;
                   }
                   cmd.Dispose();
                   cmd = null;

                   if (exists == false)
                   {
                        query = "CREATE TABLE tbl_treeviewgroup (id serial PRIMARY KEY, " +
                                        "id_viewsub VARCHAR (50) NULL, " +
                                        "name VARCHAR (50) NULL, " +
                                        "datetime VARCHAR (50) NULL" +
                                        ");";
                       cmd = new OdbcCommand(query, cn);
                       cn.Open();
                       cmd.ExecuteNonQuery();
                       cmd.Dispose();
                       cmd = null;
                       cn.Close();
                   }

               }
           }
           catch (Exception ex) { }
       }




       // insert INTO tbl_user (_username,_password)values('admin','admin')
        //insert INTO tbl_list_menu (m_id,menu,menu_url,menu_icon)values('14','ตรวจสอบ','','')
        //ALTER TABLE tbl_upload_data ADD COLUMN longitude varchar(50)
//        CREATE TABLE public.tbl_petition_information
//(
//    id serial PRIMARY KEY,
//    title_name character varying(200),
//    username character varying(200),
//    lastname character varying(200),
//    idcard character varying(20),
//    birthday character varying(200),
//    old character varying(100),
//    address character varying(200) ,
//    village character varying(200) ,
//    alley character varying(200) ,
//    road character varying(200) ,
//    district character varying(200) ,
//    prefecture character varying(200) ,
//    province character varying(200) ,
//    zipcode character varying(100) ,
//    tel character varying(200) ,
//    email character varying(200) ,
//    datepetition character varying(200),
//    dateinsert character varying(200) ,
//    dateupdate character varying(200)
//)



//CREATE TABLE public.tbl_details
//(
//    id serial PRIMARY KEY,
//    idpetition character varying(20),
//    detailstype character varying(200),
//     details character varying(200),
//      building character varying(200),
//     buildingstyle character varying(200),
//    class character varying(20),
//     waterpipe character varying(200),
//     latitude character varying(100),
//    longitude character varying(200) ,
//  dateinstallgauges character varying(200) ,
//   fee character varying(200) ,
//   insurancefee character varying(200) ,
//   wage character varying(200) ,
//   revenuestamp character varying(200) ,
//   sum character varying(200) ,
//    dateinsert character varying(200),
//    dateupdate character varying(200)
//)

    }
}