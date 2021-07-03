<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkdata_details.aspx.cs" Inherits="DXWebTemplate.checkdata_details" %>


<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
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
       
     input[type=text] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border:none;
  border-bottom: 1px dotted ;
}
     .auto-style1 {
         width: 32px;
     }
    </style>
</head>
    <script>
        function onload() { ////////////////////ไม่ได้ใช้ เขียน C#
            var prmid = document.getElementById("iduser").value;
            //  alert(prmid);
            if (prmid != "") {
                var val = 'prm_viewcheckdata_details=' + prmid;
                // alert(val);
                $.ajax({
                    url: 'selectdata.aspx',
                    data: val,
                    type: "POST",
                    cache: false,
                    processData: false,
                    success: function (msg) {
                        if (msg != "") {
                            var _sp = msg.split(';');
                            var sp_val1 = _sp[0].split(':'); // ข้อมูลผู้ใช้น้ำ
                            var sp_val2 = _sp[1].split(':'); //ข้อมูลการจดมาตร
                        }

                    },
                    error: function (xmlhttprequest, textstatus, errorthrown) {

                        console.log("error: " + errorthrown);
                    }
                });
            }

        }
</script>
<body >
    <form id="form1" name="f1" runat="server" style="text-align:center;">
<%--       
        <div style="display:none;">
              <input type="text" id="iduser"  autocomplete="off" runat="server" name="iduser"  class="txt" />
             <input type="text" id="txtapprove"  autocomplete="off" runat="server" name="txtapprove"  class="txt" />
               <input type="text" id="datepetition"  autocomplete="off" runat="server" name="datepetition"  class="txt" />
             <input type="text" id="txtnumberpetition"  autocomplete="off" runat="server" name="txtnumberpetition"  class="txt" />
        </div>
         --%>
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
                                      <dx:LayoutItem HorizontalAlign="Left" Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer Width="10px" runat="server" SupportsDisabledAttribute="True">
                                    <div>
                                            <h3>รายละเอียดการจดมาตร</h3>
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                               <dx:LayoutGroup Caption="ข้อมูลผู้ใช้น้ำ"    GroupBoxStyle-Caption-Font-Size="18px"  ColCount="1"  GroupBoxDecoration="Box">
            
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
                                                <td >
                                                         <asp:Label ID="Label77" CssClass="lable" runat="server"  Text="เลขที่ผู้ใช้น้ำ "></asp:Label>&nbsp;
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                   
                                                     <input type="text" id="t38" autocomplete="off" runat="server"   class="txt" name="t38"  />
                                                </td>
                                                <td>&nbsp;</td>
                                                <td >
                                                         <asp:Label ID="Label1" CssClass="lable" runat="server"  Text="ชื่อ-นามสกุล "></asp:Label>&nbsp;
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                   
                                                     <input type="text" id="t39" autocomplete="off" runat="server"  class="txt" name="t39"  />
                                                </td>
                                            </tr>
                                         <tr>
                                                <td >
                                                         <asp:Label ID="Label2" CssClass="lable" runat="server"  Text="เลขประจำมาตรวัด "></asp:Label>&nbsp;
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                   
                                                     <input type="text" id="t40" autocomplete="off" runat="server"  class="txt" name="t40"  />
                                                </td>
                                            </tr>
                                        </table>
                                  <table>
                                                <tr>   <td>&nbsp;</td>
                                                <td >
                                                         <asp:Label ID="Label3" CssClass="lable" runat="server"  Text="ที่ตั้งมาตร "></asp:Label>&nbsp;
                                                </td>
                                                <td class="auto-style1">&nbsp;</td>
                                                <td >
                                                   
                                                     <input type="text" id="t41" autocomplete="off" runat="server"  style="width:476px;"  class="txt" name="t41"  />
                                                </td>
                                            </tr>
                                  </table>
                                    </div>
                                      <div>
                                            <p id="address" class="lable"></p>
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
                                     <div style="margin-left: 0px">
                                        
                                    </div>
                                      <div>
                                     
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup> 




        <dx:LayoutGroup Caption="ข้อมูลการจดมาตร"    GroupBoxStyle-Caption-Font-Size="18px"  ColCount="1"  GroupBoxDecoration="Box">
            
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
                                                <td >
                                                         <asp:Label ID="Label4" CssClass="lable" runat="server"  Text="เลขใบแจ้งหนี้ "></asp:Label>&nbsp;
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                   
                                                     <input type="text" id="t42" autocomplete="off" runat="server"  class="txt" name="t42"  />
                                                </td>
                                                <td>&nbsp;</td>
                                                <td >
                                                         <asp:Label ID="Label5" CssClass="lable" runat="server"  Text="เจ้าหน้าที่จดมาตร "></asp:Label>&nbsp;
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                   
                                                     <input type="text" id="t43" autocomplete="off" runat="server"  class="txt" name="t43"  />
                                                </td>
                                            </tr>
                                        </table>
                               
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

             <div>&nbsp;</div>
                <div>

                                        <dx:ASPxGridView ID="ASPxGridView2"  AutoGenerateColumns="False" ClientInstanceName="ASPxGridView2"     KeyboardSupport="True"  runat="server"   Font-Size="Small" Width="100%" Theme="Aqua" KeyFieldName="id"  >
          
         <SettingsBehavior AllowDragDrop="false" AllowSort="false" AllowGroup="false"/>
         
             <SettingsPager PageSize="100" Position="TopAndBottom" PageSizeItemSettings-Position="Left" >
