<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view_menu.aspx.cs" Inherits="DXWebTemplate.view_menu" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width, user-scalable=no, maximum-scale=1.0, minimum-scale=1.0" />
    <meta charset="UTF-8">
    <title>WAC</title>
    <%--    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/omr.ico">--%>
    <link rel="shortcut icon" href="images/omr.ico">
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.4/themes/gray/easyui.css">
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.4/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.4/demo/demo.css">
    <script type="text/javascript" src="jquery-easyui-1.4/jquery.min.js"></script>
    <script type="text/javascript" src="jquery-easyui-1.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="Scripts/JScript.js"></script>





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
    </style>
    <script type="text/jscript">
        function OnGetNodeValues_SetEdit(Keynode) {
          
            //alert('==>' + Keynode);
            var NodeUrl = Keynode[2];
            var NodeName = Keynode[3];
            if (Keynode[4] != 0) {
                if (NodeUrl != null) {
                    addPanel(NodeUrl, NodeName)
                }
            }


        }
        function CallLink(MenuUrl, MenuID, MenuName) {
           // alert(MenuUrl, MenuID, MenuName);
            if (MenuUrl != null || MenuUrl != "") {
                var val = 'prm=' + MenuID;

                $.ajax({
                    url: MenuUrl,
                    data: val,
                    type: "POST",
                    cache: false,
                    success: function (msg) {

                        addPanel(MenuUrl, MenuName);
                    }
                });

            }

        }
        function GetLink(Val) {
            if (Val == 1) {
                document.getElementById("td").style.textDecoration = "underline";
            } else if (Val == 2) {
                document.getElementById("td").style.textDecoration = "none";
            } else if (Val == 3) {
                document.getElementById("td2").style.textDecoration = "underline";
            } else if (Val == 4) {
                document.getElementById("td2").style.textDecoration = "none";
            }

        }
        function CallSubject() {

            window.open("main_group.aspx" , "contentUrlPane");
        }
        function CallGroup() {
            alert(lbGid.GetText() + ASPxLabel1.GetText);
            window.open("main_exam.aspx?gid=" + lbGid.GetText() + "&gName=" + ASPxLabel1.GetText(), "contentUrlPane")
        }
    </script>
    <link rel="stylesheet" href="Styles/Scrollbar.css" />
    <style>
        .focus {
            background-color: #EEFFAA;
            color: Blue;
        }

            .focus .dxtl {
                border: 0px solid #EEFFAA !important;
            }
    </style>
</head>
<body class="easyui-layout layout panel-noscroll">
    <form id="form1" runat="server">
        <div data-options="region:'north',border:false" style="height: 30px; padding: 0px; overflow: hidden;">
            <table>
                <tr>
                    <td id="td" style="cursor: pointer;" onmouseover="GetLink(1)" onmouseout="GetLink(2)" onclick="CallSubject()">
                        <dx:ASPxLabel ID="lbGid" ClientInstanceName="lbGid" runat="server" ClientVisible="false"></dx:ASPxLabel>
                        <%--<dx:ASPxLabel ID="ASPxLabel2" runat="server"  Text="หน้าแรก"></dx:ASPxLabel>--%>
                    </td>
                    <td></td>
                    <td id="td2" style="cursor: pointer;"  onmouseover="GetLink(3)" onmouseout="GetLink(4)" onclick="CallGroup()">
                        <%--<dx:ASPxLabel ID="ASPxLabel1" runat="server" ClientInstanceName="ASPxLabel1"></dx:ASPxLabel>--%>
                    </td>
                    <td></td>
                 
                     <td id="td3" >
                        <%--<dx:ASPxLabel ID="ASPxLabel3" runat="server"></dx:ASPxLabel>--%>
                    </td>
                  
                      
                </tr>
            </table>
        </div>
     
             <div style="text-align:right;">
           
          
            </div>
       
        <script type="text/javascript">
            function callUrl(key) {
              
                TreeMenu.GetNodeValues(key, 'NODE_ID;parent_id;menu_url;menu;parent_id', OnGetNodeValues_SetEdit);
            }
        </script>
        <div data-options="region:'west',title:'เมนู'" style="width: 290px; padding: 0px; color: #111; font-family: 'Open Sans', sans-serif; margin: 0 0 72px; background-color: rgba(254, 254, 254, 0.93)">
            <div>
                <dx:ASPxNavBar ID="ASPxNavBar1" runat="server" AllowSelectItem="True" EnableAnimation="True"
                    Width="100%" Border-BorderWidth="1">
                    <GroupHeaderStyle HorizontalAlign="Left" ForeColor="Black" />
                    <ItemStyle HorizontalAlign="Left" ForeColor="Black">
                        <SelectedStyle ForeColor="White">
                        </SelectedStyle>
                    </ItemStyle>

                    <Border BorderWidth="1px"></Border>
                </dx:ASPxNavBar>
            </div>
        </div>

      <%--  <div data-options="region:'south',border:false" style="height: 37px; background-image:url(Images/bg2.png);
        padding: 0px">
        <table style="width: 100%; margin-left: auto; margin-right: auto; border-collapse: collapse;
            text-align: center; margin-top: 2px;">
            <tr>
                <td rowspan="2" style="width: 230px;">
                </td>
                <td style="text-align: center; font-size: 11px">
                    <dx:ASPxLabel ID="lbCopyRight" runat="server" Font-Size="6pt" ForeColor="#585858">
                    </dx:ASPxLabel>
                </td>
            </tr>
        </table>
    </div>--%>

        <div data-options="region:'center'" style="height: 97%; width: 99%">
            <div id="tt" fit="true" class="easyui-tabs" data-options="region:'center',tools:'#tab-tools'"
                style="width: 100%; height: 100%" plain="true">
            </div>
            <%-- <div id="tab-tools">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove'"
                        onclick="removePanel()"></a>
                </div>--%>
        </div>
        <dx:ASPxLabel ID="lbChkUser" runat="server" ClientInstanceName="lbChkUser" ClientVisible="false"></dx:ASPxLabel>
        <script type="text/javascript">
            $(document).ready(function () {
                CallLink("water_user.aspx", "1", "ทะเบียนผู้ใช้น้ำ");
            });

        </script>










        <dx:ASPxPopupControl ID="PopupWarning" runat="server" CloseAction="CloseButton" Modal="True"
            Width="300px" Height="100px" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
            ClientInstanceName="PopupWarning" HeaderText="Session Warnning." AllowDragging="True"
            PopupAnimationType="None" EnableViewState="False" ShowCloseButton="False">
            <HeaderImage IconID="people_role_16x16">
            </HeaderImage>
            <ContentCollection>
                <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                    <table style="width: 100%;">
                        <tr>
                            <td style="color: Red;">Session on web page is empty.<br />
                                <b>Please go back to login !</b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <hr />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxButton ID="btnGoBack" runat="server" Text="   OK   " AutoPostBack="false">
                                    <ClientSideEvents Click="function(s,e){window.open('logout.aspx','_parent');}" />
                                    <Image IconID="people_assigntome_16x16">
                                    </Image>
                                </dx:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>


    </form>
</body>
</html>

