<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="CSS Sampler.aspx.cs" Inherits="ShilohWeb.CSS_Sampler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <h1>CSS Sampler [h1]</h1>
    <!-- Horizontal navigation between topics within a subject. -->
    <ul class="topicMenu">
        <li><a href="#">[topicMenu] [li] [a]</a></li>
        <li><a href="#">[topicMenu] [li] [a]</a></li>
        <li><a href="#">[topicMenu] [li] [a]</a></li>
        <li><a href="#">[topicMenu] [li] [a]</a></li>
    </ul>
    <br style="clear: left" />
    <!-- The directory and entry listings for people and organizations -->
    <div id="directory">
        <div class="entry">
            <img alt="Directory entry Image [img]" src="~/Images/noImage.png" />
            <h3>Directory Entry Name [#directory .entry h3]</h3>
            <p>This is a paragraph area available for entering a summary description of the entry [#directory .entry p]</p>
            <dl>
                <dt>Definition List Term [dt]</dt><dd>definition list description [dd]</dd>
                <dt>Definition List Term [dt]</dt><dd>definition list description [dd]</dd>   
            </dl>
            <a href="Ministries/AdminSupportMinistry.aspx" title="Administration and Support Ministries">Learn more...</a>
        </div>   
        <div class="entry">
            <img alt="Directory entry Image [img]" src="~/Images/noImage.png" width="21em" />
            <h3>Directory Entry Name [#directory .entry h3]</h3>
            <p>summary description of the entry [#directory .entry p]</p>
            <dl>
                <dt>Definition List Term [dt]</dt><dd>definition list description [dd]</dd>
                <dt>Definition List Term [dt]</dt><dd>definition list description [dd]</dd>   
            </dl>
            <a href="Ministries/AdminSupportMinistry.aspx" title="Administration and Support Ministries">Learn more...</a>
        </div>  
    </div>
    <!-- a quote inline -->
    <div class="quote">
        <blockquote>This is the quoted text.</blockquote>
        <cite>Author Name [cite]</cite>
    </div>     

</asp:Content>