<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="print_approve_request.aspx.cs" Inherits="DXWebTemplate.print_approve_request" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="~/WebUserControl3.ascx" TagName="WebUserControl3" TagPrefix="WebUserControl3" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WAC</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <WebUserControl3:WebUserControl3 runat="server"/>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    </div>
    </form>
</body>
</html>
