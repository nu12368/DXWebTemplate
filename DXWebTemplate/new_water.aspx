<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="new_water.aspx.cs" Inherits="DXWebTemplate.view" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v16.1, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WAC</title>
<meta name="viewport" content="width=device-width, user-scalable=no, maximum-scale=1.0, minimum-scale=1.0" />
 <%-- <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=tis-620">--%>

    <%--    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/omr.ico">--%>
    <%--<link rel="shortcut icon" href="images/omr.ico">--%>
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.4/themes/gray/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.4/themes/icon.css"/>
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.4/demo/demo.css"/>
    <script type="text/javascript" src="jquery-easyui-1.4/jquery.min.js"></script>
    <script type="text/javascript" src="jquery-easyui-1.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="Scripts/JScript.js"></script>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

         <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"/>

  <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.css'/>
 <style type="text/css">
        .circular {
            width: 300px;
            height: 300px;
            border-radius: 150px;
            -webkit-border-radius: 150px;
            -moz-border-radius: 150px;
            background: url(http://link-to-your/image.jpg) no-repeat;
            box-shadow: 0 0 8px rgba(0, 0, 0, .8);
            -webkit-box-shadow: 0 0 8px rgba(0, 0, 0, .8);
            -moz-box-shadow: 0 0 2px rgba(0, 0, 0, .8);
        }

        hr.style-A {
            border: 0;
            height: 0;
            border-top: 1px solid rgba(0, 0, 0, 0.1);
            border-bottom: 1px solid rgba(255, 255, 255, 0.3);
        }


        .link-cursor {
            cursor: pointer;
            text-decoration: none;
        }

        .txt-header {
            text-shadow: 1px 1px #BDBDBD;
        }

        .img-shadow {
            box-shadow: 10px 10px 5px #888888;
        }

        .BeerStyle {
            /*background-color:#A9D0F5;
            background: #507BA4;*/
            border: 2px solid #CEE3F6;
            font-weight: bold;
            color: #424242;
            border-radius: 0px;
            background: -webkit-linear-gradient(top left, #A9D0F5 0%, #FFFFFF 100%);
        }

        a.notif {
            position: relative;
            display: block;
            height: 37px;
            width: 37px;
            background: url('images/Alert.png');
            background-size: contain;
            text-decoration: none;
        }

        .num {
            position: absolute;
            right: 5px;
            top: 4px;
            color: #fff;
        }
.img {
    background: #fff;
    border: solid 1px #ccc;
    padding: 4px;
    width:250px;
    height:300px;
}
     .txt {
      width: 100%;
  padding: 12px 20px;
  margin: 1px 0 1px 1409;
  box-sizing: border-box;
     height:30px;
     font-size:16px;
     }
          .txt2 {
      width: 200%;
  padding: 12px 20px;
  margin: 1px 0;
  box-sizing: border-box;
     height:30px;
     }
               .cb {
      width: 100%;
     height:30px;
     
     
     }
               .button {
    background-color: #ff6a00; /* Green */
    border: none;
    color: white;
    /*padding: 8px 15px;*/
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    height:40px;
}

     .lable {
         font-size:16px;
     }
     .auto-style4 {
         width: 126px;
     }
     .auto-style5 {
         width: 174px;
     }
     .auto-style6 {
         width: 63px;
     }
     .auto-style12 {
         width: 182px;
     }
     .auto-style15 {
         height: 42px;
         width: 646px;
     }
     .auto-style18 {
         width: 166px;
     }
     .auto-style19 {
         width: 123px;
     }
     .auto-style23 {
         width: 151px;
     }
     .auto-style24 {
         width: 147px;
     }
     .auto-style25 {
         width: 328px;
     }
     .auto-style27 {
         width: 291px;
     }
     .auto-style28 {
         width: 161px;
     }
     .auto-style29 {
         width: 324px;
     }
     .auto-style34 {
         width: 142px;
     }
     .auto-style35 {
         width: 356px;
     }
     .auto-style37 {
         width: 891px;
     }
     .auto-style38 {
         width: 76px;
     }
     .auto-style40 {
         width: 200px;
     }
    </style>
</head>
    <script>
        function onload() {
            var prmid = document.getElementById("iduser").value;
            var txtnumberpetition = document.getElementById("txtnumberpetition").value;
            if (prmid != "") {
                var val = 'prm_id=' + prmid;
                // alert(val);
                $.ajax({
                    url: 'selectdata.aspx',
                    data: val,
                    type: "POST",
                    cache: false,
                    processData: false,
                    success: function (msg) {
                        if (msg != "") {
                            var sp_return = msg.split(';');
                            var _sp = sp_return[0].split(':'); /////// ข้อมูลร้องขอ
                            document.getElementById("t1").value = _sp[1];
                            document.getElementById("t2").value = _sp[2];
                            document.getElementById("t3").value = _sp[3];
                            document.getElementById("t4").value = _sp[5];
                            document.getElementById("t5").value = _sp[6];
                            document.getElementById("t6").value = _sp[7];
                            document.getElementById("t7").value = _sp[8];
                            document.getElementById("t8").value = _sp[9];
                            document.getElementById("t9").value = _sp[10];
                            document.getElementById("t10").value = _sp[11];
                            document.getElementById("t11").value = _sp[12];
                            document.getElementById("t12").value = _sp[13];
                            document.getElementById("t13").value = _sp[14];
                            document.getElementById("t14").value = _sp[15];
                            var newdate = _sp[16].split('-');
                            var petition = newdate[2] + "-" + newdate[1] + "-" + newdate[0];
                            var dob = new Date(Date.parse(petition));


                            if (dob.toString() == "Invalid Date") {
                                de3.SetDate(null);
                            } else {
                                de3.SetDate(dob);
                            }


                         
                          //  de3.SetEnabled(false);
                         



                            /////////////////////วันเกิด
                            var newdate2 = _sp[4].split('-');
                            var birthdate = newdate2[2] + "-" + newdate2[1] + "-" + newdate2[0];
                            var dob2 = new Date(Date.parse(birthdate));

                            if (dob2.toString() == "Invalid Date") {
                                debirthdate.SetDate(null);
                            } else {
                                debirthdate.SetDate(dob2);
                            }


                           
                          //  debirthdate.SetEnabled(false);


                            if (_sp[0] == "นาย") {
                                document.getElementById("c1").checked = true;
                            }
                            if (_sp[0] == "นาง") {
                                document.getElementById("c2").checked = true;
                            }
                            if (_sp[0] == "นางสาว") {
                                document.getElementById("c3").checked = true;
                            }
                            if (_sp[0] == "อื่นๆ") {
                                document.getElementById("c4").checked = true;
                            }
                            var i;
                            for (i = 1; i < 15; i++) {
                              //  document.getElementById("t" + i.toString()).disabled = true;
                            }


                            if (sp_return[1] != "" && sp_return[1] != null)
                            {
                                var _sp2 = sp_return[1].split(':'); /////// ข้อมูลมิเตอร์

                                //38 เลขคำขอ
                                //26 เลขมาตรวัด
                                document.getElementById("t38").value = _sp2[0];
                                document.getElementById("t26").value = _sp2[1];

                                var _sp3 = sp_return[2].split(':'); /////// ข้อมูลผู้ขอใช้น้ำ
                                if (_sp3[0] == "บุคคลธรรมดา") {
                                    document.getElementById("c5").checked = true;
                                }
                                if (_sp3[0] == "นิติบุคคล") {
                                    document.getElementById("c6").checked = true;
                                }

                                if (_sp3[1] == "นาย") {
                                    document.getElementById("c01").checked = true;
                                }
                                if (_sp3[1] == "นาง") {
                                    document.getElementById("c02").checked = true;
                                }
                                if (_sp3[1] == "นางสาว") {
                                    document.getElementById("c03").checked = true;
                                }
                                if (_sp3[1] == "อื่นๆ") {
                                    document.getElementById("c04").checked = true;
                                }
                                document.getElementById("t01").value = _sp3[2];
                                document.getElementById("t02").value = _sp3[3];
                                document.getElementById("t03").value = _sp3[4];
                                document.getElementById("t04").value = _sp3[6];
                                /////////////////////วันเกิด
                                var newdate3 = _sp3[5].split('-');
                                var birthdate3 = newdate3[2] + "-" + newdate3[1] + "-" + newdate3[0];
                                var dob3 = new Date(Date.parse(birthdate3));
                               

                                if (dob3.toString() == "Invalid Date") {
                                    debirthdatenew.SetDate(null);
                                } else {
                                    debirthdatenew.SetDate(dob3);
                                }




                                var jsDatedatenew = debirthdatenew.GetDate();
                                document.getElementById("1birthdateyear").value = jsDatedatenew.getFullYear();
                                document.getElementById("1birthdatemonth").value = jsDatedatenew.getMonth();
                                document.getElementById("1birthdateday").value = jsDatedatenew.getDate();



                             //   debirthdatenew.SetEnabled(false);

                                document.getElementById("t15").value = _sp3[7];
                                document.getElementById("t16").value = _sp3[8];
                                document.getElementById("t17").value = _sp3[9];
                                document.getElementById("t18").value = _sp3[10];
                                document.getElementById("t19").value = _sp3[11];
                                document.getElementById("t20").value = _sp3[12];
                                document.getElementById("t21").value = _sp3[13];
                                document.getElementById("t22").value = _sp3[14];
                                document.getElementById("t23").value = _sp3[15];
                                document.getElementById("t24").value = _sp3[14];

                                var ii;
                                for (ii = 15; ii < 25; ii++) {
                                  //  document.getElementById("t" + ii.toString()).disabled = true;
                                }
                             

                                var _sp4 = sp_return[3].split(':'); /////// ข้อมูลรายละเอียด

                                combo1.SetText(_sp4[0]);
                                combo2.SetText(_sp4[1]);
                                combo3.SetText(_sp4[5]);

                                document.getElementById("txtcombo1").value = _sp4[0];
                                document.getElementById("txtcombo2").value = _sp4[1];
                                document.getElementById("txtcombo3").value = _sp4[5];

                           
                                if (_sp4[2] == "ถาวร") {
                                    document.getElementById("c8").checked = true;
                                }
                                if (_sp4[2] == "ชั่วคราว") {
                                    document.getElementById("c9").checked = true;
                                }
                                if (_sp4[3] == "ตึก") {
                                    document.getElementById("c10").checked = true;
                                }
                                if (_sp4[3] == "อาคารพาณิชย์") {
                                    document.getElementById("c11").checked = true;
                                }
                                if (_sp4[3] == "ไม้") {
                                    document.getElementById("c12").checked = true;
                                }

                                document.getElementById("t25").value = _sp4[4];
                                document.getElementById("t27").value = _sp4[6];
                                document.getElementById("t28").value = _sp4[7];
                                document.getElementById("t29").value = _sp4[9];
                                document.getElementById("t30").value = _sp4[10];
                                document.getElementById("t31").value = _sp4[11];
                                document.getElementById("t32").value = _sp4[12];

                                if (_sp4[13].toString() == "0")
                                {
                                    _sp4[13].toString() = "";
                                }
                                document.getElementById("t33").value = _sp4[13];

                                var newdate4 = _sp4[8].split('-');
                                var birthdate4 = newdate4[2] + "-" + newdate4[1] + "-" + newdate4[0];
                                var dob4 = new Date(Date.parse(birthdate4));
                               // alert(dob4.toString());
                                if (dob4.toString() == "Invalid Date") {
                                    dateinstall.SetDate(null);
                                } else {
                                    dateinstall.SetDate(dob4);
                                }
                               // dateinstall.SetEnabled(false);

                                var jsDateinstall = dateinstall.GetDate();

                                document.getElementById("dateinstallyear").value = jsDateinstall.getFullYear();
                                document.getElementById("dateinstallmonth").value = jsDateinstall.getMonth();
                                document.getElementById("dateinstallday").value = jsDateinstall.getDate();

                                var _sp5 = sp_return[4].split(':'); /////// สำหรับเจ้าหน้าที่
                                document.getElementById("t34").value = _sp5[0];
                                document.getElementById("t35").value = _sp5[1];
                                document.getElementById("t36").value = _sp5[2];
                                document.getElementById("t37").value = _sp5[3];
                                var _approve = document.getElementById("txtnumberpetition").value;
                              //  alert(_approve);
                                if (_approve != "") {
                                    ///////////////////////////////  เปิดให้ใช้งานปกติ
                                    // alert('cvascvf');
                                } else {
                                    document.getElementById("approve").disabled = true;
                                    document.getElementById("notapprove").disabled = true;
                                    document.getElementById("t39").disabled = true;
                                    dateapprove.SetEnabled(false);
                                }
                            }
                           
                            var txtnumberpetition = document.getElementById("txtnumberpetition").value;

                            if (txtnumberpetition != "") {
                                document.getElementById("t34").disabled = true;
                                document.getElementById("t35").disabled = true;
                                document.getElementById("t36").disabled = true;
                                document.getElementById("t37").disabled = true;
                                de3.SetEnabled(false);
                                debirthdate.SetEnabled(false);
                                document.getElementById("c1").disabled = true;
                                document.getElementById("c2").disabled = true;
                                document.getElementById("c3").disabled = true;
                                document.getElementById("c4").disabled = true;
                                var i;
                                for (i = 1; i < 15; i++) {
                                    document.getElementById("t" + i.toString()).disabled = true;
                                }
                                document.getElementById("t38").disabled = true;
                                document.getElementById("t26").disabled = true;
                                document.getElementById("c7").disabled = true;
                                document.getElementById("c07").disabled = true;
                                document.getElementById("c01").disabled = true;
                                document.getElementById("c02").disabled = true;
                                document.getElementById("c03").disabled = true;
                                document.getElementById("c04").disabled = true;
                                document.getElementById("c5").disabled = true;
                                document.getElementById("c6").disabled = true;
                                document.getElementById("t01").disabled = true;
                                document.getElementById("t02").disabled = true;
                                document.getElementById("t03").disabled = true;
                                document.getElementById("t04").disabled = true;
                                /////////////////////วันเกิด
                                debirthdatenew.SetEnabled(false);
                                var ii;
                                for (ii = 15; ii < 25; ii++) {
                                    document.getElementById("t" + ii.toString()).disabled = true;
                                }
                                combo1.SetEnabled(false);
                                combo2.SetEnabled(false);
                                combo3.SetEnabled(false);
                                document.getElementById("c8").disabled = true;
                                document.getElementById("c9").disabled = true;
                                document.getElementById("c10").disabled = true;
                                document.getElementById("c11").disabled = true;
                                document.getElementById("c12").disabled = true;
                                document.getElementById("t25").disabled = true;
                                document.getElementById("t27").disabled = true;
                                document.getElementById("t28").disabled = true;
                                document.getElementById("t29").disabled = true;
                                document.getElementById("t30").disabled = true;
                                document.getElementById("t31").disabled = true;
                                document.getElementById("t32").disabled = true;
                                document.getElementById("t33").disabled = true;
                                dateinstall.SetEnabled(false);
                                document.getElementById("t34").disabled = true;
                                document.getElementById("t35").disabled = true;
                                document.getElementById("t36").disabled = true;
                                document.getElementById("t37").disabled = true;

                                document.getElementById("approve").disabled = false;
                                document.getElementById("notapprove").disabled = false;
                                document.getElementById("t39").disabled = false;
                                //  dateapprove.SetEnabled(false);

                                var checkapprove = document.getElementById("txtapprove").value;
                                if (checkapprove != "") {
                                    
                                    var _sp6 = sp_return[5].split(':'); /////// สำหรับเจ้าหน้าที่
                                   
                                    if (_sp6[0] == "approve") {
                                        document.getElementById("approve").checked = true;
                                    }
                                    if (_sp6[0] == "notapprove") {
                                        document.getElementById("notapprove").checked = true;
                                    }
                                    document.getElementById("t39").value = _sp6[1];

                                    var newdateapprove = _sp6[2].split('-');
                                    var newdateapprovenew = newdateapprove[2] + "-" + newdateapprove[1] + "-" + newdateapprove[0];
                                    var doapprove = new Date(Date.parse(newdateapprovenew));
                                    if (doapprove.toString() == "Invalid Date") {
                                        dateapprove.SetDate(null);
                                    } else {
                                        dateapprove.SetDate(doapprove);
                                    }



                                    document.getElementById("approve").disabled = true;
                                    document.getElementById("notapprove").disabled = true;
                                    document.getElementById("t39").disabled = true;
                                    dateapprove.SetEnabled(false);



                                }
                            }


                        }

                    },
                    error: function (xmlhttprequest, textstatus, errorthrown) {

                        console.log("error: " + errorthrown);
                    }
                });
            }
           
            var _approve = document.getElementById("txtnumberpetition").value;
          //  alert(_approve);
            if (_approve != "") {
            //    alert('if');
                ///////////////////////////////  เปิดให้ใช้งานปกติ
              //document.getElementById("Send").style.backgroundColor = "gray";
              //  document.getElementById("Submit").style.backgroundColor = "gray";
              //  document.getElementById("Submit").disabled = true;
                //  document.getElementById("Send").disabled = true;

               // document.getElementById("Submit").disabled = true;
            
                // alert('cvascvf');
            } else {
                document.getElementById("approve").disabled = true;
                document.getElementById("notapprove").disabled = true;
                document.getElementById("t39").disabled = true;
                dateapprove.SetEnabled(false);
            }
          


          

                //var i;
                //for (i = 15; i < 39; i++) {
                //    document.getElementById("t" + i.toString()).disabled = true;
                //}
   
                //document.getElementById("c5").disabled = true;
                //document.getElementById("c6").disabled = true;
                //document.getElementById("c7").disabled = true;
                //document.getElementById("c8").disabled = true;
                //document.getElementById("c9").disabled = true;
                //document.getElementById("c10").disabled = true;
                //document.getElementById("c11").disabled = true;
                //document.getElementById("c12").disabled = true;
                //document.getElementById("Send").disabled = true;
            //document.getElementById("Sendapprove").style.backgroundColor = "gray";
                //document.getElementById("t01").disabled = true;
                //document.getElementById("t02").disabled = true;
                //document.getElementById("t03").disabled = true;
                //document.getElementById("t04").disabled = true;
                //document.getElementById("approve").disabled = true;
                //document.getElementById("notapprove").disabled = true;
                //document.getElementById("t39").disabled = true;
                //document.getElementById("c01").disabled = true;
                //document.getElementById("c02").disabled = true;
                //document.getElementById("c03").disabled = true;
                //document.getElementById("c04").disabled = true;
                //document.getElementById("c07").disabled = true;
                //dateapprove.SetEnabled(false);
                //debirthdatenew.SetEnabled(false);
                //dateinstall.SetEnabled(false);
                //combo1.SetEnabled(false);
                //combo2.SetEnabled(false);
                //combo3.SetEnabled(false);
           
            
        }
</script>
<body onload="onload()" >
    <form id="form1" name="f1" runat="server" method="POST" action="InsertData.aspx">
       
        <div style="display:none;">
              <input type="text" id="iduser"  autocomplete="off" runat="server" name="iduser"  class="txt" />
             <input type="text" id="txtapprove"  autocomplete="off" runat="server" name="txtapprove"  class="txt" />
               <input type="text" id="datepetition"  autocomplete="off" runat="server" name="datepetition"  class="txt" />
             <input type="text" id="txtnumberpetition"  autocomplete="off" runat="server" name="txtnumberpetition"  class="txt" />
        </div>
         

         <div style="text-align:left;  margin-left:auto;">
         </div>
         <asp:panel id="Panel1" runat="server">
                    <div >
                    <div class="w3-container">

                            <dx:ASPxFormLayout runat="server" ID="ASPxFormLayout1"  RequiredMarkDisplayMode="Auto" UseDefaultPaddings="false" AlignItemCaptionsInAllGroups="true" Width="100%" ColumnCount="3">
            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="500" />
                   <Paddings PaddingBottom="1"  />
        <Styles>
            <LayoutGroupBox CssClass="fullWidth fullHeight"></LayoutGroupBox>
            <LayoutGroup Cell-CssClass="fullHeight">
<Cell CssClass="fullHeight"></Cell>
            </LayoutGroup>
        </Styles>
        <SettingsAdaptivity>

        </SettingsAdaptivity>
                                 <Items>

                                     
<dx:LayoutGroup Caption=""    GroupBoxStyle-Caption-Font-Size="18px"  ColCount="3"  GroupBoxDecoration="Box">
<GroupBoxStyle>
<Caption Font-Size="18px"></Caption>
</GroupBoxStyle>
                                <Items>
                      <dx:LayoutItem HorizontalAlign="Left" Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer Width="10px" runat="server" SupportsDisabledAttribute="True">
                                    <div>
                                            <h3>การขอติดตั้งประปาใหม่</h3>
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                                     <dx:LayoutItem HorizontalAlign="Left"  Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                 <div>&nbsp;</div>
                                      <div>&nbsp;</div>
                                     <div>&nbsp;</div> <div>&nbsp;</div>
                                       <div>

                                           <asp:Label ID="result" CssClass="lable" ForeColor="Green" runat="server" Text=""></asp:Label>
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                   <dx:LayoutItem HorizontalAlign="Left"  Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" ID="NestedControl"  SupportsDisabledAttribute="True">
                                  
                                                      <div>
                                        <table>
                                            <tr>
                                                <td>
                                                         <asp:Label ID="Label77" CssClass="lable" runat="server"  Text="เลขที่รับคำขอ "></asp:Label>
                                                </td>
                                                <td>
                                                   
                                                     <input type="text" id="t38" autocomplete="off"  class="txt" name="t38"  />
                                                </td>
                                            </tr>
                                            <tr><td>&nbsp;</td></tr>
                                            <tr >
                                                <td>
                                                       <asp:Label ID="Label78" CssClass="lable" runat="server" Text="วันที่รับคำขอ"></asp:Label>
        
                                                </td>

                                                <td >
                                                     <dx:ASPxDateEdit ID="ASPxDateEdit3"  runat="server"   ClientInstanceName="de3" CssClass="txt" Font-Bold="true"  ButtonEditEllipsisImage-Url="~/\images/Calendar_24x24.png" Width="260px">
                                  
<ButtonEditEllipsisImage Url="~/\images/Calendar_24x24.png"></ButtonEditEllipsisImage>
<ButtonStyle>
<BackgroundImage ImageUrl="~/\images/Calendar_24x24.png"></BackgroundImage>
</ButtonStyle>
                                                         <ClientSideEvents  ValueChanged="function(s, e)  {
                         var jsDate = de3.GetDate();      
	                     petitiondate(jsDate);
                                                             }" />
                                  </dx:ASPxDateEdit>
                                                      <input type="text" id="petitionyear"  style="display:none;"  name="petitionyear" class="txt" />
                                                       <input type="text" id="petitionmonth"  style="display:none;"  name="petitionmonth" class="txt" />
                                                       <input type="text" id="petitionday"  style="display:none;"  name="petitionday" class="txt" />
                                                     <script>
                                                         function petitiondate(jsDate) {
                                                             var year = jsDate.getFullYear(); // where getFullYear returns the year (four digits)  
                                                             var month = jsDate.getMonth();// where getMonth returns the month (from 0-11)  
                                                             var day = jsDate.getDate();  // where getDate returns the day of the month (from 1-31)  
                                                            
                                                             document.getElementById("petitionyear").value = jsDate.getFullYear() + 543;
                                                             document.getElementById("petitionmonth").value = jsDate.getMonth() + 1;
                                                             document.getElementById("petitionday").value = jsDate.getDate();
                                                            // var d =  document.getElementById("petitionyear").value;
                                                             //alert(d);
                                                        //  document.getElementById('<%=ASPxDateEdit3.ClientID%>') = d;
                                                              
                                                             //ASPxDateEdit3.SetDate(new Date("2010/00/00"));
                                                         }
                                                     </script>
                                                 </td>
                                                                                                 <td>
<p style="color:red; font-size:20px" id="p1">*</p>
                                                 </td>
                                             </tr>
                                             
                                        </table>
                                     
                                    </div>
                             
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup> 




                                        <dx:LayoutGroup Caption="ข้อมูลผู้ยื่นคำร้อง"    GroupBoxStyle-Caption-Font-Size="18px"  ColCount="3"  GroupBoxDecoration="Box">
            
<GroupBoxStyle>
<Caption Font-Size="18px"></Caption>
</GroupBoxStyle>
            
                                <Items>
               
               
                      <dx:LayoutItem HorizontalAlign="Left" Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer Width="10px" runat="server" ID="n1"  SupportsDisabledAttribute="True">
                                    <div>
                                        <table>
                                            <tr >
                                                <td>
                                                   
                                                </td>

                                                <td >
                                                 
                                                     <table style="width: 417px">
                                                           <tr>
                                                 <td class="auto-style34" >
                                                     <asp:Label ID="Label15" CssClass="lable" runat="server"  Text="คำนำหน้าชื่อ :"></asp:Label>
                                                 </td>
                                                 <td>
                                                   
                                                   <input type="checkbox" id="c1" name="c1" value="นาย"  />  <asp:Label ID="Label16" CssClass="lable" runat="server"  Text="นาย"></asp:Label>
                                                <input type="checkbox" id="c2" name="c2"  value="นาง" />   <asp:Label ID="Label17" CssClass="lable" runat="server"  Text="นาง"></asp:Label>
                                              <input type="checkbox" id="c3" name="c3" value="นางสาว"  />  <asp:Label ID="Label18" CssClass="lable" runat="server"  Text="นางสาว"></asp:Label>
                                                 <input type="checkbox" id="c4" name="c4" value="อื่นๆ"  />   <asp:Label ID="Label19" CssClass="lable" runat="server"  Text="อื่นๆ"></asp:Label>
                                                    
                                                 &nbsp;</td>
                                             </tr>
                                                         <tr><td class="auto-style34">&nbsp;</td></tr>
                                             <tr>
                                                 <td class="auto-style34" >
                                                     <asp:Label ID="Label1" CssClass="lable" runat="server"  Text="ชื่อ "></asp:Label> 
                                                   
                                                 </td>
                                                 <td>
                                                      <input type="text" id="t1"  autocomplete="off"    name="t1" class="txt" />
                                                  </td>
                                                 <td>
<p style="color:red; font-size:20px">*</p>
                                                 </td>
                                             </tr>
                                             <tr><td class="auto-style34"><div>&nbsp;</div></td></tr>
                                                          <tr>
                                                 <td class="auto-style34">
                                                     <asp:Label ID="Label2" CssClass="lable" runat="server"  Text="นามสกุล :"></asp:Label>
                                                 </td>
                                                 <td>
                                                        <input type="text" id="t2" autocomplete="off"  name="t2" class="txt" />
                                      </td>
                                                                                                                                                               <td>
<p style="color:red; font-size:20px">*</p>
                                                 </td>
                                             </tr>
                                              <tr><td class="auto-style34"><div>&nbsp;</div></td></tr>
                                                          <tr>
                                                 <td class="auto-style34">
                                                     <asp:Label ID="Label3" CssClass="lable" runat="server"  Text="เลขบัตรประชาชน :"></asp:Label>
                                                 </td>
                                                 <td>
                                                         <input type="text" id="t3" autocomplete="off" name="t3" class="txt" />
                                    </td>
                                                                                                                                                               <td>
<p style="color:red; font-size:20px">*</p>
                                                 </td>
                                             </tr>
                                              <tr><td class="auto-style34"><div>&nbsp;</div></td></tr>
                                                 <tr>
                                                 <td class="auto-style34">
                                                     <asp:Label ID="Label4" CssClass="lable" runat="server"  Text="วัน เดือน ปี เกิด :"></asp:Label>
                                                 </td>
                                                 <td>
                                                  <dx:ASPxDateEdit ID="ASPxDateEdit1"  runat="server"   ClientInstanceName="debirthdate" CssClass="txt" Font-Bold="true"  ButtonEditEllipsisImage-Url="~/\images/Calendar_24x24.png" Width="260px">
                                  
<ButtonEditEllipsisImage Url="~/\images/Calendar_24x24.png"></ButtonEditEllipsisImage>
<ButtonStyle>
<BackgroundImage ImageUrl="~/\images/Calendar_24x24.png"></BackgroundImage>
</ButtonStyle>
                                                         <ClientSideEvents  ValueChanged="function(s, e)  {
                         var jsDate = debirthdate.GetDate();      
	                     setdate(jsDate);
                                                             }" />
                                  </dx:ASPxDateEdit>
                                                      <input type="text" id="birthdateyear"  style="display:none;"  name="birthdateyear" class="txt" />
                                                       <input type="text" id="birthdatemonth"  style="display:none;"  name="birthdatemonth" class="txt" />
                                                       <input type="text" id="birthdateday"  style="display:none;"  name="birthdateday" class="txt" />
                                                     <script>
                                                         function setdate(jsDate)
                                                         {
                                                             var year = jsDate.getFullYear(); // where getFullYear returns the year (four digits)  
                                                             var month = jsDate.getMonth();// where getMonth returns the month (from 0-11)  
                                                             var day = jsDate.getDate();  // where getDate returns the day of the month (from 1-31)  
                                                           
                                                             document.getElementById("birthdateyear").value = jsDate.getFullYear() + 543;
                                                             document.getElementById("birthdatemonth").value = jsDate.getMonth()+1;
                                                             document.getElementById("birthdateday").value = jsDate.getDate();
                                                         }
                                                     </script>
                                            </td>
 <td><p style="color:red; font-size:20px">*</p></td>
                                             </tr>
                                              <tr><td class="auto-style34"><div>&nbsp;</div></td></tr>
                                                 <tr>
                                                 <td class="auto-style34">
                                                     <asp:Label ID="Label5" CssClass="lable" runat="server"  Text="อายุ :"></asp:Label>
                                                 </td>
                                                 <td>
                                                        <input type="text" id="t4" autocomplete="off" name="t4" class="txt" />
                                       </td>
                                             </tr>
                                         </table>
                                                </td>
                                             </tr>
                                             
                                        </table>
                                     
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                                     <dx:LayoutItem HorizontalAlign="Left"  Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <div style="width: 856px">
                                        <table>
                                            <tr >
                                                <td>
                                                   
                                                </td>

                                                <td class="auto-style37" >
                                                 
                                                     <table style="width: 751px">
                                                           <tr>
                                                 <td class="auto-style35" >
                                                     <asp:Label ID="Label6" CssClass="lable" runat="server" Font-Bold="true" Text="ที่อยู่ที่สามารถติดต่อได้"></asp:Label>
                                                 </td>
                                             </tr>
                                                         <tr><td class="auto-style35">&nbsp;</td></tr>
                                             <tr>
                                                 
                                                 <td class="auto-style35" >
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style4">
                                                                 <asp:Label ID="Label11" CssClass="lable" runat="server"  Text="บ้านเลขที่ :"></asp:Label>
                                                             </td>
                                                             <td class="auto-style4">
                                                                   <input type="text" id="t5" autocomplete="off" name="t5" class="txt" />
                                           </td>
                                                             <td>&nbsp;</td>
                                                              <td class="auto-style4" style="text-align:right" >
                                                                 <asp:Label ID="Label7" CssClass="lable" runat="server"  Text="หมู่ที่ :"></asp:Label> 
                                                             </td>
                                                              <td  class="auto-style4">
                                                                   <input type="text" id="t6" autocomplete="off" name="t6" class="txt" />

                                                              </td>
                                                              
                                                         </tr>
                                                     </table>
                                                 </td>
                                             
                                                 <td style="text-align:right" class="auto-style28">
                                                    &nbsp; <asp:Label ID="Label8" CssClass="lable" runat="server"  Text="ตรอก/ซอย :"></asp:Label>
                                                       
                                                </td>
                                                 <td>
                                                      <input type="text" id="t7"  autocomplete="off" name="t7" class="txt" />

                                                 </td>
                                             </tr>
                                             <tr><td class="auto-style35"><div>&nbsp;</div></td></tr>
                                                          <tr>
                                                 <td class="auto-style35">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style6">
                                                                 <asp:Label ID="Label12" CssClass="lable" runat="server"  Text="ถนน :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t8" autocomplete="off"  name="t8" class="txt" />

                                                             </td>
                                                           
                                                         </tr>
                                                     </table>
                                                     
                                                 </td>
                                                
                                                     <td class="auto-style28" style="text-align:right;">
                                                                <asp:Label ID="Label9" CssClass="lable" runat="server"  Text="ตำบล :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t9" autocomplete="off"  name="t9" class="txt" />
                                          </td> <td><p style="color:red; font-size:20px">*</p></td>
                                                     
                                             </tr>
                                              <tr><td class="auto-style35"><div>&nbsp;</div></td></tr>
                                                          <tr>
                                                 <td class="auto-style35">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style6">
                                                                 <asp:Label ID="Label10" CssClass="lable" runat="server"  Text="อำเภอ :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t10"  autocomplete="off" name="t10" class="txt" />

                                                           </td>
                                                            <td><p style="color:red; font-size:20px">*</p></td>
                                                         </tr>
                                                     </table>
                                                 </td>
                                                                <td class="auto-style28" style="text-align:right;">
                                                                <asp:Label ID="Label13" CssClass="lable" runat="server"  Text="จังหวัด :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t11"  autocomplete="off" name="t11" class="txt" />
                                                  </td>
                                                 <td><p style="color:red; font-size:20px">*</p></td>
                                             </tr>
                                              <tr><td class="auto-style35"><div>&nbsp;</div></td></tr>
                                                 <tr>
                                                 <td class="auto-style35">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style4">
                                                                 <asp:Label ID="Label14" CssClass="lable" runat="server"  Text="รหัสไปรษณีย์ :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t12" autocomplete="off"  name="t12" class="txt" /></td>
                                                           
                                                         </tr>
                                                     </table>
                                                 </td>
                                                 <td class="auto-style28" style="text-align:right;">
                                                                <asp:Label ID="Label21" CssClass="lable" runat="server"  Text="โทรศัพท์บ้าน/มือถือ :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t13"  autocomplete="off" name="t13" class="txt" />
                                         </td> <td><p style="color:red; font-size:20px">*</p></td>
                                             </tr>
                                              <tr><td class="auto-style35"><div>&nbsp;</div></td></tr>
                                                 <tr>
                                                 <td class="auto-style35">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style6">
                                                                 <asp:Label ID="Label20" CssClass="lable" runat="server"  Text="อีเมล์ :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t14" autocomplete="off"  name="t14" class="txt" /></td>
                                                           
                                                         </tr>
                                                     </table>
                                                 </td>
                                             </tr>
                                         </table>
                                                </td>
                                             </tr>
                                             
                                        </table>
                                     
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                   <dx:LayoutItem HorizontalAlign="Left"  Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                     <div style="margin-left: 0px">
                                        
                                    </div>
                                      <div>
                                     
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                                    
                        
                    </Items>
                </dx:LayoutGroup>




                               <dx:LayoutGroup Caption="ข้อมูลผู้ขอใช้น้ำ"    GroupBoxStyle-Caption-Font-Size="18px"  ColCount="3"  GroupBoxDecoration="Box">
            
