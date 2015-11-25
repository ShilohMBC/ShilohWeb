<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TabsAdmin.ascx.cs" Inherits="ShilohWeb.Controls.TabsAdmin" %>
   <div id="subjectHeading">
        <h1>Administration</h1>
        <ul>
            <asp:Literal ID="litIndex0" runat="server">
                <li><a href="/Administration/Home.aspx" title="Administration Home">Home</a></li>
            </asp:Literal>
            <asp:Literal ID="litIndex1" runat="server">
                <li><a href="/Administration/EventsHome.aspx" title="Events Home">Events</a></li>
            </asp:Literal>
            <asp:Literal ID="litIndex2" runat="server">
                <li><a href="#">Members</a></li>
            </asp:Literal>
            <asp:Literal ID="litIndex3" runat="server">
                <li><a href="/Administration/PrayerRequestHome.aspx">Prayer Requests</a></li>
            </asp:Literal>
            <asp:Literal ID="litIndex4" runat="server">
                <li><a href="/Administration/MediaHome.aspx">Media</a></li>
            </asp:Literal>            
        </ul>    
    </div>     
