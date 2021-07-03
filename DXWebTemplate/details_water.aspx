<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="details_water.aspx.cs" Inherits="DXWebTemplate.details_water" %>


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
                var val = 'prm_viewupload=' + prmid;
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

                            document.getElementById("username").innerHTML = _sp[1] +  _sp[2] + " " + _sp[3];
                          
                            document.getElementById("address").innerHTML = "เลขที่ " + _sp[7] + " ม." + _sp[8] + " ซ." + _sp[9] + " ถ." + _sp[10] + " ต." + _sp[11] + " อ." + _sp[12] + " จ." + _sp[13] + " " + _sp[14];
                            

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
    <form id="form1" name="f1" runat="server" style="text-align:center;">
       
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

                               <dx:LayoutGroup Caption="รายละเอียด"    GroupBoxStyle-Caption-Font-Size="18px"  ColCount="1"  GroupBoxDecoration="Box">
            
<GroupBoxStyle>
<Caption Font-Size="18px"></Caption>
</GroupBoxStyle>
            
                                <Items>
               
               
                      <dx:LayoutItem HorizontalAlign="Left" Caption="" FieldName="FirstName">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer Width="10px" runat="server" SupportsDisabledAttribute="True">
                                    <div>
                                     <p id="username" class="lable"></p>
                                  
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