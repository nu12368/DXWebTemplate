<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebUserControl2.ascx.cs" Inherits="DXWebTemplate.WebUserControl2" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register Assembly="DevExpress.XtraReports.v16.1.Web, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>



  <meta charset="UTF-8"/>
  <meta name="description" content="Free Web tutorials"/>
  <meta name="keywords" content="HTML,CSS,XML,JavaScript"/>
  <meta name="author" content="John Doe"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>


   <script type="text/javascript">
       function init(s) {
           var createFrameElement = s.viewer.printHelper.createFrameElement;
           s.viewer.printHelper.createFrameElement = function (name) {
               var frameElement = createFrameElement.call(this, name);
               var isChrome = /Chrome/.test(navigator.userAgent) && /Google Inc/.test(navigator.vendor);
               if (isChrome) {
                   frameElement.addEventListener("load", function (e) {
                       if (frameElement.contentDocument && frameElement.contentDocument.contentType !== "text/html")
                           frameElement.contentWindow.print();
                   });
               }
               return frameElement;
           }
       }
    </script>

<dx:ASPxDocumentViewer ID="ASPxDocumentViewer1"  runat="server" ReportTypeName="DXWebTemplate.print_request_instal">
    <ClientSideEvents Init="init" />
</dx:ASPxDocumentViewer>

