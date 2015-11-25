<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FilterMonthYear.ascx.cs" Inherits="ShilohWeb.Controls.FilterMonthYear" %>
    <table style="padding: 3px 5px 3px 5px; width: 185px; border: 1px solid silver; vertical-align: middle;">
        <tr>
            <td style="font-size: 8pt; font-weight: bold; font-family: Arial;">Filter: </td>
            <td>
                <asp:DropDownList ID="ddlFilterMonth" runat="server">
                    <asp:ListItem Text="Jan" Value="1" Selected="true"></asp:ListItem>
                    <asp:ListItem Text="Feb" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Mar" Value="3"></asp:ListItem>
                    <asp:ListItem Text="Apr" Value="4"></asp:ListItem>
                    <asp:ListItem Text="May" Value="5"></asp:ListItem>
                    <asp:ListItem Text="Jun" Value="6"></asp:ListItem>
                    <asp:ListItem Text="Jul" Value="7"></asp:ListItem>
                    <asp:ListItem Text="Aug" Value="8"></asp:ListItem>
                    <asp:ListItem Text="Sep" Value="9"></asp:ListItem>
                    <asp:ListItem Text="Oct" Value="10"></asp:ListItem>
                    <asp:ListItem Text="Nov" Value="11"></asp:ListItem>
                    <asp:ListItem Text="Dec" Value="12"></asp:ListItem>            
                </asp:DropDownList>
            </td>
            <td>
                <asp:DropDownList ID="ddlFilterYear" runat="server">
                </asp:DropDownList>                
            </td>
            
            <td>
               <asp:ImageButton ID="ibtnFilter" ImageUrl="~/Images/Refresh24x24.png" 
                    AlternateText="Refresh" ToolTip="Refresh" runat="server" BorderStyle="None" 
                    ImageAlign="AbsMiddle" onclick="ibtnFilter_Click" />            
            </td>
        </tr>
    </table>