<%@ Page Title="Shiloh Missionary Baptist Church - Media Directory" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="MediaDirectory.aspx.cs" Inherits="ShilohWeb.Media.MediaDirectory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<meta name="robots" content="all" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <div id="subjectHeading">
        <h1>Media Directory</h1>
        <ul>
            <li class="current">Videos</li>
<!-- Hidden pending implementation of additional media types
            <li><a href="#">Audio</a></li>
            <li><a href="#">Articles</a></li>
            <li><a href="#">Photos</a></li>
-->
        </ul>
    </div>
    
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
    <div id="promotion">
        <div style="position:absolute; right:0px; top: 0px;">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <asp:Literal ID="litVideo" runat="server" EnableViewState="false">
                    </asp:Literal>   
                    <div>Click on blue program links to view Hour of Decision videos online.</div>
                </ContentTemplate>         
            </asp:UpdatePanel>
        </div>
        
        <h1 id="promoHeadline"></h1>
        <p id="promoCopy">
        </p>
    </div>

    <div class="defaultMargin"> 
        
        

        <asp:Panel ID="pnlStreameTyne" runat="server" Width="250">            
            <h2>Online Streaming</h2>
            <div style="width:100%;position: relative;text-align: center;">
            <asp:HyperLink ID="hlStream"  Target="StreamScreen" runat="server" BorderWidth="0" ImageUrl="~/Images/ShilohStreaming.png" ImageWidth="100">                
            </asp:HyperLink>
            </div>
            <div>Click on logo to see our live feed!</div>
        </asp:Panel>


        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
            <ContentTemplate>  
                <asp:PlaceHolder ID="plMedia" runat="server">
                </asp:PlaceHolder>
            </ContentTemplate> 
        </asp:UpdatePanel>

    </div>

</asp:Content>