<GroupBoxStyle>
<Caption Font-Size="18px"></Caption>
</GroupBoxStyle>
            
                                <Items>
               
               
                      <dx:LayoutItem HorizontalAlign="Left" Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer Width="10px" runat="server" SupportsDisabledAttribute="True">
                                    <div>
                                        <table>
                                            <tr >
                                                <td >
                                                 
                                                     <table>
                                                           <tr>
                                                 <td >
                                                     <table>
                                                         <tr>
                                                             <td>
                                                                  <asp:Label ID="Label22" CssClass="lable" runat="server"  Text="ประเภทผู้ใช้น้ำ :"></asp:Label>
                                                             </td>
                                                                                                             <td>
<p style="color:red; font-size:20px">*</p>
                                                 </td>
                                                             <td>&nbsp;&nbsp;</td>
                                                              <td>&nbsp;&nbsp;</td>
                                                             <td>
                                                                  <input type="checkbox"  id="c5" name="c5"  value="บุคคลธรรมดา" />  <asp:Label ID="Label23" CssClass="lable" runat="server"  Text="บุคคลธรรมดา"></asp:Label>
                                                 <input type="checkbox"  id="c6" name="c6"  value="นิติบุคคล" />  <asp:Label ID="Label24" CssClass="lable" runat="server"  Text="นิติบุคคล"></asp:Label>
                                             
                                                             </td>
                                                         </tr>
                                                     </table>
                                                    
                                                 </td>
                                             </tr>
                                                    <tr>
                                                        <td>
                                                             <table style="width: 876px">
                                                                 <tr><td class="auto-style29"><div>&nbsp;</div></td></tr>
                                                           <tr>
                                                 <td class="auto-style29" >
                                                     

                                                     <table>
                                                         <tr>
                                                             <td>
                                                                 <asp:Label ID="Label25" CssClass="lable" runat="server" Font-Bold="true" Text="ข้อมูลผู้ขอใช้น้ำ"></asp:Label>
                                                             </td>
                                                            
                                                         </tr>
                                                     </table>

                                                 </td>
                                                               <td class="auto-style12"></td>
                                                          <td >
                                                              <table>
                                                                  <tr>
                                                                      <td>
                                                                            <input type="checkbox"   onclick="a7();"  id="c7" name="c7"   />   <asp:Label ID="Label36" CssClass="lable" runat="server"  Text="ผู้ขอใช้น้ำเป็นบุคคลเดียวกันกับผู้ร้องขอ"></asp:Label>
                                                                      </td>
                                                                  </tr>
                                                              </table>
                                                                
                                                              <script>
                                                                  var i;
                                                                  function a7() {
                                                                      if ($("#c7").is(':checked')) {
                                                                          document.getElementById("t01").value = document.getElementById("t1").value;
                                                                          document.getElementById("t02").value = document.getElementById("t2").value;
                                                                          document.getElementById("t03").value = document.getElementById("t3").value;
                                                                          document.getElementById("t04").value = document.getElementById("t4").value;
                                                                         


                                                                          var jsDate = debirthdate.GetDate();      
                                                                         
                                                   
                                                                      var year = jsDate.getFullYear(); // where getFullYear returns the year (four digits)  
                                                                      var month = jsDate.getMonth();// where getMonth returns the month (from 0-11)  
                                                                      var day = jsDate.getDate();  // where getDate returns the day of the month (from 1-31)  
                                                           
                                                                     // alert(jsDate);
                                                                      debirthdatenew.SetDate(jsDate);


                                              
                                                                      document.getElementById("1birthdateyear").value = year + 543;
                                                                      document.getElementById("1birthdatemonth").value = month + 1;
                                                                      document.getElementById("1birthdateday").value = day;
                                                   



                                                                      if ($("#c1").is(':checked')) { document.getElementById("c01").checked = true; }
                                                                      if ($("#c2").is(':checked')) { document.getElementById("c02").checked = true; }
                                                                      if ($("#c3").is(':checked')) { document.getElementById("c03").checked = true; }
                                                                      if ($("#c4").is(':checked')) { document.getElementById("c04").checked = true; }

                                                                      }
                                                                      else {
                                                                          document.getElementById("t01").value = "";
                                                                          document.getElementById("t02").value = "";
                                                                          document.getElementById("t03").value ="";
                                                                          document.getElementById("t04").value = "";
                                                                          var jsDate;
                                                                          debirthdatenew.SetDate(jsDate);
                                                                          document.getElementById("c01").checked = false;
                                                                          document.getElementById("c02").checked = false;
                                                                          document.getElementById("c03").checked = false;
                                                                          document.getElementById("c04").checked = false;
                                                                      }
                                                                  }
                                                                  
                                                              </script>


                                                              </td>     
                                             </tr>
                                                                   <tr><td class="auto-style29">&nbsp;</td></tr>
                                                         <tr><td class="auto-style29">
                                                              <asp:Label ID="Label45" CssClass="lable" runat="server"  Text="คำนำหน้าชื่อ :"></asp:Label>
                                                               <input type="checkbox" id="c01" name="c01" value="นาย"  />  <asp:Label ID="Label46" CssClass="lable" runat="server"  Text="นาย"></asp:Label>
                                                <input type="checkbox" id="c02" name="c02"  value="นาง" />   <asp:Label ID="Label47" CssClass="lable" runat="server"  Text="นาง"></asp:Label>
                                              <input type="checkbox" id="c03" name="c03" value="นางสาว"  />  <asp:Label ID="Label48" CssClass="lable" runat="server"  Text="นางสาว"></asp:Label>
                                                 <input type="checkbox" id="c04" name="c04" value="อื่นๆ"  />   <asp:Label ID="Label49" CssClass="lable" runat="server"  Text="อื่นๆ"></asp:Label>
                                                             </td></tr>

                                                                  

                                                                  <tr><td class="auto-style29">&nbsp;</td></tr>
                                                                 <tr>
                                                                     <td>
                                                                         <table style="width: 417px">
                                                                              <tr>
                                                 <td class="auto-style40" >
                                                     <asp:Label ID="Label51" CssClass="lable" runat="server"  Text="ชื่อ "></asp:Label> 
                                                   
                                                 </td>
                                                 <td>
                                                      <input type="text" id="t01"  autocomplete="off"    name="t01" class="txt" />
                                                   
                                                  </td>
                                                 <td>
