<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="water_user.aspx.cs" Inherits="DXWebTemplate.root" %>


<%@ Register Assembly="DevExpress.XtraReports.v16.1.Web, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WAC</title>
<meta name="viewport" content="width=device-width, user-scalable=no, maximum-scale=1.0, minimum-scale=1.0" />
  <meta charset="tis-620"/>
    <meta http-equiv="Content-Type" content="text/html; charset=tis-620"/>

        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/omr.ico">
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
    </style>

   

</head>
<body>
    <form id="form1" runat="server" ><%--method="POST" action="Searchdata.aspx"--%>
      <div>
        <table>
            <tr>
                <td>
                     <asp:Label ID="Label1" Font-Size="18px" runat="server" Text="ทะเบียนผู้ใช้น้ำ"></asp:Label>
                </td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                   <td>
                        <a  class="pointer"  onclick="displayblock()" >   <img src="images/089.png" width="30" height="30" />  <asp:Label ID="Label3" Font-Size="18px" runat="server" Text="ค้นหา"></asp:Label> </a>

                    <script>
                        function displayblock() {
                            document.getElementById("divsearch").style.display = "block";
                        }
                    </script>
                </td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                     <td>
                <a href="water_user.aspx">  <img src="images/024.png" width="30" height="30"  />  <asp:Label ID="Label5" Font-Size="18px" runat="server" Text="รีเฟรช"></asp:Label>  </a>
                </td>
                 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td>
                  <a  class="pointer"  runat="server" onserverclick="Unnamed_ServerClick" >   <img src="images/excelBT.png" width="30" height="30" />  <asp:Label ID="Label12" Font-Size="18px" runat="server" Text="Export Excel"></asp:Label> </a>

                  
                </td>
                   <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td>
                      <a href="print_water_user.aspx" target="_blank">  <img src="images/193.png" width="30" height="30"  />  <asp:Label ID="Label2" Font-Size="18px" runat="server" Text="พิมพ์"></asp:Label>  </a>
                </td>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            
                <td>
     
                    <%-- <a  href="new_water.aspx" onclick="window.open(this.href,'targetWindow','toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=1024,height=700,top=10'); return false;">   <img src="images/032.png" width="30" height="30" />
                          <asp:Label ID="Label4" Font-Size="18px" runat="server" Text="ขอติดตั้งน้ำประปาใหม่"></asp:Label>
                           </a>--%>
                </td>
                   
              
            </tr>
        </table>
          <div style="text-align:right;">
            
         <%--  <script>
              
                   function OnGridFocusedRowChanged() {
                       ASPxGridView2.GetRowValues(ASPxGridView2.GetFocusedRowIndex(), 'id;id', OnGetRowValues);
                   }
                   function OnGetRowValues(values) {
                       alert(values[1]);

                   }
               
           </script>--%>
      </div>
         <div>&nbsp;</div>
          <div id="divsearch" runat="server" style="display:none;">
                                 <dx:ASPxFormLayout runat="server" ID="ASPxFormLayout1"  RequiredMarkDisplayMode="Auto" UseDefaultPaddings="false" AlignItemCaptionsInAllGroups="true" Width="100%" ColumnCount="3">
        <SettingsAdaptivity>

        </SettingsAdaptivity>
            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="500" />
                                 <Items>

                                     <dx:LayoutGroup Caption="ค้นหา"    GroupBoxStyle-Caption-Font-Size="18px"  ColCount="3"  GroupBoxDecoration="Box">
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
                                                         <asp:Label ID="Label4" CssClass="lable" runat="server"  Text="เลขที่ผู้ใช้น้ำ : "></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                   
                                                     <input type="text" id="t1" autocomplete="off"  class="txt" name="t1"  />
                                                </td>
                                                <td>&nbsp;</td>
                                                 <td>
                                                         <asp:Label ID="Label7" CssClass="lable" runat="server"  Text="ชื่อ : "></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                   
                                                     <input type="text" id="t2" autocomplete="off"  class="txt" name="t2"  />
                                                </td>
                                                   <td>&nbsp;</td>
                                                      <td>
                                                         <asp:Label ID="Label8" CssClass="lable" runat="server"  Text="นามสกุล : "></asp:Label>
                                                </td>
                                                 <td>
                                                   
                                                     <input type="text" id="t3" autocomplete="off"  class="txt" name="t3"  />
                                                </td>
                                                   <td>&nbsp;</td>
                                                      <td>
                                                         <asp:Label ID="Label6" CssClass="lable" runat="server"  Text="หมู่ที่ : "></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                   
                                                     <input type="text" id="t4" autocomplete="off"  class="txt" name="t4"  />
                                                </td>
                                            </tr>
                                           <tr><td>&nbsp;</td></tr>
                                            <tr >
                                                     <td>
                                                         <asp:Label ID="Label9" CssClass="lable" runat="server"  Text="ตำบล : "></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                   
                                                     <input type="text" id="t5" autocomplete="off"  class="txt" name="t5"  />
                                                </td>
                                                <td>&nbsp;</td>
                                                 <td>
                                                         <asp:Label ID="Label10" CssClass="lable" runat="server"  Text="อำเภอ : "></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                   
                                                     <input type="text" id="t6" autocomplete="off"  class="txt" name="t6"  />
                                                </td>
                                                   <td>&nbsp;</td>
                                                      <td>
                                                         <asp:Label ID="Label11" CssClass="lable" runat="server"  Text="จังหวัด : "></asp:Label>
                                                </td>
                                                 <td>
                                                   
                                                     <input type="text" id="t7" autocomplete="off"  class="txt" name="t7"  />
                                                </td>
                                                   <td>&nbsp;</td>
                                                      <td>
                                                         <%--<asp:Label ID="Label12" CssClass="lable" runat="server"  Text="หมู่ที่ : "></asp:Label>--%>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                   
                                                     <%--<input type="text" id="t38" autocomplete="off"  class="txt" name="t38"  />--%>
                                                </td>
                                                <td>
                                                      <button type="submit" form="form1" class="button" runat="server" onserverclick="Unnamed_ServerClick1" name="SubmitSearch" value="SubmitSearch">ค้นหา
                                                      <img src="images/089.png" />
                                                     
                                                 </button>
                                                </td>
                                                   <td>&nbsp;</td>
                                                <td>
                                
                                                     <button type="button"  class="button" name="Submit" onclick="fncancel()" value="Submit">ยกเลิก
                                                      <img src="images/003.png" />
                                                     
                                                 </button>

                                                    <script>
                                                        function fncancel()
                                                        {
                                                            document.getElementById("divsearch").style.display = "none";
                                                          //  window.re("dashboard.aspx");
                                                            //for(i = 1; i<8; i++)
                                                            //{
                                                            //    document.getElementById("t" + i.toString()).value = "";
                                                            //}
                                                        }
                                                    </script>
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
                   <Paddings PaddingBottom="1"  />
        <Styles>
            <LayoutGroupBox CssClass="fullWidth fullHeight"></LayoutGroupBox>
            <LayoutGroup Cell-CssClass="fullHeight">
