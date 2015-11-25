<%@ Page Title="Shiloh - Current Events" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="CurrentEvents.aspx.cs" Inherits="ShilohWeb.CurrentEvents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <div id="subjectHeading">
        <h1>Event Calendar</h1>
        <ul>
            <li class="current">Current Events</li>            
            <li><a href="/Calendar.aspx">Shiloh Events</a></li>        
        </ul>
    </div>
    
    <div class="defaultMargin prayerRequest">
        <h2>Current Special Events</h2>
        <p>
            We list our current special events on this page.  Come here, periodically, to see what is happening
            at Shiloh.
        </p>
        <h1>Upcoming Special Event</h1>
        
        <div style="text-align: center; position: relative;padding-bottom: 25px;">		            

            <img src="/Images/specialEvent.png" alt="Shiloh's Current Special Event" style="width: 730px; height: 850px;border: 1px solid silver;" />
        </div>
        <div>
            
        </div>
    </div>
    
</asp:Content>
