<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="Programs.aspx.cs" Inherits="ShilohWeb.ChildrensMinistry.Programs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
        .defaultMargin, .defaultMargin h1, .defaultMargin h2
        {
            font-family: Comic Sans MS, Arial, Sans-Serif;
        }
        
        .defaultMargin
        {
            background-image: url('/Images/sk_kidfigures_bg.png');
            background-position: center;
            background-repeat: no-repeat;
        }
        .defaultMargin > h2
        {
            font-size: 14pt;
        }         
        p
        {
            font-weight: bold;
        }                
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <div id="subjectHeading">
        <h1>ShilohKIDS Programming</h1><ul>
            <li><a href="About.aspx">About</a></li>
            <li><a href="#" class="current">Programs</a></li>
            <li><a href="Events.aspx">Events</a></li>
        </ul>
    </div>
    
    <div class="defaultMargin prayerRequest">
        <h2>Sunday - Sunday Morning Glory: Early Morning Childcare - 7:30 AM</h2>
        <p style="color: rgb(255,0,255);">
            <img src="../Images/sk_rhino.png" alt="Rhino" style="width: 190px; height: 137px;
                float: right; margin: 4px" />
            Shiloh Children’s Ministry Nursery and Preschool 8:00 AM childcare exists to provide
            a safe, nurturing environ-ment for children of parents who serve in ministry on
            Sunday mornings. 7:30 AM Children will enter a quiet, restful atmosphere. Caregivers
            will provide quiet activities and soft music with the opportunity for additional
            rest for children in care. A hot nutritious breakfast will be served. 
        </p>
        <h2>Sunday - Sunday School 9:45 AM - 10:45 AM</h2>
        <ul style="color: rgb(255,128,0);">
            <li>Children will gather in the gym. Opening prayer and assembly (10 mins).</li> 
            <li>Overview of lesson (3-5 mins).</li>
            <li>Children will exit gym with their teachers to the classroom.</li>
            <li>Teachers will reinforce concepts of the lesson using the adopted curriculum (40 mins).</li>
            <li>Closing Prayer – Children will be escorted to the children’s gym or released to a parent/guardian
            or older sibling.</li>
        </ul>
        <h2>Sunday - ShilohKIDS Worship Experience - 11:00 AM</h2>
        
        <dl style="color: blue;">
            <dt>11:00 - 11:20</dt>
            <dd>Gathering – Activity Stations</dd>
            <dt>11:20 - 11:30</dt>
            <dd>Transition Time to Worship Experience</dd>
            <dt>11:30 - 12:30</dt>
            <dd>Worship Experience </dd>
            <dt>12:30 - 12:50</dt>
            <dd>Hang Time | Snack | Sharing with Friends </dd>
            <dt>12:50</dt>
            <dd>Sending Out </dd>
        </dl>
        <h2>Wednesday - ShilohKIDS Discipleship - 6:30 PM</h2>
            <img src="../Images/sk_disciples.png" alt="Kids Discipleship" style="width: 135px;
                height: 90px; float: right; margin: 4px;" />
        <dl style="color: rgb(0,215,100);">
            <dt>6:30 – 6:45</dt>
            <dd>See It: Video Bible Lesson</dd> 
            <dt>6:45 – 7:00</dt>
            <dd>Say It: Bible Lesson and Memory Verse [ Circle Groups] </dd>
            <dt>7:00 – 7:45</dt>
            <dd>Shape It | Slam It | Snack It: [ Learning Centers]</dd> 
            <dt>7:45 – 8:00</dt>
            <dd>Share It: Prayer and Share Time</dd> 
            <dt>8:00 - 8:20</dt>
            <dd>Sing It: Music Time</dd>
            <dt>8:20 - 8:30</dt>
            <dd>Sending Out: Snack Time | Sharing with Friends</dd> 
        </dl>
        <h2>Friday - KONNECTION: Friendship & Fun - 6:30 PM - 9:00 PM</h2>
        <img src="../Images/sk_shilohkids.png" alt="ShilohKids" style="width: 119px; height: 100px;
            float: left; margin: 4px 8px 2px 2px" />
        <p style="color: rgb(64,0,128);">
            Kids Konnection provides a safe and fun time for the children of parents who are
            serving on Friday nights in choir rehearsals and other ministries. Kids Konnection
            also provides an opportunity for parents to spend a evening out. During Kids Konnection
            we celebrate special days and events, engage in team challenges and sports, make
            new friends, and just have tons of fun!
        </p>
    </div>
</asp:Content>
