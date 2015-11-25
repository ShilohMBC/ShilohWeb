<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Donate.aspx.cs" Inherits="ShilohWeb.Donate" %>
<%@ Register Src="/Controls/Header.ascx" TagName="Header" TagPrefix="uc1" %>
<%@ Register Src="/Controls/Footer.ascx" TagName="Footer" TagPrefix="uc1" %>
<%@ Register Src="/Controls/SiteMap.ascx" TagName="SiteMap" TagPrefix="uc1" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Shiloh Missionary Baptist Church - Donate</title>
    <meta name="keywords" content="Shiloh, Missionary Baptist Church, Baptist Church, Alaska, Anchorage, African-American" />
    <meta name="description" content="Website for the Shiloh Missionary Baptist Church, Anchorage Alaska" />
    <meta name="authors" content="Impact Custom Solutions and Papaya Design Studio" />
    <meta name="authorURLs" content="www.impactcustomsolutions.com, www.papayadesignstudio.com" />
    
    <link rel="stylesheet" type="text/css" href="/Styles/Shiloh2000.css" />
    <script type="text/javascript" src="/Scripts/shiloh.js"></script>
</head>
<body>           
        <form action="https://www.paypal.com/cgi-bin/webscr" method="post" id="payPalForm">
            <uc1:Header ID="ucHeader" runat="server" />

            <div id="subjectHeading">
                <h1>Make a Donation</h1>
            </div>
           
            <div class="prayerRequest">
				<h1>Tithes and Offerings</h1>
				<p>
					You can now pay your tithes and offerings online!  We accept all major credit cards and most debit 
					cards and PayPal payments through PayPal. All you need is a credit/debit card and a valid 
					e-mail address.  You do <b>not</b> already have to have a PayPal account to pay your tithes.  You can 
					tithe any amount that you wish.  Once you have submitted your tithe or offering, you will receive a 
					confirmation to the e-mail address that you provide.  If you are ready to tithe then press the button 
					below:					
				</p>
				<div style="width: 95%; text-align: center; position: relative;">
					<input type="hidden" name="cmd" value="_s-xclick" />
					<input type="hidden" name="hosted_button_id" value="QP8LAT7NA2XZJ" />
					<input type="image" src="https://www.paypal.com/en_US/i/btn/btn_donateCC_LG.gif"
						style="border: none;" name="submit" alt="PayPal - The safer, easier way to pay online!" />
					<img alt="" border="0" src="https://www.paypal.com/en_US/i/scr/pixel.gif" width="1"
						height="1" />
				</div>
				
				<h1>Donations</h1>
                <p>
                    Would you like to make a donation to Shiloh? We accept all major credit cards and
                    PayPal payments through PayPal. Just click on the Donate button below and you will
                    be taken to our PayPal site to accept your donations. You do <b>not</b> already
                    have to have a PayPal account to donate. You can make your contribution in any amount
                    that you wish. Once you have donated, a confirmation will be sent to you, so you
                    must supply a valid e-mail address at the time of your donation. If you are ready
                    to donate, please press the donate button below to proceed: 
                </p>   
                <div style="width: 95%; text-align: center; position: relative;">                    
                    <input type="hidden" name="cmd" value="_s-xclick" />
                    <input type="hidden" name="hosted_button_id" value="QP8LAT7NA2XZJ" />
                    <input type="image" src="https://www.paypal.com/en_US/i/btn/btn_donateCC_LG.gif" style="border: none;"
                        name="submit" alt="PayPal - The safer, easier way to pay online!" />
                    <img alt="" border="0" src="https://www.paypal.com/en_US/i/scr/pixel.gif" width="1"
                        height="1" />
                    
                </div>                                 
                <p>
                Thank you and may God bless!
                </p>
            </div>
            
            <uc1:SiteMap ID="ucSiteMap" runat="server" />
            <uc1:Footer ID="ucFooter" runat="server" />
                   
        </form>    
</body>
</html>
