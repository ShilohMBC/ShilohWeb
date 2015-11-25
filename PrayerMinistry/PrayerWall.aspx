<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="PrayerWall.aspx.cs" Inherits="ShilohWeb.PrayerMinistry.PrayerWall" %>
<%@ Register src="/Controls/FilterMonthYear.ascx" tagname="FilterMonthYear" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <div id="subjectHeading">
        <h1>Prayer Ministry</h1>
        <ul>
            <li><a href="About.aspx">About</a></li>
            <li><a href="PrayerRequest.aspx">Prayer Request</a></li>
            <li class="current">Prayer Wall</li>
        </ul>
    </div>
    
    <asp:ScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="true">
    </asp:ScriptManager>
        
    <div class="defaultMargin" id="prayerWall" style="position: relative;">
        <h1>Prayer Request Wall</h1>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>            
                <asp:DataList ID="dlRequests" runat="server">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td valign="top">
                                    <label>
                                        <%# DataBinder.Eval(Container.DataItem, "firstName").ToString() %>&nbsp;
                                        <%# DataBinder.Eval(Container.DataItem, "lastName").ToString() %>                                        
                                    </label>
                                </td>
                                <td class="prayerWallEntry">
                                    <%# DataBinder.Eval(Container.DataItem, "prayerNeeds").ToString() %>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td class="footerInfo">
                                    <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "dateReceived")).ToString("dddd, dd MMMM yyyy hh:mm tt") %>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td class="prayWallResponse">
                                    <%# GetPrayerResponse(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "ID"))) %>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SeparatorTemplate>
                        <hr style="color: Silver; width: 65%;" />
                    </SeparatorTemplate>
                </asp:DataList>
                <br />
                
                <!-- Filter -->
                <div style="position: absolute; top: -8px; right: 0px; z-index: 100;">
                    <uc1:FilterMonthYear ID="ucFilterMonthYear" runat="server" YearsBeforeCurrentDate="4" YearsAfterCurrentDate="2" Visible="false" />
                </div>
            
            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>
    
</asp:Content>
