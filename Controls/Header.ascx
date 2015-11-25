<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="ShilohWeb.Controls.Header" %>
<%@ Register src="Login.ascx" tagname="Login" tagprefix="uc1" %>
<!-- Identity Banner: branding through logo, access to secure site features. -->
<div id="identity">
    <img runat="server" src="/Images/bannerBackground.png" alt="Shiloh Missionary Baptist Church Home" />
    <a runat="server" class="logo" href="/Default.aspx" title="Shiloh Home"><img runat="server" src="/Images/ShilohLogo.gif" alt="Shiloh Homepage" /></a>
    <a runat="server" class="location" href="/AboutUs/WorshipServices.aspx">855 E. 20th Ave&nbsp;|&nbsp;Anchorage AK  99501&nbsp;|&nbsp;(907) 276-6673 |</a> &nbsp;
    <asp:HyperLink ID="hlSignIn" runat="server" Text="Sign In" CssClass="loginLink" NavigateUrl="~/UserLogin.aspx"></asp:HyperLink>
    <div id="primaryMenu">
        <ul>
            <li><a runat="server" id="homeLink" title="Home Page" href="/Default.aspx">Home</a></li><li>|</li>            
            <li><a runat="server" id="aboutLink" title="About Us" href="/AboutUs/Mission.aspx"><span>About Us</span></a></li><li>|</li>
			<li><a runat="server" id="calendar" title="Calendar Events" href="/Calendar.aspx"><span>Calendar</span></a></li><li>|</li>
            <li><a runat="server" id="mediaLink" title="TV" href="/Media/MediaDirectory.aspx"><span>TV</span></a></li><li>|</li>
            <li><a runat="server" id="ministryLink" title="Ministries" href="/Ministries.aspx"><span>Ministries</span></a></li><li>|</li>            
            <li><a runat="server" id="prayerLink" title="Prayer" href="/PrayerMinistry/About.aspx"><span>Prayer</span></a></li><li>|</li>            
            <li><a runat="server" id="donateLink" title="Donate" href="/Donation/Donate.aspx"><span>Donate</span></a></li>
			<asp:PlaceHolder ID="phMyAccount" runat="server" Visible="false">
				<li>|</li>
				<li>
					<asp:HyperLink ID="hlMyAccount" runat="server" NavigateUrl="~/Administration/Home.aspx">My Account</asp:HyperLink>
				</li>
			</asp:PlaceHolder>
			<asp:Panel ID="pnlMyAccount" runat="server" Visible="false">
			</asp:Panel>

        </ul>
<!-- Hidden pending implementation as Phase 2
        <a runat="server" class="login" href="#" onmouseover="ShowLoginPanel()">Log In</a>
        <uc1:Login ID="ucLogin" runat="server" />
 -->
    </div>
</div>