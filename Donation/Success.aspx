<%@ Page Title="Shiloh Missionary Baptist Church - Successful Donation" Language="C#"
    MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="Success.aspx.cs"
    Inherits="ShilohWeb.Donation.Success" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">

    <div style="height: 450px;">
    <div id="subjectHeading">
        <h1>Donation Success</h1>
    </div>
    
    <div class="defaultMargin prayerRequest">
        <p>
            Congratulations, you have successfully donated to Shiloh. A record of your
            donation should be sent to you shortly, to the e-mail that you had supplied at time
            of donation. If you have any questions please go to the 
            <a href="../ContactUs.aspx" title="Contact Us">Contact Us</a> link on the website
            and contact us with your question or concern. 
        </p>
        <p>
            Thank you and may God bless you!
        </p>
        <p>
            <a href="../Default.aspx">Go back to the Home Page</a>
        </p>
    </div>
    </div>
</asp:Content>
