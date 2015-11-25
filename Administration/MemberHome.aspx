<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="MemberHome.aspx.cs" Inherits="ShilohWeb.Administration.MemberHome" %>
<%@ Register Src="/Controls/TabsAdmin.ascx" TagName="AdminTabs" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <uc1:admintabs id="ucAdminTabs" runat="server" selectedindex="2" selectedcssclass="current" />
    <div class="defaultMargin" style="height: 350px;">
        <h1>Member Maintenance</h1>
        This page is used to administrate church members online. Some of the tasks that can be accomplished are:
        <ul>
            <!-- <li><a href="Member_Entry.aspx" title="Enter a member ">Enter a New Member</a> </li>-->
            
            <li>Enter a New Member</li>
            <li>Show A List of Members</li>
        </ul>       
    </div>
</asp:Content>
