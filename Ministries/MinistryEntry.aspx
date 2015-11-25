<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="MinistryEntry.aspx.cs" Inherits="ShilohWeb.Ministries.MinistryEntry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<meta name="robots" content="all" />
	<style type="text/css" media="screen">
		P { font-size: 10pt; }
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
	
	<div id="subjectHeading">
		<h1>Ministry Entry</h1>		
		<ul>
			<li><a href="MinstryEntryHome.aspx">Home</a></li>
			<li class="current">Ministry Entry</li>
		</ul>
	</div>
	<div class="defaultMargin">
		<h2>Ministry Information</h2>
		<p>
		In an attempt to update the ministry information on our website, we are collecting information from each ministry leader.  Please 
		type in as much information about your ministry as possible in the fields below.  Once you are done, you can submit the information 
		and someone will review the information and edit it as necessary.  Once everything has been verified, then your ministry will have a  
		web page built specifically for it.  It will then be posted on the Shiloh website to be accessed by our members and the public.
		</p>
		<p>
		If you are unable to or don't want to enter your information online you can download the 
		<a target="downloadwin" href="../Downloads/ShilohMinistryInfoEntry.pdf" title="Download ministry information form">ministry information form</a>, 
		print it out, fill it out, and then leave it at the front office or with Rev. Edwenia Brown. 
		<a target="downloadwin" href="../Downloads/ShilohMinistryInfoEntry.pdf" title="Download ministry information form">
				click here</a> to download the form.
		</p>
				
		<label>All fields in <span class="required">red</span> are required.</label>
		<br />
		<asp:UpdatePanel ID="UpdatePanel1" runat="server">
		<ContentTemplate>
			<asp:Label ID="lblMsg" runat="server" Text="" CssClass="required"></asp:Label>
			<fieldset>				
					<legend class="required">Ministry Name</legend>						
				<div>
					<asp:DropDownList ID="ddlMinistry" runat="server" 
						onselectedindexchanged="ddlMinistry_SelectedIndexChanged" AppendDataBoundItems="True" 
						AutoPostBack="True">
						<asp:ListItem Selected="True" Text="-- Select Ministry --" Value="-1">
						</asp:ListItem>
					</asp:DropDownList>
					<asp:RequiredFieldValidator ID="valreqMinistry" runat="server" ControlToValidate="ddlMinistry"
						InitialValue="-1" ErrorMessage="Select a ministry!">  
					</asp:RequiredFieldValidator>
				</div>
			</fieldset>
			<fieldset>
				<legend>Contact Info</legend>
				<div>
					<label class="required">Name</label>
					<label class="required">E-mail</label>
					<label class="required">Phone 1</label>
					<label>Phone 2</label>
				</div>
				<div>
					<asp:TextBox ID="txtContactName" runat="server" Width="175"></asp:TextBox>			
					<asp:TextBox ID="txtContactEmail" runat="server" Width="175"></asp:TextBox>						
					<asp:TextBox ID="txtContactPhone1" runat="server" Width="175" MaxLength="15"></asp:TextBox>										
					<asp:TextBox ID="txtContactPhone2" runat="server" Width="175" MaxLength="15"></asp:TextBox>
				</div>
				
				<asp:RequiredFieldValidator ID="valreqName" runat="server" ErrorMessage="Enter your name."
					Display="Dynamic" ControlToValidate="txtContactName" CssClass="required"></asp:RequiredFieldValidator>
				<asp:RequiredFieldValidator ID="valreqEmail" runat="server" ErrorMessage="Enter your email address."
					ControlToValidate="txtContactEmail" CssClass="required" Display="Dynamic"></asp:RequiredFieldValidator>
				<asp:RegularExpressionValidator ID="valregexEmail" runat="server" ErrorMessage="Invalid e-mail address."
					ControlToValidate="txtContactEmail" CssClass="required" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
				<asp:RequiredFieldValidator ID="valreqPhone1" runat="server" ErrorMessage="Enter a phone number."
					CssClass="required" Display="Dynamic" ControlToValidate="txtContactPhone1"></asp:RequiredFieldValidator>
				<asp:RegularExpressionValidator ID="valregexPhone1" runat="server" ErrorMessage="Invalid phone number (xxx-xxx-xxxx)"
					ControlToValidate="txtContactPhone1" CssClass="required" Display="Dynamic" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
			</fieldset>
			
			<fieldset>
				<legend class="required">Short Summary</legend>				
				<div style="font-size: 10pt;">
					Please enter 1 or 2 sentence brief description of your ministry. To be used on the 
					<a target="entryexwin" href="../Ministries.aspx" title="Ministries Home Page">Ministries page</a>.				
				</div>
				<asp:TextBox ID="txtSummaryBrief" runat="server" TextMode="MultiLine" Height="75px" 
					Width="780px" MaxLength="500"></asp:TextBox>
				<asp:RequiredFieldValidator ID="valreqSummary" runat="server" ErrorMessage="Enter summary information"
					CssClass="required" Display="Dynamic" ControlToValidate="txtSummaryBrief"></asp:RequiredFieldValidator>
			</fieldset>
			
			<fieldset>
				<legend class="required">Detailed Description</legend>
				<div style="font-size: 10pt;">
					Please enter a detailed description about your ministry.  It should be at least a paragraph or more. It will
					be edited and put into web page on it's own.
				</div>
				<asp:TextBox ID="txtSummaryDetailed" runat="server" TextMode="MultiLine" Height="150px" Width="780px"></asp:TextBox>
				<asp:RequiredFieldValidator ID="valreqDescription" runat="server" ErrorMessage="Enter ministry description."
					CssClass="required" Display="Dynamic" ControlToValidate="txtSummaryDetailed"></asp:RequiredFieldValidator>
			</fieldset>
			
			<fieldset>
				<legend>Program List</legend>
				<div style="font-size: 10pt;">
					Please enter a list of programs sponsored by the ministry, if any.  Examples would be: Children's Summer Camp,
					Mother's Day Choral Concert, Annual Church Picnic. Include dates if possible.  Put each program on a separate line.
				</div>
				<asp:TextBox ID="txtPrograms" runat="server" TextMode="MultiLine" Height="75px" Width="780px"></asp:TextBox>
			</fieldset>
			
			<fieldset>
				<legend>Misc Information</legend>
				<div style="font-size: 10pt;">
					Please include additional information about your ministry.  This includes additional contact information 
					for the ministry, any external web links for the ministry (i.e. social networking links, outside web pages 
					etc.)
				</div>
				<asp:TextBox ID="txtMiscInfo" runat="server" TextMode="MultiLine" Height="75px" Width="780px"></asp:TextBox>
			</fieldset>
			
			<fieldset>
				<legend>Supporting Ministries</legend>
				<div style="font-size: 10pt;">
					List all of the other ministries that support this ministry or are underneath this ministry.  Put each 
					ministry on a separate line.  
				</div>
				<asp:TextBox ID="txtSupport" runat="server" TextMode="MultiLine" Height="75px" Width="780px"></asp:TextBox>
			</fieldset>
			
			<div style="width: 100%; text-align: center; nargin-top: 20px;">
				<asp:Button ID="btnSubmit" runat="server" Text="Submit Ministry Information" 
					onclick="btnSubmit_Click" /> &nbsp;
				<asp:HyperLink ID="hlCancel" runat="server" NavigateUrl="~/Ministries/MinstryEntryHome.aspx">Cancel</asp:HyperLink>
			</div>
			
			</ContentTemplate>
		</asp:UpdatePanel>
	</div>
	<br />
</asp:Content>