<p style="color:red; font-size:20px">*</p>
                                                 </td>
                                             </tr>
                                             <tr><td class="auto-style40"><div>&nbsp;</div></td></tr>
                                                          <tr>
                                                 <td class="auto-style40">
                                                     <asp:Label ID="Label52" CssClass="lable" runat="server"  Text="นามสกุล :"></asp:Label>
                                                 </td>
                                                 <td>
                                                        <input type="text" id="t02" autocomplete="off"  name="t02" class="txt" />
                                      </td>
                                                                                                                                                               <td>
<p style="color:red; font-size:20px">*</p>
                                                 </td>
                                             </tr>
                                              <tr><td class="auto-style40"><div>&nbsp;</div></td></tr>
                                                          <tr>
                                                 <td class="auto-style40">
                                                     <asp:Label ID="Label53" CssClass="lable" runat="server"  Text="เลขบัตรประชาชน :"></asp:Label>
                                                 </td>
                                                 <td>
                                                         <input type="text" id="t03" autocomplete="off" name="t03" class="txt" />
                                    </td>
                                                                                                                                                               <td>
<p style="color:red; font-size:20px">*</p>
                                                 </td>
                                             </tr>
                                                                               <tr><td class="auto-style40"><div>&nbsp;</div></td></tr>
                                                                                       <tr>
                                                 <td class="auto-style40">
                                                     <asp:Label ID="Label54" CssClass="lable" runat="server"  Text="วัน เดือน ปี เกิด :"></asp:Label>
                                                 </td>
                                                 <td>
                                                  <dx:ASPxDateEdit ID="ASPxDateEdit4"  runat="server"   ClientInstanceName="debirthdatenew" CssClass="txt" Font-Bold="true"  ButtonEditEllipsisImage-Url="~/\images/Calendar_24x24.png" Width="260px">
                                  
