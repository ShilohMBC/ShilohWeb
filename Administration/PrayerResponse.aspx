<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="PrayerResponse.aspx.cs" Inherits="ShilohWeb.Administration.PrayerResponse" %>
<%@ Register Src="/Controls/TabsAdmin.ascx" TagName="AdminTabs" TagPrefix="uc1" %>
<%@ Register Src="/Controls/PopUpMessage.ascx" TagName="PopUpMessage" TagPrefix="uc1" %>
<%@ Register Src="/Controls/ActionButton.ascx" TagName="ActionButton" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css" media="all" >
        .newLabel
        {
            font-size: 10pt;
            font-weight: bold;
            font-family: Arial, Sans-Serif;
            color: Black;     
            width: auto;    
        }
        
        DIV.section
        {
            margin-bottom: 15px;
        }

        .requestText
        {
            font-style: italic;
            color: Maroon;           
        }
                
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">

    <uc1:admintabs id="ucAdminTabs" runat="server" selectedindex="3" selectedcssclass="current" />
    
    <div class="defaultMargin" style="position: relative;">
        
        <h2>Prayer Response</h2>

        <div class="section" style="width:95%">        
        Print the prayer request before responding to it (click on the <i>"Print Request"</i> button link above). 
        If this prayer request is inappropriate, you can delete it by clicking on the <i>"Delete Request"</i> button link above. 
        You can respond to the request by typing into the response area beneath the prayer request.  Make sure that you click on 
        the <i>"Process Request"</i> button to save your response. 
        </div>
                             
        <fieldset>
            <legend>Prayer Request</legend>                             
            <div class="section">                
                <div style="font-size: 10pt">
                    <b>From:</b> <asp:Label ID="lblFrom" runat="server" Text=""></asp:Label>
                </div>
            </div>    
            <div class="section">
                <asp:Label ID="lblConfidential" runat="server" Text="!! This request is confidential !!" CssClass="required" Font-Size="Small" Visible="false"></asp:Label>
                <div runat="server" id="divPrayer" class="prayerWallEntry requestText" style="width: 90%;
                    margin-bottom: 10px;"></div>
            </div>
        </fieldset>

        <fieldset><legend>Prayer Response</legend>
            <div class="section">
                <div  style="font-size: 10pt">
                    <span class="newLabel"><b>Your Response</b></span> (<b>Note:</b> this will appear on the prayer wall if request is not confidential)
                </div>
                <asp:TextBox ID="txtResponse" TextMode="MultiLine" Width="90%" Height="100" runat="server"></asp:TextBox>
            </div>               
            
            <div>
                <span class="required" style="font-size: 10pt;">Processed by:</span>
                <asp:TextBox ID="txtProcessedBy" runat="server"></asp:TextBox>
            </div>        
        </fieldset>        
        
        <div style="padding: 10px 5px; width: 100%; text-align: center;">
            <asp:Button ID="btnSubmit" runat="server" Text="Process Request" 
                onclick="btnSubmit_Click"/>
             or 
            <asp:LinkButton ID="lbCancel" runat="server" PostBackUrl="~/Administration/PrayerRequestList.aspx">Cancel</asp:LinkButton>
        </div>

        <uc1:PopUpMessage id="ucPopupMsg1" runat="server" />

        <div style="position: absolute; top: 0px; left: 620px;">
            <uc1:ActionButton id="ucPrintButton" runat="server" ImageURL="~/Images/Printer.png"
                Caption="Print Request" />
            <uc1:ActionButton id="ucDeleteButton" runat="server" ImageURL="~/Images/Delete.png"
                Caption="Delete Request" ConfirmationMessage="Are you sure want to delete this prayer request?" />
        </div>
        
        <asp:HiddenField ID="hdnResponseId" runat="server" Value="0" />
    </div>
</asp:Content>
