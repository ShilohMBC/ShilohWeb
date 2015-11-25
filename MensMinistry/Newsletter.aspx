<%@ Page Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="Newsletter.aspx.cs" Inherits="ShilohWeb.MensMinistry.Newsletter" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <h1>Men's Ministry</h1>
    <ul class="topicMenu">
        <li><a href="About.aspx">About</a></li>
        <li><a href="Calendar.aspx">Calendar</a></li>
        <li><a href="#" class="current">Newsletter</a></li>
        <li><a href="Programs.aspx">Programs</a></li>
        <li><a href="Membership.aspx">Members</a></li>
        <li><a href="Gallery.aspx">Gallery</a></li>
    </ul>
    <h2>Men's Ministry Newsletter: <i>My Brother's Keeper</i></h2>
    <p>[this would include the current newsletter with links to prior/archived versions. This might be supported through a Blog or Wiki package.</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="formatting" runat="server">
</asp:Content>