<ButtonEditEllipsisImage Url="~/\images/Calendar_24x24.png"></ButtonEditEllipsisImage>
<ButtonStyle>
<BackgroundImage ImageUrl="~/\images/Calendar_24x24.png"></BackgroundImage>
</ButtonStyle>
                                                         <ClientSideEvents  ValueChanged="function(s, e)  {
                         var jsDate = debirthdatenew.GetDate();      
	                     setdatenew(jsDate);
                                                             }" />
                                  </dx:ASPxDateEdit>
                                                      <input type="text" id="1birthdateyear"  style="display:none;"  name="1birthdateyear" class="txt" />
                                                       <input type="text" id="1birthdatemonth"  style="display:none;"  name="1birthdatemonth" class="txt" />
                                                       <input type="text" id="1birthdateday"  style="display:none;"  name="1birthdateday" class="txt" />
                                                     <script>
                                                         function setdatenew(jsDate) {
                                                             var year = jsDate.getFullYear(); // where getFullYear returns the year (four digits)  
                                                             var month = jsDate.getMonth();// where getMonth returns the month (from 0-11)  
                                                             var day = jsDate.getDate();  // where getDate returns the day of the month (from 1-31)  

                                                             document.getElementById("1birthdateyear").value = jsDate.getFullYear() + 543;
                                                             document.getElementById("1birthdatemonth").value = jsDate.getMonth() + 1;
                                                             document.getElementById("1birthdateday").value = jsDate.getDate();
                                                         }
                                                     </script>
                                            </td>
 <td><p style="color:red; font-size:20px">*</p></td>
                                             </tr>
                                              <tr><td class="auto-style40"><div>&nbsp;</div></td></tr>
                                                 <tr>
                                                 <td class="auto-style40">
                                                     <asp:Label ID="Label55" CssClass="lable" runat="server"  Text="อายุ :"></asp:Label>
                                                 </td>
                                                 <td>
                                                        <input type="text" id="t04" autocomplete="off" name="t04" class="txt" />
                                       </td>
                                             </tr>
                                                                         </table>
                                                                     </td>
                                                                 </tr>
                                                                 <tr><td>&nbsp;</td></tr>
                                                                 <tr>
                                                                     <td>
                                                                          <table>
                                                         <tr>
                                                             <td>
                                                                 <asp:Label ID="Label50" CssClass="lable" runat="server"  Font-Bold="true"  Text="สถานที่ติดตั้งมาตรวัด"></asp:Label>
                                                             </td>
                                                            
                                                         </tr>
                                                     </table>
                                                                     </td>
                                                                      <td class="auto-style12"></td>
                                                                     <td>
                                                                            <table>
                                                                  <tr>
                                                                      <td>
                                                                            <input type="checkbox"   onclick="a();"  id="c07" name="c07"   />   <asp:Label ID="Label56" CssClass="lable" runat="server"  Text="เป็นที่อยู่เดียวกันกับผู้ติดต่อ"></asp:Label>
                                                                      </td>
                                                                  </tr>
                                                              </table>
                                                                
                                                              <script>
                                                                  var i;
                                                                  function a() {
                                                                      if ($("#c07").is(':checked')) {
                                                                          document.getElementById("t15").value = document.getElementById("t5").value;
                                                                          document.getElementById("t16").value = document.getElementById("t6").value;
                                                                          document.getElementById("t17").value = document.getElementById("t7").value;
                                                                          document.getElementById("t18").value = document.getElementById("t8").value;
                                                                          document.getElementById("t19").value = document.getElementById("t9").value;
                                                                          document.getElementById("t20").value = document.getElementById("t10").value;
                                                                          document.getElementById("t21").value = document.getElementById("t11").value;
                                                                          document.getElementById("t22").value = document.getElementById("t12").value;
                                                                          document.getElementById("t23").value = document.getElementById("t13").value;
                                                                          document.getElementById("t24").value = document.getElementById("t14").value;

                                                                      }
                                                                      else {
                                                                         
                                                                          document.getElementById("t15").value = "";
                                                                          document.getElementById("t16").value = "";
                                                                          document.getElementById("t17").value = "";
                                                                          document.getElementById("t18").value = "";
                                                                          document.getElementById("t19").value = "";
                                                                          document.getElementById("t20").value = "";
                                                                          document.getElementById("t21").value = "";
                                                                          document.getElementById("t22").value = "";
                                                                          document.getElementById("t23").value = "";
                                                                          document.getElementById("t24").value = "";
                                                                          //for (i = 15; i < 39; i++) {
                                                                          //    document.getElementById("t" + i.toString()).disabled = true;
                                                                          //}
                                                                          // document.getElementById("t5").value = "";
                                                                          // alert('2');
                                                                      }
                                                                  }

                                                              </script>

                                                                     </td>
                                                                 </tr>
                                                                 <tr><td>&nbsp;</td></tr>
                                             <tr>
                                                
                                                 <td class="auto-style29" >
                                                     <table>
                                                         <tr>
                                                             <td>
                                                                   
                                                             </td>
                                                                 <td>
                                                   
                                                 
                                                    
                                                 &nbsp;</td>
                                                         </tr>
                                                         <tr>
                                                             <td class="auto-style5">
                                                                 <asp:Label ID="Label26" CssClass="lable" runat="server"  Text="บ้านเลขที่ :"></asp:Label>
                                                             </td>
                                                             <td class="auto-style4">
                                                                   <input type="text" id="t15" autocomplete="off" name="t15" class="txt" />

                                                             </td>
                                                             <td>&nbsp;</td>
                                                              <td class="auto-style38">
                                                                 <asp:Label ID="Label27" CssClass="lable" runat="server"  Text="หมู่ที่ :"></asp:Label> 
                                                             </td>
                                                              <td  class="auto-style4">
                                                                   <input type="text" id="t16" autocomplete="off" name="t16" class="txt" />

                                                              </td>
                                                              
                                                         </tr>
                                                     </table>
                                                 </td>
                                             
                                                 <td style="text-align:right" class="auto-style12" >
                                                    &nbsp; <asp:Label ID="Label28" CssClass="lable" runat="server"  Text="ตรอก/ซอย :"></asp:Label>
                                                       
                                                </td>
                                                 <td>
                                                      <input type="text" id="t17" autocomplete="off"  name="t17" class="txt" />

                                                 </td>
                                             </tr>
                                             <tr><td class="auto-style29"><div>&nbsp;</div></td></tr>
                                                          <tr>
                                                 <td class="auto-style29">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style6">
                                                                 <asp:Label ID="Label29" CssClass="lable" runat="server"  Text="ถนน :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t18"  autocomplete="off" name="t18" class="txt" />

                                                             </td>
                                                           
                                                         </tr>
                                                     </table>
                                                     
                                                 </td>
                                                
                                                     <td  style="text-align:right;" class="auto-style12">
                                                                <asp:Label ID="Label30" CssClass="lable" runat="server"  Text="ตำบล :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t19" autocomplete="off" name="t19" class="txt" />
                       </td>
                                                     
                                             </tr>
                                              <tr><td class="auto-style29"><div>&nbsp;</div></td></tr>
                                                          <tr>
                                                 <td class="auto-style29">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style6">
                                                                 <asp:Label ID="Label31" CssClass="lable" runat="server"  Text="อำเภอ :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t20" autocomplete="off"  name="t20" class="txt" />

                                                             </td>
                                                           
                                                         </tr>
                                                     </table>
                                                 </td>
                                                                <td style="text-align:right;" class="auto-style12">
                                                                <asp:Label ID="Label32" CssClass="lable" runat="server"  Text="จังหวัด :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t21" autocomplete="off"  name="t21" class="txt" />
                                                        </td>
                                                
                                             </tr>
                                              <tr><td class="auto-style29"><div>&nbsp;</div></td></tr>
                                                 <tr>
                                                 <td class="auto-style29">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style4">
                                                                 <asp:Label ID="Label33" CssClass="lable" runat="server"  Text="รหัสไปรษณีย์ :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t22" autocomplete="off" name="t22" class="txt" />

                                                             </td>
                                                           
                                                         </tr>
                                                     </table>
                                                 </td>
                                                 <td  style="text-align:right;" class="auto-style12">
                                                                <asp:Label ID="Label34" CssClass="lable" runat="server"  Text="โทรศัพท์บ้าน/มือถือ :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t23" autocomplete="off"  name="t23" class="txt" />
                                              </td>
                                             </tr>
                                              <tr><td class="auto-style29"><div>&nbsp;</div></td></tr>
                                                 <tr>
                                                 <td class="auto-style29">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style6">
                                                                 <asp:Label ID="Label35" CssClass="lable" runat="server"  Text="อีเมล์ :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t24"  autocomplete="off" name="t24" class="txt" /></td>
                                                           
                                                         </tr>
                                                     </table>
                                                 </td>
                                             </tr>
                                         </table>
                                                        </td>
                                                    </tr>    
                                         </table>
                                                </td>
                                             </tr>
                                        </table>
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                                     <dx:LayoutItem HorizontalAlign="Left"  Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <div>
                                        <table>
                                            <tr >
                                                <td>
                                                   
                                                </td>

                                                <td >
                                                 
                                                     &nbsp;</td>
                                             </tr>
                                             
                                        </table>
                                     
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                   <dx:LayoutItem HorizontalAlign="Left"  Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                     <div style="margin-left: 0px">
                                        
                                    </div>
                                      <div>
                                     
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                                    
                        
                    </Items>
                </dx:LayoutGroup>    
        




                               <dx:LayoutGroup Caption="รายละเอียด"    GroupBoxStyle-Caption-Font-Size="18px"  ColCount="1"  GroupBoxDecoration="Box">
            
