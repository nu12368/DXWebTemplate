<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="Default.aspx.cs" Inherits="DXWebTemplate._Default" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width, user-scalable=no, maximum-scale=1.0, minimum-scale=1.0" />
    <meta charset="UTF-8">
    <title>WAC</title>
<%--    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/omr.ico">--%>
      <link rel="Stylesheet" href="Styles/Scrollbar.css" />
    <link rel="shortcut icon" href="images/omr.ico"/>
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.4/themes/gray/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.4/themes/icon.css"/>
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.4/demo/demo.css"/>
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
            color: #424242;F
            border-radius: 0px;
            background: -webkit-linear-gradient(top left, #A9D0F5 0%, #FFFFFF 100%);
        }

        a.notif {
            position: relative;
            display: block;
            height: 37px;
            width: 37px;
            /*background: url('images/Alert.png');*/
            background-size: contain;
            text-decoration: none;
        }

        .num {
            position: absolute;
            right: 5px;
            top: 4px;
            color: #fff;
        }
        .textBox
{
    visibility:hidden;
    display:none;
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
        function CallLink(MenuUrl, MenuName) {
            //alert(MenuUrl +"---"+ MenuName);
            if (MenuUrl != null || MenuUrl != "") {
                addPanel(MenuUrl, MenuName)
            }

        }

        function UploaderEdit_OnFileUploadComplete(args) {
            var imgSrc2 = aspxPreviewImgSrc2;
            if (args.isValid) {
                var date = new Date();
                imgSrc2 = "Pic_Profile/" + args.callbackData + "?dx=" + date.getTime();
            }
            imgPro.SetImageUrl(imgSrc2);
        }


        function getPreviewImageElement2() {
            return document.getElementById(imgSrc2);
        }
        function GetPicIDEdit() {
            var EmpID = lbEPid.GetText();
            var val = 'prm=' + EmpID;
            $.ajax({
                url: 'ajax_get_picid.aspx',
                data: val,
                type: "GET",
                cache: false,
                success: function (msg) {
                    txtChkPic.SetText(msg + ".jpg");
                }
            });
        }
        function SaveProfile() {
            var EmpID = lbEPid.GetText();
            var Name = txtName.GetText();
            var Surname = txtSurname.GetText();
            var OldPwd = txtPwdOld.GetText();
            var Pwd = txtPwdConfirm.GetText();
            var val = 'EmpID=' + EmpID + '&Name=' + Name + '&Surname=' + Surname + '&Pwd=' + Pwd + '&OldPwd=' + OldPwd;
            //alert(val);
            $.ajax({
                url: 'ajax_update_profile.aspx',
                data: val,
                type: "GET",
                cache: false,
                success: function (msg) {
                    //alert(msg);
                    if (msg == "1") {
                        popEditProfile.Hide();
                        PopupSaveComplete.Show();
                    } else {
                        alert("*! ????????????????????????????????????????????");
                        txtPwdOld.SetFocus(true);
                    }

                }
            });

        }

    </script>
  
    <style>
        .focus {
            background-color: #EEFFAA;
            color: Blue;
        }

            .focus .dxtl {
                border: 0px solid #EEFFAA !important;
            }
        .auto-style1 {
            width: 37px;
        }
    </style>
</head>
<body class="easyui-layout layout panel-noscroll">
    <form id="form1" runat="server">
        <div>&nbsp;</div>
   <dx:ASPxTextBox ID="txtChkPic" runat="server" ClientInstanceName="txtChkPic" ClientVisible="false"></dx:ASPxTextBox>
    <div data-options="region:'north',border:false" style="height: 50px; background-image:url(Images/bg2.png);
        padding: 0px; overflow: hidden;">
        <table style="border-collapse: collapse; width: 100%;">
            <tr>
                <td>

                    <dx:ASPxPanel ID="panelProfile" runat="server" ClientInstanceName="panelProfile"
                        Width="100%" ClientVisible="true">
                        <PanelCollection>
                            <dx:PanelContent>
                                <table style="border-collapse: collapse; width: 100%">
                                    <tr>
                                        <td style="width: 50%;">
                                            <table style="border-collapse: collapse;margin-top:-2px;"">
                                                <tr>
                                                     
                                                    <td>
                                                        <dx:ASPxImage ID="imgLogo" runat="server" ClientInstanceName="imgLogo" ImageUrl="~/Images/logoMain.png"
                                                            Height="50" Width="100" Style="margin-left: -20px; margin-top: -5px;">
                                                        </dx:ASPxImage>
                                                    </td>
                                                    
                                                    <td>
                                                        <table style="margin-left:-25px;">
                                                            <tr>
                                                             <td style="font-size: 16pt; text-shadow: 1px 1px #BDBDBD; color: Blue;">
                                                                   &nbsp; &nbsp;  ?????????????????????????????????????????????????????????????????????????????????????????????
                                                                </td>
                                                   <%-- <td style="font-size: 16pt; text-shadow: 1px 1px #BDBDBD; color: Blue;">
                                                        &nbsp;S
                                                    </td>
                                                    <td style="font-size: 10pt; text-shadow: 1px 1px #BDBDBD;">
                                                        YSTEM
                                                    </td>--%>
                                                                <td class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                              
                                                            </tr>
                                                        </table>

                                                    </td>
                                                  
                                                    
                                                </tr>
                                            </table>
                                        </td>
                                       
                                        <td>
                                                             <table style="margin-left: auto; margin-top:-5px;">
                                                 <tr>
                                                      <td style="text-align:right;">
                            <a href="login.aspx" style="font-size:16px;">[??????????????????????????????]</a>
                     </td>
                                                 </tr>
                                             </table>
                                        </td>
                                        <td style="display:none;">
                            
                                              
                                            <script type="text/javascript">
                                                function CallProfile() {
                                                    var left1 = window.event.clientX + document.body.scrollLeft + document.documentElement.scrollLeft;
                                                    var top1 = window.event.clientY + document.body.scrollTop + document.documentElement.scrollTop;

                                                    popUpProfile.ShowAtPos(left1 - 350, top1);
                                                }
                                            </script>
                                            <table style="margin-left: auto; margin-top:-5px;">
                                                <tr>
                                                   <td >
                                                      <%--  <dx:ASPxButton ID="btnImageAdmin" runat="server" RenderMode="Link" AutoPostBack="false">
                                                             <ClientSideEvents Click="function(s,e){
                                                                        var left1 = window.event.clientX + document.body.scrollLeft + document.documentElement.scrollLeft;
                                                                        var top1 = window.event.clientY + document.body.scrollTop + document.documentElement.scrollTop;
                                                                      
                                                                        popUpAdmin.ShowAtPos(left1-100, top1);
                                                                    }" />
            <Image IconID="grid_customizegrid_32x32">
            </Image>
        </dx:ASPxButton>--%>
                                                    </td>           
                                                    <td  style="vertical-align: middle;">
                                                        <div>


                                                      <%--      <dx:ASPxLabel ID="lbAdmin" ToolTip="????????????????????????????????????????" runat="server" Cursor="pointer"
                                                                ForeColor="#0080FF" Text="????????????????????????????????????????">
                                                                <ClientSideEvents Click="function(s,e){
                                                                        var left1 = window.event.clientX + document.body.scrollLeft + document.documentElement.scrollLeft;
                                                                        var top1 = window.event.clientY + document.body.scrollTop + document.documentElement.scrollTop;
                                                                      
                                                                        popUpAdmin.ShowAtPos(left1-100, top1);
                                                                    }" />
                                                            </dx:ASPxLabel>--%>
                                                        </div>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        
                                                    </td>
                                                    
                                                    <td style=" cursor:pointer;"> <a onclick="CallAlert();" title="?????????????????????????????????????????????????"  class="notif" style="text-decoration:none;"><span class="num"><dx:ASPxLabel runat="server" ID="lbAlert" ClientInstanceName="lbAlert"></dx:ASPxLabel></span></a></td>
                                                   <td>&nbsp;</td>
                                                    <td >
                                                        <a href="javascript:void();" onclick="CallProfile();" style="cursor: pointer;">
                                                            <asp:Image ID="Image1" runat="server" Height="30px" Width="30px" CssClass="circular" ImageUrl="~/Pic_Profile/person.jpg" />
                                                        </a>
                                                    </td>
                                                    <td>
                                                      
                                                    </td>
                                                    <td>&nbsp;&nbsp;</td>
                                                    <td  style="vertical-align: middle;">
                                                        <div>


                                                            <dx:ASPxLabel ID="profile_hrm" ToolTip="?????????????????" runat="server" Cursor="pointer"
                                                                ForeColor="#0080FF" Text="?????????????????">
                                                                <ClientSideEvents Click="function(s,e){
                                                                        var left1 = window.event.clientX + document.body.scrollLeft + document.documentElement.scrollLeft;
                                                                        var top1 = window.event.clientY + document.body.scrollTop + document.documentElement.scrollTop;
                                                                      
                                                                        popUpProfile.ShowAtPos(left1-350, top1);
                                                                    }" />
                                                            </dx:ASPxLabel>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        &nbsp;&nbsp;&nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxPanel>
                </td>
                <td>
                </td>
            </tr>
        </table>
    </div>
   <%-- <script type="text/javascript">
        function callUrl(key) {
            TreeMenu.GetNodeValues(key, 'NODE_ID;parent_id;menu_url;menu;parent_id', OnGetNodeValues_SetEdit);
        }
    </script>--%>

    <div data-options="region:'south',border:false" style="height: 37px; background-image:url(Images/bg2.png);
        padding: 0px">

        <table style="width: 100%; border-collapse: collapse;
            text-align: center; margin-top: 2px;">
            <tr>
               
                <td style="font-size: 11px">
                  <%--<dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="ASPxLabel" Font-Size="6pt" ForeColor="#585858"></dx:ASPxLabel>--%>

                    <dx:ASPxLabel ID="lbCopyRight" runat="server" Font-Size="6pt" ForeColor="#585858">
                    </dx:ASPxLabel>
                </td>
            </tr>
        </table>
    </div>
        <script type="text/javascript" >
            function CallStyle(chk, ctrl) {
                if (chk == 1) {
                    document.getElementById("tb" + ctrl).bgColor = '#CEE3F6'
                    document.getElementById("td" + ctrl).style.textDecoration = "underline";
                } else {
                    document.getElementById("tb" + ctrl).bgColor = 'transparent'
                    document.getElementById("td" + ctrl).style.textDecoration = "none";
                }

            }
            function CallSubject(GroupID) {
                //alert(GroupID);
                var paneContent = ASPxSplitter1.GetPaneByName('contentUrlPane');
                if (GroupID == "0") {
                    paneContent.SetContentUrl("main_group.aspx");
                } else {
                    paneContent.SetContentUrl("View_Plan.aspx");
                }
                paneContent.RefreshContentUrl();
            }

            function CallAdmin(UrlID) {
                popUpAdmin.Hide();
                var paneContent = ASPxSplitter1.GetPaneByName('contentUrlPane');
                paneContent.SetContentUrl("admin_manage.aspx?UrlID=" + UrlID);
                paneContent.RefreshContentUrl();
            }
            function CallLink(Url, strMenu, S) {
                //alert(Url + '----' + strMenu + '----' + S);
                popUpAdmin.Hide();
                var paneContent = ASPxSplitter1.GetPaneByName('contentUrlPane');
                paneContent.SetContentUrl("admin_manage.aspx?Url=" + Url + "&strMenu=" + strMenu + "&S=" + S);
                paneContent.RefreshContentUrl();
            }
        </script>
       
                 <div data-options="region:'center'" >

                     <dx:ASPxSplitter ID="ASPxSplitter1" runat="server" ClientInstanceName="ASPxSplitter1" FullscreenMode="True" Height="100%" Width="100%">
                         
                         <Panes>
                             <dx:SplitterPane ScrollBars="Auto" Name="contentUrlPane" ContentUrlIFrameName="contentUrlPane" ContentUrl="main_group.aspx" >
                                 <ContentCollection>
