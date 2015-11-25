<%@ Page Title="Shiloh Missionary Baptist Church - Prayer Requests" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="PrayerRequest.aspx.cs" Inherits="ShilohWeb.PrayerRequest" %>
<%@ Register src="/Controls/StatesList.ascx" tagname="States" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<meta name="robots" content="all" />    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <div id="subjectHeading">
        <h1>Prayer Ministry</h1>
        <ul>
            <li><a href="About.aspx">About</a></li>
            <li class="current">Prayer Request</li>
            <li><a href="PrayerWall.aspx">Prayer Wall</a></li>
        </ul>
    </div>
    <div class="defaultMargin">
        <h2>Prayer Request</h2>
        <div class="prayerRequest">
            <p>Please fill out as much of the following information as possible so we can pray for your specific needs.  
            If you would like a call from a Pastor or Prayer Team Member, please provide your name and the best telephone number
            for contact. Once your request has be reviewed it will appear on the Prayer Wall 
            <span style="text-decoration:underline; font-weight: bold">unless</span> it was marked as confidential in which case it will
            not appear on the Prayer Wall. </p>
            <p>Thank you for allowing us to join you concerning your Prayer Needs! We care and will
                be praying for you and may God bless you.</p>
        </div>                
        
        <asp:Literal ID="litError" runat="server" Visible="false">
        </asp:Literal>
        
        <asp:Panel ID="pnlContactInfo" runat="server" CssClass="prayerRequest">               
            <fieldset>
                <legend>Contact Information</legend>
                <div>
                    <label>First Name</label>
                    <label>Last Name</label>                    
                </div><br />                
                <div>
                    <asp:ValidationSummary ID="ValidationSummary1" DisplayMode="List" ShowSummary="true" runat="server" />                             
                    <asp:TextBox ID="txtFirstName" runat="server" Width="200" MaxLength="100" TabIndex="10"></asp:TextBox>               
                    <asp:RequiredFieldValidator ID="reqFirstName" runat="server" 
                        ErrorMessage="Please enter a first name" Display="None" 
                        ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtLastName" runat="server" Width="200" MaxLength="100" TabIndex="13"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqLastName" runat="server" 
                        ErrorMessage="Please enter a last name" Display="None" 
                        ControlToValidate="txtLastName"></asp:RequiredFieldValidator>                                        
                </div><br />
                <div>                                        
                    <label>Check box if request is confidential</label>
                    <asp:CheckBox ID="cbIsConfidential" runat="server"/>                    
                    <div class="required" style="font-size: 10pt;">(Note: all requests will appear on the prayer wall unless they are marked confidential)</div>
                </div><br />
                <div>
                    <label class="twoCols">Street Address (with Apt# or Unit#)</label>
                </div><br />
                <div>
                    <asp:TextBox ID="txtAddress" runat="server" Width="400" TabIndex="20"></asp:TextBox>
                </div><br />
                <div>
                    <label>City</label>
                    <label>State/Zip</label>
                </div><br />
                <div>
                    <asp:TextBox ID="txtCity" runat="server" Width="200" MaxLength="50" TabIndex="30"></asp:TextBox>    
                    <uc1:States ID="ucStates" runat="server" />                    
                    <asp:TextBox ID="txtZIP" runat="server" Width="75" MaxLength="10" TabIndex="34"></asp:TextBox>
                </div><br />
                <div>
                    <label>Phone</label>
                    <label>Time To Call</label>                
                </div><br />
                <div>
                    <asp:TextBox ID="txtPhone" runat="server" Width="200" MaxLength="12" TabIndex="40"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="regexvalPhone" runat="server" 
                        ErrorMessage="The phone number format is invalid. Should be (xxx-xxxx or xxx-xxx-xxxx)" 
                        Display="None" ControlToValidate="txtPhone" 
                        ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                    <asp:DropDownList ID="ddlBestTimeToCall" runat="server" TabIndex="42">
                        <asp:ListItem Selected="True" Text="Do Not Call" Value="NoCall"></asp:ListItem>
                        <asp:ListItem Text="Call In the Morning" Value="Morning"></asp:ListItem>
                        <asp:ListItem Text="Call In the Afternoon" Value="Afternoon"></asp:ListItem>
                        <asp:ListItem Text="Call At Night (after 5pm)" Value="Night"></asp:ListItem>
                    </asp:DropDownList>
                </div><br />
                <div>
                    <label class="twoCols">Email Address (username@domain.com)</label>
                </div><br />
                <div>
                    <asp:TextBox ID="txtEmail" runat="server" MaxLength="200" Width="300" TabIndex="50"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="regexvalEmail" Display="Dynamic" 
                        runat="server" ErrorMessage="The format for your e-mail is invalid." 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ControlToValidate="txtEmail"></asp:RegularExpressionValidator>
                </div><br />
            </fieldset>
        </asp:Panel>
        
        <asp:Panel ID="pnlPrayerNeeds" runat="server" CssClass="prayerRequest">
            <fieldset>
                <legend>Prayer Request</legend>
                
                <div>
                    <asp:TextBox ID="txtPrayerNeeds" runat="server" TextMode="MultiLine" Width="600px" Height="100px" TabIndex="100"></asp:TextBox>
                </div>
                <div style="margin-top: 10px;">
                    <label>&nbsp;</label>
                    <label>No</label>
                    <label>Yes</label>                    
                </div><br />
                <div>
                    <label>Is anyone in danger?</label>
                    <label><asp:RadioButton ID="rbInDangerNo" runat="server" Checked="true" TabIndex="200" GroupName="InDanger" /></label>
                    <label><asp:RadioButton ID="rbInDangerYes" runat="server" TabIndex="210" GroupName="InDanger" /></label>
                </div><br />                
                <div>
                    <label>Is someone in the Hospital?</label>
                    <label><asp:RadioButton ID="rbInHospitalNo" runat="server" Checked="true"  TabIndex="310" GroupName="InHospital"/></label>
                    <label><asp:RadioButton ID="rbInHospitalYes" runat="server"  TabIndex="320" GroupName="InHospital"/></label>
                </div><br />
                <div>
                    <label>Would you like a hospital visit?</label>
                    <label><asp:RadioButton ID="rbVisitNo" runat="server" Checked="true" TabIndex="400" GroupName="DoVisit" /></label>
                    <label><asp:RadioButton ID="rbVisitYes" runat="server" TabIndex="410" GroupName="DoVisit" /></label>
                </div><br />
                <div>
                    <label>&nbsp;</label>
                    <label>Hospital Name</label>
                    <label>Room Number</label>
                </div><br />
                <div>
                    <label>&nbsp;</label>
                    <asp:TextBox ID="txtHospitalName" runat="server" Width="200px" MaxLength="200" TabIndex="500"></asp:TextBox>
                    <asp:TextBox ID="txtHospitalRoom" runat="server" Width="200px" MaxLength="50" TabIndex="510"></asp:TextBox>
                </div><br />   
                <div>
                    <label>Selected needed resources or referrals:</label>
                </div><br />
                <div>
                    <asp:CheckBoxList ID="cblReferrals" runat="server" Width="400px" 
                        RepeatColumns="4" CssClass="rbLabel" TextAlign="Left" TabIndex="600" >
                        <asp:ListItem Text="Personal"></asp:ListItem>
                        <asp:ListItem Text="Marriage"></asp:ListItem>
                        <asp:ListItem Text="Teens"></asp:ListItem>
                        <asp:ListItem Text="Recovery"></asp:ListItem>
                    </asp:CheckBoxList>
                </div>
                <div>
                    <label>Special Requests/Instructions</label>
                </div>
                <div>
                    <asp:TextBox ID="txtSpecialInstructions" runat="server" Width="600px" 
                        Height="100px"  TabIndex="700" TextMode="MultiLine"></asp:TextBox>
                </div>
            </fieldset>
        </asp:Panel>
        
        <div style="text-align: center; position: relative; width: 100%; padding-bottom: 10px;">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit Prayer Request" 
                TabIndex="1100" onclick="btnSubmit_Click" />
        </div>
        
        <asp:Panel ID="pnlShowMsg" runat="server" CssClass="msgBox" Visible="false">            
            <asp:Label ID="lblMsg" runat="server" Text="Your prayer request has submitted to the Prayer Team. Thank you and God Bless!"></asp:Label>
             
             <div style="position: relative; text-align: center; padding: 20px 5px; top: 25px;">
                <asp:Button ID="btnClose" runat="server" Text="Close Window" ValidationGroup="CloseMsg" 
                     onclick="btnClose_Click" />
            </div>
        </asp:Panel>
        
        <asp:Literal ID="litMailMsg" Visible="false" runat="server">
            <p>Hello,</p>
            <p>
                A new prayer request has been submitted on the Shiloh website. Below is the person who submitted the request: 
            </p>
               
            <b>Requester: </b>%name%<br />
            <b>Phone: </b>%phone%<br />
            <b>Email: </b>%email%<br /><br />
            
            <p>                                
                To review this new request do the following:                
            </p>
            <ol>
                <li>Go to the Shiloh website: http://www.shiloh2000.com </li>
                <li>Sign in by clicking on the "Sign in" link in the upper right hand corner of the home page.</li>
                <li>Once signed in, click on the "Admin" link in the upper right hand corner of the page, second line.</li>
                <li>Click on the "List Prayer Requests" link located in the <b>Prayer Requests</b> section of the page.</li>               
            </ol>
            <p>
                All of the prayer requests are listed from the most recent to the oldest. To view and process the prayer 
                request, click on the "click here to process" link (or the pencil icon).  Further instructions are listed on the
                prayer response page on how to process a prayer request. You will have up to 90 minutes to respond to the prayer 
                request until your session times out. If there are any additional questions, please contact the website administrator.
            </p>
            <p>
                Just as a reminder, no prayer request will be displayed on the Prayer Wall until it has been assigned to a staff member. 
                If the request is confidential, then it will <b>NOT</b> appear on the wall at all.
            </p>
            <p>
                Thank you.
            </p>
        </asp:Literal>
   </div>
</asp:Content>
