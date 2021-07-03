<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="print_request_instal.aspx.cs" Inherits="DXWebTemplate.WebForm1" %>
<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="~/WebUserControl2.ascx" TagName="WebUserControl2" TagPrefix="WebUserControl2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WAC</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <WebUserControl2:WebUserControl2 runat="server"/>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    </div>
    </form>
</body>
</html>
