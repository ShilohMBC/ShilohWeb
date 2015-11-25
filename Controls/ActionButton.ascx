<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ActionButton.ascx.cs" Inherits="ShilohWeb.Controls.ActionButton" %>
<div class="actionButton">
    <asp:ImageButton ID="imgAction" runat="server" OnClick="imgAction_Click" Width="16"
        Height="16" ImageAlign="AbsMiddle" />
    <asp:LinkButton ID="lbAction" runat="server" OnClick="lbAction_Click" OnClientClick=""></asp:LinkButton>        
</div>