<Cell CssClass="fullHeight"></Cell>
            </LayoutGroup>
        </Styles>
        </dx:ASPxFormLayout>
          </div>
                       
        <div>&nbsp;</div>


                 <div>
     <dx:ASPxGridView ID="Grid"  AutoGenerateColumns="False" ClientInstanceName="ASPxGridView2"   OnHtmlRowPrepared="ASPxGridView2_HtmlRowPrepared"  KeyboardSupport="True"  runat="server"   Font-Size="Small" Width="100%" Theme="Aqua" KeyFieldName="id"  >
           <SettingsFilterControl ViewMode="VisualAndText" AllowHierarchicalColumns="true" ShowAllDataSourceColumns="true" MaxHierarchyDepth="1" />
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
             <dx:GridViewDataTextColumn FieldName="id" Caption="" VisibleIndex="1"  Visible="false" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px"  HeaderStyle-HorizontalAlign="Center"  CellStyle-HorizontalAlign="Left" >
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
            
           
                    <dx:GridViewBandColumn Caption="ที่ตั้งมาตร" HeaderStyle-Font-Size="12px"   VisibleIndex="5"  HeaderStyle-HorizontalAlign="Center" >
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="address" Caption="เลขที่" VisibleIndex="6"  HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" CellStyle-HorizontalAlign="Left" >
                    <HeaderStyle HorizontalAlign="Center"     />
                                                        <CellStyle HorizontalAlign="Center"  >
                                                        </CellStyle>
             </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="หมู่ที่" FieldName="village" VisibleIndex="7"  HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" CellStyle-HorizontalAlign="Left" >
                    <HeaderStyle HorizontalAlign="Center"     />
                                                        <CellStyle HorizontalAlign="Center"  >
                                                        </CellStyle>
             </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="ตำบล" FieldName="district" VisibleIndex="8" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" CellStyle-HorizontalAlign="Left" >
                    <HeaderStyle HorizontalAlign="Center"     />
                                                        <CellStyle HorizontalAlign="Center"  >
                                                        </CellStyle>
             </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:GridViewBandColumn>

                   <dx:GridViewDataTextColumn Caption="ประเภทผู้ใช้น้ำ"  FieldName="detailstype" VisibleIndex="9"  HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px"  CellStyle-HorizontalAlign="Left" >
                    <HeaderStyle HorizontalAlign="Center"     />
                                                        <CellStyle HorizontalAlign="Center"  >
                                                        </CellStyle>
             </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn Caption=" เลขมาตรวัด" FieldName="numbergauge" VisibleIndex="10"  HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" CellStyle-HorizontalAlign="Left" >
                    <HeaderStyle HorizontalAlign="Center"     />
                                                        <CellStyle HorizontalAlign="Center"  >
                                                        </CellStyle>
             </dx:GridViewDataTextColumn>

           
                    <dx:GridViewBandColumn Caption="สถานะตรวจ" HeaderStyle-Font-Size="12px"  VisibleIndex="11" HeaderStyle-HorizontalAlign="Center">
                        <Columns>
                            <dx:GridViewDataTextColumn  Caption="ผู้ใช้น้ำ" FieldName="status1" VisibleIndex="12" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left" >
                    <HeaderStyle HorizontalAlign="Center"     />
                                                        <CellStyle HorizontalAlign="Center"  >
                                                        </CellStyle>
             </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn  Caption="รับชำระ" FieldName="status" VisibleIndex="13" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px"  HeaderStyle-HorizontalAlign="Center"  CellStyle-HorizontalAlign="Left" >
                    <HeaderStyle HorizontalAlign="Center"     />
                                                        <CellStyle HorizontalAlign="Center"  >
                                                        </CellStyle>
             </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:GridViewBandColumn>
                 <%--   <dx:GridViewDataTextColumn FieldName="Quantity" Caption="Qty" />
                 <dx:GridViewDataDateColumn FieldName="OrderDate" Caption="Date" />
               <dx:GridViewDataDateColumn FieldName="OrderDate" Caption="Date" />--%>
             
        </Columns>
        <Settings ShowGroupPanel="false" />

    </dx:ASPxGridView>
               <dx:ASPxGridViewExporter ID="GridExport" runat="server" GridViewID="Grid"></dx:ASPxGridViewExporter>
    </div>










      <%--  <div>
      <dx:ASPxGridView ID="ASPxGridView2"   AutoGenerateColumns="False" ClientInstanceName="ASPxGridView2"   OnHtmlRowPrepared="ASPxGridView2_HtmlRowPrepared"  KeyboardSupport="True"  runat="server"   Font-Size="Small" Width="100%" Theme="Aqua" KeyFieldName="id"  
    >
          <SettingsBehavior AllowDragDrop="false" />
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

        
            <SettingsBehavior AllowDragDrop="false" />
                                <Columns>
                                   
                                                                          <dx:GridViewDataTextColumn Caption="id" FieldName="id" VisibleIndex="1" Visible="false"   HeaderStyle-HorizontalAlign="Center" Width="100%" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center"     />
                                                        <CellStyle HorizontalAlign="Center"  >
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="ลำดับที่" FieldName="number"  VisibleIndex="2" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center"    />
                                                        <CellStyle HorizontalAlign="Center" >
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                         <dx:GridViewDataTextColumn Caption="เลขที่ผู้ใช้น้ำ" FieldName="waterusernumber" VisibleIndex="3" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center"    />
                                                        <CellStyle HorizontalAlign="Center" >
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                      <dx:GridViewDataTextColumn Caption="ชื่อผู้ใช้น้ำ" FieldName="username" Name="username" VisibleIndex="4" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center"    />
                                                        <CellStyle HorizontalAlign="Center" >
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                          
                                      
                                        <dx:GridViewDataColumn FieldName="" Caption="ที่ตั้งมาตร" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px" VisibleIndex="6" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
       
                                               <Columns>
              
                      <dx:GridViewDataTextColumn Caption="เลขที่" FieldName="address"  VisibleIndex="0" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center"  />
                                                        <CellStyle HorizontalAlign="Center" >
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                 
                                     <dx:GridViewDataTextColumn  Caption="หมู่ที่" FieldName="village" VisibleIndex="1" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
            
                                     <dx:GridViewDataTextColumn Caption="ตำบล" FieldName="district" VisibleIndex="9" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                          <Settings AllowDragDrop="True" />
                                    </dx:GridViewDataTextColumn>
                 
            </Columns>
        </dx:GridViewDataColumn>
                                      <dx:GridViewDataTextColumn Caption="ประเภทผู้ใช้น้ำ"  FieldName="detailstype" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px" VisibleIndex="10" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                      <dx:GridViewDataTextColumn Caption=" เลขมาตรวัด" FieldName="numbergauge" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px" VisibleIndex="11" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                             <dx:GridViewDataColumn FieldName="" Caption="สถานะตรวจ" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px" CellRowSpan="2" VisibleIndex="12" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
            <Columns>
                                     <dx:GridViewDataTextColumn Caption="ผู้ใช้น้ำ" FieldName="status1" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px"  VisibleIndex="13" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="รับชำระ" FieldName="status" HeaderStyle-Font-Size="16px" CellStyle-Font-Size="16px" VisibleIndex="14"   HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                     
                                    </dx:GridViewDataTextColumn>
                  </Columns>
        </dx:GridViewDataColumn>
                                </Columns>

                          <Styles>
                              <SearchPanel Font-Size="XX-Large">
                              </SearchPanel>
                          </Styles>
                            </dx:ASPxGridView>
              <dx:ASPxGridViewExporter ID="GridExport" runat="server" GridViewID="ASPxGridView2"></dx:ASPxGridViewExporter>
    </div>--%>


  
    </div>
    </form>
</body>
</html>
