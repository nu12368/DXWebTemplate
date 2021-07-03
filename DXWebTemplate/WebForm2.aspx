<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="DXWebTemplate.WebForm2" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.XtraReports.v16.1.Web, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<%@ Register Src="~/WebUserControl1.ascx" TagName="WebUserControl1" TagPrefix="WebUserControl1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
                <dx:ASPxCallbackPanel ID="CallbackReport" runat="server" ClientInstanceName="CallbackReport" Width="100%">
                <PanelCollection>
                    <dx:PanelContent>
                        <div style="margin-top: 5px;">
                            <dx:ASPxDocumentViewer ID="ASPxDocumentViewer1" Visible="false" runat="server"></dx:ASPxDocumentViewer>

                        </div>


                    </dx:PanelContent>
                </PanelCollection>

            </dx:ASPxCallbackPanel>
         <WebUserControl1:WebUserControl1 runat="server"/>
    </div>
    </form>
</body>
</html>
