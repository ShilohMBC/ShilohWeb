<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="EventsHome.aspx.cs" Inherits="ShilohWeb.Administration.EventsHome" %>
<%@ Register src="/Controls/TabsAdmin.ascx" tagname="AdminTabs" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">

<uc1:AdminTabs ID="ucAdminTabs" runat="server" SelectedIndex="1" SelectedCssClass="current" />     

<div class="defaultMargin" style="height: 350px;">
    <h1>Calendar Event Maintenance</h1>
    This page is used to administrate the calendar events that are listed on the shiloh2000.com
    website.  Some of the tasks that can be accomplished are:
    <ul>
        <li>
            <a href="EventEntry.aspx" title="Enter a calendar event">Enter a New Calendar Event</a>
        </li>
        <li>
            <a href="EventsList.aspx" title="Show a List of Calendar events">Show A List of Calendar Events</a>
        </li>
    </ul>
    
    All events will appear on the <a href="/Calendar.aspx" title="calendar page">calendar page</a>
    and the home page of the website.            
</div>

</asp:Content>