<GroupBoxStyle>
<Caption Font-Size="18px"></Caption>
</GroupBoxStyle>
            
                                <Items>
               
               
                      <dx:LayoutItem HorizontalAlign="Left" Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer Width="10px" runat="server" SupportsDisabledAttribute="True">
                                    <div>
                                        <table>
                                            <tr >
                                                <td >
                                                 
                                                     <table>
                                                           <tr>
                                                 <td class="auto-style15" >
                                                     <table>
                                                         <tr>
                                                             <td>
                                                                  <asp:Label ID="Label37" CssClass="lable" runat="server"  Text="ประเภทผู้ใช้น้ำ :"></asp:Label>
                                                             </td>
                                                             <td>&nbsp;</td>
                                                             <td>
                                                                     <dx:ASPxComboBox ID="ASPxComboBox1" CssClass="cb" ClientInstanceName="combo1"  runat="server" ValueType="System.String">
                                                         <Items>
                                                                <dx:ListEditItem Text="--เลือก--" Value="1"  Selected="true" />
                                                             <dx:ListEditItem Text="ที่พักอาศัยทั่วไปและอื่นๆ" Value="2"  />
                                                             <dx:ListEditItem Text="ราชการและธุรกิจขนาดเล็ก" Value="3"  />
                                                              <dx:ListEditItem Text="รัฐวิสาหกิจอุตสาหกรรมและธุรกิจขนาดใหญ่" Value="4"  />
                                                         </Items>
                                                                          <ClientSideEvents SelectedIndexChanged="function(e,s) { selectcombo1();}">
