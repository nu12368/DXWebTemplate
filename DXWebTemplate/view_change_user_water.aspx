<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view_change_user_water.aspx.cs" Inherits="DXWebTemplate.view_change_user_water" %>


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
     .auto-style6 {
         width: 63px;
     }
     .auto-style28 {
         width: 161px;
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
     .auto-style41 {
         width: 96px;
     }
     .auto-style42 {
         width: 158px;
     }
     .auto-style43 {
         width: 415px;
     }
     .auto-style44 {
         width: 152px;
     }
     .auto-style47 {
         width: 124px;
     }
     .auto-style48 {
         width: 98px;
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
                      

                            var _sp7 = sp_return[6].split(':'); /////// เลขที่ผู้ใช้น้ำ
                            document.getElementById("t40").value = _sp7[0];



                            if (sp_return[1] != "" && sp_return[1] != null) {
                          
                                var _sp2 = sp_return[1].split(':'); /////// ข้อมูลมิเตอร์

                                //38 เลขคำขอ
                                //26 เลขมาตรวัด
                                document.getElementById("t38").value = _sp2[0]; //เลขคำขอ
                                document.getElementById("t19").value = _sp2[1];


                                var _sp3 = sp_return[2].split(':'); /////// ข้อมูลผู้ขอใช้น้ำ
                                //if (_sp3[0] == "บุคคลธรรมดา") {
                                //    document.getElementById("ca1").checked = true;
                                //}
                                //if (_sp3[0] == "นิติบุคคล") {
                                //    document.getElementById("ca2").checked = true;
                                //}

                                document.getElementById("t15").value = _sp3[1] + _sp3[2] + " "+ _sp3[3];
                                document.getElementById("tname").value = _sp3[1] + _sp3[2] + " "+ _sp3[3];
                                document.getElementById("t16").value = "เลขที่ " + _sp[6] + " ม." + _sp[7] + " ซ." +_sp[8] + " ถ."+ _sp[9] +" ต." + _sp[10] + " อ." + _sp[11] +" จ." + _sp[12] + " " + _sp[13];
                              
                                var _sp4 = sp_return[3].split(':'); /////// ข้อมูลรายละเอียด
                                document.getElementById("t17").value = _sp4[0];
                                document.getElementById("t18").value = _sp4[1];
                              
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
            
            } else {
                document.getElementById("approve").disabled = true;
                document.getElementById("notapprove").disabled = true;
                document.getElementById("t39").disabled = true;
                dateapprove.SetEnabled(false);
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
        <SettingsAdaptivity>

        </SettingsAdaptivity>
                                 <Items>

                                     
<dx:LayoutGroup Caption=""    GroupBoxStyle-Caption-Font-Size="16px"  ColCount="3"  GroupBoxDecoration="Box">
<GroupBoxStyle>
<Caption Font-Size="16px"></Caption>
</GroupBoxStyle>
                                <Items>
                      <dx:LayoutItem HorizontalAlign="Left" Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer Width="10px" runat="server" SupportsDisabledAttribute="True">
                                    <div>
                                            <h3>ขอเปลี่ยนแปลงข้อมูล</h3>
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
                                                     <dx:ASPxDateEdit ID="ASPxDateEdit3"  runat="server"   ClientInstanceName="de3" CssClass="txt" Font-Bold="true"  ButtonEditEllipsisImage-Url="~/\images/Calendar_24x24.png" Width="250px">
                                  
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

                                                <td class="auto-style41" >
                                                 
                                                     <table style="width: 417px">
                                                           <tr>
                                                 <td class="auto-style34" >
                                                     <asp:Label ID="Label80" CssClass="lable" runat="server"  Text="เลขที่ผู้ใช้น้ำ "></asp:Label> 
                                                   
                                                 </td>
                                                 <td>
                                                      <input type="text" id="t40"  autocomplete="off"    name="t40" class="txt" />
                                                  </td>
                                                 <td>
<p style="color:red; font-size:20px">*</p>
                                                 </td>
                                             </tr>
                                                          <tr><td class="auto-style34"><div>&nbsp;</div></td></tr>

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
                                                         function setdate(jsDate) {
                                                             var year = jsDate.getFullYear(); // where getFullYear returns the year (four digits)  
                                                             var month = jsDate.getMonth();// where getMonth returns the month (from 0-11)  
                                                             var day = jsDate.getDate();  // where getDate returns the day of the month (from 1-31)  

                                                             document.getElementById("birthdateyear").value = jsDate.getFullYear() + 543;
                                                             document.getElementById("birthdatemonth").value = jsDate.getMonth() + 1;
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
                                                        
                                                                         <table style="width: 888px" >
                                                                              <tr>
                                                 <td class="auto-style47"  >
                                                     <asp:Label ID="Label51" CssClass="lable" runat="server"  Text="ชื่อ-นามสกุล "></asp:Label> 
                                                   
                                                 </td>
                                                 <td >
                                                      <input type="text" id="t15"  autocomplete="off" style=" border:none; border-bottom: 1px dotted; "   name="ะ15" class="txt" />
                                                   
                                                  </td>
                                               
                                             </tr>
                                             <tr><td class="auto-style47" ><div>&nbsp;</div></td></tr>
                                                          <tr>
                                                 <td class="auto-style47" >
                                                     <asp:Label ID="Label52" CssClass="lable" runat="server"  Text="สถานที่ตั้งมาตร "></asp:Label>
                                                 </td>
                                                 <td >
                                                     
                                        <input type="text" id="t16" autocomplete="off" style=" border:none; border-bottom: 1px dotted; width:500px;"  name="t16" class="txt" />
                                                              
                                      </td>
                                     
                                             </tr>
                                              <tr><td class="auto-style47" ><div>&nbsp;</div></td></tr>
                                                          <tr>
                                                 <td class="auto-style47" >
                                                     <asp:Label ID="Label53" CssClass="lable" runat="server"  Text="ประเภทผู้ใช้น้ำ "></asp:Label>
                                                 </td>
                                                 <td >
                                                         <input type="text" id="t17" autocomplete="off" style=" border:none; border-bottom: 1px dotted; " name="t17" class="txt" />
                                    </td>
                                                
                                                                   <td class="auto-style41" >
                                                     <asp:Label ID="Label54" CssClass="lable" runat="server"  Text="รายละเอียด "></asp:Label>
                                                 </td>
                                                 <td>
                                                       <input type="text" id="t18" autocomplete="off" style=" border:none; border-bottom: 1px dotted;  " name="t18" class="txt" />
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
                                     
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                   <dx:LayoutItem HorizontalAlign="Left"  Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                  
                                      <div>
                                     
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                                    
                        
                    </Items>
                </dx:LayoutGroup>    
        




                               <dx:LayoutGroup Caption="มีความประสงค์"    GroupBoxStyle-Caption-Font-Size="18px"  ColCount="1"  GroupBoxDecoration="Box">
            
<GroupBoxStyle>
<Caption Font-Size="18px"></Caption>
</GroupBoxStyle>
            
                                <Items>
               
               
                      <dx:LayoutItem HorizontalAlign="Left" Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer Width="10px" runat="server" SupportsDisabledAttribute="True">
                                    <div>
                                           <input type="checkbox" id="cc1" name="cc1" value="cc1"  />  <asp:Label ID="Label22" CssClass="lable" runat="server"  Text="ขอเปลี่ยนมาตรวัดน้ำประปา"></asp:Label>
                                    </div>
                                    <div>
                                          <input type="checkbox" id="cc2" name="cc2"  value="cc2" />   <asp:Label ID="Label23" CssClass="lable" runat="server"  Text="ขอเปลี่ยนชื่อกรรมสิทธิ์ผู้ใช้น้ำประปา"></asp:Label>
                                    </div>
                                    <div>
                                          <input type="checkbox" id="cc3" name="cc3" value="cc3"  />  <asp:Label ID="Label24" CssClass="lable" runat="server"  Text="ขอยกเลิกสัญญาการใช้น้ำประปา"></asp:Label>
                                    </div>
                                    <div>
                                         <input type="checkbox" id="cc4" name="cc4" value="cc4"  />   <asp:Label ID="Label25" CssClass="lable" runat="server"  Text="ถอนเงินสัญญาการใช้งานน้ำประปาชั่วคราว"></asp:Label>
                                    </div>
                                    <div>
                                                          <input type="checkbox" id="cc5" name="cc5" value="cc5"  />   <asp:Label ID="Label26" CssClass="lable" runat="server"  Text="แจ้งมาตรวัดหาย"></asp:Label>
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                                     <dx:LayoutItem HorizontalAlign="Left"  Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <div>
                                       
                                     
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                   <dx:LayoutItem HorizontalAlign="Left"  Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                   
                                      <div>
                                     
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                                    
                        
                    </Items>
                </dx:LayoutGroup> 








  <dx:LayoutGroup Caption="ขอเปลี่ยนมาตรวัดน้ำประปา"    GroupBoxStyle-Caption-Font-Size="18px"  ColCount="3"  GroupBoxDecoration="Box">
            
<GroupBoxStyle>
<Caption Font-Size="18px"></Caption>
</GroupBoxStyle>
            
                                <Items>
               
               
                      <dx:LayoutItem HorizontalAlign="Left" Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer Width="10px" runat="server" SupportsDisabledAttribute="True">
                                    <div style="width: 856px">
                                        <table>
                                            <tr >
                                                <td>
                                                   
                                                </td>

                                                <td class="auto-style37" >
                                                 
                                                     <table style="width: 751px">
                                          
                                             <tr><td class="auto-style35"><div>&nbsp;</div></td></tr>
                                                          <tr>
                                                 <td class="auto-style35">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style42">
                                                                 <asp:Label ID="Label31" CssClass="lable" runat="server"  Text="เลขประจำมาตรวัดเดิม "></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t19" autocomplete="off"  name="t19" class="txt" />

                                                             </td>
                                                           
                                                         </tr>
                                                     </table>
                                                     
                                                 </td>
                                             </tr>
                                              <tr><td class="auto-style35"><div>&nbsp;</div></td></tr>
                                                          <tr>
                                                 <td class="auto-style35">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style42">
                                                                 <asp:Label ID="Label33" CssClass="lable" runat="server"  Text="เลขประจำมาตรวัดใหม่ "></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t20"  autocomplete="off" name="t20" class="txt" />

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

                                     <dx:LayoutGroup Caption="ขอเปลี่ยนชื่อกรรมสิทธิ์ผู้ใช้มาตรวัดน้ำประปา"    GroupBoxStyle-Caption-Font-Size="18px"  ColCount="3"  GroupBoxDecoration="Box">
            
<GroupBoxStyle>
<Caption Font-Size="18px"></Caption>
</GroupBoxStyle>
                                <Items>
                      <dx:LayoutItem HorizontalAlign="Left" Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer Width="10px" runat="server" SupportsDisabledAttribute="True">
                                    <div>
                                        <table>
                                                     <tr>
                                                             <td>
                                                                <table>
                                                                        <tr>
                                                                            <td>
                                                                                 <asp:Label ID="Label56" CssClass="lable" runat="server"  Text="ชื่อผู้ใช้เดิม "></asp:Label>
                                                                            </td>
                                                                            <td>&nbsp;</td>
                                                                              <td>
                                                                    <input type="text" id="tname" autocomplete="off" name="tname" class="txt" />
                                                                                </td>
                                                                        </tr>
                                                                </table>                                                                
                                                                  
                                                             </td>
                                                           
                                                         </tr>
                                            <tr >
                                                <td >
                                                 
                                                     <table style="width: 452px">
                                                

                                              <tr><td class="auto-style43"><div>&nbsp;</div></td></tr>
                                                                    <tr><td class="auto-style43"><div>  <asp:Label ID="Label69" CssClass="lable" runat="server"  Text="ชื่อผู้ใช้น้ำที่ต้องการเปลี่ยน"></asp:Label> &nbsp;&nbsp;
                                                                        <input type="checkbox" id="ca1" name="ca1" value="ca1" />
                                                                         <asp:Label ID="Label82" CssClass="lable" runat="server"  Text="บุคคลธรรมดา "></asp:Label>
                                                                         <input type="checkbox" id="ca2" name="ca2" value="ca2" />
                                                                         <asp:Label ID="Label83" CssClass="lable" runat="server"  Text="นิติบุคคล "></asp:Label>
                                                                                                 </div></td>
                                                                       <td>
                                                                            
                                                                       </td>
                                                                    </tr>
                                                  <tr><td class="auto-style43"><div>&nbsp;</div></td></tr>
                                                                 <tr>
                                                 <td class="auto-style43">
                                          
                                                         <div style="width: 856px">
                                        <table>
                                            <tr >
                                                <td>
                                                   
                                                </td>

                                                <td class="auto-style37" >
                                                 
                                                     <table style="width: 751px">
                                                           <tr>
                                                 <td class="auto-style35" >
                                                     <asp:Label ID="Label27" CssClass="lable" runat="server" Font-Bold="true" Text="ที่อยู่ที่สามารถติดต่อได้"></asp:Label>
                                                 </td>
                                             </tr>
                                                         <tr><td class="auto-style35">&nbsp;</td></tr>
                                             <tr>
                                                 
                                                 <td class="auto-style35" >
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style4">
                                                                 <asp:Label ID="Label28" CssClass="lable" runat="server"  Text="บ้านเลขที่ :"></asp:Label>
                                                             </td>
                                                             <td class="auto-style4">
                                                                   <input type="text" id="t21" autocomplete="off" name="t21" class="txt" />
                                           </td>
                                                             <td>&nbsp;</td>
                                                              <td class="auto-style4" style="text-align:right" >
                                                                 <asp:Label ID="Label29" CssClass="lable" runat="server"  Text="หมู่ที่ :"></asp:Label> 
                                                             </td>
                                                              <td  class="auto-style4">
                                                                   <input type="text" id="t22" autocomplete="off" name="t22" class="txt" />

                                                              </td>
                                                              
                                                         </tr>
                                                     </table>
                                                 </td>
                                             
                                                 <td style="text-align:right" class="auto-style28">
                                                    &nbsp; <asp:Label ID="Label30" CssClass="lable" runat="server"  Text="ตรอก/ซอย :"></asp:Label>
                                                       
                                                </td>
                                                 <td>
                                                      <input type="text" id="t23"  autocomplete="off" name="t23" class="txt" />

                                                 </td>
                                             </tr>
                                             <tr><td class="auto-style35"><div>&nbsp;</div></td></tr>
                                                          <tr>
                                                 <td class="auto-style35">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style6">
                                                                 <asp:Label ID="Label32" CssClass="lable" runat="server"  Text="ถนน :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t24" autocomplete="off"  name="t24" class="txt" />

                                                             </td>
                                                           
                                                         </tr>
                                                     </table>
                                                     
                                                 </td>
                                                
                                                     <td class="auto-style28" style="text-align:right;">
                                                                <asp:Label ID="Label34" CssClass="lable" runat="server"  Text="ตำบล :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t25" autocomplete="off"  name="t25" class="txt" />
                                          </td> <td><p style="color:red; font-size:20px">*</p></td>
                                                     
                                             </tr>
                                              <tr><td class="auto-style35"><div>&nbsp;</div></td></tr>
                                                          <tr>
                                                 <td class="auto-style35">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style6">
                                                                 <asp:Label ID="Label35" CssClass="lable" runat="server"  Text="อำเภอ :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t26"  autocomplete="off" name="t26" class="txt" />

                                                           </td>
                                                            <td><p style="color:red; font-size:20px">*</p></td>
                                                         </tr>
                                                     </table>
                                                 </td>
                                                                <td class="auto-style28" style="text-align:right;">
                                                                <asp:Label ID="Label36" CssClass="lable" runat="server"  Text="จังหวัด :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t27"  autocomplete="off" name="t27" class="txt" />
                                                  </td>
                                                 <td><p style="color:red; font-size:20px">*</p></td>
                                             </tr>
                                              <tr><td class="auto-style35"><div>&nbsp;</div></td></tr>
                                                 <tr>
                                                 <td class="auto-style35">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style4">
                                                                 <asp:Label ID="Label37" CssClass="lable" runat="server"  Text="รหัสไปรษณีย์ :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t28" autocomplete="off"  name="t28" class="txt" /></td>
                                                           
                                                         </tr>
                                                     </table>
                                                 </td>
                                                 <td class="auto-style28" style="text-align:right;">
                                                                <asp:Label ID="Label38" CssClass="lable" runat="server"  Text="โทรศัพท์บ้าน/มือถือ :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t29"  autocomplete="off" name="t29" class="txt" />
                                         </td> <td><p style="color:red; font-size:20px">*</p></td>
                                             </tr>
                                              <tr><td class="auto-style35"><div>&nbsp;</div></td></tr>
                                                 <tr>
                                                 <td class="auto-style35">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style6">
                                                                 <asp:Label ID="Label39" CssClass="lable" runat="server"  Text="อีเมล์ :"></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t30" autocomplete="off"  name="t30" class="txt" /></td>
                                                           
                                                         </tr>
                                                     </table>
                                                 </td>
                                             </tr>
                                         </table>
                                                </td>
                                             </tr>
                                        </table>
                                    </div>
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


 <dx:LayoutGroup Caption="ขอยกเลิกสัญญการใช้น้ำประปา"    GroupBoxStyle-Caption-Font-Size="18px"  ColCount="3"  GroupBoxDecoration="Box">
            
<GroupBoxStyle>
<Caption Font-Size="18px"></Caption>
</GroupBoxStyle>
                                <Items>
                      <dx:LayoutItem HorizontalAlign="Left" Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer Width="10px" runat="server" SupportsDisabledAttribute="True">
                                    <div style="width: 856px">
                                        <table>
                                            <tr >
                                                <td>
                                                   
                                                </td>

                                                <td class="auto-style37" >
                                                 
                                                     <table style="width: 751px">
                                          
                                             <tr><td class="auto-style35"><div>&nbsp;</div></td></tr>
                                                          <tr>
                                                 <td class="auto-style35">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style42">
                                                                 <asp:Label ID="Label40" CssClass="lable" runat="server"  Text="วันที่ยกเลิกสัญญา "></asp:Label>
                                                             </td>
                                                             <td>
                                                                  <dx:ASPxDateEdit ID="ASPxDateEdit2"  runat="server"   ClientInstanceName="decancel" CssClass="txt" Font-Bold="true"  ButtonEditEllipsisImage-Url="~/\images/Calendar_24x24.png" Width="260px">
                                  
<ButtonEditEllipsisImage Url="~/\images/Calendar_24x24.png"></ButtonEditEllipsisImage>
<ButtonStyle>
<BackgroundImage ImageUrl="~/\images/Calendar_24x24.png"></BackgroundImage>
</ButtonStyle>
                                                         <ClientSideEvents  ValueChanged="function(s, e)  {
                         var jsDate = decancel.GetDate();      
	                     canceldate(jsDate);
                                                             }" />
                                  </dx:ASPxDateEdit>
                                                      <input type="text" id="decancelyear"  style="display:none;"  name="decancelyear" class="txt" />
                                                       <input type="text" id="decancelmonth"  style="display:none;"  name="decancelmonth" class="txt" />
                                                       <input type="text" id="decancelday"  style="display:none;"  name="decancelday" class="txt" />
                                                     <script>
                                                         function canceldate(jsDate) {
                                                             var year = jsDate.getFullYear(); // where getFullYear returns the year (four digits)  
                                                             var month = jsDate.getMonth();// where getMonth returns the month (from 0-11)  
                                                             var day = jsDate.getDate();  // where getDate returns the day of the month (from 1-31)  

                                                             document.getElementById("decancelyear").value = jsDate.getFullYear() + 543;
                                                             document.getElementById("decancelmonth").value = jsDate.getMonth() + 1;
                                                             document.getElementById("decancelday").value = jsDate.getDate();
                                                          
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
                                     
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                   <dx:LayoutItem HorizontalAlign="Left"  Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                      <div>
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup> 




                                     <dx:LayoutGroup Caption="ถอนเงินประกันสัญญาการใช้น้ำประปาชั่วคราว"    GroupBoxStyle-Caption-Font-Size="18px"  ColCount="3"  GroupBoxDecoration="Box">
            
<GroupBoxStyle>
<Caption Font-Size="18px"></Caption>
</GroupBoxStyle>
                                <Items>
                      <dx:LayoutItem HorizontalAlign="Left" Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer Width="10px" runat="server" SupportsDisabledAttribute="True">
                                    <div style="width: 856px">
                                        <table>
                                            <tr >
                                                <td>
                                                   
                                                </td>

                                                <td class="auto-style37" >
                                                 
                                                     <table style="width: 751px">
                                          
                                             <tr><td class="auto-style35"><div>&nbsp;</div></td></tr>
                                                          <tr>
                                                 <td class="auto-style35">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style42">
                                                                 <asp:Label ID="Label42" CssClass="lable" runat="server"  Text="วันที่ถอนเงินประกัน "></asp:Label>
                                                             </td>
                                                             <td>
                                                                  <dx:ASPxDateEdit ID="ASPxDateEdit4"  runat="server"   ClientInstanceName="de4" CssClass="txt" Font-Bold="true"  ButtonEditEllipsisImage-Url="~/\images/Calendar_24x24.png" Width="260px">
                                  
<ButtonEditEllipsisImage Url="~/\images/Calendar_24x24.png"></ButtonEditEllipsisImage>
<ButtonStyle>
<BackgroundImage ImageUrl="~/\images/Calendar_24x24.png"></BackgroundImage>
</ButtonStyle>
                                                         <ClientSideEvents  ValueChanged="function(s, e)  {
                         var jsDate = de4.GetDate();      
	                     date4(jsDate);
                                                             }" />
                                  </dx:ASPxDateEdit>
                                                      <input type="text" id="4year"  style="display:none;"  name="4year" class="txt" />
                                                       <input type="text" id="4month"  style="display:none;"  name="4month" class="txt" />
                                                       <input type="text" id="4day"  style="display:none;"  name="4day" class="txt" />
                                                     <script>
                                                         function date4(jsDate) {
                                                             var year = jsDate.getFullYear(); // where getFullYear returns the year (four digits)  
                                                             var month = jsDate.getMonth();// where getMonth returns the month (from 0-11)  
                                                             var day = jsDate.getDate();  // where getDate returns the day of the month (from 1-31)  

                                                             document.getElementById("4year").value = jsDate.getFullYear() + 543;
                                                             document.getElementById("4month").value = jsDate.getMonth() + 1;
                                                             document.getElementById("4day").value = jsDate.getDate();

                                                         }
                                                     </script>
                                                             </td>
                                                           
                                                         </tr>
                                                     </table>
                                                     
                                                 </td>
                                             </tr>
                                              <tr><td class="auto-style35"><div>&nbsp;</div></td></tr>
                                                          <tr>
                                                 <td class="auto-style35">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style42">
                                                                 <asp:Label ID="Label43" CssClass="lable" runat="server"  Text="จำนวนเงินประกัน "></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t31"  autocomplete="off" name="t32" class="txt" />
                                                           </td>
                                                             <td>&nbsp;</td>
                                                     <td>
                                                          <asp:Label ID="Label41" CssClass="lable" runat="server"  Text="บาท "></asp:Label>
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
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                   <dx:LayoutItem HorizontalAlign="Left"  Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                      <div>
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup>



                                       <dx:LayoutGroup Caption="แจ้งมาตรวัดหาย"    GroupBoxStyle-Caption-Font-Size="18px"  ColCount="3"  GroupBoxDecoration="Box">
            
<GroupBoxStyle>
<Caption Font-Size="18px"></Caption>
</GroupBoxStyle>
                                <Items>
                      <dx:LayoutItem HorizontalAlign="Left" Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer Width="10px" runat="server" SupportsDisabledAttribute="True">
                                    <div style="width: 856px">
                                        <table>
                                            <tr >
                                                <td>
                                                   
                                                </td>

                                                <td class="auto-style37" >
                                                 
                                                     <table style="width: 751px">
                                          
                                             <tr><td class="auto-style35"><div>&nbsp;</div></td></tr>
                                                          <tr>
                                                 <td class="auto-style35">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style42">
                                                                 <asp:Label ID="Label44" CssClass="lable" runat="server"  Text="วันที่แจ้งหาย "></asp:Label>
                                                             </td>
                                                             <td>
                                                                  <dx:ASPxDateEdit ID="ASPxDateEdit5"  runat="server"   ClientInstanceName="de5" CssClass="txt" Font-Bold="true"  ButtonEditEllipsisImage-Url="~/\images/Calendar_24x24.png" Width="260px">
                                  
<ButtonEditEllipsisImage Url="~/\images/Calendar_24x24.png"></ButtonEditEllipsisImage>
<ButtonStyle>
<BackgroundImage ImageUrl="~/\images/Calendar_24x24.png"></BackgroundImage>
</ButtonStyle>
                                                         <ClientSideEvents  ValueChanged="function(s, e)  {
                         var jsDate = de5.GetDate();      
	                     5date(jsDate);
                                                             }" />
                                  </dx:ASPxDateEdit>
                                                      <input type="text" id="5year"  style="display:none;"  name="5year" class="txt" />
                                                       <input type="text" id="5month"  style="display:none;"  name="5month" class="txt" />
                                                       <input type="text" id="5day"  style="display:none;"  name="5day" class="txt" />
                                                     <script>
                                                         function 5date(jsDate) {
                                                             var year = jsDate.getFullYear(); // where getFullYear returns the year (four digits)  
                                                             var month = jsDate.getMonth();// where getMonth returns the month (from 0-11)  
                                                             var day = jsDate.getDate();  // where getDate returns the day of the month (from 1-31)  

                                                             document.getElementById("5year").value = jsDate.getFullYear() + 543;
                                                             document.getElementById("5month").value = jsDate.getMonth() + 1;
                                                             document.getElementById("5day").value = jsDate.getDate();

                                                         }
                                                     </script>
                                                             </td>
                                                           <td class="auto-style44" style="text-align:right;">
                                                                   <asp:Label ID="Label47" CssClass="lable" runat="server"  Text="เลขที่ใบแจ้งความ "></asp:Label>
                                                           </td>
                                                             <td>
                                                                  <input type="text" id="t33"  autocomplete="off" name="t33" class="txt" />
                                                             </td>
                                                         </tr>
                                                     </table>
                                                     
                                                 </td>
                                             </tr>
                                              <tr><td class="auto-style35"><div>&nbsp;</div></td></tr>
                                                          <tr>
                                                 <td class="auto-style35">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style42">
                                                                 <asp:Label ID="Label45" CssClass="lable" runat="server"  Text="รายละเอียด "></asp:Label>
                                                             </td>
                                                             <td>
                                                                <textarea name="t34" id="t34" cols="40" rows="5"></textarea>
                                                           </td>
                                                             <td>&nbsp;</td>
                                                     
                                                         </tr>
                                                         <tr><td><div>&nbsp;</div></td></tr>
                                                                   <tr>
                                                             <td class="auto-style42">
                                                                 <asp:Label ID="Label46" CssClass="lable" runat="server"  Text="เอกสารประกอบ "></asp:Label>
                                                             </td>
                                                             <td>
                                                                <textarea name="t35" id="t35" cols="40" rows="5"></textarea>
                                                           </td>
                                                             <td>&nbsp;</td>
                                                     
                                                         </tr>
                                                         <tr><td><div>&nbsp;</div></td></tr>
                                                         <tr>
                                                                    <td>
                                                                 <asp:Label ID="Label49" CssClass="lable" runat="server"  Text="วันที่ติดตั้งใหม่ "></asp:Label>
                                                             </td>
                                                             <td>
                                                                  <dx:ASPxDateEdit ID="ASPxDateEdit7"  runat="server"   ClientInstanceName="de6" CssClass="txt" Font-Bold="true"  ButtonEditEllipsisImage-Url="~/\images/Calendar_24x24.png" Width="260px">
                                  
<ButtonEditEllipsisImage Url="~/\images/Calendar_24x24.png"></ButtonEditEllipsisImage>
<ButtonStyle>
<BackgroundImage ImageUrl="~/\images/Calendar_24x24.png"></BackgroundImage>
</ButtonStyle>
                                                         <ClientSideEvents  ValueChanged="function(s, e)  {
                         var jsDate = de6.GetDate();      
	                     6date(jsDate);
                                                             }" />
                                  </dx:ASPxDateEdit>
                                                      <input type="text" id="6year"  style="display:none;"  name="6year" class="txt" />
                                                       <input type="text" id="6month"  style="display:none;"  name="6month" class="txt" />
                                                       <input type="text" id="6day"  style="display:none;"  name="6day" class="txt" />
                                                     <script>
                                                         function 6date(jsDate) {
                                                             var year = jsDate.getFullYear(); // where getFullYear returns the year (four digits)  
                                                             var month = jsDate.getMonth();// where getMonth returns the month (from 0-11)  
                                                             var day = jsDate.getDate();  // where getDate returns the day of the month (from 1-31)  

                                                             document.getElementById("6year").value = jsDate.getFullYear() + 543;
                                                             document.getElementById("6month").value = jsDate.getMonth() + 1;
                                                             document.getElementById("6day").value = jsDate.getDate();

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
                                     
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                   <dx:LayoutItem HorizontalAlign="Left"  Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                      <div>
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup>





                                       <dx:LayoutGroup Caption="ค่าธรรมเนียม"    GroupBoxStyle-Caption-Font-Size="18px"  ColCount="3"  GroupBoxDecoration="Box">
            
<GroupBoxStyle>
<Caption Font-Size="18px"></Caption>
</GroupBoxStyle>
                                <Items>
                      <dx:LayoutItem HorizontalAlign="Left" Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer Width="10px" runat="server" SupportsDisabledAttribute="True">
                                    <div style="width: 856px">
                                        <table>
                                            <tr >
                                                <td>
                                                   
                                                </td>

                                                <td class="auto-style37" >
                                                 
                                                     <table style="width: 751px">
                                          
                                                       
                                              <tr><td class="auto-style35"><div>&nbsp;</div></td></tr>
                                                          <tr>
                                                 <td class="auto-style35">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style42">
                                                                 <asp:Label ID="Label50" CssClass="lable" runat="server"  Text="รายการ (ค่าธรรมเนียม) "></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t36"  autocomplete="off" name="t36" class="txt" />
                                                           </td>
                                                           
                                                              <td class="auto-style42" style="text-align:right;">
                                                                 <asp:Label ID="Label48" CssClass="lable" runat="server"  Text="จำนวนเงิน "></asp:Label>
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t37"  autocomplete="off" name="t37" class="txt" />
                                                           </td>
                                                     <td>
                                                          <asp:Label ID="Label55" CssClass="lable" runat="server"  Text="บาท "></asp:Label>
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
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                   <dx:LayoutItem HorizontalAlign="Left"  Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
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
                         
                                          <%--  <button type="submit" form="form1" class="button" name="p1" value="p1">พิมพ์คำร้อง
                                                      <img src="images/193.png" />
                                                 </button>
                                            <button type="submit" form="form1" class="button" name="p2" value="p2">พิมพ์สัญญา
                                                      <img src="images/193.png" />
                                                 </button>--%>
                                 
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                                     <dx:LayoutItem HorizontalAlign="Left"  Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                  <%--<p  style="color:red; font-size:14px;">***หากต้องการส่งคำร้องนี้อนุมัติ กดปุ่ม "ส่งอนุมัติ" จะไม่สามารถแก้ไขข้อมูลได้อีก***</p>--%>
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
                                                               <%--  <button type="submit" form="form1" class="button" name="Send" id="Send" value="Send">ส่งอนุมัติ
                                                      <img src="images/085.png" />
                                                 </button>--%>

                                                    </div>
                                                 
                                                 </td>
                                                <td>            <div style="display:block;" id="div1" runat="server">
                                                              <%--   <button type="submit" form="form1" class="button" name="Sendapprove" id="Sendapprove" value="Sendapprove">อนุมัติ
                                                      <img src="images/091.png" />
                                                 </button>--%>

                                                    </div></td>
                                                  <td>&nbsp;</td>
                                                <td>
                                                  <%--   <button type="submit" form="form1" class="button" name="cancel" value="cancel">ยกเลิก
                                                      <img src="images/020.png" />
                                                 </button>--%>
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

            function _return() {

                alert('_return');
                return true;
            }

        </script>
    </form>
</body>
</html>
