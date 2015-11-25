<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="ShilohWeb.ChildrensMinistry.Events" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .defaultMargin, .defaultMargin h1, .defaultMargin h2
        {
            font-family: Comic Sans MS, Arial, Sans-Serif;
        }
                 
        p
        {
            font-weight: bold;
        }    
        .defaultMargin > h2
        {
            font-size: 14pt;
        }              
        .defaultMargin  img 
        {
            padding: 10px 2px;
        }      
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <div id="subjectHeading">
        <h1>Upcoming Events</h1>
        <ul>
            <li><a href="About.aspx">About</a></li>
            <li><a href="Programs.aspx">Programs</a></li>
            <li><a href="#" class="current">Events</a></li>
        </ul>
    </div>

    <div class="defaultMargin prayerRequest">
        <h2>Upcoming Events</h2>
        <div style="color:Blue;">
            Here are list of events that are coming for this quarter:
        </div>
        <div style="width: 100%; position: relative; text-align: center; margin: auto;">
            <img src="../Images/sk_event_music.jpg" style="width: 893px; height: 424px;" alt="Music Event" />
            <img src="../Images/sk_event_recharge.jpg" style="width: 894px; height: 587px;" alt="Music Event" />
            <img src="../Images/sk_event_summer.jpg" style="width: 888px; height: 666px;" alt="Summer events"/>
            <img src="../Images/sk_event_popsday.jpg" style="width: 439px; height: 317px;"
                alt="Father's Day" />
        </div>
    </div>    
    
</asp:Content>
