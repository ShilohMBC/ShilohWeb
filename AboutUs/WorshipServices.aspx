<%@ Page Title="Shiloh Missionary Baptist Church - Worship Services" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="WorshipServices.aspx.cs" Inherits="ShilohWeb.AboutUs.WorshipServices" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <div id="subjectHeading">
        <h1>About Us</h1>
        <ul>
            <li class="current">Worship Services</li>
            <li><a href="Mission.aspx">Mission &amp; Beliefs</a></li>
            <li><a href="PastorStaff.aspx">Pastor &amp; Staff</a></li>
            <li><a href="OurHistory.aspx">Our History</a></li>
            <li><a href="WebConferencing.aspx">Web Conferencing</a></li>
        </ul>
    </div>
    <div class="twoColumn left defaultMargin">
        <h2>Our Worship Services</h2>
        <div class="oneColumn left">
            <h3>Sunday Services</h3>
            <dl>
                <dt>8:00am</dt><dd>Traditional</dd>
                <dt>9:45am</dt><dd>Church School</dd>
                <dt>11:00am</dt><dd>Contemporary</dd>	    
            </dl>
        </div>
        <div class="oneColumn right">
            <h3>Wednesday Services</h3>
            <dl>                   
                <dt>6:30pm</dt><dd>Prayer</dd>
                <dt>7:00pm</dt><dd>Bible Study</dd>	    
            </dl>
        </div>
        <div class="twoColumn left prayerRequest">
            <h3>SMBC Hour of Decision</h3>
            <p>
                Join our weekly television broadcast on Saturday mornings at 6:00am on <strong>Channel 4 FOX</strong>.
                <a href="../Media/MediaDirectory.aspx" title="Hour of Decision">Click here</a> to see past broadcasts.
            </p>

            <h2>Contact Us</h2>
            <dl>
                <dt>Phone</dt><dd>(907) 276-6673</dd>
                <dt>Mail</dt><dd>855 East 20th. Ave<br />Anchorage, Alaska 99501</dd>
                <dt>eMail</dt><dd><a href="mailto:shiloh@shiloh2000.net" title="Mail Shiloh">shiloh@shiloh2000.net</a></dd>
                <dt>Website</dt><dd><a href="http://www.shiloh2000.com" title="Shiloh MBC Home Page">www.shiloh2000.com</a></dd>
                <dt></dt>
                <dd style="padding: 2px 0px;">
                    <a href="http://www.facebook.com/shiloh.alaska.5" target="SMBC_Facebook" title="SMBC on Facebook">
                        <img style="width: 72; height: 22px; padding-left: 5px; vertical-align: middle;" src="/Images/5u84f48n.gif" alt="Shiloh on Facebook" />
                    </a>                                    
                    <a href="http://www.facebook.com/shiloh.alaska.5" target="SMBC_Facebook" >Shiloh </a> on Facebook
                </dd>
            </dl>
        </div>
    </div>
    <div class="halfPage right">
        <div class="smallMap">
            <iframe width="400px" height="325px" frameborder="1" scrolling="no" marginheight="25px" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=shiloh+missionary+baptist+church+anchorage+alaska&amp;sll=41.805405,-88.01499&amp;sspn=0.007965,0.013969&amp;ie=UTF8&amp;cid=16080919877965237426&amp;ll=61.208038,-149.862528&amp;spn=0.014469,0.036478&amp;z=14&amp;iwloc=A&amp;output=embed&key=ABQIAAAAWudLBBPP2Hm6IuGjr5nbAxTt-YYh1-wKBrO4b2sMn8RfzfuV7xT-i1-7tdYIKK0AfkKJ3tIZcYqQJw"></iframe><br />
            <small>
                <a href="http://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=shiloh+missionary+baptist+church+anchorage+alaska&amp;sll=41.805405,-88.01499&amp;sspn=0.007965,0.013969&amp;ie=UTF8&amp;cid=16080919877965237426&amp;ll=61.208038,-149.862528&amp;spn=0.014469,0.036478&amp;z=14&amp;iwloc=A&key=ABQIAAAAWudLBBPP2Hm6IuGjr5nbAxTt-YYh1-wKBrO4b2sMn8RfzfuV7xT-i1-7tdYIKK0AfkKJ3tIZcYqQJw" style="color:#0000FF;text-align:left">
                    View Larger Map
                </a>
            </small>
        </div>
    </div>
</asp:Content>