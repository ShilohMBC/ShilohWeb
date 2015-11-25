<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="WebConferencing.aspx.cs" Inherits="ShilohWeb.AboutUs.WebConferencing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
<div id="subjectHeading">
    <h1>About Us</h1>
    <ul>
        <li><a href="WorshipServices.aspx">Worship Services</a></li>
        <li>Mission &amp; Beliefs</li>
        <li><a href="PastorStaff.aspx">Pastor &amp; Staff</a></li>
        <li><a href="OurHistory.aspx">Our History</a></li>
        <li class="current"><a href="WebConferencing.aspx">Web Conferencing</a></li>
    </ul>
</div>

<div class="defaultMargin">
<h2>Shiloh Online Web Conferencing</h2>

<dl>
    <dt>Discontinued</dt>
    <dd>
        Our online web conferencing has been discontinued. Please contact the church for alternative methods
        for online conferencing.  
    </dd>
    
</dl>

<h2>Diaconate Signin</h2>
<div class="defaultMargin">
    Looking for the Diaconate Parish Managment system?  
    <a href="https://diakonate.shiloh2000.net/" target="diaconateSystem" title="Diaconate Online Application">Click here</a> to sign-in.
</div>
<br />
</div>

</asp:Content>
