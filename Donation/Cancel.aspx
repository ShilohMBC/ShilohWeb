<%@ Page Title="Shiloh Missionary Baptist Church - Donation Cancelled" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="Cancel.aspx.cs" Inherits="ShilohWeb.Donation.Cancel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <div style="height: 450px;">
        <div id="subjectHeading">
            <h1>Donation Cancelled</h1>
        </div>    
        <div class="defaultMargin">
            <div class="prayerRequest">
                <p>
                Your attempt to donate was cancelled. Your card should not have been charged or
                your PayPal account should not have been debited by any amount. If you wish to donate
                at another time, please come back to the site and click the 
                <a href="Donate.aspx" title="Make a donation">Donate</a> link to try again.
                </p>
                <p>
                Thank you.
                </p>
                <p>
                    <a href="../Default.aspx" title="Home page">Go Back to the Home Page</a>
                </p>
            </div>
        </div>
    </div>
</asp:Content>
