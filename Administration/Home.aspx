<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ShilohWeb.Administration.Home" RequireSSL="false" %>
<%@ Register src="/Controls/TabsAdmin.ascx" tagname="AdminTabs" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">

<uc1:AdminTabs ID="ucAdminTabs" runat="server" SelectedIndex="0" SelectedCssClass="current" /> 

<div class="defaultMargin">
    <h2>Administrative Home</h2>
    <div>
        This is the home page for the administrative maintenance of the Shiloh2000.com website. 
        Here you can perform the following tasks:        
    </div>
    
    <div style="width: 400px; float:left;">
        <h1>Events</h1>
        <ul>
            <li>
                <a href="EventEntry.aspx" title="Enter a calendar event">Enter a Calendar Event</a>
            </li>
            <li>
                <a href="EventsList.aspx" title="Show Calendar events">Show Calendar Events</a>
            </li>
        </ul>
    </div>    
    
    <div style="width: 400px; float: left;">
        <h1>Media</h1>
        <ul>
            <li>
                <a href="MediaEntry.aspx">Add New Media (video, audio etc.)</a>
            </li>
            <li>
                <a href="MediaList.aspx">List Media</a>
            </li>
        </ul>
    </div>

    <div style="width: 400px; float: left;">
        <h1>Members</h1><ul>
            <!--
            <li><a href="Member_Entry.aspx?" title="Create a member">Create a new Member</a></li>
            <li><a href="MemberSearch.aspx" title="Lookup a member">Search For a Member</a></li>
            -->
            <li>Create a new Member</li>
            <li>Search For a Member</li>
        </ul>
    </div>
    
    <div style="width: 400px; float: left;">
        <h1>Prayer Requests</h1>
        <ul>
            <li>
                <a href="PrayerRequestList.aspx" title="List Prayer Requests">List Prayer Requests</a>
            </li>
            <li>
                Print Prayer Requests
            </li>
        </ul>        
    </div>
    
</div>
</asp:Content>
