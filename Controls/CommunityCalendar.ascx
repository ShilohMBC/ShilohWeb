<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommunityCalendar.ascx.cs" Inherits="ShilohWeb.Controls.CommunityCalendar" %>

<!-- Uses the built in ASP Calendar to display activities for a gievn day for a selected community. -->
<asp:Calendar runat="server" ID="communityCalendar" ForeColor="Black" BackColor="AntiqueWhite" onselectionchanged="communityCalendar_SelectionChanged" />