</ClientSideEvents>
                                                     </dx:ASPxComboBox>
                                                                 <div style="display:none;">
                                                                      <input type="text" id="txtcombo1" autocomplete="off"  name="txtcombo1" class="txt" />
                                                                 </div>
                                                                   <script type="text/javascript">
                                                                       function selectcombo1() {
                                                                           document.getElementById("txtcombo1").value = combo1.GetText();
                                                                       }
                                                                 </script>
                                                             </td>
                                                             <td>&nbsp;</td>
                                                              <td>
                                                                  <asp:Label ID="Label38" CssClass="lable" runat="server"  Text="รายละเอียด :"></asp:Label>
                                                             </td>
                                                             <td>&nbsp;</td>
                                                             <td>
                                                                     <dx:ASPxComboBox ID="ASPxComboBox2" CssClass="cb" ClientInstanceName="combo2" runat="server" ValueType="System.String">
                                                         <Items>
                                                              <dx:ListEditItem Text="--เลือก--" Value="1"  Selected="true" />
                                                             <dx:ListEditItem Text="พักอาศัย" Value="2"   />
                                                            <%-- <dx:ListEditItem Text="60" Value="60"  />
                                                             <dx:ListEditItem Text="90" Value="90"  />
                                                               <dx:ListEditItem Text="120" Value="120"  />
                                                             <dx:ListEditItem Text="180" Value="180" Selected="true" />--%>
                                                         </Items>
                                                                          <ClientSideEvents SelectedIndexChanged="function(e,s) { selectcombo2();}">
</ClientSideEvents>
                                                     </dx:ASPxComboBox>
                                                                            <script type="text/javascript">
                                                                                function selectcombo2() {
                                                                                    document.getElementById("txtcombo2").value = combo2.GetText();

                                                                                }
                                                                 </script>
                                                                 <div style="display:none;">
                                                                      <input type="text" id="txtcombo2" autocomplete="off"  name="txtcombo2" class="txt" />
                                                                 </div>
                                                             </td>
                                                         </tr>
                                                     </table>
                                                    
                                                 </td>
                                             </tr>
                                                    <tr>
                                                        <td>
                                                            
                                                             <table style="width: 1024px">
                                                                 <tr>
                                                                     <td class="auto-style28"><div>&nbsp;</div></td></tr>
                                                           <tr>
                                                 <td class="auto-style18" >
                                                                  <asp:Label ID="Label39" CssClass="lable" runat="server"  Text="ประเภทสิ่งปลูกสร้าง :"></asp:Label>

                                                 </td>
                                                               <td>
                                                                      <input type="checkbox" id="c8" name="c8" value="ถาวร"  />  <asp:Label ID="Label40" CssClass="lable" runat="server"  Text="ถาวร"></asp:Label>
                                                <input type="checkbox" id="c9" name="c9"  value="ชั่วคราว" />   <asp:Label ID="Label41" CssClass="lable" runat="server"  Text="ชั่วคราว"></asp:Label>
                                                               </td>
                                                                        

                                                                  <td  class="auto-style19" >
                                                                  <asp:Label ID="Label42" CssClass="lable" runat="server"  Text="ลักษณะอาคาร :"></asp:Label> 
                                                 </td>
                                                         <td class="auto-style18">
                                                               <input type="checkbox" id="c10" name="c10" value="ตึก"  />   <asp:Label ID="Label43" CssClass="lable" runat="server"  Text="ตึก"></asp:Label>
                                               <input type="checkbox" id="c11" name="c11" value="อาคารพาณิชย์"  />   <asp:Label ID="Label64" CssClass="lable" runat="server"  Text="อาคารพาณิชย์"></asp:Label>
                                         
                                                             </td>
                                                               <td class="auto-style18">
                                                                   <table>
                                                                       <tr>
                                                                           <td class="auto-style18">
                                                                                <input type="text" id="t25" autocomplete="off"  name="t25" class="txt" />
                                                                        </td>
                                                                       </tr>
                                                                   </table>
                                                                    
                                                          </td>
                                                               <td>
                                                                   <asp:Label ID="Label65" CssClass="lable" runat="server"  Text="ชั้น"></asp:Label>
                                                               </td>
                                                               <td>
                                                                     <input type="checkbox" id="c12" name="c12" value="ไม้"  />   <asp:Label ID="Label66" CssClass="lable" runat="server"  Text="ไม้"></asp:Label>
                                                               </td>
                                             </tr>
                                            
                                             <tr><td class="auto-style25"><div>&nbsp;</div></td></tr>
                                                          <tr>
                                                 <td class="auto-style25">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style24">
                                                                 <asp:Label ID="Label57" CssClass="lable" runat="server"  Text="เลขประจำมาตรวัด :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t26" autocomplete="off"  name="t26" class="txt" />

                                                             </td>
                                                           
                                                         </tr>
                                                     </table>
                                                     
                                                 </td>
                                                
                                                     <td  style="text-align:right;" class="auto-style28">
                                                                <asp:Label ID="Label58" CssClass="lable" runat="server"  Text="ขนาดท่อ :"></asp:Label>
                                                             </td>
                                                             <td class="auto-style19">
                                                                 <dx:ASPxComboBox ID="ASPxComboBox3" CssClass="cb" ClientInstanceName="combo3" runat="server" ValueType="System.String">
                                                         <Items>
                                                               <dx:ListEditItem Text="--เลือก--" Value="1"  Selected="true" />
                                                             <dx:ListEditItem Text="1/2" Value="2"   />
                                                             <dx:ListEditItem Text="1/4" Value="3"  />
                                                          
                                                         </Items>
                                                                         <ClientSideEvents SelectedIndexChanged="function(e,s) { selectcombo3();}">
