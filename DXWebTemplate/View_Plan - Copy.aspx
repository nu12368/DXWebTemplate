<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_Plan.aspx.cs" Inherits="DXWebTemplate.View_Plan" %>

<%@ Register Assembly="DevExpress.Dashboard.v16.1.Web, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxRichEdit.v16.1, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxRichEdit" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v16.1.Web, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v16.1, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="Styles/Scrollbar.css" />
  <%--  <meta http-equiv="refresh" content="3" >--%>
    <script type="text/javascript" src="Scripts/jquery-1.11.3.js"></script>
    <%--<link rel="stylesheet" href="Styles/Scrollbar.css" />--%>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.css'>

      <link rel="stylesheet" href="css/style.css">
    <style>
    .bg
        {
            /* The image used */
            background-image: url("BackgroundImg/plan3.jpg"); /* Full height */
            height: 100%; /* Center and scale the image nicely  style="background-image:url(EasyImage/3.jpg);" */
             width:100%;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
        .auto-style1 {
            width: 489px;
        }
        .auto-style2 {
            width: 489px;
            height: 18px;
        }
        .auto-style3 {
            height: 18px;
        }
        .Label {
            font-size:30px;
            color:#0094ff;
        }
        </style>
    <script type="text/javascript">
        $(document).ready(function () {
            AdjustSize();
        });
        //function OnInit(s, e) {
        //    AdjustSize();
        //}
        //function OnEndCallback(s, e) {
        //    AdjustSize();
        //}
        //function OnControlsInitialized(s, e) {
        //    ASPxClientUtils.AttachEventToElement(window, "resize", function (evt) {
        //        AdjustSize();
        //    });
        //}
        function AdjustSize() {
            var height = Math.max(0, document.documentElement.clientHeight);
            //var divG = $('#divGrid').height(); //$("#divGrid").height;
            //alert(height);
            //RichEdit.SetHeight(height-18);
            var paneContent = ASPxSplitter1.GetPaneByName('pnGraph1');
            //alert(123);
            //WebChartControl1.SetWidth(500);

            //WebChartControl1.SetWidth(document.body.offsetWidth);
            //alert(111);
            //alert(paneContent.GetClientHeight());
            // splitter.GetPane(0).maxSize
            //paneContent.SetContentUrl("edit_profile.aspx");
            //paneContent.RefreshContentUrl();
        }

        var splitterHeight;
        function OnPaneExpanded(s, e) {
            //&& splitterHeight
            if (e.pane.name == "pnGraph1") {
                alert("ขยาย" + s.GetHeight());
                //WebChartControl1.SetHeight("533px");

                WebChartControl1.style.width = 500;
                alert(22);
                //var h = s.GetPaneByName("pnGraph1").GetClientHeight();
                //alert(h);
                //s.SetHeight(splitterHeight);
                //splitterHeight = null;
            }
        }
        function OnPaneCollapsed(s, e) {
            if (e.pane.name == "pnGraph1") {
                //splitterHeight = s.GetHeight();
                //var h = s.GetPaneByName("pnGraph2").GetClientHeight();
                alert("หุบ" + s.GetHeight());
                //s.SetHeight(s.GetPaneByName("pnGraph1").GetClientHeight());
            }
        }


        function edit_sub(SubjGroupID) {
            txtSubjGroupID.SetText(SubjGroupID);
            callbackPanel.PerformCallback('AddSub@' + SubjGroupID);
        }
    </script>
</head>

     

<body>
      <link href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <form id="form1" runat="server">

        <%--<dx:ASPxRichEdit ID="RichEdit" ClientInstanceName="RichEdit" ShowConfirmOnLosingChanges="false" runat="server" WorkDirectory="~\App_Data\WorkDirectory" RibbonMode="None" Width="100%">
           
            <Settings>
                <Behavior FullScreen="Enabled" />
                <HorizontalRuler Visibility="Hidden" />
            </Settings>
            <Border BorderStyle="None" />
        </dx:ASPxRichEdit>--%>
        <%--ondashboardloading="ASPxDashboardViewer1_DashboardLoading" --%>



        <dx:ASPxSplitter ID="ASPxSplitter1" runat="server" ClientInstanceName="ASPxSplitter1" Height="100%" Width="100%" FullscreenMode="True">
            <ClientSideEvents PaneExpanded="OnPaneExpanded" PaneCollapsed="OnPaneCollapsed" />
            <Panes>
 
                <dx:SplitterPane ShowCollapseForwardButton="False" AllowResize="False" ShowCollapseBackwardButton="False" ShowSeparatorImage="False">
                    <Panes>
                        <dx:SplitterPane ShowCollapseBackwardButton="False" AllowResize="False" ScrollBars="Auto" ShowCollapseForwardButton="False" ShowSeparatorImage="False">
                            <PaneStyle>
                                <BorderLeft BorderStyle="Solid" BorderWidth="1px" />
                                <BorderTop BorderStyle="None" />
                                <BorderRight BorderStyle="None" />
                                <BorderBottom BorderStyle="Solid" BorderWidth="1px" />
                            </PaneStyle>
                            <ContentCollection>
                                <dx:SplitterContentControl ID="SplitterContentControl2" runat="server">
                                    <table class="bg" border="1" >
                                        <tr>
                                          
                                            <td  >
                                               <dx:ASPxPopupControl ID="pcLogin" runat="server" Width="320" CloseAction="CloseButton" CloseOnEscape="true" Modal="True"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="pcLogin"
        HeaderText="Login" AllowDragging="True" PopupAnimationType="None" EnableViewState="False" AutoUpdatePosition="true">
        <ClientSideEvents PopUp="function(s, e) { ASPxClientEdit.ClearGroup('entryGroup'); tbLogin.Focus(); }" />
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxPanel ID="Panel1" runat="server" DefaultButton="btOK">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <dx:ASPxFormLayout runat="server" ID="ASPxFormLayout1" Width="100%" Height="100%">
                                <Items>
                                    <dx:LayoutItem Caption="Username">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxTextBox ID="tbLogin" runat="server" Width="100%" ClientInstanceName="tbLogin">
                                                    <ValidationSettings EnableCustomValidation="True" ValidationGroup="entryGroup" SetFocusOnError="True"
                                                        ErrorDisplayMode="Text" ErrorTextPosition="Bottom" CausesValidation="True">
                                                        <RequiredField ErrorText="Username required" IsRequired="True" />
                                                        <RegularExpression ErrorText="Login required" />
                                                        <ErrorFrameStyle Font-Size="10px">
                                                            <ErrorTextPaddings PaddingLeft="0px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Password">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxTextBox ID="tbPassword" runat="server" Width="100%" Password="True">
                                                    <ValidationSettings EnableCustomValidation="True" ValidationGroup="entryGroup" SetFocusOnError="True"
                                                        ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                        <RequiredField ErrorText="Password required" IsRequired="True" />
                                                        <ErrorFrameStyle Font-Size="10px">
                                                            <ErrorTextPaddings PaddingLeft="0px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxCheckBox ID="chbRemember" runat="server" Text="Remember me">
                                                </dx:ASPxCheckBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem ShowCaption="False" Paddings-PaddingTop="19">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxButton ID="btOK" runat="server" Text="OK" Width="80px" AutoPostBack="False" Style="float: left; margin-right: 8px">
                                                    <ClientSideEvents Click="function(s, e) { if(ASPxClientEdit.ValidateGroup('entryGroup')) pcLogin.Hide(); }" />
                                                </dx:ASPxButton>
                                                <dx:ASPxButton ID="btCancel" runat="server" Text="Cancel" Width="80px" AutoPostBack="False" Style="float: left; margin-right: 8px">
                                                    <ClientSideEvents Click="function(s, e) { pcLogin.Hide(); }" />
                                                </dx:ASPxButton>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>

<Paddings PaddingTop="19px"></Paddings>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:ASPxFormLayout>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
                <div>
                    <a href="javascript:ShowCreateAccountWindow();" id="hl1" style="float: right; margin: 14px 0 10px 0;">Create Account</a>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
        <ContentStyle>
            <Paddings PaddingBottom="5px" />
        </ContentStyle>
    </dx:ASPxPopupControl>
                                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="view" />
                                                 
                                                               <asp:Label ID="B1" CssClass="Label" runat="server" Text=""></asp:Label>
                                            </td>
                                            
                                            <td >
                                                  <button type="button" class="btn btn-info">view</button>
                                              <asp:Label ID="B2" runat="server" CssClass="Label" Text=""></asp:Label>
                                            </td>
                                        </tr>
                                  
                                        <tr>
                                       
                                            <td  >
                                                  <button type="button" class="btn btn-info">view</button>
                                                            <asp:Label ID="B3" runat="server" CssClass="Label" Text=""></asp:Label>
                                         
                                            </td>
                                                
                                            <td>
                                                  <button type="button" class="btn btn-info">view</button>
                                                <asp:Label ID="B4" runat="server" CssClass="Label" Text=""></asp:Label>
                                            </td>
                                           
                                        </tr>

                                    </table>




                                   
        





                                  
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
                                   <%-- <dx:ASPxGridView Border-BorderWidth="1px" ID="GridView" runat="server" AutoGenerateColumns="False"
                                        ClientInstanceName="GridView" Width="100%" KeyFieldName="Subj_ID">


                                        <SettingsSearchPanel Visible="true" />
                                        <SettingsBehavior EnableRowHotTrack="True" AllowFocusedRow="true" />
                                        <SettingsPager Mode="ShowAllRecords">
                                        </SettingsPager>

                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="กลุ่มสาระ" FieldName="SubjGroup_Name" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <CellStyle HorizontalAlign="Left">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="วิชา (รหัส)" FieldName="Subj_Name" ShowInCustomizationForm="True" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="ระดับชั้น" FieldName="ClassRoom_Level" ShowInCustomizationForm="True" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>

                                        <Styles>
                                            <Header HorizontalAlign="Center">
                                            </Header>
                                            <AlternatingRow Enabled="True">
                                            </AlternatingRow>
                                        </Styles>

                                        <Border BorderWidth="1px"></Border>
                                    </dx:ASPxGridView>--%>



                                </dx:SplitterContentControl>
                            </ContentCollection>
                        </dx:SplitterPane>



<%--                        <dx:SplitterPane AllowResize="False" ShowCollapseForwardButton="False" ShowCollapseBackwardButton="False" ShowSeparatorImage="False">
                            <PaneStyle>
                                <BorderLeft BorderStyle="Solid" BorderWidth="1px" />
                                <BorderTop BorderStyle="Solid" BorderWidth="1px" />
                                <BorderRight BorderStyle="None" />
                                <BorderBottom BorderStyle="None" />
                            </PaneStyle>
                            <ContentCollection>
                                <dx:SplitterContentControl ID="SplitterContentControl3" runat="server">
                                 
                                </dx:SplitterContentControl>
                            </ContentCollection>
                        </dx:SplitterPane>--%>
                    </Panes>
                    <ContentCollection>
                        <dx:SplitterContentControl runat="server"></dx:SplitterContentControl>
                    </ContentCollection>
                </dx:SplitterPane>
            </Panes>
        </dx:ASPxSplitter>










    </form>
</body>
</html>