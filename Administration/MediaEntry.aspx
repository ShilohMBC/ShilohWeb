<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="MediaEntry.aspx.cs" Inherits="ShilohWeb.Administration.MediaEntry" ValidateRequest="false" %>
<%@ Register src="/Controls/DateTimeEntry.ascx" tagname="DateEntry" tagprefix="uc1" %>
<%@ Register src="/Controls/PopUpMessage.ascx" tagname="PopupMessage" tagprefix="uc1" %>
<%@ Register Src="/Controls/TabsAdmin.ascx" TagName="AdminTabs" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">

    <uc1:AdminTabs ID="ucAdminTabs" runat="server" SelectedIndex="4" SelectedCssClass="current" />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
    <div class="defaultMargin" style="position: relative;">
    
    <h2>Add/Edit Media</h2>
    <div>
        You can create (or edit) media that will appear on the webiste. Please fill
        in all required fields that appear in <span class="required">red</span>.
    </div>
        
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="mediaVal" />
    
    <fieldset>
        <legend>Media Information</legend>    
        <div>
            <label class="required">Name</label>&nbsp;
            <asp:TextBox ID="txtName" runat="server" Width="250px"></asp:TextBox>
        </div>
        <div>
            <label>&nbsp;</label>&nbsp;
            <asp:CheckBox ID="cbIsActive" runat="server" Checked="true" />
            <span class="label">Make Visible on Site</span>
            <asp:RequiredFieldValidator ID="valreqName" runat="server" ControlToValidate="txtName" ErrorMessage="Please name the media." ValidationGroup="mediaVal" Display="None"></asp:RequiredFieldValidator>
        </div>
        <div>
            <label class="required">Category</label>&nbsp;
            <asp:DropDownList ID="ddlCategory" runat="server"></asp:DropDownList>
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div>
                    <label class="required">Production Date</label>
                    <uc1:DateEntry ID="ucDateTimeMediaDate" runat="server" ShowTime="false" CalendarPositionTop="300" />
                </div>
                <uc1:PopUpMessage ID="ucPopupMessage" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <div>
            <label class="required">Description </label>&nbsp;
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" 
                Height="100px" Width="500px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="valreqDescription" runat="server" ControlToValidate="txtDescription" ErrorMessage="Please enter a description of whats on the media." ValidationGroup="mediaVal" Display="None"></asp:RequiredFieldValidator>
        </div>
    </fieldset>
    
    <asp:CustomValidator ID="valcustOther" runat="server" 
        ErrorMessage="Please provide information" ControlToValidate="ddlCategory" 
        onservervalidate="valcustOther_ServerValidate" Display="None"></asp:CustomValidator>
        
    <fieldset>
        <legend>Media Source</legend>
        <div>
            <label class="required">Provider</label>&nbsp;
            <asp:DropDownList ID="ddlProvider" runat="server"></asp:DropDownList>
        </div>
        <div style="display:none;">
            <label>&nbsp;</label>
            <asp:CheckBox ID="cbIsStreaming" runat="server" Checked="true" /> 
            <span class="label">Is Streaming</span>           
        </div>
        <div style="display: none;">
            <label>MIME Type</label>
            <asp:TextBox ID="txtMIMEType" runat="server"></asp:TextBox>            
        </div>
        <div style="display: none;">
            <label>Size (bytes)</label>
            <asp:TextBox ID="txtSize" runat="server" Text="0" Width="100px"></asp:TextBox>            
        </div>
        <div style="visibility: hidden;display:none;">
            <label>URL</label>
            <asp:TextBox ID="txtURL" runat="server"></asp:TextBox>            
        </div>
        <div>
            <label>Embed Link</label>&nbsp;
            <asp:TextBox ID="txtEmbedObject" runat="server" TextMode="MultiLine" Width="500px" Height="200px"></asp:TextBox>
        </div>
    </fieldset>    
            
    <p>
        <asp:Button ID="btnSave" runat="server" Text="Save Media" ValidationGroup="mediaVal" 
            onclick="btnSave_Click" /> | 
        <asp:HyperLink ID="hlCancel" runat="server" NavigateUrl="~/Administration/MediaHome.aspx">Cancel Changes</asp:HyperLink>
    </p>
    
    <!-- List Media -->
    <div style="position: absolute; top: -8px; right: 0px; z-index: 104; border: 1px solid silver;
        vertical-align: middle; padding: 6px;">
        <a href="MediaList.aspx" title="Show a list of media."><span class="label">List All Media</span>&nbsp;
            <img src="../Images/CameraRefresh24x24.png"
                alt="New Event" style="width: 24px; height: 24px; border: none; vertical-align: middle;" />
        </a>
    </div>
    
    </div>
</asp:Content>
