<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PopUpMessage.ascx.cs" Inherits="ShilohWeb.Controls.PopUpMessage" %>
<asp:Panel ID="pnlMsg" runat="server" CssClass="msgBox" Visible="false">
    <asp:Label ID="lblMsg" CssClass="required" runat="server" Text=""></asp:Label>
    <div style="width: 90%; position: relative; text-align: center; padding: 10px;">
        <asp:Button ID="btnClose" runat="server" Text="Close" 
            onclick="btnClose_Click" ValidationGroup="PopupClose" />
    </div>
</asp:Panel>
