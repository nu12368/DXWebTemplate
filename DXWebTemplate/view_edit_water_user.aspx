<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view_edit_water_user.aspx.cs" Inherits="DXWebTemplate.view_edit_water_user" %>


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
     .auto-style15 {
         height: 42px;
         width: 646px;
     }
     .auto-style25 {
         width: 328px;
     }
     .auto-style34 {
         width: 142px;
     }
     .auto-style37 {
         width: 891px;
     }
     .auto-style44 {
         width: 166px;
     }
     .auto-style45 {
         width: 163px;
     }

     /*input[type=text] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border:none;
  border-bottom: 1px dotted ;
}*/
     .auto-style46 {
         width: 163px;
         height: 19px;
     }
     .auto-style47 {
         width: 97px;
     }
     .auto-style48 {
         width: 65px;
     }
    </style>
</head>
    <script>
        function onload() {
            var prmid = document.getElementById("iduser").value;
            //  alert(prmid);
            if (prmid != "") {
                var val = 'prm_edit_view=' + prmid;
                // alert(val);
                $.ajax({
                    url: 'selectdata.aspx',
                    data: val,
                    type: "POST",
                    cache: false,
                    processData: false,
                    success: function (msg) {
                        if (msg != "") {

                            var _sp = msg.split(':');

                         


                            if (_sp[1] == "บุคคลธรรมดา") {
                                document.getElementById("c5").checked = true;
                            }
                            if (_sp[1] == "นิติบุคคล") {
                                document.getElementById("c6").checked = true;
                            }
                            if (_sp[2] == "นาย") {
                                document.getElementById("c01").checked = true;
                            }
                            if (_sp[2] == "นาง") {
                                document.getElementById("c02").checked = true;
                            }
                            if (_sp[2] == "นางสาว") {
                                document.getElementById("c03").checked = true;
                            }
                            if (_sp[2] == "อื่นๆ") {
                                document.getElementById("c04").checked = true;
                            }
                           // alert(_sp[8]);
                            document.getElementById("t38").value = _sp[0];
                            document.getElementById("t01").value = _sp[3];
                            document.getElementById("t02").value = _sp[4];
                            document.getElementById("t03").value = _sp[5]; 
                            document.getElementById("t_editdate").value = _sp[6];
                            document.getElementById("t04").value = _sp[7];
                            document.getElementById("t15").value = _sp[8];
                            document.getElementById("t16").value = _sp[9];
                            document.getElementById("t17").value = _sp[10];
                            document.getElementById("t18").value = _sp[11];
                            document.getElementById("t19").value = _sp[12];
                            document.getElementById("t20").value = _sp[13];
                            document.getElementById("t21").value = _sp[14];
                            document.getElementById("t22").value = _sp[15];
                            document.getElementById("t23").value = _sp[16];
                            document.getElementById("t24").value = _sp[17];
                            document.getElementById("t25").value = _sp[22];
                            document.getElementById("t26").value = _sp[23];
                            document.getElementById("t27").value = _sp[25];
                            document.getElementById("t28").value = _sp[26];
                   
                            combo4.SetText("ปกติ");
                            combo5.SetText("ปกติ");


                            combo1.SetText(_sp[18]);
                            combo2.SetText(_sp[19]);
                            combo3.SetText(_sp[24]);
                            document.getElementById("txtcombo1").value = _sp[18];
                            document.getElementById("txtcombo2").value = _sp[19];
                            document.getElementById("txtcombo3").value = _sp[24];
                         


                            if (_sp[20] == "ถาวร") {
                                document.getElementById("c8").checked = true;
                            }
                            if (_sp[20] == "ชั่วคราว") {
                                document.getElementById("c9").checked = true;
                            }
                            if (_sp[21] == "ตึก") {
                                document.getElementById("c10").checked = true;
                            }
                            if (_sp[21] == "อาคารพาณิชย์") {
                                document.getElementById("c11").checked = true;
                            }
                            if (_sp[21] == "ไม้") {
                                document.getElementById("c12").checked = true;
                            }



                            var newdate4 = _sp[27].split('-');
                            var birthdate4 = newdate4[2] + "-" + newdate4[1] + "-" + newdate4[0];
                            var dob4 = new Date(Date.parse(birthdate4));
                            if (dob4.toString() == "Invalid Date") {
                                dateinstall.SetDate(null);
                            } else {
                                dateinstall.SetDate(dob4);
                            }

                            var jsDateinstall = dateinstall.GetDate();

                            document.getElementById("dateinstallyear").value = jsDateinstall.getFullYear();
                            document.getElementById("dateinstallmonth").value = jsDateinstall.getMonth();
                            document.getElementById("dateinstallday").value = jsDateinstall.getDate();

                        }

                    },
                    error: function (xmlhttprequest, textstatus, errorthrown) {

                        console.log("error: " + errorthrown);
                    }
                });
            }

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
                                            <h3>แก้ไขทะเบียนผู้ใช้น้ำ</h3>
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

                                           <asp:Label ID="result" CssClass="lable" ForeColor="Green" runat="server"></asp:Label>
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
                                                         <asp:Label ID="Label77" CssClass="lable" runat="server"  Text="เลขที่ผู้ใช้น้ำ "></asp:Label>&nbsp;
                                                </td>
                                                <td>
                                                   
                                                     <input type="text" id="t38" autocomplete="off"  class="txt" name="t38"  />
                                                </td>
                                            </tr>
                                            <tr><td>&nbsp;</td></tr>
                                           
                                             
                                        </table>
                                     
                                    </div>
                             
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup> 




                                        <dx:LayoutGroup Caption="แก้ไขทะเบียนผู้ใช้น้ำ"    GroupBoxStyle-Caption-Font-Size="18px"  ColCount="3"  GroupBoxDecoration="Box">
            
<GroupBoxStyle>
<Caption Font-Size="18px"></Caption>
</GroupBoxStyle>
            
                                <Items>
               
               
                      <dx:LayoutItem HorizontalAlign="Left" Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer Width="10px" runat="server" ID="n1"  SupportsDisabledAttribute="True">
                                    <div style="width: 897px">
                                        <table>
                                            <tr >
                                                <td>
                                                   
                                                </td>

                                                <td >
                                                 
                                                     <table style="width: 417px">
                                                           <tr>
                                                 <td class="auto-style44" style="text-align:right;">
                                                     <asp:Label ID="Label15" CssClass="lable" runat="server"  Text="ประเภทผู้ใช้น้ำ "></asp:Label>&nbsp;
                                                 </td>
                                                              
                                                 <td>
                                                   
                                                   <input type="checkbox" id="c5" name="c5" value="บุคคลธรรมดา"  />  <asp:Label ID="Label16" CssClass="lable" runat="server"  Text="บุคคลธรรมดา"></asp:Label>
                                                <input type="checkbox" id="c6" name="c6"  value="นิติบุคคล" />   <asp:Label ID="Label17" CssClass="lable" runat="server"  Text="นิติบุคคล"></asp:Label>
                                              
                                                    
                                                 &nbsp;</td>
                                             </tr>
                                                           <tr><td class="auto-style44">&nbsp;</td></tr>
                                                           <tr><td class="auto-style44">
                                                               <asp:Label ID="Label14" CssClass="lable" runat="server" Font-Bold="true"  Text="ข้อมูลผู้ใช้น้ำ"></asp:Label>
                                                               </td></tr>
                                                           <tr><td class="auto-style44">&nbsp;</td></tr>
                                                         <tr>
                                                                   <td class="auto-style34" style="text-align:right;">
                                                     <asp:Label ID="Label2" CssClass="lable" runat="server"  Text="คำนำหน้าชื่อ "></asp:Label>
                                                 </td>
                                                 <td>
                                                   
                                                   <input type="checkbox" id="c01" name="c01" value="นาย"  />  <asp:Label ID="Label10" CssClass="lable" runat="server"  Text="นาย"></asp:Label>
                                                <input type="checkbox" id="c02" name="c02"  value="นาง" />   <asp:Label ID="Label11" CssClass="lable" runat="server"  Text="นาง"></asp:Label>
                                              <input type="checkbox" id="c03" name="c03" value="นางสาว"  />  <asp:Label ID="Label12" CssClass="lable" runat="server"  Text="นางสาว"></asp:Label>
                                                 <input type="checkbox" id="c04" name="c04" value="อื่นๆ"  />   <asp:Label ID="Label13" CssClass="lable" runat="server"  Text="อื่นๆ"></asp:Label>
                                                    
                                                 &nbsp;</td>
                                                         </tr>
                                                         <tr><td class="auto-style44">&nbsp;</td></tr>
                                             <tr>
                                                 <td class="auto-style44" style="text-align:right;">
                                                     <asp:Label ID="Label1" CssClass="lable" runat="server"  Text="ชื่อ "></asp:Label> &nbsp;
                                                   
                                                 </td>
                                                 <td>
                                                      <input type="text" id="t01"  autocomplete="off"    name="t01" class="txt" />
                                                  </td>

                                             </tr>
                                             <tr><td class="auto-style44"><div>&nbsp;</div></td></tr>
                                            
                                                          <tr>
                                                 <td class="auto-style44" style="text-align:right;">
                                                     <asp:Label ID="Label3" CssClass="lable" runat="server"  Text="นามสกุล "></asp:Label>&nbsp;
                                                 </td>
                                                 <td>
                                                         <input type="text" id="t02" autocomplete="off" name="t02" class="txt" />
                                    </td>
                                   
                                             </tr>
                                              <tr><td class="auto-style44"><div>&nbsp;</div></td></tr>

                                                                       <tr>
                                                 <td class="auto-style44" style="text-align:right;">
                                                     <asp:Label ID="Label20" CssClass="lable" runat="server"  Text="เลขบัตรประชาชน"></asp:Label>&nbsp;
                                                 </td>
                                                 <td>
                                                  <input type="text" id="t03" autocomplete="off" name="t03" class="txt" />
                                            </td>
 
                                             </tr>
  <tr><td class="auto-style44"><div>&nbsp;</div></td></tr>
                                                 <tr>
                                                 <td class="auto-style44" style="text-align:right;">
                                                     <asp:Label ID="Label4" CssClass="lable" runat="server"  Text="วัน เดือน ปี เกิด "></asp:Label>&nbsp;
                                                 </td>
                                                 <td>
                                                  <input type="text" id="t_editdate" autocomplete="off" name="t_editdate" class="txt" />
                                                     <%--  <dx:ASPxDateEdit ID="ASPxDateEdit4"  runat="server"   ClientInstanceName="debirthdatenew" CssClass="txt" Font-Bold="true"  ButtonEditEllipsisImage-Url="~/\images/Calendar_24x24.png" Width="260px">
                                  
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
                                                     </script>--%>
                                            </td>
 
                                             </tr>
                                              <tr><td class="auto-style44"><div>&nbsp;</div></td></tr>
                                                 <tr>
                                                 <td class="auto-style44" style="text-align:right;">
                                                     <asp:Label ID="Label5" CssClass="lable" runat="server"  Text="อายุ "></asp:Label>&nbsp;
                                                 </td>
                                                 <td>
                                                        <input type="text" id="t04" autocomplete="off" style="width:100px" name="t04" class="txt" />&nbsp; <asp:Label ID="Label9" CssClass="lable" runat="server"  Text="ปี "></asp:Label>
                                       </td>
                                                    
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
                                                     <asp:Label ID="Label6" CssClass="lable" runat="server" Font-Bold="true" Text="ที่ตั้งมาตรวัด"></asp:Label>
                                                 </td>
                                             </tr>
                                                         <tr><td class="auto-style35">&nbsp;</td></tr>
                                             <tr>
                                                 
                                                 <td class="auto-style35" >
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style47">
                                                                 <asp:Label ID="Label7" CssClass="lable" runat="server"  Text="บ้านเลขที่ :"></asp:Label>
                                                             </td>
                                                             <td class="auto-style4">
                                                                   <input type="text" id="t15" autocomplete="off" name="t15" class="txt" />
                                           </td>
                                                             <td>&nbsp;</td>
                                                              <td class="auto-style48" style="text-align:right" >
                                                                 <asp:Label ID="Label8" CssClass="lable" runat="server"  Text="หมู่ที่ :"></asp:Label> 
                                                             </td>
                                                              <td  class="auto-style4">
                                                                   <input type="text" id="t16" autocomplete="off" name="t16" class="txt" />

                                                              </td>
                                                              
                                                         </tr>
                                                     </table>
                                                 </td>
                                             
                                                 <td style="text-align:right" class="auto-style28">
                                                    &nbsp; <asp:Label ID="Label21" CssClass="lable" runat="server"  Text="ตรอก/ซอย :"></asp:Label>
                                                       
                                                </td>
                                                 <td>
                                                      <input type="text" id="t17"  autocomplete="off" name="t17" class="txt" />

                                                 </td>
                                             </tr>
                                             <tr><td class="auto-style35"><div>&nbsp;</div></td></tr>
                                                          <tr>
                                                 <td class="auto-style35">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style6">
                                                                 <asp:Label ID="Label28" CssClass="lable" runat="server"  Text="ถนน :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t18" autocomplete="off"  name="t18" class="txt" />

                                                             </td>
                                                           
                                                         </tr>
                                                     </table>
                                                     
                                                 </td>
                                                
                                                     <td class="auto-style28" style="text-align:right;">
                                                                <asp:Label ID="Label29" CssClass="lable" runat="server"  Text="ตำบล :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t19" autocomplete="off"  name="t19" class="txt" />
                                          </td> <td><p style="color:red; font-size:20px">*</p></td>
                                                     
                                             </tr>
                                              <tr><td class="auto-style35"><div>&nbsp;</div></td></tr>
                                                          <tr>
                                                 <td class="auto-style35">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style6">
                                                                 <asp:Label ID="Label30" CssClass="lable" runat="server"  Text="อำเภอ :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t20"  autocomplete="off" name="t20" class="txt" />

                                                           </td>
                                                            <td><p style="color:red; font-size:20px">*</p></td>
                                                         </tr>
                                                     </table>
                                                 </td>
                                                                <td class="auto-style28" style="text-align:right;">
                                                                <asp:Label ID="Label31" CssClass="lable" runat="server"  Text="จังหวัด :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t21"  autocomplete="off" name="t21" class="txt" />
                                                  </td>
                                                 <td><p style="color:red; font-size:20px">*</p></td>
                                             </tr>
                                              <tr><td class="auto-style35"><div>&nbsp;</div></td></tr>
                                                 <tr>
                                                 <td class="auto-style35">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style4">
                                                                 <asp:Label ID="Label32" CssClass="lable" runat="server"  Text="รหัสไปรษณีย์ :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t22" autocomplete="off"  name="t22" class="txt" /></td>
                                                           
                                                         </tr>
                                                     </table>
                                                 </td>
                                                 <td class="auto-style28" style="text-align:right;">
                                                                <asp:Label ID="Label33" CssClass="lable" runat="server"  Text="โทรศัพท์บ้าน/มือถือ :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t23"  autocomplete="off" name="t23" class="txt" />
                                         </td> <td><p style="color:red; font-size:20px">*</p></td>
                                             </tr>
                                              <tr><td class="auto-style35"><div>&nbsp;</div></td></tr>
                                                 <tr>
                                                 <td class="auto-style35">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style6">
                                                                 <asp:Label ID="Label34" CssClass="lable" runat="server"  Text="อีเมล์ :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t24" autocomplete="off"  name="t24" class="txt" /></td>
                                                           
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
                                                            
                                                             <table style="width: 1024px">
                                                                                      <tr>
                                                 <td class="auto-style25">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style45" style="text-align:right;">
                                                                 <asp:Label ID="Label35" CssClass="lable" runat="server"  Text="สถานะผู้ใช้น้ำ "></asp:Label>&nbsp;
                                                             </td>
                                                             <td>
                                                                       <dx:ASPxComboBox ID="ASPxComboBox4" CssClass="cb" ClientInstanceName="combo4" runat="server" ValueType="System.String">
                                                         <Items>
                                                              <dx:ListEditItem Text="--เลือก--" Value="1"  Selected="true" />
                                                             <dx:ListEditItem Text="ปกติ" Value="2"   />
                                                            <%-- <dx:ListEditItem Text="60" Value="60"  />
                                                             <dx:ListEditItem Text="90" Value="90"  />
                                                               <dx:ListEditItem Text="120" Value="120"  />
                                                             <dx:ListEditItem Text="180" Value="180" Selected="true" />--%>
                                                         </Items>
                                                                          <ClientSideEvents SelectedIndexChanged="function(e,s) { selectcombo4();}">
</ClientSideEvents>
                                                     </dx:ASPxComboBox>
                                                                     <script type="text/javascript">
                                                                         function selectcombo4() {
                                                                             document.getElementById("txtcombo4").value = combo4.GetText();

                                                                         }
                                                                 </script>
                                                                 <div style="display:none;">
                                                                      <input type="text" id="txtcombo4" autocomplete="off"  name="txtcombo4" class="txt" />
                                                                 </div>
                                                             </td>

                                                           <td class="auto-style45" style="text-align:right;">
                                                                 <asp:Label ID="Label36" CssClass="lable" runat="server"  Text="สถานะ VIP "></asp:Label>&nbsp;
                                                             </td>
                                                             <td>
                                                                       <dx:ASPxComboBox ID="ASPxComboBox5" CssClass="cb" ClientInstanceName="combo5" runat="server" ValueType="System.String">
                                                         <Items>
                                                              <dx:ListEditItem Text="--เลือก--" Value="1"  Selected="true" />
                                                             <dx:ListEditItem Text="ปกติ" Value="2"   />
                                                            <%-- <dx:ListEditItem Text="60" Value="60"  />
                                                             <dx:ListEditItem Text="90" Value="90"  />
                                                               <dx:ListEditItem Text="120" Value="120"  />
                                                             <dx:ListEditItem Text="180" Value="180" Selected="true" />--%>
                                                         </Items>
                                                                          <ClientSideEvents SelectedIndexChanged="function(e,s) { selectcombo5();}">
</ClientSideEvents>
                                                     </dx:ASPxComboBox>
                                                                     <script type="text/javascript">
                                                                         function selectcombo5() {
                                                                             document.getElementById("txtcombo5").value = combo5.GetText();

                                                                         }
                                                                 </script>
                                                                 <div style="display:none;">
                                                                      <input type="text" id="txtcombo5" autocomplete="off"  name="txtcombo5" class="txt" />
                                                                 </div>
                                                             </td>
                                                         </tr>
                                                         <tr><td>&nbsp;</td></tr>

                                                                     <tr>
                                                             <td style="text-align:right;">
                                                                  <asp:Label ID="Label37" CssClass="lable" runat="server"  Text="ประเภทผู้ใช้น้ำ :"></asp:Label>
                                                             </td>
                                                         
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
                                                                           // alert('j6jh6');
                                                                           // alert(combo1.GetText());
                                                                           //   alert(text);

                                                                       }
                                                                 </script>
                                                             </td>
                                                          
                                                              <td style="text-align:right;">
                                                                  <asp:Label ID="Label38" CssClass="lable" runat="server"  Text="รายละเอียด :"></asp:Label>
                                                             </td>
                                                         
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
                                                         <tr><td>&nbsp;</td></tr>

                                                                          <tr>
                                                 <td class="auto-style18" >
                                                                  <asp:Label ID="Label39" CssClass="lable" runat="server"  Text="ประเภทสิ่งปลูกสร้าง :"></asp:Label>

                                                 </td>
                                                               <td>
                                                                      <input type="checkbox" id="c8" name="c8" value="ถาวร"  />  <asp:Label ID="Label40" CssClass="lable" runat="server"  Text="ถาวร"></asp:Label>
                                                <input type="checkbox" id="c9" name="c9"  value="ชั่วคราว" />   <asp:Label ID="Label41" CssClass="lable" runat="server"  Text="ชั่วคราว"></asp:Label>
                                                               </td>
                                                                        

                                                                  <td  class="auto-style19" style="text-align:right;" >
                                                                  <asp:Label ID="Label42" CssClass="lable" runat="server"  Text="ลักษณะอาคาร :"></asp:Label> &nbsp;
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
                                                     </table>
                                                 </td>
                                             </tr>
                                             <tr><td class="auto-style25"><div>&nbsp;</div></td></tr>
                                                          <tr>
                                                 <td class="auto-style25">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style45" style="text-align:right;">
                                                                 <asp:Label ID="Label57" CssClass="lable" runat="server"  Text="เลขประจำมาตรวัด "></asp:Label>&nbsp;
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t26" autocomplete="off"  name="t26" class="txt" />

                                                             </td>
                                                             <td>&nbsp;</td>
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
                                                     </table>
                                                 </td>
                                             </tr>
                                              <tr><td class="auto-style25"><div>&nbsp;</div></td></tr>
                                                        
                                              
                                                                 <tr>
                                                 <td class="auto-style25">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style45" style="text-align:right;">
                                                                 <asp:Label ID="Label63" CssClass="lable" runat="server"  Text="พิกัล ละติจูด "></asp:Label>&nbsp;
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t27" autocomplete="off"  name="t27" class="txt" />&nbsp;

                                                             </td>
                                                             <td>&nbsp;</td>
                                                             <td style="text-align:right;">
                                                                   <asp:Label ID="Label67" CssClass="lable" runat="server"  Text="ลองจิจูด "></asp:Label>&nbsp;
                                                             </td>
                                                              <td>&nbsp;</td>
                                                             <td>
                                                                 <input type="text" id="t28" autocomplete="off"  name="t28" class="txt" />&nbsp;

                                                             </td>
                                                         </tr>
                                                         <tr><td class="auto-style46"></td></tr>
                                                          <tr>
                                                             <td class="auto-style45" style="text-align:right;">
                                                                 <asp:Label ID="Label18" CssClass="lable" runat="server"  Text="วันที่ติดตั้งมาตรวัด "></asp:Label>&nbsp;
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
                                     <div style="margin-left: 0px; text-align:right;" >
                                            <button type="submit" form="form1" class="button" name="Edit_Submit" value="Edit_Submit">บันทึก
                                                      <img src="images/091.png" />
                                                     
                                                 </button>
                                            <button type="submit" form="form1" class="button" name="cancel" value="Edit_cancel">ยกเลิก
                                                      <img src="images/020.png" />
                                                 </button>
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





            function _return() {

                alert('_return');
                return true;
            }

        </script>




    </form>
</body>
</html>

