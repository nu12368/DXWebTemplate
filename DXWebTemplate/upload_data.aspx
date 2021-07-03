<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="upload_data.aspx.cs" Inherits="DXWebTemplate.upload_data" %>



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
    <meta name="viewport" content="initial-scale=1.0"/>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAK3RgqSLy1toc4lkh2JVFQ5ipuRB106vU&;callback=initMap"></script>
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
    </style>

            <style>
        #map {
        height: 100%;
        }
        html {
        height: 100%;
        margin: 0;
        padding: 0;
        text-align: center;
        }
        #map {
        height: 500px;
        width: 800px;
        }
        </style>


</head>


    <script>
        function onload() {
            var geocoder;
            var map;
            var _latitude;
            var _longitude;
         
                $.ajax({
                    url: 'Getlocation.aspx',
                    data: "",
                    type: "POST",
                    cache: false,
                    processData: false,
                    success: function (msg) {
                        if (msg != "") {
                            findDistance();
                          var jsonObj = JSON.parse(msg);
                            //var jsonObj = [{ "location": "wac", "latitude": "13.8069549", "longitude": "100.5899356" },
                            //                 { "location": "หมู่บ้านอารียา", "latitude": "13.847766", "longitude": "100.605768" },
                            //             { "location": "สปีดเวย์", "latitude": "13.845235", "longitude": "100.602711" },
                            //             { "location": "สเต็ก ลุงหนวด", "latitude": "13.862970", "longitude": "100.613834" }]
                        


                            var mapOptions = {
                                center: { lat: Number( jsonObj[0].latitude), lng: Number( jsonObj[0].longitude) },
                                zoom: 15,
                            }
                            var maps = new google.maps.Map(document.getElementById("map"), mapOptions);
                            var marker, info;
                            $.each(jsonObj, function (i, item) {
                               // alert(item.latitude);
                                marker = new google.maps.Marker({
                                    position: new google.maps.LatLng(item.latitude, item.longitude),
                                    map: maps,
                                    title: item.location
                                });
                                info = new google.maps.InfoWindow();
                                google.maps.event.addListener(marker, 'click', (function (marker, i) {
                                    return function () {
                                        info.setContent(item.location);
                                        info.open(maps, marker);
                                    }
                                })(marker, i));
                            });


                         

                        }

                    },
                    error: function (xmlhttprequest, textstatus, errorthrown) {

                        console.log("error: " + errorthrown);
                    }
                });
            
        }



        var Rm = 3961; // mean radius of the earth (miles) at 39 degrees from the equator
        //var Rk = 6373; // mean radius of the earth (km) at 39 degrees from the equator
        var Rk = 6371000;

        var jsonObj = [{ "location": "wac", "latitude": "13.8067527", "longitude": "100.5899851" },
                     { "location": "ราดหน้ายอดผัก", "latitude": "13.8070195", "longitude": "100.5902021" }]


        /* main function */
        function findDistance() {
            var t1, n1, t2, n2, lat1, lon1, lat2, lon2, dlat, dlon, a, c, dm, dk, mi, km;

            // get values for lat1, lon1, lat2, and lon2

         
            t1 = Number(jsonObj[0].latitude);
            n1 = Number(jsonObj[0].longitude);
            t2 =  Number(jsonObj[1].latitude);
            n2 = Number(jsonObj[1].longitude);

            // convert coordinates to radians
            lat1 = deg2rad(t1);
            lon1 = deg2rad(n1);
            lat2 = deg2rad(t2);
            lon2 = deg2rad(n2);

            // find the differences between the coordinates
            dlat = lat2 - lat1;
            dlon = lon2 - lon1;

            // here's the heavy lifting
            a = Math.pow(Math.sin(dlat / 2), 2) + Math.cos(lat1) * Math.cos(lat2) * Math.pow(Math.sin(dlon / 2), 2);
            c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a)); // great circle distance in radians
            dm = c * Rm; // great circle distance in miles
            dk = c * Rk; // great circle distance in km

            // round the results down to the nearest 1/1000
            mi = round(dm);
            km = round(dk);

          //  alert(km);

        }


        // convert degrees to radians
        function deg2rad(deg) {
            rad = deg * Math.PI / 180; // radians = degrees * pi/180
            return rad;
        }

        // round to the nearest 1/1000
        function round(x) {
            return Math.round(x * 1000) / 1000;
        }




        //var jsonObj = [{ "location": "wac", "latitude": "13.8069549", "longitude": "100.5899356" },
        //                 { "location": "หมู่บ้านอารียา", "latitude": "13.847766", "longitude": "100.605768" },
        //             { "location": "สปีดเวย์", "latitude": "13.845235", "longitude": "100.602711" },
        //             { "location": "สเต็ก ลุงหนวด", "latitude": "13.862970", "longitude": "100.613834" }]
        //function initMap() {
        //        var mapOptions = {
        //                center: {lat: 13.847860, lng: 100.604274},
        //    zoom: 15,
        //    }
        //    var maps = new google.maps.Map(document.getElementById("map"),mapOptions);
        //    var marker, info;
        //    $.each(jsonObj, function(i, item){
        //        marker = new google.maps.Marker({
        //            position: new google.maps.LatLng(item.latitude, item.longitude),
        //        map: maps,
        //        title: item.location
        //    });
        //    info = new google.maps.InfoWindow();
        //    google.maps.event.addListener(marker, 'click', (function(marker, i) {
        //        return function() {
        //            info.setContent(item.location);
        //            info.open(maps, marker);
        //        }
        //    })(marker, i));
        //    });
        //    }

