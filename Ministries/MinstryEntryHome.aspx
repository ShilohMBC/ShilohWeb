<%@ Page Title="Ministry Entry Home" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="MinstryEntryHome.aspx.cs" Inherits="ShilohWeb.Ministries.MinstryEntryHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
	<div id="subjectHeading">
		<h1>Ministry Entry Home</h1><ul>
			<li class="current">Home</li>
			<li><a href="MinistryEntry.aspx" title="Ministry Info Entry">Ministry Entry</a></li>
		</ul>
	</div>
	<div style="height: 500px; margin-left: 10px;">
		Please select an option:
		
		<ul>
			<li><a href="MinistryEntry.aspx" title="Ministry Info Submission">Submit Ministry Information</a></li>
		</ul>
	</div>
</asp:Content>
