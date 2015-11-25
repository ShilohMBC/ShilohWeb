<%@ Page Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="ShilohWeb.MensMinistry.Gallery" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <h1>Men's Ministry</h1>
    <ul class="topicMenu">
        <li><a href="About.aspx">About</a></li>
        <li><a href="Calendar.aspx">Calendar</a></li>
        <li><a href="Newsletter.aspx">Newsletter</a></li>
        <li><a href="Programs.aspx">Programs</a></li>
        <li><a href="Membership.aspx">Members</a></li>
        <li><a href="#" class="current">Gallery</a></li>
    </ul>
    <h2>Men's Ministry Photo Gallery</h2>
    <p>[this would include captions and descriptions as desired with slideshow cpabilities. Possibly supported through Flckr]</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="formatting" runat="server">
</asp:Content>