</ClientSideEvents>
                                                     </dx:ASPxComboBox>
                                                                         <script type="text/javascript">
                                                                             function selectcombo3() {
                                                                                 document.getElementById("txtcombo3").value = combo3.GetText();

                                                                             }
                                                                 </script>
                                                                 <div style="display:none;">
                                                                      <input type="text" id="txtcombo3" autocomplete="off"  name="txtcombo3" class="txt" />
                                                                 </div>
                                                   </td>
                                                     
                                             </tr>
                                              <tr><td class="auto-style25"><div>&nbsp;</div></td></tr>
                                                          <tr>
                                                 <td class="auto-style25">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style24">
                                                                 <asp:Label ID="Label59" CssClass="lable" runat="server"  Text="พิกัด ละติจูล :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t27" autocomplete="off"  name="t27" class="txt" />

                                                             </td>
                                                           
                                                         </tr>
                                                     </table>
                                                 </td>
                                                                <td style="text-align:right;" class="auto-style28">
                                                                <asp:Label ID="Label60" CssClass="lable" runat="server"  Text="ลองจิจูล :"></asp:Label>
                                                             </td>
                                                             <td class="auto-style19">
                                                                 <input type="text" id="t28" autocomplete="off"  name="t28" class="txt" />
                                                   </td>
                                                
                                             </tr>
                                              <tr><td class="auto-style25"><div>&nbsp;</div></td></tr>
                                                 <tr>
                                                 <td class="auto-style25">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style42">
                                                                 <asp:Label ID="Label61" CssClass="lable" runat="server"  Text="วันที่ติดตั้งมาตรวัด :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                  <dx:ASPxDateEdit ID="ASPxDateEdit6"  runat="server"   ClientInstanceName="dateinstall" CssClass="txt" Font-Bold="true" ButtonEditEllipsisImage-Url="~/\images/Calendar_24x24.png" Width="260px">
                                  
<ButtonEditEllipsisImage Url="~/\images/Calendar_24x24.png"></ButtonEditEllipsisImage>
<ButtonStyle>
<BackgroundImage ImageUrl="~/\images/Calendar_24x24.png"></BackgroundImage>
</ButtonStyle>
                                                         <ClientSideEvents  ValueChanged="function(s, e)  {
                         var jsDate = dateinstall.GetDate();      
	                     setdatedetails(jsDate);
                                                             }" />
                                  </dx:ASPxDateEdit>
                                                      <input type="text" id="dateinstallyear"  style="display:none;"  name="dateinstallyear" class="txt" />
                                                       <input type="text" id="dateinstallmonth"  style="display:none;"  name="dateinstallmonth" class="txt" />
                                                       <input type="text" id="dateinstallday"  style="display:none;"  name="dateinstallday" class="txt" />
                                                     <script>
                                                         function setdatedetails(jsDate) {
                                                             var year = jsDate.getFullYear(); // where getFullYear returns the year (four digits)  
                                                             var month = jsDate.getMonth();// where getMonth returns the month (from 0-11)  
                                                             var day = jsDate.getDate();  // where getDate returns the day of the month (from 1-31)  

                                                             document.getElementById("dateinstallyear").value = jsDate.getFullYear() + 543;
                                                             document.getElementById("dateinstallmonth").value = jsDate.getMonth() + 1;
                                                             document.getElementById("dateinstallday").value = jsDate.getDate();
                                                         }
                                                     </script>
                                                                
                                                           </td>
                                                         </tr>
                                                     </table>
                                                 </td>
                                             </tr>
                                              <tr><td class="auto-style25"><div>&nbsp;</div></td></tr>
                                                                    <tr><td class="auto-style25"><div>  <asp:Label ID="Label44" CssClass="lable" runat="server" Font-Bold="true" Text="ประมาณค่าใช้จ่าย"></asp:Label></div></td></tr>
                                                  <tr><td class="auto-style25"><div>&nbsp;</div></td></tr>
                                                                 <tr>
                                                 <td class="auto-style25">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style23" style="text-align:right;">
                                                                 <asp:Label ID="Label63" CssClass="lable" runat="server"  Text="ค่าธรรมเนียมติดตั้ง :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t29" autocomplete="off"  name="t29" class="txt" />&nbsp;

                                                             </td>
                                                             <td>
                                                                   <asp:Label ID="Label67" CssClass="lable" runat="server"  Text="บาท"></asp:Label>
                                                             </td>
                                                         </tr>
                                                         <tr><td>&nbsp;</td></tr>
                                                          <tr>
                                                             <td class="auto-style23" style="text-align:right;">
                                                                 <asp:Label ID="Label62" CssClass="lable" runat="server"  Text="ค่าประกันการใช้น้ำ :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t30" autocomplete="off"  name="t30" class="txt" />&nbsp;

                                                             </td>
                                                                 <td>
                                                                   <asp:Label ID="Label68" CssClass="lable" runat="server"  Text="บาท"></asp:Label>
                                                             </td>
                                                         </tr>
                                                          <tr><td>&nbsp;</td></tr>
                                                           <tr>
                                                             <td class="auto-style23" style="text-align:right;">
                                                                 <asp:Label ID="Label71" CssClass="lable" runat="server"  Text="ค่าแรงติดตั้งมิเตอร์ :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t31" autocomplete="off"  name="t31" class="txt" />&nbsp;

                                                             </td>
                                                                 <td>
                                                                   <asp:Label ID="Label72" CssClass="lable" runat="server"  Text="บาท"></asp:Label>
                                                             </td>
                                                         </tr>
                                                          <tr><td>&nbsp;</td></tr>
                                                               <tr>
                                                             <td class="auto-style23" style="text-align:right;">
                                                                 <asp:Label ID="Label73" CssClass="lable" runat="server"  Text="อากรแสตมป์ :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t32" autocomplete="off"  name="t32" class="txt" />&nbsp;

                                                             </td>
                                                                 <td>
                                                                   <asp:Label ID="Label74" CssClass="lable" runat="server"  Text="บาท"></asp:Label>
                                                             </td>
                                                         </tr>
                                                          <tr><td>&nbsp;</td></tr>
                                                               <tr>
                                                             <td class="auto-style23" style="text-align:right;">
                                                                 <asp:Label ID="Label75" CssClass="lable" runat="server"  Text="รวม :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t33" autocomplete="off" name="t33" class="txt" />&nbsp;

                                                             </td>
                                                                 <td>
                                                                 <asp:Label ID="Label76" CssClass="lable" runat="server"  Text="บาท"></asp:Label>
                                                             </td>
                                                         </tr>
                                                     </table>
                                                 </td>
                                             </tr>
                                         </table>
                                                        </td>
                                                    </tr>    
                                         </table>
                                                </td>
                                             </tr>
                                        </table>
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                                     <dx:LayoutItem HorizontalAlign="Left"  Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <div>
                                        <table>
                                            <tr >
                                                <td>
                                                   
                                                </td>

                                                <td >
                                                 
                                                     &nbsp;</td>
                                             </tr>
                                             
                                        </table>
                                     
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                   <dx:LayoutItem HorizontalAlign="Left"  Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                     <div style="margin-left: 0px">
                                        
                                    </div>
                                      <div>
                                     
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                                    
                        
                    </Items>
                </dx:LayoutGroup> 








  <dx:LayoutGroup Caption="สำหรับเจ้าหน้าที่"    GroupBoxStyle-Caption-Font-Size="18px"  ColCount="3"  GroupBoxDecoration="Box">
            
