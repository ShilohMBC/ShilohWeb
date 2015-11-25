<%@ Page Title="Shiloh Missionary Baptist Church - Home" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ShilohWeb.Home" %>

<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<meta name="robots" content="all" />    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <div id="promotion">
        <asp:ScriptManager ID="promotionScriptManager" runat="server">
        </asp:ScriptManager>
        <div class="right twoColumn">
            <img runat="server" id="promoImage" src="~/Images/congregation.png" alt="Shiloh Congregation" />
        </div>
        <h1 id="promoHeadline">A Place to Call Home</h1>
        <p id="promoCopy">
            Shiloh Missionary Baptist Church is a church where everybody is somebody and nobody is nobody; where love 
            is personified, humanity is amplified and God is glorified, worshipped and served.
        </p>
        <a runat="server" id="promoLink" href="~/Home.aspx" title="Link to Promotion Page">Learn more...</a>
    </div>
    <div class="right twoColumn">
        <div class="subjectBlock">
            <img class="left" src="Images/pulpitCross.png" alt="Services Image" />
            <div class="left">
                <h1>Sunday Services</h1>
                <p>8:00 AM - Traditional</p>
                <p>9:45 AM - Sunday School</p>
                <p>11:00 AM - Contemporary</p>
            </div>
            <div class="left">
                <h1>Wednesday Night Prayer</h1>
                <p>6:30 PM - Prayer</p>
                <h1>Wednesday Bible Study</h1>
                <p>7:00 PM - Bible Study</p>
            </div>
            <a runat="server" href="~/AboutUs/WorshipServices.aspx" title="Worship Services Details" />
        </div>
        <div class="subjectBlock">
            <img id="Img1"src="Images/reverendPatterson.png" alt="Pastor's Image" />
            <h1>Welcome to Shiloh</h1>
            <p>Our doors are open wide to everyone, and our hearts shut to no one seeking to find a safe place for spiritual life, growth and fellowship.</p>
            <span class="right"><cite>Reverend Alonso Patterson</cite></span>
            <a runat="server" href="~/AboutUs/Mission.aspx" title="Mission and Beliefs Details" />
        </div>
        <div class="subjectBlock">
            <img id="Img2"src="Images/choirPerformance.png" alt="Shiloh Choir Image" />
            <h1>Watch, Listen, Read</h1>
            <p>Shiloh worship services are broadcast Saturday and Sunday at 9:00 am on KYES, Channel 5. You can also see podcasts and transcripts of pastor sermons and performances online.</p>
            <a runat="server" href="~/Media/MediaDirectory.aspx" title="Media Details" />
        </div>
        <div class="subjectBlock">
            <img id="Img3"src="Images/anchorageAK.png" alt="Anchroage Skyline Image" />
            <h1>Share Your Gifts</h1>
            <p>The ministries at Shiloh help enrich the Church, the congregation, and the community. You can make a diference by participating in minitry programs and activities.</p>
            <a runat="server" href="~/Ministries.aspx" title="Church Ministry Directory" />
        </div>
    </div>
    <div class="right oneColumn">
        <h1 class="eventDate">Sunday, November 1</h1>
        <div class="vevent">
            <abbr class="dtstart" title="2009-11-01T08:45-0700">8:45 AM</abbr>
            <h2 class="summary">Traditional Service</h2>
            <p class="organizer">Reverend Patterson</p>
            <a runat="server" href="#" class="url" title="Activity:Traditional Services Details" />
        </div>
        <div class="vevent">
            <abbr class="dtstart" title="2009-11-01T09:45-0700">9:45 AM</abbr>
            <h2 class="summary">Church School</h2>
            <p class="organizer">Children's Ministry</p>
            <a id="A1" runat="server" href="#" class="url" title="Activity: Church School Details" />
        </div>
        <div class="vevent">
            <abbr class="dtstart" title="2009-11-01T11:00-0700">11:00 AM</abbr>
            <h2 class="summary">Contemporary Service</h2>
            <p class="organizer">Reverend Patterson</p>
            <a id="A2" runat="server" href="#" class="url" title="Activity: Contemporary Services Details" />
        </div>
        <h1 class="eventDate">Wednesday, November 4</h1>
        <div class="vevent">
            <abbr class="dtstart" title="2009-11-04T18:45-0700">6:45 PM</abbr>
            <h2 class="summary">Bible Study</h2>
            <p class="organizer">Reverend Patterson</p>
            <a id="A3" runat="server" href="#" class="url" title="Activity: Bible Study Details" />
        </div>
        <h1 class="eventDate">Sunday, November 8</h1>
        <div class="vevent">
            <abbr class="dtstart" title="2009-11-08T18:45-0700">8:45 AM</abbr>
            <h2 class="summary">Traditional Service</h2>
            <p class="organizer">Reverend Patterson</p>
            <a id="A4" runat="server" href="#" class="url" title="Activity:Traditional Services Details" />
        </div>
        <h1 class="eventDate"><a runat="server" href="#" title="Activity: Show all activities">See all Shiloh Events...</a></h1>

<!--            <asp:Repeater ID="activityList" runat="server">
            <HeaderTemplate><ul></HeaderTemplate>
            <ItemTemplate>
                <li>
                    <!-- The date should not appear of the prior date was the same. -- >
                    <b>Date</b><br />
                    <em>Time</em><br />
                    <strong>Event Name</strong><br />
                    <i>Host</i>
                </li>
            </ItemTemplate>
            <FooterTemplate>
                    <li><a runat="server" href="~/Calendar.aspx" title="See all Church Community Events">See All Shiloh Events...</a></li>
                </ul>
            </FooterTemplate>
        </asp:Repeater>
-->        
    </div>
    <div class="left twoColumn">
        <div class="calendar">
            <asp:Calendar ID="eventCalendar" runat="server" height="14.0em" Width="15.0em" SelectionMode="Day" ShowDayHeader="false"
                BorderStyle="None" ShowGridLines="true"
                TitleStyle-BackColor="Transparent" TitleStyle-BorderStyle="None" TitleStyle-Height="1.0em"
                TitleStyle-Font-Bold="true" TitleStyle-Font-Size="1.1em" TitleStyle-ForeColor="#8f8474"
                DayStyle-BorderColor="#dfdcd8"
                DayStyle-Font-Underline="false" DayStyle-HorizontalAlign="Right" DayStyle-VerticalAlign="Top"
                DayStyle-Font-Bold="true" DayStyle-Font-Size="0.75em"
                OtherMonthDayStyle-ForeColor="#bab4aa" TodayDayStyle-ForeColor="#bb9999">
            </asp:Calendar>
        </div>
        <!-- Hide current sermon series: theseare meant to be activities
        <div class="sermonSeries">        
            <h1>Current Sermon Series</h1>
            <p>
                <em>Traditional Service Sermon</em>
                <a id="A25" runat="server" href="~/AboutUs/WorshipServices.aspx" class="url" title="Activity:Traditional Services Details"/>
            </p>
            <p>
                <em>Conteporary Service Sermon</em>
                <a id="A26" runat="server" href="~/AboutUs/WorshipServices.aspx" class="url" title="Activity:Contemporary Services Details"/>
            </p>
        </div>
        -->
    </div>
    <asp:SqlDataSource ID="TopActivitesDataSource" runat="server"></asp:SqlDataSource>
    <asp:SqlDataSource ID="PromotionsDataSource" runat="server"></asp:SqlDataSource>   
</asp:Content>