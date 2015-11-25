<%@ Page Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="ShilohWeb.MensMinistry.Calendar" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <h1>Men's Ministry</h1>
    <ul class="topicMenu">
        <li><a href="About.aspx">About</a></li>
        <li><a href="#">Calendar</a></li>
        <li><a href="Newsletter.aspx" class="current">Newsletter</a></li>
        <li><a href="Programs.aspx">Programs</a></li>
        <li><a href="Membership.aspx">Members</a></li>
        <li><a href="Gallery.aspx">Gallery</a></li>
    </ul>
    <h2>Men's Ministry Calendar of Events</h2>
    <p>[this would include a calendar-based view of activities, with event descriptions listed based upon day or event selection.]</p>
    <h3>November - December, 2005</h3>
    <dl>
        <dt>November 16th:</dt><dd>Men's Ministry Team Meeting</dd>
        <dt>November 19th:</dt><dd>Men's Breakfast & Fellowship<br />
                                   Guest Speaker: Reverend Ben Williams, "God's Purpose: All Things Working Together for Good"
                               </dd>
        <dt>December 21st:</dt><dd>Men's Ministry Team Meeting</dd>
        <dt>December 29th:</dt><dd>Anchorage Gospel Rescue Mission<br />
                                   2823 East Tudor Road near Lake Otis and Tudor intersection
                               </dd>
        <dt>December 31st:</dt><dd>Watch Night Service<br />
                                   Let us Men join Pastor Patterson in bringing in the New Year with our presence and with our families. Family events throughout the afternoon, church service at 10:00 PM
                               </dd>
    </dl>
    <h3>Recurring Activities</h3>
    <dl>
        <dt>Wednesday Night Bible Study</dt><dd>7:00 PM</dd>
        <dt>Men's Ministry Team Meeting (3rd Wednesday of each Month)</dt><dd>6:00 PM</dd>
        <dt>Men's Saturday Bible Study</dt><dd>9:00 AM</dd>
        <dt>Men's Sunday Bible Class</dt><dd>9:45 AM</dd>
        <dt>Men's Chorus & Praise Team (3rd and 4th Saturdays)</dt><dd>10:00 AM</dd>
    </dl>
    <div class="quote">
        <blockquote>Love the Lord your God with all your heart and with all your soul and with all your mind and with all your strength.'</blockquote>
        <cite>Mark 12:30</cite>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="formatting" runat="server">
</asp:Content>
