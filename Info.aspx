<%@ Page Title="Shiloh Missionary Baptist Church - Information" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="Info.aspx.cs" Inherits="ShilohWeb.Info" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="robots" content="NOINDEX, NOFOLLOW" />    
    <style type="text/css">   
        .miniLinkLabel { font-size: 9pt; font-variant: small-caps; color: black; font-weight: bold; }
        #col1, #col2 { position: absolute; }
        #col1 { top: 6px; left: 150px; }     
        #col2 { top: 6px;left: 300px; }
        .ministrySubmenu { height: 34px; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <div class="ministrySubmenu">
	<div class="miniLinkLabel">Information:</div>
        <div id="col1">
            <ul>
                <li><a href="javascript:loadiFrameContent('infoContent', 'InfoAboutUs.html', '');">About Us</a></li>
                <li><a href="javascript:loadiFrameContent('infoContent', 'InfoLocation.html', '');">Our Location</a></li>
            </ul>
        </div>        				
        <div id="col2">
            <ul>
		<li><a href="javascript:loadiFrameContent('infoContent', 'InfoServices.html', '');">Worship Services</a></li>
            </ul>   	            
        </div>
    </div>

    <iframe id="infoContent" src="InfoAboutUs.html" width="480px" height="552px" frameborder="0" scrolling="auto" marginheight="2x" marginwidth="5px">
    </iframe>
</asp:Content>
