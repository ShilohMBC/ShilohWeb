<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="InfoLocation.aspx.cs" Inherits="ShilohWeb.InfoLocation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <h1>About Shiloh SMBC</h1>
    <ul class="topicMenu">
        <li><a href="History.aspx">Our History</a></li>
        <li><a href="Mission.aspx">Mission &amp; Beliefs</a></li>
        <li><a href="Pastor.aspx">Pastor &amp; Staff</a></li>
        <li><a href="InfoServices.aspx">Service Times</a></li>
        <li><a href="InfoLocation.aspx" class="current">Directions</a></li>
        <li><a href="ContactUs.aspx">Contact Us</a></li>
        <li>Broadcasts</li>
    </ul>
    <h2>Our Location</h2>

    <img src="images/shilohMap.gif" alt="Map to Shiloh" width="448" height="336"/>  	  
    <p>
        Shiloh Missionary Baptist Church<br />
        855 E. 20th Ave<br />
        Anchorage, Alaska 99501
    </p>                    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="formatting" runat="server">
</asp:Content>
