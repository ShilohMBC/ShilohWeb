<%@ Page Title="Shiloh Event Calendar" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="ShilohWeb.Calendar" %>
<%@ Register src="/Controls/EventsCalendar.ascx" tagname="EventCalendar" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="true">
    </asp:ScriptManager>
    
    <div id="subjectHeading">
        <h1>Event Calendar</h1>
        <ul>
            <li><a href="/CurrentEvents.aspx">Current Events</a></li>
            <li class="current">Shiloh Events</li>            
        </ul>
    </div>
    <div class="defaultMargin">
        <h2>Shiloh Community Events</h2>
        <div>
        There are activities offered throughout the year for our congregation members and visitors to the Anchorage area. 
        Change the calendar to see the events for upcoming and past months.
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                        
            <div class="defaultMargin" style="margin-bottom: 20px;">
                <div class="left twoColumn">
                <asp:DataList ID="dlEvents" runat="server" HorizontalAlign="Center" Width="550px">
                    <HeaderTemplate>
                        <h2>No Events Were Planned for this Month!</h2>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div style='<%# BuildStyle(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "ID")),Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "activityEnd")),"background: %color%; padding: 10px; border: 1px solid silver; ") %>'>
                            <div style="width: 100%; border: 1px solid gray; font-weight: bold; background-color: Maroon; color: White;">
                                <span class="eventDate">&nbsp;<%# BuildDateHeader(Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "activityStart")),Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "activityEnd")))%></span>
                                &nbsp;-&nbsp;
                                <span class="eventDate"><%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "activityStart")).ToString("h:mm tt")%></span>
                            </div>
                            <h2 class="summary" style="padding: 0px; margin: 0px;"><%# DataBinder.Eval(Container.DataItem, "name") %></h2>
                            <div>
                                <%# DataBinder.Eval(Container.DataItem, "description") %>
                            </div>
                            <div style="text-align: left; position: relative;">
                                <%# FormatLocationInfo(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "ID"))) %>
                            </div>
                        </div>
                    </ItemTemplate>                    
                    <SeparatorTemplate>                    
                    </SeparatorTemplate>
                </asp:DataList>
                <br />
                    <asp:LinkButton ID="lbAllEvents" runat="server" PostBackUrl="~/Calendar.aspx?eid=0" Visible="false" ForeColor="Blue" Font-Underline="true">Click here to show all events for this month</asp:LinkButton>
                </div>
            </div>
        
            <div class="right twoColumn" style="height: 19em;">   
                <uc1:EventCalendar ID="ucCalendar" runat="server" />         
            </div>

            </ContentTemplate>
        </asp:UpdatePanel>

    </div>
</asp:Content>
