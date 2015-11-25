<%@ Page Title="Shiloh Missionary Baptist Church - Home" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ShilohWeb.Default" %>
<%@ Register src="/Controls/EventsCalendar.ascx" tagname="EventCalendar" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<meta name="robots" content="all" />    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <asp:ScriptManager ID="promotionScriptManager" runat="server"></asp:ScriptManager>
    <div id="promotion">        
        <table>
            <tr>
                <td>
                    <div style="margin-left: 20px; padding-top: 47px;">
<asp:Literal ID="litVideo" runat="server" Visible="true">
                            <div style="margin: 5px 10px 0px 0px; position: relative;border: 2px solid gray; width: 400px; height: 180px;">                
                                <object type="application/x-shockwave-flash" style="width:400px; height:180px;" data="http://vimeo.com/moogaloop.swf?clip_id=8881812&amp;server=vimeo.com&amp;show_title=0&amp;show_byline=0&amp;show_portrait=0&amp;color=&amp;fullscreen=1&amp;autoplay=%autoplay%">&nbsp;
									<param name="allowfullscreen" value="true" />&nbsp;
									<param name="allowscriptaccess" value="always" />&nbsp;
									<param name="autoplay" value="%autoplay%" />&nbsp;
									<param name="movie" value="http://vimeo.com/moogaloop.swf?clip_id=8881812&amp;server=vimeo.com&amp;show_title=0&amp;show_byline=0&amp;show_portrait=0&amp;color=&amp;fullscreen=1&amp;autoplay=%autoplay%" />&nbsp;
								</object>
			                </div>          			
                        </asp:Literal>   
                        <asp:Literal ID="litVideoIE" runat="server" Visible="false">               
                            <div style="margin: 5px 10px 0px 0px; position: relative;border: 2px solid gray; width: 400px; height: 180px;">                
            	                <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0" width="400" height="180" id="myMovieName">
									
									<param name="allowfullscreen" value="true" />&nbsp;
									<param name="allowscriptaccess" value="always" />
									<param name="autoplay" value="%autoplay%" />&nbsp;
									<param name="movie" value="http://vimeo.com/moogaloop.swf?clip_id=8881812&amp;server=vimeo.com&amp;show_title=0&amp;show_byline=0&amp;show_portrait=0&amp;color=&amp;fullscreen=1&amp;autoplay=%autoplay%" />&nbsp;
								</object>                               
			                </div> 
                        </asp:Literal>                     </div>
                </td>
                <td valign="bottom">
                    <a id="hlHomePromo" runat="server" href="CurrentEvents.aspx" style="position:static;" title="Welcome to Shiloh">
                        <asp:Image runat="server" ID="imgHomePromo" ImageUrl="~/Images/homePromo.gif" Width="495" Height="220" 
                        AlternateText="Welcome To Shiloh" ToolTip="Welcome to Shiloh" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px"/>
                    </a>
                </td>
            </tr>         
        </table>
    </div>
    
    <div style="float: left; border-right: 1px solid Maroon; border-left: 0px solid Maroon;">
		<asp:Panel ID="pnlTelecast" runat="server" Visible="true">    
				<div class="homeservices"  style="padding-bottom: 11px;">
					<h3>Sunday Services</h3>
					<dl>
						<dt>8:00am</dt><dd>Traditional</dd>
						<dt>9:45am</dt><dd>Sunday School</dd>
						<dt>11:00am</dt><dd style="color: Maroon; font-weight: bold">Contemporary</dd> 
					</dl>
	                
					<h3>Wednesday Services</h3>
					<dl>
						<dt>6:30pm</dt><dd>Prayer</dd>
						<dt>7:00pm</dt><dd style="color: Maroon; font-weight: bold">Bible Study</dd>
	                
				</dl>
                <h3>Saturday TV Telecast</h3>
				<dl>
					<dt>6:00am</dt><dd>FOX Channel 4</dd> 
                    <dt style="text-align:center;position:relative;width:100%;">
                        <asp:HyperLink ID="hlStream" runat="server" BorderWidth="0" Target="StreamScreen" ImageUrl="~/Images/ShilohStreaming.png" ImageWidth="100">
                        </asp:HyperLink>
                    </dt>
				</dl>				
			</div>					
			
		</asp:Panel>
	</div>
    
    <div id="homeMainContent">	
		
		<img alt="The Cross" title="Shiloh" src="/Images/pulpitCross.png" style="float: left;
			margin: 5px 6px 0px 2px;" />	
				
		<div style="float: right; margin-right: 15px;">
			<asp:Panel runat="server" ID="pnlEvents" Visible="false">
				<div style="margin: 25px 5px 0px 10px; padding: 8px 1px 8px 18px; width: 175px; height: 100%; border: maroon 1px solid;">
					<label style="width: 100%; text-align: center;text-decoration:underline;">Upcoming Events</label>
					<asp:DataList ID="dlEvents" runat="server" ShowFooter="true" ShowHeader="false">
						<HeaderTemplate></HeaderTemplate>
						<ItemTemplate>
							<div style="padding: 2px 5px 0px 0px;">
								<h1 class="eventDate">
									<%# BuildDateHeader(Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "activityStart")),Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "activityEnd")))%></h1>
								<div class="vevent">
									<abbr class="dtstart" title="The time of event start">
										<%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "activityStart")).ToString("h:mm tt")%></abbr>
									
									<h2 class="summary">
										<%# DataBinder.Eval(Container.DataItem, "name").ToString() %>									
										
									</h2>								
																	
									<a href='<%# BuildEventURL(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "ID")),Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "activityStart"))) %>' 
											style="position: relative; font-size: 8pt;margin-left: 12px;">
										Click for more info...
									</a>
								</div>
							</div>
						</ItemTemplate>
						<FooterTemplate>
							<div style="font-size: 10pt; padding-top: 6px;">
								<img alt="Event Calendar" title="Shiloh Calendar" src="Images/Calendar.png" height="24"
									width="24" />
								<a href="/Calendar.aspx" title="Show all of this month's events" style="color: Blue;
									text-decoration: underline;">
									View Calendar</a>
							</div>
						</FooterTemplate>
					</asp:DataList>
					
				</div>
				<div style="width: 100%; text-align: center; margin-top: 8px;">
					<img src="Images/carIcon.png" alt="Map to Shiloh" style="width: 32px;" />
					<a href="/AboutUs/WorshipServices.aspx" style="font-size: 10pt; color: Maroon; text-decoration: underline;
						top: -10px; position: relative;" title="Map to Shiloh">Go To Map of Shiloh </a>
				</div>
			</asp:Panel>
			<asp:Panel runat="server" ID="pnlFallback" Visible="true">
				<div style="font-size: 10pt; padding: 0px 15px 5px 1px; border: 1px solid Maroon;
					width: 200px; margin: 8px;">
					<h3 style="width: 100%; text-align: center;">What would you like to do?</h3><ul>
						<li><a href="PrayerMinistry/PrayerRequest.aspx" title="Submit a prayer request">Submit a Prayer Request</a></li>
						<li><a href="Calendar.aspx" title="View Shiloh's Calendar">View Our Calendar</a></li>
						<li><a href="Donation/Donate.aspx" title="Tithe/Offering/Donation">Tithe/Give Online</a></li>
						<li><a href="AboutUs/WorshipServices.aspx"title="Where are we?">View A Map to Shiloh</a></li>
						<li><a href="Media/MediaDirectory.aspx"title="Online broadcasts">View Online Broadcasts</a></li>
						<li><a href="Ministries.aspx" title="View our ministries">View Our Ministries</a></li>
						<li><a href="AboutUs/OurHistory.aspx" title="Our history">View Our Church History</a></li>
					</ul>
				</div>
			</asp:Panel>
		</div>
		<p style="padding-top: 6px;">
			<b style="color: Maroon; font-size: 13pt;">Welcome</b> to Shiloh!
			Our doors are
			open wide to everyone, and our hearts shut to no one seeking to find a safe place
			for spiritual life, growth and fellowship. </p>
		<p>	
			The mission of Shiloh Missionary Baptist Church is to preach, teach and live the
			redeeming love of God to a lost but ever changing world. 
		
			There is one and only one
			living and true God. …The eternal true God reveals Himself to us as Father, Son
			and Holy Spirit, with distinct personal attributes, but without division of nature,
			essence, or being. </p>
			
			<p style="padding-bottom: 0; margin-bottom: 0px;">
				So if you are visiting Anchorage, Alaska or simply looking
					for a church home come and join us in celebrating and worshiping God in all of his
					glory, here, at Shiloh! 																		
			</p>
	</div>
    
    
</asp:Content>