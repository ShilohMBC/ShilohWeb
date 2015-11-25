<%@ Page Title="Member Entry" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="Member_Entry.aspx.cs" Inherits="ShilohWeb.Administration.Member_Entry" %>
<%@ Register src="/Controls/DateTimeEntry.ascx" tagname="DateEntry" tagprefix="uc1" %>
<%@ Register src="/Controls/PopUpMessage.ascx" tagname="PopupMessage" tagprefix="uc1" %>
<%@ Register src="/Controls/StatesList.ascx" tagname="States" tagprefix="uc1" %>
<%@ Register src="/Controls/TabsAdmin.ascx" tagname="AdminTabs" tagprefix="uc1" %>
<%@ Register src="/Controls/Address.ascx" tagname="Address" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <uc1:AdminTabs ID="ucAdminTabs" runat="server" SelectedIndex="2" SelectedCssClass="current" />
    
    <div class="defaultMargin" style="position: relative;"> 
        <h2>Member Entry</h2>
        <div>
            Creating a new member or editing existing member information.  All fields with a 
            <span class="required">red</span> label are required.
        </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" ValidationGroup="MemberVal" />
        
        <asp:Panel ID="pnlMemberInfo" runat="server" CssClass="prayerRequest">
            <fieldset>
                <legend>Contact Information</legend>
                <div style="padding-bottom: 5px;">        
                    <span class="label">Is Active</span>                                        
                    <asp:CheckBox ID="cbIsActive" runat="server" Checked="true" TabIndex="21" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span class="label">Status</span>                        
                    <asp:DropDownList ID="ddlStatus" runat="server" TabIndex="115">
                        <asp:ListItem Selected="True" Text="Joined" Value="1"></asp:ListItem>
                        <asp:ListItem Text="In Training" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Baptized" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Full Member" Value="4"></asp:ListItem>
                    </asp:DropDownList>                   
                </div>
                <div>
                    <label class="required">First Name</label>
                    <label class="required">Last Name</label>                    
                    <label class="required">Gender</label>
                </div>
                
                <div>
                    <asp:TextBox ID="txtFirstName" runat="server" Width="200px" TabIndex="5"></asp:TextBox>
                    <asp:TextBox ID="txtLastName" runat="server" Width="200px" TabIndex="15"></asp:TextBox>
                    &nbsp;
                    <span>Male</span> &nbsp;
                    <asp:RadioButton ID="rbSexMale" runat="server" GroupName="Gender" />
                    <span>Female</span> &nbsp;
                    <asp:RadioButton ID="rbSexFemale" runat="server" GroupName="Gender" />
                    <asp:RequiredFieldValidator ID="valFirstName" ControlToValidate="txtFirstName" Display="None"
                        ValidationGroup="MemberVal" runat="server" ErrorMessage="First name is missing."></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="valLastName" ControlToValidate="txtLastName" Display="None"
                        ValidationGroup="MemberVal" runat="server" ErrorMessage="Last name is missing."></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="valSex" ControlToValidate="txtFirstName" Display="None"
                        ValidationGroup="MemberVal" runat="server" ErrorMessage="Please select a gender."
                        OnServerValidate="valSex_ServerValidate"></asp:CustomValidator>
                </div>
                                            
                <div>
                    <label class="required" style="width: 100px;">Birth Date</label>
                    <label class="required" style="width: 104px;">Anniversary Date</label>
                    <label>Occupation</label>                    
                </div><br />
                <div>
                    <asp:TextBox ID="txtDOB" runat="server" TabIndex="22" MaxLength="10" Width="95px"></asp:TextBox>
                    <asp:TextBox ID="txtAnniversaryDate" runat="server" TabIndex="23" MaxLength="10" Width="95px"></asp:TextBox>
                    <asp:TextBox ID="txtOccupation" runat="server" TabIndex="25" Width="200px"></asp:TextBox>    
                    <asp:RequiredFieldValidator ID="valDOB" ControlToValidate="txtDOB" Display="None"
                        ValidationGroup="MemberVal" runat="server" ErrorMessage="Please enter a birth date."></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="valAnniversaryDate" ControlToValidate="txtAnniversaryDate"
                        Display="None" ValidationGroup="MemberVal" runat="server" ErrorMessage="Please enter an anniversary date."></asp:RequiredFieldValidator>
                </div>
                
            </fieldset>            
        </asp:Panel>
        
        <uc1:Address runat="server" ID="ucAddress" Caption="Home Address" ShowName="false"></uc1:Address>
                            
        <asp:Panel ID="pnlPhone" runat="server" CssClass="prayerRequest">
            <fieldset>
                <legend>Alternate Contact</legend>
                <div>
                    <label style="width: 106px;">Work Phone</label>
                    <label style="width: 112px;">Mobile Phone</label>
                    <label>Email</label>
                </div>
                <br />
                <div>
                    <asp:TextBox ID="txtPhoneWork" runat="server" TabIndex="65" Width="100px"></asp:TextBox>
                    <asp:TextBox ID="txtPhoneMobile" runat="server" TabIndex="68" Width="100px"></asp:TextBox>
                    <asp:TextBox ID="txtEmail" runat="server" TabIndex="35" Width="250px"></asp:TextBox>
                </div>
            </fieldset>
        </asp:Panel>
        
        <asp:Panel ID="pnlNotes" runat="server" CssClass="prayerRequest">
            <fieldset><legend>Notes or Special Instructions</legend>
                <asp:TextBox ID="txtNotes" TextMode="MultiLine" runat="server" TabIndex="75" Width="95%"
                    Height="75px"></asp:TextBox>
            </fieldset>
        </asp:Panel>
        
        <uc1:Address runat="server" ID="ucAddressEmergency" Caption="Emergency Address" ShowName="true"></uc1:Address>
                 
        <div style="width: 100%; position: relative; text-align: center; padding: 2px 5px 10px 5px;">
            <asp:Button ID="btnSave" runat="server" Text="Save Member" TabIndex="125" ValidationGroup="MemberVal"
                OnClick="btnSave_Click" />
            &nbsp; or &nbsp;
            <asp:LinkButton ID="lbCancel" runat="server" TabIndex="135" PostBackUrl="~/Administration/MemberHome.aspx">Cancel Member Entry</asp:LinkButton>
        </div>
        
        <asp:RegularExpressionValidator ID="valEmail" ControlToValidate="txtEmail" ValidationGroup="MemberVal"
            runat="server" ErrorMessage="Email is in an invalid format." Display="None" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator ID="valPhoneWork" runat="server" ControlToValidate="txtPhoneWork"
            Display="None" ValidationGroup="MemberVal" ErrorMessage="Work phone number is in an invalid format."
            ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator ID="valPhoneMobile" runat="server" ControlToValidate="txtPhoneMobile"
            Display="None" ValidationGroup="MemberVal" ErrorMessage="Mobile phone number is in an invalid format."
            ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
        <asp:Panel ID="pnlShowMsg" runat="server" CssClass="msgBox" Visible="false">
            <asp:Label ID="lblMsg" runat="server" Text="The member has been created."></asp:Label>
            <div style="position: relative; text-align: center; padding: 20px 5px; top: 25px;">
                <asp:Button ID="btnClose" runat="server" Text="Close Window" ValidationGroup="CloseMsg"
                    OnClick="btnClose_Click" />
            </div>
        </asp:Panel>      
        
        <uc1:PopupMessage id="ucPopupMsg" runat="server"></uc1:PopupMessage>
    </div>
</asp:Content>
