<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="PrayerRequestHome.aspx.cs" Inherits="ShilohWeb.Administration.PrayerRequestHome" %>
<%@ Register src="/Controls/TabsAdmin.ascx" tagname="AdminTabs" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">

<uc1:AdminTabs ID="ucAdminTabs" runat="server" SelectedIndex="3" SelectedCssClass="current" />

<div class="defaultMargin" style="height: 350px;">
    <h1>Prayer Request Maintenance</h1>
    This page is used to administrate the prayer request that are entered the 
    <a href="/PrayerMinistry/PrayerRequest.aspx">prayer request page</a> on the shiloh2000.com
    website.  Some of the tasks that can be accomplished are:
    <ul>
        <li>
            <a href="PrayerRequestList.aspx">Prayer Requests</a>
        </li>
        <li>
            Print Prayer Requests
        </li>
    </ul>
    <br />    
</div>
</asp:Content>