<PageSizeItemSettings Position="Left"></PageSizeItemSettings>
                               </SettingsPager>
                                <SettingsBehavior EnableRowHotTrack="True" AllowFocusedRow="true"  />
            <SettingsCommandButton>
<ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>

<HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
</SettingsCommandButton>
<%--                                <SettingsSearchPanel Visible="True" />
           <SettingsText SearchPanelEditorNullText="คีย์ข้อมูลที่ต้องการค้นหาด่วน..."    />--%>
            <SettingsBehavior AllowDragDrop="false" />
         <Columns>
           
                  <dx:GridViewBandColumn Caption="จดครั้งนี้" HeaderStyle-Font-Size="12px"   VisibleIndex="0"  HeaderStyle-HorizontalAlign="Center" >
                        <Columns>
                     <dx:GridViewDataTextColumn Caption="วันที่" FieldName="datethistime"  VisibleIndex="1" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center"  />
                                                        <CellStyle HorizontalAlign="Center" >
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                 
                                     <dx:GridViewDataTextColumn  Caption="เลขมาตร" FieldName="numberthistime" VisibleIndex="2" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
            
                        </Columns>
                    </dx:GridViewBandColumn>
                    <dx:GridViewBandColumn Caption="จดครั้งก่อน" HeaderStyle-Font-Size="12px"   VisibleIndex="3"  HeaderStyle-HorizontalAlign="Center" >
                        <Columns>
                   <dx:GridViewDataTextColumn Caption="วันที่" FieldName="datelasttime"  VisibleIndex="4" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center"  />
                                                        <CellStyle HorizontalAlign="Center" >
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                 
                                     <dx:GridViewDataTextColumn  Caption="เลขมาตร" FieldName="numberlasttime" VisibleIndex="5" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:GridViewBandColumn>


           
              <dx:GridViewDataTextColumn  Caption="จำนวนที่ใช้" FieldName="amountused" VisibleIndex="6" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn  Caption="ค่าน้ำประปา" FieldName="waterbill" VisibleIndex="7" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn  Caption="ค่ารักษามาตร" FieldName="maintenancefee" VisibleIndex="8" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn  Caption="รวมเป็นเงิน" FieldName="sum" VisibleIndex="9" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn  Caption="สถานะ" FieldName="statuswaterbill" VisibleIndex="10" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
        </Columns>
        <Settings ShowGroupPanel="false" />

    </dx:ASPxGridView>
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
