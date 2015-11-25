<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DateTimeEntry.ascx.cs" Inherits="ShilohWeb.Controls.DateTimeEntry" %>
<table>
    <tr>
        <td>
            <asp:TextBox ID="txtDate" runat="server" MaxLength="11" Width="75px" 
                BorderStyle="Solid" ReadOnly="True"></asp:TextBox>
        </td>
        <td>
            <asp:ImageButton ID="ibtnPopupCal" runat="server" Width="16px" Height="16px" 
                ImageUrl="~/Images/Calendar.png" onclick="ibtnPopupCal_Click" />
        </td>
        <td>
            <asp:DropDownList ID="ddlHour" runat="server">
                <asp:ListItem Selected="True" Text="1"></asp:ListItem>
                <asp:ListItem Text="2"></asp:ListItem>
                <asp:ListItem Text="3"></asp:ListItem>
                <asp:ListItem Text="4"></asp:ListItem>
                <asp:ListItem Text="5"></asp:ListItem>
                <asp:ListItem Text="6"></asp:ListItem>
                <asp:ListItem Text="7"></asp:ListItem>
                <asp:ListItem Text="8"></asp:ListItem>
                <asp:ListItem Text="9"></asp:ListItem>
                <asp:ListItem Text="10"></asp:ListItem>
                <asp:ListItem Text="11"></asp:ListItem>
                <asp:ListItem Text="12"></asp:ListItem>                
            </asp:DropDownList>
        </td>
        <td>            
            <asp:DropDownList ID="ddlMinute" runat="server">
                <asp:ListItem Selected="True" Text=":00" Value="0"></asp:ListItem>
                <asp:ListItem Text=":15" Value="15"></asp:ListItem>
                <asp:ListItem Text=":30" Value="30"></asp:ListItem>
                <asp:ListItem Text=":45" Value="45"></asp:ListItem>
            </asp:DropDownList>
        </td>
        <td>
            <asp:DropDownList ID="ddlMerdian" runat="server">
                <asp:ListItem Selected="True" Text="AM"></asp:ListItem>
                <asp:ListItem Selected="False" Text="PM"></asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
</table>

<asp:Panel ID="pnlCalendar" runat="server" Visible="false" CssClass="popupCalendar" HorizontalAlign="Center">
    <div style="border: 1px silver solid; padding: 5px; width: 200px; background-color: rgb(255,255,128);">
        <asp:Calendar ID="calPickDate" runat="server" BackColor="White" 
            BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
            Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" 
            Width="200px" onselectionchanged="calPickDate_SelectionChanged">
            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
            <SelectorStyle BackColor="#CCCCCC" />
            <WeekendDayStyle BackColor="#FFFFCC" />
            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
            <OtherMonthDayStyle ForeColor="#808080" />
            <NextPrevStyle VerticalAlign="Bottom" />
            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
        </asp:Calendar>
        <div>
            <asp:Button ID="btnCloseCal" runat="server" Text="Close" 
                onclick="btnCloseCal_Click" />
        </div>
    </div>
</asp:Panel>