</script>
  

<body onload="onload()">
    
    <form id="form1" runat="server">
        <div id="map" style="display:none;"></div>
    

        <div style="display:none;">
               <input type="text" id="tt" name="tt" />
        </div>
      <div>
        <table>
            <tr>
                <td>
                     <asp:Label ID="Label1" Font-Size="18px" runat="server" Text="Upload ข้อมูล"></asp:Label>
                </td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td>
                   <%-- <asp:Menu ID="Menu1" runat="server" ClientInstanceName="menuExport" OnMenuItemClick="Menu1_MenuItemClick" ClientVisible="true" >
                        <Items>
                            <asp:MenuItem Text="Export Excel"   ImageUrl="~/images/excelBT.png">
                                  
                            </asp:MenuItem>
                        </Items>
                    </asp:Menu>--%>
               </td>
                  <td>
                <a href="upload_data.aspx">  <img src="images/024.png" width="30" height="30"  />  <asp:Label ID="Label5" Font-Size="18px" runat="server" Text="รีเฟรช"></asp:Label>  </a>
                </td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td>
                <a href="">  <img src="images/193.png" width="30" height="30"  />  <asp:Label ID="Label2" Font-Size="18px" runat="server" Text="พิมพ์"></asp:Label>  </a>
                </td>
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
                 
            </tr>
        </table>
    <%--       <div data-options="region:'north',border:false" style="height: 56px; padding: 0px; overflow: hidden;">
             <div style="text-align:right;">
          
                 <dx:ASPxButton ID="ASPxButton1" runat="server"  Font-Size="Medium" Text="บันทึก" Height="34px" Width="101px"></dx:ASPxButton>&nbsp;&nbsp;
               <dx:ASPxButton ID="ASPxButton2" runat="server"  Font-Size="Medium" Text="ส่งอนุมัติ" Height="34px" Width="101px"></dx:ASPxButton>
                         
            </div>
        </div>--%>

        <div>&nbsp;</div>
        <div>
           

            <%--OnHtmlRowPrepared="ASPxGridView2_HtmlRowPrepared"--%> 
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
                                                                          <%--<dx:GridViewCommandColumn VisibleIndex="0">
                                                                          </dx:GridViewCommandColumn>--%>
                                                                          <dx:GridViewDataTextColumn Caption="id" FieldName="id" VisibleIndex="1" Visible="false"   HeaderStyle-HorizontalAlign="Center" Width="100%" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center"    />
                                                        <CellStyle HorizontalAlign="Center" >
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="ลำดับที่" FieldName="number" VisibleIndex="2" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center"    />
                                                        <CellStyle HorizontalAlign="Center" >
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                      <dx:GridViewDataTextColumn Caption="เครื่อง" FieldName="number_device" VisibleIndex="3" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center"    />
                                                        <CellStyle HorizontalAlign="Center" >
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                          
                                      <dx:GridViewDataTextColumn Caption="วันที่" FieldName="dateupload" VisibleIndex="4" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="ผู้ใช้น้ำ" FieldName="username"  VisibleIndex="5" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn  Caption="สถานะ" FieldName="status" VisibleIndex="6" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                      <dx:GridViewDataTextColumn  Caption="รายละเอียด" FieldName="details" VisibleIndex="6" HeaderStyle-Font-Size="12px" CellStyle-Font-Size="12px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
               <dx:ASPxGridViewExporter ID="GridExport" runat="server" GridViewID="ASPxGridView2"></dx:ASPxGridViewExporter>
         

    </div>
    </div>


    </form>
</body>
</html>
