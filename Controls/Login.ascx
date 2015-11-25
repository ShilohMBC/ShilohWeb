<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Login.ascx.cs" Inherits="ShilohWeb.Controls.Login" %>


<asp:Panel ID="Panel1" runat="server" Visible="false" Height="200px" Width="200px">
    <asp:Login ID="LoginControl" runat="server" 
            BackColor="#eeeeee" BorderColor="#222222" BorderPadding="4" BorderStyle="Solid" BorderWidth="1" 
            DestinationPageURL="~/Administration/Home.aspx"
            Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" Height="197px"
            PasswordRecoveryText="Forgotten your password" PasswordRecoveryUrl="#"
            Style="z-index: 100; left:78px; position:absolute; top:55px;" Width="315px">
        <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"
            Font-Names="Segoe UI, Myriad Pro, Arial, San-serif" Font-Size="0.8em" ForeColor="#284775" />
        <TextBoxStyle Font-Size="0.8em" />
        <TitleTextStyle BackColor="#5D7B9D" Font-Bold="true" Font-Size="0.9em" ForeColor="White" />
        <InstructionTextStyle Font-Italic="true" ForeColor="Black" />
    </asp:Login>
</asp:Panel>