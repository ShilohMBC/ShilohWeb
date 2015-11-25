<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="ShilohWeb.Ministries.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">    
    <div id="subjectHeading">
        <h1>Men's Ministry</h1>
        <ul>
            <li><a href="#" class="current">About</a></li>
            <li><a href="#">Programs</a></li>
            <li><a href="#">Events</a></li>
        </ul>
    </div>
    
    <div class="defaultMargin prayerRequest">
    <h2>About the Men's Ministry</h2>
    <div id="directory">
        <div class="entry">
            <img alt="Picture" src="/Images/noImage.gif" width="96px"/>
            <h3>Reverend Dennis D. Davis: <i>Director</i></h3>
            <dl>
                <dt>Phone:</dt><dd>(907) 276-6673</dd>
                <dt>Email:</dt><dd><a href="mailto:dennis.davis@ak.net">dennis.davis@ak.net</a></dd>
            </dl>
        </div>
    </div>
    <h3>Our Purpose</h3>
    <p>The Men's Ministry of Shiloh Baptist Church is focused on helping men grow in their God-given roles and to encourage and exhort one another toward maturity in Christ.</p>
    <h3>Men of God:</h3>
    <ul>
        <li>Helping men mature spiritually by grounding them in God's Word.</li>
        <li>Providing opportunities to build relationships with other men.</li>
        <li>Offering ways in which men may serve the Lord.</li>
        <li>Discipling the next generation.</li>
    </ul>
    </div>
</asp:Content>
