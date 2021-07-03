<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main_group.aspx.cs" Inherits="DXWebTemplate.main_group" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WAC</title>
    <script type="text/javascript">
        function CallStyle(chk, ctrl) {
            if (chk == 1) {
                document.getElementById("tb" + ctrl).bgColor = '#FFFFFF'
                document.getElementById("td" + ctrl).style.textDecoration = "underline";
            } else {
                document.getElementById("tb" + ctrl).bgColor = 'transparent'
                document.getElementById("td" + ctrl).style.textDecoration = "none";
            }

        }

        function CallSubject(GroupID, GroupName) {
            //alert(GroupID);
            window.open("view_menu.aspx?gid=" + GroupID + "&gName=" + GroupName, "contentUrlPane")

            /* var paneContent = ASPxSplitter1.GetPaneByName('SpContent');
             if (GroupID == "0") {
                 alert(55);
                 paneContent.SetContentUrl("main_group.aspx");
                 paneContent.RefreshContentUrl();
             }
 
            
 
             
             */
        }
    </script>


</head>
<body>
    <form id="form1" runat="server">
      
        <div>
            <dx:ASPxDataView ID="DataView" ClientInstanceName="DataView" ContentStyle-BackColor="White" runat="server"
                Width="100%" PagerAlign="Justify" Border-BorderStyle="None"  ItemSpacing="4px" Paddings-Padding="0" BackColor="White">
                <SettingsTableLayout ColumnCount="8" RowsPerPage="5" />

                <Paddings Padding="0px"></Paddings>

                <ContentStyle Border-BorderStyle="None">
                </ContentStyle>

                <ItemStyle Height="50px" BackColor="White" Border-BorderStyle="None">
                    <Paddings PaddingTop="20px" PaddingBottom="5px"></Paddings>
                </ItemStyle>
                <ItemTemplate>
                    <%--height: 1px; margin-top: -40px; margin-left: -50px; margin-right: -50px; margin-bottom: -50px;--%>
                    <table style="width: 137px; height: 1px; margin-top: 1px; margin-left: -50px; margin-right: -50px; margin-bottom: -50px;"
                        onmouseover="CallStyle('1','<%# Eval("username") %>')"
                        onmouseout="CallStyle('2','<%# Eval("password") %>')">
                        <tr>
                            <td></td>
                            <td style="width: 100%; text-align: center; cursor: pointer" onclick="CallSubject('<%# Eval("username") %>','<%# Eval("password") %>');">
                                <table id="tb<%# Eval("username") %>"
                                    style="margin-left: auto; margin-right: auto; text-align: center">
                                    <tr>
                                        <td>
                                            <dx:ASPxImage ID="imgCover" runat="server" ImageUrl="~/images/folder.png"
                                                Width="50px" Height="50px" ShowLoadingImage="false">
                                            </dx:ASPxImage>

                                        </td>
                                    </tr>
                                </table>

                            </td>
                        </tr>
                        <tr>

                            <td id="td<%# Eval("username") %>" onclick="CallSubject('<%# Eval("username") %>','<%# Eval("password") %>');" colspan="2" style="width: 100%; text-align: center; cursor: pointer;">
                               
                                 <dx:ASPxLabel  ID="lbName" runat="server" Text='<%# Eval("password") %>'></dx:ASPxLabel>                                                                             
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <PagerSettings ShowNumericButtons="false" EllipsisMode="InsideNumeric" SEOFriendly="Enabled">
                </PagerSettings>

                <Border BorderStyle="None"></Border>
            </dx:ASPxDataView>
        </div>
    </form>
</body>
</html>

