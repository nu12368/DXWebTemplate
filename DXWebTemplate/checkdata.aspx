<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkdata.aspx.cs" Inherits="DXWebTemplate.checkdata" %>


<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
  margin: 1px 0;
  box-sizing: border-box;
     height:30px;
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
    font-size: 14px;
}
                 .lable {
         font-size:16px;
     }
                .pointer {cursor: pointer;}
     .auto-style1 {
         width: 88px;
     }
     .lable {
   
    </style>

   

</head>
<body>
    <form id="form1" runat="server">
      <div>
        <table>
            <tr>
                <td>
                     <asp:Label ID="Label1" Font-Size="18px" runat="server" Text="ตรวจสอบ"></asp:Label>
                </td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
              
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
             
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td>
                        <%--<a href="">   <img src="images/089.png" width="30" height="30" />  <asp:Label ID="Label3" Font-Size="18px" runat="server" Text="ค้นหา"></asp:Label> </a>--%>
                </td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td>
     
                    <%-- <a  href="new_water.aspx" onclick="window.open(this.href,'targetWindow','toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=1024,height=700,top=10'); return false;">   <img src="images/032.png" width="30" height="30" />
                          <asp:Label ID="Label4" Font-Size="18px" runat="server" Text="ขอติดตั้งน้ำประปาใหม่"></asp:Label>
                           </a>--%>
                </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                   <td>
                <a href="checkdata.aspx">  <img src="images/024.png" width="30" height="30"  />  <asp:Label ID="Label5" Font-Size="18px" runat="server" Text="รีเฟรช"></asp:Label>  </a>
                </td>
            </tr>
        </table>

        <div>&nbsp;</div>

              <div id="divsearch" runat="server" style="display:block;">
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
                                    <div style="width: 1473px">
                                                 <table>
                                            <tr>
                                                  <td>
                   <button type="button"  class="button" name="Submit"  value="Submit">จดมาตร
                                                      <%--<img src="images/003.png" />--%>
                                                     
                                                 </button>
               </td>
                                                  <td>&nbsp;</td>
                                                   <td>
                  <button type="button"  class="button" name="Submit"  value="Submit">เก็บเงิน
                                                      <%--<img src="images/003.png" />--%>
                                                     
                                                 </button>
                </td>
                                                  <td>&nbsp;</td>
                                                  <td class="auto-style1">&nbsp;</td>
                                                  <td>&nbsp;</td>
                                                <td>
                                                         <asp:Label ID="Label4" CssClass="lable" runat="server"  Text="ปี "></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                              <dx:ASPxComboBox ID="ASPxComboBox1" CssClass="cb" ClientInstanceName="combo1"  runat="server" ValueType="System.String">
                                                         <Items>
                                                                <dx:ListEditItem Text="--เลือก--" Value="1"  Selected="true" />
                                                             <dx:ListEditItem Text="2563" Value="2"  />
                                                             <dx:ListEditItem Text="2564" Value="3"  />
                                                              <dx:ListEditItem Text="2565" Value="4"  />
                                                                <dx:ListEditItem Text="2566" Value="4"  />
                                                                <dx:ListEditItem Text="2567" Value="4"  />
                                                                <dx:ListEditItem Text="2568" Value="4"  />
                                                                <dx:ListEditItem Text="2569" Value="4"  />
                                                                <dx:ListEditItem Text="2570" Value="4"  />
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
                                                         <asp:Label ID="Label7" CssClass="lable" runat="server"  Text="เดือน "></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                              <dx:ASPxComboBox ID="ASPxComboBox2" CssClass="cb" ClientInstanceName="combo2"  runat="server" ValueType="System.String">
                                                         <Items>
                                                                <dx:ListEditItem Text="--เลือก--" Value="0"  Selected="true" />
                                                             <dx:ListEditItem Text="มกราคม" Value="1"  />
                                                             <dx:ListEditItem Text="กุมภาพันธ์" Value="2"  />
                                                              <dx:ListEditItem Text="มีนาคม" Value="3"  />
                                                               <dx:ListEditItem Text="เมษายน" Value="4"  />
                                                               <dx:ListEditItem Text="พฤษภาคม" Value="5"  />
                                                               <dx:ListEditItem Text="มิถุนายน " Value="6"  />
                                                               <dx:ListEditItem Text="กรกฎาคม " Value="7"  />
                                                               <dx:ListEditItem Text="สิงหาคม " Value="8"  />
                                                               <dx:ListEditItem Text="กันยายน" Value="9"  />
                                                               <dx:ListEditItem Text="ตุลาคม" Value="10"  />
                                                               <dx:ListEditItem Text="พฤศจิกายน" Value="11"  />
                                                                <dx:ListEditItem Text="ธันวาคม " Value="12"  />
                                                         </Items>
                                                                          <ClientSideEvents SelectedIndexChanged="function(e,s) { selectcombo2();}">
</ClientSideEvents>
                                                     </dx:ASPxComboBox>
                                                                 <div style="display:none;">
                                                                      <input type="text" id="txtcombo2" autocomplete="off"  name="txtcombo2" class="txt" />
                                                                 </div>
                                                                   <script type="text/javascript">
                                                                       function selectcombo2() {
                                                                           document.getElementById("txtcombo2").value = combo2.GetText();
                                                                       }
                                                                 </script>
                                                     
                                                </td>
                                                   <td>&nbsp;</td>
                                                      <td>
                                                         <asp:Label ID="Label8" CssClass="lable" runat="server"  Text="เจ้าหน้าที่จดมาตร "></asp:Label>
                                                </td>
                                                 <td>
                                            <dx:ASPxComboBox ID="ASPxComboBox3" CssClass="cb" ClientInstanceName="combo3"  runat="server" ValueType="System.String">
                                                         <Items>
                                                                <dx:ListEditItem Text="--เลือก--" Value="0"  Selected="true" />
                                                             <dx:ListEditItem Text="AAA" Value="1"  />
                                                             <dx:ListEditItem Text="BBB" Value="2"  />
                                                              <dx:ListEditItem Text="CCC" Value="3"  />
                                                         </Items>
                                                                          <ClientSideEvents SelectedIndexChanged="function(e,s) { selectcombo3();}">
</ClientSideEvents>
                                                     </dx:ASPxComboBox>
                                                                 <div style="display:none;">
                                                                      <input type="text" id="txtcombo3" autocomplete="off"  name="txtcombo3" class="txt" />
                                                                 </div>
                                                                   <script type="text/javascript">
                                                                       function selectcombo3() {
                                                                           document.getElementById("txtcombo3").value = combo3.GetText();
                                                                       }
                                                                 </script>
                                                     
                                                </td>
                                                   <td>&nbsp;</td>
                                                      <td>
                                                         <asp:Label ID="Label6" CssClass="lable" runat="server"  Text="เส้นทาง "></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                   
                                                                 <dx:ASPxComboBox ID="ASPxComboBox4" CssClass="cb" ClientInstanceName="combo4"  runat="server" ValueType="System.String">
                                                         <Items>
                                                                <dx:ListEditItem Text="--เลือก--" Value="1"  Selected="true" />
                                                             <dx:ListEditItem Text="A" Value="2"  />
                                                             <dx:ListEditItem Text="B" Value="3"  />
                                                              <dx:ListEditItem Text="C" Value="4"  />
                                                         </Items>
                                                                          <ClientSideEvents SelectedIndexChanged="function(e,s) { selectcombo4();}">
</ClientSideEvents>
                                                     </dx:ASPxComboBox>
                                                                 <div style="display:none;">
                                                                      <input type="text" id="txtcombo4" autocomplete="off"  name="txtcombo4" class="txt" />
                                                                 </div>
                                                                   <script type="text/javascript">
                                                                       function selectcombo4() {
                                                                           document.getElementById("txtcombo4").value = combo4.GetText();
                                                                       }
                                                                 </script>
                                                     
                                                </td>
                                            </tr>
                                           <tr><td>&nbsp;</td></tr>
                                            <tr >
                                                     <td>
                                                       
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
                                 <div>&nbsp;</div>
                                   
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                   <dx:LayoutItem HorizontalAlign="Left"  Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" ID="NestedControl"  SupportsDisabledAttribute="True">
                                  
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


          <div>&nbsp;</div>


           <div>
     <dx:ASPxGridView ID="ASPxGridView2"  AutoGenerateColumns="False" ClientInstanceName="ASPxGridView2"   OnHtmlRowPrepared="ASPxGridView2_HtmlRowPrepared"  KeyboardSupport="True"  runat="server"   Font-Size="Small" Width="100%" Theme="Aqua" KeyFieldName="id"  >
          
         <SettingsBehavior AllowDragDrop="false" AllowSort="false" AllowGroup="false"/>
         
             <SettingsPager PageSize="100" Position="TopAndBottom" PageSizeItemSettings-Position="Left" >
<PageSizeItemSettings Position="Left"></PageSizeItemSettings>
                               </SettingsPager>
                                <SettingsBehavior EnableRowHotTrack="True" AllowFocusedRow="true"  />
            <SettingsCommandButton>
<ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>

<HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
</SettingsCommandButton>
                                <SettingsSearchPanel Visible="True" />
           <SettingsText SearchPanelEditorNullText="คีย์ข้อมูลที่ต้องการค้นหาด่วน..."    />
            <SettingsBehavior AllowDragDrop="false" />
         <Columns>
             <dx:GridViewDataTextColumn FieldName="id" Caption="" VisibleIndex="1"  Visible="false" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px"  HeaderStyle-HorizontalAlign="Center"  CellStyle-HorizontalAlign="Left" >
                    <HeaderStyle HorizontalAlign="Center"     />
                                                        <CellStyle HorizontalAlign="Center"  >
                                                        </CellStyle>
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="number" Caption="ลำดับที่" VisibleIndex="2"  HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px"  CellStyle-HorizontalAlign="Left" >
                    <HeaderStyle HorizontalAlign="Center"     />
                                                        <CellStyle HorizontalAlign="Center"  >
                                                        </CellStyle>
             </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="idwaterusernumber" Caption="เลขที่ผู้ใช้น้ำ" VisibleIndex="3"  HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px"  CellStyle-HorizontalAlign="Left" >
                    <HeaderStyle HorizontalAlign="Center"     />
                                                        <CellStyle HorizontalAlign="Center"  >
                                                        </CellStyle>
             </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn FieldName="username" Caption="ชื่อผู้ใช้น้ำ"  VisibleIndex="4" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" CellStyle-HorizontalAlign="Left" >
                    <HeaderStyle HorizontalAlign="Center"     />
                                                        <CellStyle HorizontalAlign="Center"  >
                                                        </CellStyle>
             </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn  Caption="หมายเลขมาตร" FieldName="numbergauge" VisibleIndex="5" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
           
                  <dx:GridViewBandColumn Caption="จดครั้งนี้" HeaderStyle-Font-Size="12px"   VisibleIndex="9"  HeaderStyle-HorizontalAlign="Center" >
                        <Columns>
                     <dx:GridViewDataTextColumn Caption="วันที่" FieldName="datethistime"  VisibleIndex="10" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center"  />
                                                        <CellStyle HorizontalAlign="Center" >
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                 
                                     <dx:GridViewDataTextColumn  Caption="เลขมาตร" FieldName="numberthistime" VisibleIndex="11" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
            
                        </Columns>
                    </dx:GridViewBandColumn>
                    <dx:GridViewBandColumn Caption="จดครั้งก่อน" HeaderStyle-Font-Size="12px"   VisibleIndex="6"  HeaderStyle-HorizontalAlign="Center" >
                        <Columns>
                   <dx:GridViewDataTextColumn Caption="วันที่" FieldName="datelasttime"  VisibleIndex="7" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center"  />
                                                        <CellStyle HorizontalAlign="Center" >
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                 
                                     <dx:GridViewDataTextColumn  Caption="เลขมาตร" FieldName="numberlasttime" VisibleIndex="8" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:GridViewBandColumn>


           
              <dx:GridViewDataTextColumn  Caption="จำนวนที่ใช้" FieldName="amountused" VisibleIndex="12" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn  Caption="ค่าน้ำประปา" FieldName="waterbill" VisibleIndex="13" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn  Caption="ค่ารักษามาตร" FieldName="maintenancefee" VisibleIndex="14" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn  Caption="ค้างชำระ" FieldName="overdue" VisibleIndex="15" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn  Caption="รวมเป็นเงิน" FieldName="sum" VisibleIndex="16" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn  Caption="สถานะ" FieldName="statuswaterbill" VisibleIndex="17" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                      <dx:GridViewDataTextColumn Caption="เลขที่ใบแจ้งหนี้" FieldName="invoicenumber" VisibleIndex="18" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center"    />
                                                        <CellStyle HorizontalAlign="Center" >
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>

            

           
                  
             
        </Columns>
        <Settings ShowGroupPanel="false" />

    </dx:ASPxGridView>
               <dx:ASPxGridViewExporter ID="GridExport" runat="server" GridViewID="ASPxGridView2"></dx:ASPxGridViewExporter>
    </div>


      <%--  <div>
      <dx:ASPxGridView ID="ASPxGridView2"   AutoGenerateColumns="False" ClientInstanceName="ASPxGridView2"   OnHtmlRowPrepared="ASPxGridView2_HtmlRowPrepared"  KeyboardSupport="True"  runat="server"   Font-Size="Small" Width="100%" Theme="Aqua" KeyFieldName="id"  
    >
            <SettingsBehavior AllowDragDrop="false" AllowSort="false" AllowGroup="false"/>
            <SettingsPager Position="TopAndBottom" PageSizeItemSettings-Position="Left"   >

        </SettingsPager>
             <SettingsPager PageSize="100">
<PageSizeItemSettings Position="Left"></PageSizeItemSettings>
                               </SettingsPager>
                                <SettingsBehavior EnableRowHotTrack="True" AllowFocusedRow="true"  />
          
            <SettingsCommandButton>
<ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>

<HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
</SettingsCommandButton>
                                <SettingsSearchPanel Visible="True" />
           <SettingsText SearchPanelEditorNullText="คีย์ข้อมูลที่ต้องการค้นหาด่วน..."    />
          
                                <Columns>
                                                                          <dx:GridViewDataTextColumn Caption="id" FieldName="id" VisibleIndex="1" Visible="false"   HeaderStyle-HorizontalAlign="Center" Width="100%" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center"    />
                                                        <CellStyle HorizontalAlign="Center" >
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="ลำดับที่" FieldName="number" VisibleIndex="2" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center"    />
                                                        <CellStyle HorizontalAlign="Center" >
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    
                                      <dx:GridViewDataTextColumn Caption="เลขที่ผู้ใช้น้ำ" FieldName="idwaterusernumber" VisibleIndex="3" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="ผู้ใช้น้ำ" FieldName="username"  VisibleIndex="4" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn  Caption="หมายเลขมาตร" FieldName="numbergauge" VisibleIndex="5" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>


                                                                       
                                        <dx:GridViewDataColumn FieldName="" Caption="จดครั้งก่อน" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px" CellRowSpan="2" VisibleIndex="6" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
            <Columns>
              
                      <dx:GridViewDataTextColumn Caption="วันที่" FieldName="datelasttime"  VisibleIndex="7" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center"  />
                                                        <CellStyle HorizontalAlign="Center" >
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                 
                                     <dx:GridViewDataTextColumn  Caption="เลขมาตร" FieldName="numberlasttime" VisibleIndex="8" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
            
                 
            </Columns>
        </dx:GridViewDataColumn>

                                       <dx:GridViewDataColumn FieldName="" Caption="จดครั้งนี้" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px" CellRowSpan="2" VisibleIndex="9" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
            <Columns>
              
                   <dx:GridViewDataTextColumn Caption="วันที่" FieldName="datethistime"  VisibleIndex="10" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center"  />
                                                        <CellStyle HorizontalAlign="Center" >
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                 
                                     <dx:GridViewDataTextColumn  Caption="เลขมาตร" FieldName="numberthistime" VisibleIndex="11" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
            
                 
            </Columns>
        </dx:GridViewDataColumn>
                                      <dx:GridViewDataTextColumn  Caption="จำนวนที่ใช้" FieldName="amountused" VisibleIndex="12" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn  Caption="ค่าน้ำประปา" FieldName="waterbill" VisibleIndex="13" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn  Caption="ค่ารักษามาตร" FieldName="maintenancefee" VisibleIndex="14" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn  Caption="ค้างชำระ" FieldName="overdue" VisibleIndex="15" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn  Caption="รวมเป็นเงิน" FieldName="sum" VisibleIndex="16" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn  Caption="สถานะ" FieldName="statuswaterbill" VisibleIndex="17" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                      <dx:GridViewDataTextColumn Caption="เลขที่ใบแจ้งหนี้" FieldName="invoicenumber" VisibleIndex="18" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center"    />
                                                        <CellStyle HorizontalAlign="Center" >
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                          
                                </Columns>
                            </dx:ASPxGridView>
               <dx:ASPxGridViewExporter ID="GridExport" runat="server" GridViewID="ASPxGridView2"></dx:ASPxGridViewExporter>
    </div>--%>
    </div>
    </form>
</body>
</html>
