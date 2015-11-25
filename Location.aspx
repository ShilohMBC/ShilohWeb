<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="Location.aspx.cs" Inherits="ShilohWeb.Location" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<meta name="robots" content="all" />    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <div style="padding-bottom: 10px;">
        <div class="label">Our Worship Services</div>
        <table style="width:100%;">
            <tr>
                <td style="width:34%;vertical-align: top;">
               		<div class="label2">Sundays</div>
		            <div class="list">8:00am Traditional</div>
		            <div class="list">9:45am Church School</div>
		            <div class="list">11:00am Contemporary</div>
                </td>
                <td style="width:31%;vertical-align: top;">
                    <div class="label2">Wednesdays</div>                       
		            <div class="list">6:30pm Prayer</div>
		            <div class="list">7:00pm Bible Study</div>
                </td>
                <td style="width:35%;vertical-align: top;">
                    <div class="label2">SMBC Hour of Decision</div>
                    <div class="normal">
                    Weekly television broadcast Sunday mornings at 9:00am on
                    <span class="label2" style="text-decoration:none;">Channel 5 KYES</span>                    
                    </div>
                </td>
            </tr>
        </table>
    <hr style="color:Silver; width:90%;" />
    <div class="label">Our Location</div>
    <div class="contentCentered">
        <img id="imgMap" src="images/shilohMap.gif" alt="Map to Shiloh" width="448" height="336"/>                   
        <div style="padding-top: 20px;">
            Shiloh Missionary Baptist Church<br />
            855 E. 20th Ave<br />
            Anchorage, Alaska 99501
        </div>
    </div>         
</div>

</asp:Content>
