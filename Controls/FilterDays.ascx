<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FilterDays.ascx.cs" Inherits="ShilohWeb.Controls.FilterDays" %>
<table style="padding: 3px 5px 3px 5px; width: 165px; border: 1px solid silver; vertical-align: middle; text-align: center;">
    <tr>
        <td style="font-size: 8pt; font-weight: bold; font-family: Arial;">
            Filter:
        </td>
        <td>
            <asp:DropDownList ID="ddlFilter" runat="server" OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged" AutoPostBack="true">
                <asp:ListItem Text="All" Value="0"></asp:ListItem>
                <asp:ListItem Selected="True" Text="Last 30 Days" Value="1"></asp:ListItem>
                <asp:ListItem Text="Last Month" Value="2"></asp:ListItem>
                <asp:ListItem Text="Last Quarter" Value="3"></asp:ListItem>
                <asp:ListItem Text="Last Year" Value="4"></asp:ListItem>
                <asp:ListItem Text="This Month" Value="5"></asp:ListItem>
                <asp:ListItem Text="This Quarter" Value="6"></asp:ListItem>
                <asp:ListItem Text="Year To Date" Value="7"></asp:ListItem>
            </asp:DropDownList>        
        </td>
    </tr>
</table>

