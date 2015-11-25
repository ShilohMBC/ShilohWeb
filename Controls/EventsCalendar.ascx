<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EventsCalendar.ascx.cs" Inherits="ShilohWeb.Controls.EventsCalendar" %>
<div class="calendar">
    <asp:Calendar ID="eventCalendar" runat="server" height="16.0em" Width="16.0em" 
        SelectionMode="None" ShowDayHeader="false"
        BorderStyle="None" ShowGridLines="true"
        TitleStyle-BackColor="Transparent" TitleStyle-BorderStyle="None" TitleStyle-Height="1.0em"
        TitleStyle-Font-Bold="true" TitleStyle-Font-Size="1.1em" TitleStyle-ForeColor="#8f8474"
        DayStyle-BorderColor="#dfdcd8"
        DayStyle-Font-Underline="false" DayStyle-HorizontalAlign="Right" DayStyle-VerticalAlign="Top"
        DayStyle-Font-Bold="true" DayStyle-Font-Size="0.75em"
        OtherMonthDayStyle-ForeColor="#bab4aa" TodayDayStyle-ForeColor="#bb9999" 
        ondayrender="eventCalendar_DayRender" onload="eventCalendar_Load" 
        onvisiblemonthchanged="eventCalendar_VisibleMonthChanged" 
        onselectionchanged="eventCalendar_SelectionChanged">
    </asp:Calendar>
</div>