<dx:SplitterContentControl runat="server">


</dx:SplitterContentControl>
</ContentCollection>
                             </dx:SplitterPane>
                            
                         </Panes>
                         <Styles>
                             <Pane Border-BorderStyle="None">
                             </Pane>
                         </Styles>
                         <Border BorderStyle="None" />
                     </dx:ASPxSplitter>
                     
                    
                </div>
    <script type="text/javascript">
        $(document).ready(function () {
            /*var content = '<iframe id="displayHelp"  frameborder="0" src="main_group.aspx" width="100%" style="height:100%" ></iframe> ';
            $('#tt').tabs('add', {
                title: "?????????????????????????????????????????",
                content: content,
                closable: true

            });*/

            CallSubject("0");

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
                        <td style="color: Red;">
                            Session on web page is empty.<br />
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
        <script type="text/javascript">
            function GetLink(Chk, Val) {
                if (Chk == 0) { //Check Onmouse select
                    document.getElementById("tr" + Val).style.textDecoration = "underline";
                    /*if (Val == 1) {
                        document.getElementById("tr1").style.textDecoration = "underline";
                    } else if (Val == 2) {
                        document.getElementById("tr2").style.textDecoration = "underline";
                    } else {
                        document.getElementById("tr" + Val).style.textDecoration = "none";
                    }*/
                } else { //Check Onmouse out
                    document.getElementById("tr" + Val).style.textDecoration = "none";
                }



            }

        </script>
        <dx:ASPxPopupControl ID="popUpAdmin" runat="server" ShowHeader="false" PopupHorizontalAlign="RightSides"
        PopupVerticalAlign="TopSides" PopupVerticalOffset="25" PopupAlignCorrection="Disabled"
        PopupAction="LeftMouseClick" ClientInstanceName="popUpAdmin" PopupElementID="lbAdmin"
        Width="200px">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl5" runat="server">
               <table style="display:none;">
                   <tr id="tr1" onmouseover="GetLink(0,1)" onmouseout="GetLink(1,1)" style="height:30px; cursor:pointer;" onclick="CallAdmin(1)">
                       <td><img src="images/menu_icon/1-1.png" title="???????????????????????????????????????" /></td>
                       <td><dx:ASPxLabel runat="server" ID="lbM1" Text="???????????????????????????????????????"></dx:ASPxLabel></td>
                   </tr>
                   <tr id="tr2" onmouseover="GetLink(0,2)" onmouseout="GetLink(1,2)" style="height:30px; cursor:pointer;" onclick="CallAdmin(2)">
                       <td><img src="images/menu_icon/_1.3.png" title="?????????????????? ?????????./?????????/?????????????????" /></td>
                       <td><dx:ASPxLabel runat="server" ID="ASPxLabel6" Text="?????????????????? ?????????./?????????/?????????????????"></dx:ASPxLabel></td>
                   </tr>
                   <tr id="tr3" onmouseover="GetLink(0,3)" onmouseout="GetLink(1,3)" style="height:30px; cursor:pointer;" onclick="CallAdmin(3)">
                       <td><img src="images/menu_icon/_1.4.png" title="?????????????????????????????????????????????????" /></td>
                       <td><dx:ASPxLabel runat="server" ID="ASPxLabel9" Text="?????????????????????????????????????????????????"></dx:ASPxLabel></td>
                   </tr>
                   <tr id="tr4" onmouseover="GetLink(0,4)" onmouseout="GetLink(1,4)" style="height:30px; cursor:pointer;" onclick="CallAdmin(4)">
                       <td><img src="images/menu_icon/_1.5.png" title="???????????????????????????????????" /></td>
                       <td><dx:ASPxLabel runat="server" ID="ASPxLabel10" Text="???????????????????????????????????"></dx:ASPxLabel></td>
                   </tr>
                   <tr id="tr5" onmouseover="GetLink(0,5)" onmouseout="GetLink(1,5)" style="height:30px; cursor:pointer;" onclick="CallAdmin(5)">
                       <td><img src="images/menu_icon/_1.1.png" title="??????????????????????????????????????????????" /></td>
                       <td><dx:ASPxLabel runat="server" ID="ASPxLabel11" Text="??????????????????????????????????????????????"></dx:ASPxLabel></td>
                   </tr>
                  
               </table>
               

                <dx:ASPxNavBar ID="ASPxNavBar1" runat="server" AllowSelectItem="True" EnableAnimation="True"
                    Width="100%" Border-BorderWidth="0" Border-BorderStyle="None">
                    <GroupHeaderStyle HorizontalAlign="Left" ForeColor="Black" />
                    <ItemStyle HorizontalAlign="Left" ForeColor="Black">
                        <SelectedStyle ForeColor="White">
                        </SelectedStyle>
                    </ItemStyle>

                    <Border BorderWidth="1px"></Border>
                </dx:ASPxNavBar>


            </dx:PopupControlContentControl>
        </ContentCollection>
        <Border BorderStyle="None" />
    </dx:ASPxPopupControl>




    <dx:ASPxPopupControl ID="popUpProfile" runat="server" ShowHeader="false" PopupHorizontalAlign="RightSides"
        PopupVerticalAlign="TopSides" PopupVerticalOffset="25" PopupAlignCorrection="Disabled"
        PopupAction="LeftMouseClick" ClientInstanceName="popUpProfile" PopupElementID="profile_hrm"
        Width="400px">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                <table >
                    <tr>
                        <td style="vertical-align: top;">
                 
                            <asp:Image ID="PicProfile" runat="server" Height="60px" Width="57px" />
                        </td>
                        <td style="vertical-align: top;">
                            <table style="width: 100%;">
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;">
                                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="???????????? :">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxLabel ID="lbPid" runat="server" ForeColor="#0066FF">
                                        </dx:ASPxLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;">
                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="????????????-????????????????? :">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxLabel ID="lbName" runat="server" ForeColor="#0066FF">
                                        </dx:ASPxLabel>
                                    </td>
                                </tr>
                                <tr style="display:none;">
                                    <td style="text-align: right;">
                                        <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Name-Surname :">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxLabel ID="lbNameEn" runat="server" ForeColor="#0066FF">
                                        </dx:ASPxLabel>
                                    </td>
                                </tr>
                                <tr style="display: none;">
                                    <td style="text-align: right;">
                                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="???????????? :">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxLabel ID="lbOrg" runat="server" ForeColor="#0066FF">
                                        </dx:ASPxLabel>
                                    </td>
                                </tr>
                                <tr style="display:none;">
                                    <td style="text-align: right;">
                                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="?????? :">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxLabel ID="lbDepartment" runat="server" ForeColor="#0066FF">
                                        </dx:ASPxLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;">
                                        <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="?????????????? :">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxLabel ID="lbPosition" runat="server" ForeColor="#0066FF">
                                        </dx:ASPxLabel>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <hr />
                <table style="width: 100%; display:none;">
                    <tr> 
                        <td style="width: 50%; ">
                            <dx:ASPxButton ID="btnViewProfile" runat="server"   Text=" ???????????????????????? " AutoPostBack="false">
                                <ClientSideEvents Click="function(s,e){
                                    popUpProfile.Hide();
                                    txtPwdOld.SetText('');
                                    txtPwdNew.SetText('');
                                    txtPwdConfirm.SetText('')
                                    popEditProfile.Show();
                                }" />
                            </dx:ASPxButton>
                        </td>
                        <td style="text-align: right;">
                            <dx:ASPxButton ID="btnLogout" runat="server" Text=" ?????????????????? " AutoPostBack="false">
                                <ClientSideEvents Click="function(s,e){
                                    PopupConfirmLogout.Show();
                                }" />
                            </dx:ASPxButton>
                        </td>
                    </tr>
                </table>
            </dx:PopupControlContentControl>
        </ContentCollection>
        <Border BorderStyle="None" />
    </dx:ASPxPopupControl>
    <dx:ASPxPopupControl ID="PopupConfirmLogout" runat="server" CloseAction="CloseButton"
        Modal="True" Width="300px" Height="100px" PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter" ClientInstanceName="PopupConfirmLogout" HeaderText="Confirm Logout."
        AllowDragging="True" PopupAnimationType="None" EnableViewState="False" ShowCloseButton="true">
        <HeaderImage IconID="support_question_16x16">
        </HeaderImage>
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl3" runat="server">
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <dx:ASPxLabel ID="lbResult" runat="server" ClientInstanceName="lbResult" Text="???????????????????????????????????????????????? ?">
                            </dx:ASPxLabel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxButton ID="ASPxButton1" runat="server" Text="   ????????   " AutoPostBack="false"
                                Width="80px">
                                <ClientSideEvents Click="function(s,e){
                                                        location.href='logout.aspx';
                                    }" />
                                <Image IconID="people_assigntome_16x16">
                                </Image>
                            </dx:ASPxButton>
                            <dx:ASPxButton ID="btnClose" runat="server" Text="   ??????????   " AutoPostBack="false"
                                Width="80px">
                                <ClientSideEvents Click="function(s,e){PopupConfirmLogout.Hide();}" />
                                <Image IconID="edit_delete_16x16">
                                </Image>
                            </dx:ASPxButton>
                        </td>
                    </tr>
                </table>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>



         <%--OnFileUploadComplete="uplImage_FileUploadComplete"--%>
 <dx:ASPxPopupControl ID="popEditProfile" runat="server" CloseAction="CloseButton"
        Modal="True" Width="550" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        ClientInstanceName="popEditProfile" HeaderText="????????????????????????" AllowDragging="True"
        PopupAnimationType="None" EnableViewState="False" ShowCloseButton="False">
        <HeaderImage IconID="businessobjects_bouser_16x16">
        </HeaderImage>
        <ContentCollection>
            <dx:PopupControlContentControl>
                <table>
                    <tr>
                        <td colspan="2">
                            <table style="margin-left: auto; margin-right: auto;">
                                <tr>
                                    <td style="text-align:center;">
                                        <%--ClientInstanceName="imgPro"--%>
                                        <dx:ASPxImage ID="imgPro" runat="server" ImageUrl="~/Pic_Profile/person.jpg"  Width="150px" Height="150px">
                                        </dx:ASPxImage>
                                        <dx:ASPxUploadControl ID="uplImageEdit" runat="server" ClientInstanceName="uploaderEdit" ClientEnabled="true" ShowClearFileSelectionButton="False"
                                                BrowseButton-Text="??????????????" ShowProgressPanel="True" Width="1px" > 
                                                <ClientSideEvents FileUploadComplete="function(s, e) { UploaderEdit_OnFileUploadComplete(e); }"
                                                    TextChanged="function(s, e) { uploaderEdit.Upload(); }" FileUploadStart="function(s,e){GetPicIDEdit();}"></ClientSideEvents>
                                                <ValidationSettings MaxFileSize="4194304" AllowedFileExtensions=".jpg,.jpeg,.jpe,.gif,.png">
                                                </ValidationSettings>
                                                <BrowseButton Text="??????????????">
                                                </BrowseButton>
                          
                                            </dx:ASPxUploadControl>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right;">
                            ????????????????????? :
                        </td>
                        <td>
                            <dx:ASPxLabel ID="lbEPid" runat="server" ClientInstanceName="lbEPid" ForeColor="Blue">
                            </dx:ASPxLabel>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right;">
                            ????????????-????????????????? :
                        </td>
                        <td>
                            <table style="border-collapse: collapse;">
                                <tr>
                                    <td>
                                        <dx:ASPxTextBox ID="txtName" runat="server" ClientInstanceName="txtName" ForeColor="Blue">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtSurname" runat="server" ClientInstanceName="txtSurname" ForeColor="Blue">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            ?????????????????????????
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right;">
                            ????????????????????????? :
                        </td>
                        <td>
                            <dx:ASPxTextBox ID="txtPwdOld" runat="server" ClientInstanceName="txtPwdOld" ForeColor="Blue" Password="true">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right;">
                            ???????????????????????????? :
                        </td>
                        <td>
                            <dx:ASPxTextBox ID="txtPwdNew" runat="server" ClientInstanceName="txtPwdNew" ForeColor="Blue" Password="true">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right;">
                            ??????????????????????????????????????????? :
                        </td>
                        <td>
                            <dx:ASPxTextBox ID="txtPwdConfirm" runat="server" ClientInstanceName="txtPwdConfirm" Password="true"
                                ForeColor="Blue">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <hr />
                            <dx:ASPxLabel ID="lbChkWn" runat="server" ClientInstanceName="lbChkWn" ForeColor="Red" >
                            </dx:ASPxLabel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxButton ID="btnConfirmSent" runat="server" ClientInstanceName="btnConfirmSent"
                                            AutoPostBack="false" Text="????????????????????????????" Image-IconID="businessobjects_boresume_16x16">
                                            <ClientSideEvents Click="function(s,e){
                                                                        //alert(cmbPerList.GetValue());
                                                            if(txtPwdOld.GetText()==''){
                                                                 lbChkWn.SetText('! ???????????????????????????????????????????????????????');
                                                                 txtPwdOld.SetFocus(true);
                                                                 return false;
                                                            }else if(txtPwdNew.GetText()==''){
                                                                 lbChkWn.SetText('! ??????????????????????????????????????????????????????????');
                                                                 txtPwdNew.SetFocus(true);
                                                                 return false;
                                                            }else if(txtPwdConfirm.GetText()==''){
                                                                 lbChkWn.SetText('! ?????????????????????????????????????????????????????????????????????????????');
                                                                 txtPwdConfirm.SetFocus(true);
                                                                 return false;
                                                            }else if(txtPwdNew.GetText() != txtPwdConfirm.GetText()){
                                                                 lbChkWn.SetText('! ??????????????????????????????????????????????');
                                                                 txtPwdConfirm.SetFocus(true);
                                                                 return false;
                                                            }else{
                                                                SaveProfile();
                                                            }
                                                                      
                                                                        
                                                                     }" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ASPxButton6" runat="server" ClientInstanceName="btnConfirmSent"
                                            AutoPostBack="false" Text="??????????" Image-IconID="actions_cancel_16x16">
                                            <ClientSideEvents Click="function(s,e){
                                                                        popEditProfile.Hide();
                                                                     }" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

        <dx:ASPxPopupControl ID="PopupSaveComplete" runat="server" CloseAction="CloseButton"
                                            Modal="True" Width="300px" Height="100px" PopupHorizontalAlign="WindowCenter"
                                            PopupVerticalAlign="WindowCenter" ClientInstanceName="PopupSaveComplete" HeaderText="?????????????????."
                                            AllowDragging="True" PopupAnimationType="None" EnableViewState="False" ShowCloseButton="true">
                                            <HeaderImage IconID="support_info_16x16">
                                            </HeaderImage>
                                            <ContentCollection>
                                                <dx:PopupControlContentControl ID="PopupControlContentControl8" runat="server">
                                                    <table style="width: 100%;">
                                                        <tr>
                                                            <td>
                                                                <dx:ASPxLabel ID="ASPxLabel4" runat="server" ClientInstanceName="lbAllChkSave" ForeColor="Green"
                                                                    Text="???????????????????????????????????????????????????.">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <hr />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <dx:ASPxButton ID="ASPxButton8" runat="server" Text="   ????????   " AutoPostBack="false"
                                                                    Width="80px">
                                                                    <ClientSideEvents Click="function(s,e){
                                                                                    //var NodeID = TextBoxIDTree.GetText();
                                                                                    //alert(NodeID);
                                                                                    //CalbackUserRight.PerformCallback();
                                                                                    PopupSaveComplete.Hide();
                                                                                  }" />
                                                                </dx:ASPxButton>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </dx:PopupControlContentControl>
                                            </ContentCollection>
                                        </dx:ASPxPopupControl>



         <script type="text/javascript">
             // <![CDATA[
             //var aspxPreviewImgSrc = getPreviewImageElement().src;
             var aspxPreviewImgSrc2 = getPreviewImageElement2().src;
             // ]]> 
                                </script>
        <script type="text/javascript">
            function CallAlert() {
                popupAlert.Show();
            }
        </script>
        <dx:ASPxPopupControl ID="popupAlert" runat="server" CloseAction="CloseButton" Modal="True"
            Width="500px" Height="100px" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
            ClientInstanceName="popupAlert" AllowDragging="True" HeaderText ="??????????????????????????????????."
            PopupAnimationType="None" EnableViewState="False" ShowCloseButton="true">
            <HeaderImage IconID="status_warning_32x32">
            </HeaderImage>
            <ContentCollection>
                <dx:PopupControlContentControl ID="PopupControlContentControl4" runat="server">
                    <table>
                        <tr>
                            <td>Test</td>
                        </tr>
                    </table>
                </dx:PopupControlContentControl>
            </ContentCollection>
            <Border BorderStyle="None" />
        </dx:ASPxPopupControl>
    </form>
</body>
</html>
