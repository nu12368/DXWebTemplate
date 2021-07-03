<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view_user_water.aspx.cs" Inherits="DXWebTemplate.view_user_water" %>


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
     .auto-style41 {
         width: 213px;
     }
     .auto-style44 {
         width: 166px;
     }
     .auto-style45 {
         width: 163px;
     }

     input[type=text] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border:none;
  border-bottom: 1px dotted ;
}
     .auto-style46 {
         width: 163px;
         height: 19px;
     }
    </style>
</head>
    <script>
        function onload() {
            var prmid = document.getElementById("iduser").value;
          //  alert(prmid);
            if (prmid != "") {
                var val = 'prm_view=' + prmid;
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

                         //   alert(_sp[4]);

                           
                            if (_sp[1] == "บุคคลธรรมดา") {
                                document.getElementById("c1").checked = true;
                            }
                            if (_sp[1] == "นิติบุคคล") {
                                document.getElementById("c2").checked = true;
                            }
                            document.getElementById("c1").disabled = true;
                            document.getElementById("c2").disabled = true;

                            document.getElementById("t38").value = _sp[0];
                            document.getElementById("t1").value = _sp[2] + " " + _sp[3] + " " + _sp[4];
                            document.getElementById("t3").value = _sp[5];
                            document.getElementById("t4").value = _sp[6];
                            document.getElementById("t5").value = _sp[7];
                            document.getElementById("t6").value = "เลขที่ " + _sp[8] + " ม." + _sp[9] + " ซ." +_sp[10] + " ถ."+ _sp[11] +" ต." + _sp[12] + " อ." + _sp[13] +" จ." + _sp[14] + " " + _sp[15];
                            document.getElementById("t7").value = _sp[16];
                            document.getElementById("t8").value = _sp[17];
                            document.getElementById("t9").value = _sp[18];
                            document.getElementById("t10").value = "เลขที่ " + _sp[8] + " ม." + _sp[9] + " ซ." +_sp[10] + " ถ."+ _sp[11] +" ต." + _sp[12] + " อ." + _sp[13] +" จ." + _sp[14] + " " + _sp[15];
                            document.getElementById("t11").value = _sp[19];
                            document.getElementById("t12").value = _sp[20];
                            document.getElementById("t13").value = _sp[21];
                            document.getElementById("t14").value = _sp[22];
                            document.getElementById("t15").value = _sp[23];
                            document.getElementById("t16").value = _sp[24];
                            document.getElementById("t17").value = _sp[25] + "-" + _sp[26];
                            document.getElementById("t18").value = "ปกติ";
                            document.getElementById("t19").value = "ปกติ";
                            document.getElementById("t20").value = "ปกติ";

                            document.getElementById("t38").readOnly = true;
                            document.getElementById("t1").readOnly = true;
                            var i;
                            for (i = 3; i < 21; i++) {
                                document.getElementById("t" + i.toString()).readOnly = true;
                            }
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
    <form id="form1" name="f1" runat="server">
       
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
                                            <h3>รายละเอียดผู้ใช้น้ำ</h3>
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




                                        <dx:LayoutGroup Caption="ข้อมูลผู้ใช้น้ำ"    GroupBoxStyle-Caption-Font-Size="18px"  ColCount="3"  GroupBoxDecoration="Box">
            
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
                                                 <td class="auto-style44" style="text-align:right;">
                                                     <asp:Label ID="Label15" CssClass="lable" runat="server"  Text="ประเภทผู้ใช้น้ำ "></asp:Label>&nbsp;
                                                 </td>
                                                              
                                                 <td>
                                                   
                                                   <input type="checkbox" id="c1" name="c1" value="บุคคลธรรมดา"  />  <asp:Label ID="Label16" CssClass="lable" runat="server"  Text="บุคคลธรรมดา"></asp:Label>
                                                <input type="checkbox" id="c2" name="c2"  value="นิติบุคคล" />   <asp:Label ID="Label17" CssClass="lable" runat="server"  Text="นิติบุคคล"></asp:Label>
                                              
                                                    
                                                 &nbsp;</td>
                                             </tr>
                                                         <tr><td class="auto-style44">&nbsp;</td></tr>
                                             <tr>
                                                 <td class="auto-style44" style="text-align:right;">
                                                     <asp:Label ID="Label1" CssClass="lable" runat="server"  Text="ชื่อ "></asp:Label> &nbsp;
                                                   
                                                 </td>
                                                 <td>
                                                      <input type="text" id="t1"  autocomplete="off"    name="t1" class="txt" />
                                                  </td>

                                             </tr>
                                             <tr><td class="auto-style44"><div>&nbsp;</div></td></tr>
                                            
                                                          <tr>
                                                 <td class="auto-style44" style="text-align:right;">
                                                     <asp:Label ID="Label3" CssClass="lable" runat="server"  Text="เลขบัตรประชาชน "></asp:Label>&nbsp;
                                                 </td>
                                                 <td>
                                                         <input type="text" id="t3" autocomplete="off" name="t3" class="txt" />
                                    </td>
                                   
                                             </tr>
                                              <tr><td class="auto-style44"><div>&nbsp;</div></td></tr>
                                                 <tr>
                                                 <td class="auto-style44" style="text-align:right;">
                                                     <asp:Label ID="Label4" CssClass="lable" runat="server"  Text="วัน เดือน ปี เกิด "></asp:Label>&nbsp;
                                                 </td>
                                                 <td>
                                                  <input type="text" id="t4" autocomplete="off" name="t4" class="txt" />
                                            </td>
 
                                             </tr>
                                              <tr><td class="auto-style44"><div>&nbsp;</div></td></tr>
                                                 <tr>
                                                 <td class="auto-style44" style="text-align:right;">
                                                     <asp:Label ID="Label5" CssClass="lable" runat="server"  Text="อายุ "></asp:Label>&nbsp;
                                                 </td>
                                                 <td>
                                                        <input type="text" id="t5" autocomplete="off" style="width:100px" name="t5" class="txt" />&nbsp; <asp:Label ID="Label9" CssClass="lable" runat="server"  Text="ปี "></asp:Label>
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
                                                <td class="auto-style41" style="text-align:right;">
                                                   <asp:Label ID="Label6" CssClass="lable" runat="server"  Text="ที่อยู่ที่สามารถติดต่อได้"></asp:Label>&nbsp;
                                                </td>

                                                <td class="auto-style37" >
                                                  <input type="text" id="t6" autocomplete="off" name="t6" class="txt" />
                                           
                                                </td>
                                             </tr>
                                             <tr><td class="auto-style34"><div>&nbsp;</div></td></tr>
                                               <tr >
                                                <td class="auto-style41" style="text-align:right;">
                                                   <asp:Label ID="Label7" CssClass="lable" runat="server"  Text="โทรศัพท์บ้าน/มือถือ "></asp:Label>&nbsp;
                                                </td>

                                                <td class="auto-style37" >
                                                  <input type="text" id="t7" autocomplete="off" style="width:250px;" name="t7" class="txt" />
                                           
                                                </td>
                                                 
                                             </tr>
                                             <tr><td class="auto-style34"><div>&nbsp;</div></td></tr>
                                            <tr>
                                                   <td class="auto-style41" style="text-align:right;">
                                                   <asp:Label ID="Label8" CssClass="lable" runat="server"  Text="อีเมล์ "></asp:Label>&nbsp;
                                                </td>

                                                <td class="auto-style37" >
                                                  <input type="text" id="t8" autocomplete="off" style="width:250px;" name="t8" class="txt" />
                                           
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
                                                                
                                             <tr><td class="auto-style25"><div>&nbsp;</div></td></tr>
                                                          <tr>
                                                 <td class="auto-style25">
                                                     <table>
                                                         <tr>
                                                             <td class="auto-style45" style="text-align:right;">
                                                                 <asp:Label ID="Label57" CssClass="lable" runat="server"  Text="เลขประจำมาตรวัด "></asp:Label>&nbsp;
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t9" autocomplete="off"  name="t9" class="txt" />

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
                                                                 <asp:Label ID="Label59" CssClass="lable" runat="server"  Text="ที่ติดตั้งมาตรวัด "></asp:Label>&nbsp;
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t10" autocomplete="off" style="width:590px;"  name="t10" class="txt" />

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
                                                                 <asp:Label ID="Label63" CssClass="lable" runat="server"  Text="ประเภทผู้ใช้น้ำ "></asp:Label>&nbsp;
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t11" autocomplete="off"  name="t11" class="txt" />&nbsp;

                                                             </td>
                                                             <td>&nbsp;</td>
                                                             <td style="text-align:right;">
                                                                   <asp:Label ID="Label67" CssClass="lable" runat="server"  Text="รายละเอียด "></asp:Label>&nbsp;
                                                             </td>
                                                              <td>&nbsp;</td>
                                                             <td>
                                                                 <input type="text" id="t12" autocomplete="off"  name="t12" class="txt" />&nbsp;

                                                             </td>
                                                         </tr>
                                                         <tr><td class="auto-style46"></td></tr>
                                                          <tr>
                                                             <td class="auto-style45" style="text-align:right;">
                                                                 <asp:Label ID="Label18" CssClass="lable" runat="server"  Text="ประเภทสิ่งปลูกสร้าง "></asp:Label>&nbsp;
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t13" autocomplete="off"  name="t13" class="txt" />&nbsp;

                                                             </td>
                                                             <td>&nbsp;</td>
                                                             <td style="text-align:right;">
                                                                   <asp:Label ID="Label19" CssClass="lable" runat="server"  Text="ลักษณะอาคาร "></asp:Label>&nbsp;
                                                             </td>
                                                              <td>&nbsp;</td>
                                                             <td>
                                                                 <input type="text" id="t14" autocomplete="off"  name="t14" class="txt" />&nbsp;

                                                             </td>
                                                         </tr>
                                                           <tr>
                                                             <td class="auto-style45" style="text-align:right;">
                                                                 <asp:Label ID="Label22" CssClass="lable" runat="server"  Text="ขนาดท่อ "></asp:Label>&nbsp;
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t15" autocomplete="off"  name="t15" class="txt" />&nbsp;

                                                             </td>
                                                             <td>&nbsp;</td>
                                                             <td style="text-align:right;">
                                                                   <asp:Label ID="Label23" CssClass="lable" runat="server"  Text="วันที่ติดตั้งมิเตอร์ "></asp:Label>&nbsp;
                                                             </td>
                                                              <td>&nbsp;</td>
                                                             <td>
                                                                 <input type="text" id="t16" autocomplete="off"  name="t16" class="txt" />&nbsp;

                                                             </td>
                                                         </tr>
                                                         <tr>
                                                             <td class="auto-style45" style="text-align:right;">
                                                                 <asp:Label ID="Label24" CssClass="lable" runat="server"  Text="พิกัด "></asp:Label>&nbsp;
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t17" autocomplete="off"  name="t17" class="txt" />&nbsp;

                                                             </td>
                                                             <td>&nbsp;</td>
                                                           
                                                         </tr>
                                                           <tr>
                                                             <td class="auto-style45" style="text-align:right;">
                                                                 <asp:Label ID="Label25" CssClass="lable" runat="server"  Text="สถานะ "></asp:Label>&nbsp;
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t18" autocomplete="off"  name="t18" class="txt" />&nbsp;

                                                             </td>
                                                             <td>&nbsp;</td>
                                                             <td style="text-align:right;">
                                                                   <asp:Label ID="Label26" CssClass="lable" runat="server"  Text="สถานะ VIP"></asp:Label>&nbsp;
                                                             </td>
                                                              <td>&nbsp;</td>
                                                             <td>
                                                                 <input type="text" id="t19" autocomplete="off"  name="t19" class="txt" />&nbsp;

                                                             </td>
                                                         </tr>
                                                           <tr>
                                                             <td class="auto-style45" style="text-align:right;">
                                                                 <asp:Label ID="Label27" CssClass="lable" runat="server"  Text="สถานะค้างชำระ "></asp:Label>&nbsp;
                                                             </td>
                                                             <td>
                                                                 <input type="text" id="t20" autocomplete="off"  name="t20" class="txt" />&nbsp;

                                                             </td>
                                                             <td>&nbsp;</td>
                                                           
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
