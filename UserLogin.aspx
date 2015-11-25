<%@ Page Title="Shiloh - Login" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="ShilohWeb.UserLogin" RequireSSL="true" %>
<%@ Register src="/Controls/PopUpMessage.ascx" tagname="PopupMessage" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <div class="defaultMargin" style="height: 300px;">                   
        
        <div style="position: relative; top: 50px; left: 320px; width: 250px; background-color: rgb(255,255,200); border:1px solid silver; padding: 5px 10px 10px 10px;">
            <div style="text-align: center; font-size: 11pt; width: 245px; background-color: #5D7B9D; color: White; font-weight: bold;">Log in</div>
            
            <div class="label" style="padding-top: 8px;">Username</div>
            <div>
                <asp:TextBox ID="txtUser" runat="server" Width="200px" TabIndex="10"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ID="valUser" ControlToValidate="txtUser" Display="Dynamic" runat="server" ErrorMessage="Enter a user name."></asp:RequiredFieldValidator>
            <br />
            <div class="label">Password</div>
            <div>
                <asp:TextBox ID="txtPwd" runat="server" Width="200px" TabIndex="20" TextMode="Password"></asp:TextBox>                               
            </div>
            <asp:RequiredFieldValidator ID="valPwd" ControlToValidate="txtPwd" runat="server" Display="Dynamic" ErrorMessage="Please enter a password"></asp:RequiredFieldValidator>
            
            <div style="width: 100%; position: relative; text-align: center; padding-top: 10px;">    
                <asp:Button ID="btnLogin" runat="server" Text="Login" TabIndex="100" 
                    onclick="btnLogin_Click" />
            </div>           
        </div>
        <uc1:PopupMessage ID="ucPopupMsg" runat="server" />
    </div>
</asp:Content>
