<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Address.ascx.cs" Inherits="ShilohWeb.Controls.Address" %>
<%@ Register src="/Controls/StatesList.ascx" tagname="States" tagprefix="uc1" %>

<div style="position: relative;">
<fieldset>
    <legend><asp:Label ID="lblTitle" runat="server" Text="Address"></asp:Label></legend>

    <table>
        <tr>
            <td style="width: 75px;" class="label">
                <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label> 
            </td>
            <td colspan="3">
                <asp:TextBox ID="txtName" runat="server" OnTextChanged="TextBox_Changed" Width="395px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 75px;" class="label">Street</td>
            <td colspan="3">
                <asp:TextBox ID="txtStreetAddress" runat="server" OnTextChanged="TextBox_Changed"
                    Width="395px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valStreetAddress" runat="server" ControlToValidate="txtStreetAddress"
                    ErrorMessage="Enter street address" Display="Dynamic" ValidationGroup="AddressValidation"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="label">
                City
            </td>
            <td>
                <asp:TextBox ID="txtCity" runat="server" OnTextChanged="TextBox_Changed"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valCity" runat="server" ControlToValidate="txtCity"
                    ErrorMessage="Enter city" Display="Dynamic" ValidationGroup="AddressValidation"></asp:RequiredFieldValidator>
            </td>
            <td class="label">
                State
            </td>
            <td>
                <uc1:States ID="ucStates" runat="server" />
                <asp:CustomValidator ID="custvalStates" ControlToValidate="txtCountry" runat="server"
                    ErroMessage="CustomValidator"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td class="label">
                ZIP</td>
            <td>
                <asp:TextBox ID="txtZip" runat="server" OnTextChanged="TextBox_Changed"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valZip" runat="server" ControlToValidate="txtZip"
                    ErrorMessage="Enter ZIP Code" Display="Dynamic" ValidationGroup="AddressValidation"></asp:RequiredFieldValidator>
            </td>
            <td class="label">
            Country
            </td>
            <td>
                <asp:TextBox ID="txtCountry" runat="server" Text="USA" OnTextChanged="TextBox_Changed"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valCountry" runat="server" ControlToValidate="txtCountry"
                    ErrorMessage="Enter country" Display="Dynamic" ValidationGroup="AddressValidation"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="label">
                Phone</td>
            <td>
                <asp:TextBox ID="txtPhone" runat="server" OnTextChanged="TextBox_Changed"></asp:TextBox>
                <asp:RegularExpressionValidator ID="regexvalPhone" runat="server" ErrorMessage="Invalid phone number format."
                    Display="Dynamic" ControlToValidate="txtPhone" ValidationGroup="AddressValidation"></asp:RegularExpressionValidator>
            </td>
            <td class="label">
                FAX
            </td>
            <td>
                <asp:TextBox ID="txtFax" runat="server" OnTextChanged="TextBox_Changed"></asp:TextBox>
                <asp:RegularExpressionValidator ID="regexvalFAX" runat="server" ControlToValidate="txtFAX"
                    ErrorMessage="Invalid FAX number format." Display="Dynamic" ValidationGroup="AddressValidation"></asp:RegularExpressionValidator>
            </td>
        </tr>
    </table>    
</fieldset>
</div>