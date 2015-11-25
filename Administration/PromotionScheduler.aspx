<%@ Page Title="Shiloh Missionary Baptist Church - Promotion Scheduler" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="PromotionScheduler.aspx.cs" Inherits="ShilohWeb.Admimnistration.PromotionScheduler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="robots" content="all" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <div id="subjectHeading">
        <h1>Administration</h1>
        <ul>
            <li><a href="Home.aspx">Home</a></li>
            <li><a href="CommunityEntry.aspx">Communities</a></li>
            <li><a href="EventEntry.aspx">Events</a></li>
            <li><a href="MemberEntry.aspx">Members</a></li>
            <li class="current">Promotions</li>
        </ul>
    </div>
    <div class="defaultMargin">
    <h2>Promotion Scheduler</h2>
        <p>Add and update information to promote church events and activites on the website home page.</p>
        <div id="promotion">
            <img id="promoImage" src="~/Images/congregation.jpg" alt="Shiloh Congregation" />
            <h1 id="promoHeadline">Welcome to Shiloh</h1>
            <p id="promoCopy">Shiloh Missionary Baptist Church is a church where everybody is somebody and nobody is nobody; where love 
            is personified, humanity is amplified and God is glorified, worshipped and served.<br />
            We are a Gospel-driven church with a multicultural congregation who are determined to preach, teach and live
            the redeeming love of God to a lost, but changing world.</p>
            <a runat="server" id="promoLink" href="~/Home.aspx" title="Link to Promotion Page">Learn more...</a>
        </div>
        <div id="promotionEditor">
        </div>
    </div>
</asp:Content>