<GroupBoxStyle>
<Caption Font-Size="18px"></Caption>
</GroupBoxStyle>
            
                                <Items>
               
               
                      <dx:LayoutItem HorizontalAlign="Left" Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer Width="10px" runat="server" SupportsDisabledAttribute="True">
                                    <div>
                                        <table>
                                            <tr >
                                                <td >
                                                 
                                                     <table style="width: 452px">
                                              <tr><td class="auto-style25"><div>&nbsp;</div></td></tr>
                                                                    <tr><td class="auto-style25"><div>  <asp:Label ID="Label92" CssClass="lable" runat="server"  Text="ความเห็นเจ้าหน้าที่"></asp:Label></div></td></tr>
                                                  <tr><td class="auto-style25"><div>&nbsp;</div></td></tr>
                                                                 <tr>
                                                 <td class="auto-style25">
                                                     <table>
                                                           <tr>
                                                             <td class="auto-style27" style="text-align:right;">
                                                                
                                                             </td>
                                                             <td>
                                                                   <textarea name="t34" id="t34" cols="40" rows="5"></textarea>
                                                                 </td>
                                                       
                                                         </tr>
                                                           <tr><td class="auto-style27">&nbsp;</td></tr>
                                                         <tr>
                                                             <td class="auto-style27" style="text-align:right;">
                                                                 <asp:Label ID="Label93" CssClass="lable" runat="server"  Text="สำรวจโดย :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t35" autocomplete="off"  name="t35" class="txt" />

                                                             </td>
                                                         
                                                         </tr>
                                                         <tr><td class="auto-style27">&nbsp;</td></tr>
                                                          <tr>
                                                             <td class="auto-style27" style="text-align:right;">
                                                                 <asp:Label ID="Label95" CssClass="lable" runat="server"  Text="ข้อเสนอ :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t36" autocomplete="off"  name="t36" class="txt" />

                                                             </td>
                                                          
                                                         </tr>
                                                          <tr><td class="auto-style27">&nbsp;</td></tr>
                                                           <tr>
                                                             <td class="auto-style27" style="text-align:right;">
                                                                 <asp:Label ID="Label97" CssClass="lable" runat="server"  Text="คำสั่ง :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t37" autocomplete="off" name="t37" class="txt" />

                                                             </td>
                                                              
                                                         </tr>
                                                     </table>
                                                 </td>
                                             </tr>
                                         </table>
                                                        </td>
                                                    </tr>    
                                         </table>
                                            
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                                     <dx:LayoutItem HorizontalAlign="Left"  Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <div>
                                        <table>
                                            <tr >
                                                <td>
                                                   
                                                </td>

                                                <td >
                                                 
                                                     &nbsp;</td>
                                             </tr>
                                             
                                        </table>
                                     
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                   <dx:LayoutItem HorizontalAlign="Left"  Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                     <div style="margin-left: 0px">
                                        
                                    </div>
                                      <div>
                                     
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                                    
                        
                    </Items>
                </dx:LayoutGroup> 

                                     <dx:LayoutGroup Caption="สำหรับผู้อนุมัติ"    GroupBoxStyle-Caption-Font-Size="18px"  ColCount="3"  GroupBoxDecoration="Box">
            
<GroupBoxStyle>
<Caption Font-Size="18px"></Caption>
</GroupBoxStyle>
            
                                <Items>
               
               
                      <dx:LayoutItem HorizontalAlign="Left" Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer Width="10px" runat="server" SupportsDisabledAttribute="True">
                                    <div>
                                        <table>
                                            <tr >
                                                <td >
                                                 
                                                     <table style="width: 452px">
                                              <tr><td class="auto-style25"><div>&nbsp;</div></td></tr>
                                                                    <tr><td class="auto-style25"><div>  <asp:Label ID="Label69" CssClass="lable" runat="server"  Text="ผลพิจารณา"></asp:Label> &nbsp;&nbsp;
                                                                        <input type="checkbox" id="approve" name="approve" value="approve" />
                                                                         <asp:Label ID="Label82" CssClass="lable" runat="server"  Text="อนุมัติ "></asp:Label>
                                                                         <input type="checkbox" id="notapprove" name="notapprove" value="notapprove" />
                                                                         <asp:Label ID="Label83" CssClass="lable" runat="server"  Text="ไม่อนุมัติ "></asp:Label>
                                                                                                 </div></td>
                                                                       <td>
                                                                            
                                                                       </td>
                                                                    </tr>
                                                  <tr><td class="auto-style25"><div>&nbsp;</div></td></tr>
                                                                 <tr>
                                                 <td class="auto-style25">
                                                     
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                 <asp:Label ID="Label70" CssClass="lable" runat="server"  Text="หมายเหตุ "></asp:Label>
                                                            </td>
                                                           <td>
                                                                &nbsp;
                                                           </td>
                                                            <td>
                                                                           <input type="text" id="t39" autocomplete="off" name="t39" class="txt" />
                                                                     </td>
                                                        </tr>
                                                        <tr><td>&nbsp;</td></tr>
                                                              <tr>
                                                            <td>
                                                                 <asp:Label ID="Label79" CssClass="lable" runat="server"  Text="วันที่อนุมัติ "></asp:Label>
                                                            </td>
                                                           <td>
                                                                &nbsp;
                                                           </td>
                                                            <td>
                                                                         <dx:ASPxDateEdit ID="ASPxDateEdit2"  runat="server"   ClientInstanceName="dateapprove" CssClass="txt" Font-Bold="true" ButtonEditEllipsisImage-Url="~/\images/Calendar_24x24.png" Width="260px">
                                  
<ButtonEditEllipsisImage Url="~/\images/Calendar_24x24.png"></ButtonEditEllipsisImage>
<ButtonStyle>
<BackgroundImage ImageUrl="~/\images/Calendar_24x24.png"></BackgroundImage>
</ButtonStyle>
                                                         <ClientSideEvents  ValueChanged="function(s, e)  {
                         var jsDate = dateapprove.GetDate();      
	                     setdateapprovw(jsDate);
                                                             }" />
                                  </dx:ASPxDateEdit>
                                                      <input type="text" id="dateapproveyear"  style="display:none;"  name="dateapproveyear" class="txt" />
                                                       <input type="text" id="dateapprovemonth"  style="display:none;"  name="dateapprovemonth" class="txt" />
                                                       <input type="text" id="dateapproveday"  style="display:none;"  name="dateapproveday" class="txt" />
                                                     <script>
                                                         function setdateapprovw(jsDate) {
                                                             var year = jsDate.getFullYear(); // where getFullYear returns the year (four digits)  
                                                             var month = jsDate.getMonth();// where getMonth returns the month (from 0-11)  
                                                             var day = jsDate.getDate();  // where getDate returns the day of the month (from 1-31)  

                                                             document.getElementById("dateapproveyear").value = jsDate.getFullYear() + 543;
                                                             document.getElementById("dateapprovemonth").value = jsDate.getMonth() + 1;
                                                             document.getElementById("dateapproveday").value = jsDate.getDate();
                                                         }
                                                     </script>
                                                                  
                                                                
                                                             
                                                                     </td>
                                                        </tr>
                                                    </table>
                                                 </td>
                                                                     
                                             </tr>
                                         </table>
                                                        </td>
                                                    </tr>    
                                         </table>
                                            
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                                     <dx:LayoutItem HorizontalAlign="Left"  Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <div>
                                        <table>
                                            <tr >
                                                <td>
                                                   
                                                </td>

                                                <td >
                                                 
                                                     &nbsp;</td>
                                             </tr>
                                             
                                        </table>
                                     
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                   <dx:LayoutItem HorizontalAlign="Left"  Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                     <div style="margin-left: 0px">
                                        
                                    </div>
                                      <div>
                                     
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                                    
                        
                    </Items>
                </dx:LayoutGroup> 


<dx:LayoutGroup Caption=""    GroupBoxStyle-Caption-Font-Size="18px"  ColCount="3" Name="box6"  GroupBoxDecoration="Box">
            
<GroupBoxStyle>
<Caption Font-Size="18px"></Caption>
</GroupBoxStyle>
                                <Items>
               
               
                      <dx:LayoutItem HorizontalAlign="Left" Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer Width="10px" runat="server" SupportsDisabledAttribute="True">
                                    <div>
                         
                                            <button type="submit" form="form1" class="button" name="p1" value="p1">พิมพ์คำร้อง
                                                      <img src="images/193.png" />
                                                 </button>
                                            <button type="submit" form="form1" class="button" name="p2" value="p2">พิมพ์สัญญา
                                                      <img src="images/193.png" />
                                                 </button>
                                         <%-- <dx:ASPxButton ID="ASPxButton3" runat="server"  Font-Size="Medium" Text="พิมพ์คำร้อง" Height="34px" Width="101px"></dx:ASPxButton>&nbsp;&nbsp;
               <dx:ASPxButton ID="ASPxButton4" runat="server"  Font-Size="Medium" Text="พิมพ์สัญญา" Height="34px" Width="101px"></dx:ASPxButton> --%>
                                 
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                                     <dx:LayoutItem HorizontalAlign="Left"  Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                  <p  style="color:red; font-size:14px;">***หากต้องการส่งคำร้องนี้อนุมัติ กดปุ่ม "ส่งอนุมัติ" จะไม่สามารถแก้ไขข้อมูลได้อีก***</p>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                   <dx:LayoutItem HorizontalAlign="Left"  Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                     <div style="margin-left: 0px">
                                                      <div>
                                        <table>
                                            <tr >
                                                <td>
                                                   
                                                 <button type="submit" form="form1" class="button" name="Submit" value="Submit">บันทึก
                                                      <img src="images/091.png" />
                                                     
                                                 </button>
                                                </td>
                                         <%--       <td>&nbsp;</td>
                                                 <td>
                                                   <button type="submit" form="form1" class="button" name="Submit" value="update">อัพเดท
                                                      <img src="images/079.png" />
                                                     
                                                 </button>
                                                </td>--%>
                                                <td>&nbsp;</td>
                                                <td >
                                                              <div style="display:block;" id="divsend" runat="server">
                                                                 <button type="submit" form="form1" class="button" name="Send" id="Send" value="Send">ส่งอนุมัติ
                                                      <img src="images/085.png" />
                                                 </button>

                                                    </div>
                                                 
                                                 </td>
                                                <td>            <div style="display:block;" id="div1" runat="server">
                                                                 <button type="submit" form="form1" class="button" name="Sendapprove" id="Sendapprove" value="Sendapprove">อนุมัติ
                                                      <img src="images/091.png" />
                                                 </button>

                                                    </div></td>
                                                  <td>&nbsp;</td>
                                                <td>
                                                     <button type="submit" form="form1" class="button" name="cancel" value="cancel">ยกเลิก
                                                      <img src="images/020.png" />
                                                 </button>
                                                </td>
                                             </tr>
                                        </table>
                                     
                                    </div>
                                    </div>
                                      <div>
                                     
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup> 
            </Items>
        </dx:ASPxFormLayout>

                        </div>
                    </div>
               </asp:panel>
   
        <script language="JavaScript" type="text/javascript">
            function datetime() {
                alert('ssssssssss');
            }



            function SubMit() {
                alert('ssssssssss');
            }





            function _return()
            {

                alert('_return');
                return true;
            }

        </script>




    </form>
</body>
</html>
