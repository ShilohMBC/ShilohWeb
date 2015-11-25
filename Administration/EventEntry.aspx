<%@ Page Title="Shiloh Missionary Baptist Church - Activity Scheduler" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="EventEntry.aspx.cs" Inherits="ShilohWeb.Administration.EventEntry" %>
<%@ Register src="/Controls/DateTimeEntry.ascx" tagname="DateEntry" tagprefix="uc1" %>
<%@ Register src="/Controls/PopUpMessage.ascx" tagname="PopupMessage" tagprefix="uc1" %>
<%@ Register src="/Controls/StatesList.ascx" tagname="States" tagprefix="uc1" %>
<%@ Register src="/Controls/TabsAdmin.ascx" tagname="AdminTabs" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<meta name="robots" content="all" />    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    
    <uc1:AdminTabs ID="ucAdminTabs" runat="server" SelectedIndex="1" SelectedCssClass="current" />
    
    <div class="defaultMargin" style="position: relative;">    
        <h2>Add Calendar Events</h2> 
        <div>
            You can create (or edit) an event that will appear on the calendar.  Please fill in
            all fields that appear in <span class="required">red</span> are required.
        </div>
        
        <asp:ScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="true"></asp:ScriptManager>
        
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="EventVal" DisplayMode="List" Font-Bold="true" />
        
        <asp:Panel ID="pnlEventEntry" runat="server" CssClass="prayerRequest"> 
            <fieldset>
                <legend>Event Information</legend>
                <div>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                    <table>
                        <tr>
                            <td class="label required">Start Date/Time: </td>
                            <td style="padding-right: 20px;">
                                <uc1:DateEntry ID="ucDateTimeEditStart" runat="server" />
                                <asp:CustomValidator ID="custvalStartDateTime" 
                                    runat="server" 
                                    ControlToValidate="txtEventName" 
                                    ErrorMessage="Please enter a valid start date/time" Display="None" 
                                    onservervalidate="custvalStartDateTime_ServerValidate"></asp:CustomValidator>
                            </td>
                            <td class="label required">End Date/Time: </td>
                            <td>
                                <uc1:DateEntry ID="ucDateTimeEditStop" runat="server" /> 
                                <asp:CustomValidator ID="custvalEndDateTime" 
                                    ControlToValidate="txtEventName" runat="server" 
                                    ErrorMessage="Please enter a valid end date/time" Display="None" 
                                    onservervalidate="custvalEndDateTime_ServerValidate"></asp:CustomValidator>
                            </td>
                        </tr>
                    </table>     
                    <uc1:PopUpMessage ID="ucPopupMessage" runat="server" />
                    </ContentTemplate>
                    </asp:UpdatePanel>                          
                </div>
                <div>
                    <label class="required">Event Name</label>
                    <label>(Example: MLK 2010 Celebration)</label>
                </div>
                <div>
                    <asp:TextBox ID="txtEventName" TabIndex="10" MaxLength="200" Width="679px" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="valEventName" ControlToValidate="txtEventName" Display="None" runat="server" ErrorMessage="Please enter an event name" ValidationGroup="EventVal"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <label class="required">Description</label>
                </div>          
                <div>
                    <asp:TextBox ID="txtDescription" TabIndex="20" runat="server" Width="679px" Height="150px" 
                        TextMode="MultiLine"></asp:TextBox>               
                    <asp:RequiredFieldValidator ID="valDescription" runat="server" 
                        ErrorMessage="Please enter an event description" Display="None" 
                        ControlToValidate="txtDescription" ValidationGroup="EventVal"></asp:RequiredFieldValidator>
                </div><br />
                <div>                    
                    <label>Occurence</label>
                    <asp:DropDownList ID="ddlFrequency" runat="server"  TabIndex="30">
                        <asp:ListItem Selected="True" Text="One Time Only" Value="1"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div>
                    <label>Event Hosted By</label>
                    <asp:DropDownList ID="ddlCommunity" runat="server" TabIndex="40">
                        <asp:ListItem Selected="True" Text="No Host" Value="0"></asp:ListItem>
                    </asp:DropDownList>                                    
                </div>
            </fieldset>
        </asp:Panel>
        
        <asp:Panel ID="pnlContactInfo" runat="server" CssClass="prayerRequest"> 
        <fieldset>
            <legend>Event Location</legend>
            <div>
                <label class="required">Location</label>
                <label>(Where is the event located?)</label>
            </div>
            <div>
                <asp:TextBox ID="txtLocation" runat="server" Width="410px" MaxLength="200" 
                     TabIndex="40"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valLocation" ControlToValidate="txtLocation" Display="None" runat="server" ErrorMessage="Please enter a location" ValidationGroup="EventVal"></asp:RequiredFieldValidator>
            </div>
            <div>
                <label>Address</label>
                <label>City</label>
                <label>State/ZIP</label>                
            </div>
            <div>
                <asp:TextBox ID="txtAddress" TabIndex="50" runat="server" Width="205px" MaxLength="200"></asp:TextBox>
                <asp:TextBox ID="txtCity"  TabIndex="60" runat="server" MaxLength="100" Width="204px"></asp:TextBox>
                <uc1:States ID="ucStates" runat="server" />
                <asp:TextBox ID="txtZIP" runat="server" Width="100px" TabIndex="80" MaxLength="6"></asp:TextBox>                
            </div>
            <div>
                <label>Contact Name</label>
                <label>Contact Phone</label>
                <label>Contact Email Address</label>                
            </div>
            <div>
                <asp:TextBox ID="txtContactName" runat="server" Width="204px" TabIndex="100"></asp:TextBox>
                <asp:TextBox ID="txtContactPhone" runat="server" Width="206px" TabIndex="110"></asp:TextBox>
                <asp:TextBox ID="txtContactEmail" runat="server" Width="200px" TabIndex="120"></asp:TextBox>                                                
            </div>            
            <div>
                <label>Contact Website Address</label>
            </div>            
            <div>
                <asp:TextBox ID="txtContactURL" runat="server" Width="616px" TabIndex="122"></asp:TextBox>

                <asp:RegularExpressionValidator ID="regexvalPhone" runat="server" 
                ControlToValidate="txtContactPhone" 
                ErrorMessage="Please enter a valid contact phone number: XXX-XXXX or XXX-XXX-XXXX" 
                ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" 
                ValidationGroup="EventVal"></asp:RegularExpressionValidator>                
                <asp:RegularExpressionValidator ID="regexevalEmail" runat="server" 
                ControlToValidate="txtContactEmail" 
                ErrorMessage="Please enter a valid contact e-mail address: user@domain.com" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ValidationGroup="EventVal"></asp:RegularExpressionValidator>
                
                <asp:RegularExpressionValidator ID="regexvalURL" Display="None" 
                    ControlToValidate="txtContactURL" runat="server" 
                    ErrorMessage="Please specifiy a valid web address: .http://www.address.com" 
                    ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
            </div>
                     
        </fieldset>        
        </asp:Panel>

        <div style="padding: 10px; text-align: center; position: relative; width: 90%;">
            <asp:Button ID="btnSubmit" runat="server" Text="Save Event"  TabIndex="300" 
                            ValidationGroup="EventVal" onclick="btnSubmit_Click" />
             or                             
            <asp:LinkButton ID="lbCancel" runat="server"  TabIndex="400" PostBackUrl="~/Administration/EventsList.aspx" Font-Size="11pt">Cancel Event Entry</asp:LinkButton>                                                        
        </div>   

        <!-- New Event Button -->                                        
        <div style="position: absolute; top: -8px; right: 0px; z-index: 104; border: 1px solid silver; vertical-align: middle; padding: 6px;">
            <a href="EventsList.aspx" title="Show a list of events.">
                <span class="label">List All Events</span>&nbsp;
                <img src="../Images/CalendarRefresh24x24.png" alt="New Event" style="width: 24px;height:24px;border: none; vertical-align: middle;" />                
            </a>
        </div>             
    </div>    
        

</asp:Content>