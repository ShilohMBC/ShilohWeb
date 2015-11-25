<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="MediaHome.aspx.cs" Inherits="ShilohWeb.Administration.MediaHome" %>
<%@ Register src="/Controls/TabsAdmin.ascx" tagname="AdminTabs" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">

<uc1:AdminTabs ID="ucAdminTabs" runat="server" SelectedIndex="4" SelectedCssClass="current" />

<div class="defaultMargin" style="height: 350px;">
    <h1>Media Maintenance</h1>
    This page is used to administrate the media on the 
    <a href="/PrayerMinistry/PrayerRequest.aspx">prayer request page</a> on the shiloh2000.com
    website.  Some of the tasks that can be accomplished are:
    <ul>
        <li>
            <a href="MediaEntry.aspx">Add New Media (video, audio etc.)</a>
        </li>
        <li>
            <a href="MediaList.aspx">List Media</a>
        </li>
    </ul>
    <br />    
</div>
</asp:Content>
