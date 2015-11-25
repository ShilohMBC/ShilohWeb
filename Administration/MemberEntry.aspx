<%@ Page Title="Shiloh Missionary Baptist Church - Member Entry" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="MemberEntry.aspx.cs" Inherits="ShilohWeb.Admimnistration.MemberEntry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<meta name="robots" content="all" />    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <div id="subjectHeading">
        <h1>Administration</h1>
        <ul>
            <li><a href="Home.aspx">Home</a></li>
            <li><a href="CommunityEntry.aspx">Communities</a></li>
            <li><a href="EventEntry.aspx">Events</a></li>
            <li class="current">Members</li>
            <li><a href="PromotionScheduler.aspx">Promotions</a></li>
        </ul>
    </div>
    <div class="defaultMargin">
        <h2>Member Maintenance</h2>
        <p>Add member information by completing the form below. The member information is displayed in the sample area. Update member information by selecting the desired community from the member list, then make changes as desired.</p>
        
        <!-- Select a person to edit member information -->
        <asp:DropDownList ID="personDropList" runat="server" AutoPostBack="True" 
            DataSourceID="personDataSource" DataTextField="fullName" DataValueField="ID">
        </asp:DropDownList>
        
        <asp:FormView ID="personForm" runat="server" AllowPaging="True" 
            DataKeyNames="ID" DataSourceID="personDataSource">
            <EditItemTemplate>
                ID:
                <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                <br />
                givenName:
                <asp:TextBox ID="givenNameTextBox" runat="server"  Text='<%# Bind("givenName") %>' />
                <br />
                surname:
                <asp:TextBox ID="surnameTextBox" runat="server" Text='<%# Bind("surname") %>' />
                <br />
                sex:
                <asp:TextBox ID="sexTextBox" runat="server" Text='<%# Bind("sex") %>' />
                <br />
                title:
                <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                <br />
                familiarName:
                <asp:TextBox ID="familiarNameTextBox" runat="server" Text='<%# Bind("familiarName") %>' />
                <br />
                streetAddress:
                <asp:TextBox ID="streetAddressTextBox" runat="server" 
                    Text='<%# Bind("streetAddress") %>' />
                <br />
                city:
                <asp:TextBox ID="cityTextBox" runat="server" Text='<%# Bind("city") %>' />
                <br />
                state:
                <asp:TextBox ID="stateTextBox" runat="server" Text='<%# Bind("state") %>' />
                <br />
                emailAddress:
                <asp:TextBox ID="emailAddressTextBox" runat="server" 
                    Text='<%# Bind("emailAddress") %>' />
                <br />
                password:
                <asp:TextBox ID="passwordTextBox" runat="server" 
                    Text='<%# Bind("password") %>' />
                <br />
                photoPath:
                <asp:TextBox ID="photoPathTextBox" runat="server" 
                    Text='<%# Bind("photoPath") %>' />
                <br />
                fullName:
                <asp:TextBox ID="fullNameTextBox" runat="server" 
                    Text='<%# Bind("fullName") %>' />
                <br />
                telephone:
                <asp:TextBox ID="telephoneTextBox" runat="server" 
                    Text='<%# Bind("telephone") %>' />
                <br />
                zipCode:
                <asp:TextBox ID="zipCodeTextBox" runat="server" Text='<%# Bind("zipCode") %>' />
                <br />
                login:
                <asp:TextBox ID="loginTextBox" runat="server" Text='<%# Bind("login") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                givenName:
                <asp:TextBox ID="givenNameTextBox" runat="server" 
                    Text='<%# Bind("givenName") %>' />
                <br />
                surname:
                <asp:TextBox ID="surnameTextBox" runat="server" Text='<%# Bind("surname") %>' />
                <br />
                sex:
                <asp:TextBox ID="sexTextBox" runat="server" Text='<%# Bind("sex") %>' />
                <br />
                title:
                <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                <br />
                familiarName:
                <asp:TextBox ID="familiarNameTextBox" runat="server" 
                    Text='<%# Bind("familiarName") %>' />
                <br />
                streetAddress:
                <asp:TextBox ID="streetAddressTextBox" runat="server" 
                    Text='<%# Bind("streetAddress") %>' />
                <br />
                city:
                <asp:TextBox ID="cityTextBox" runat="server" 
                    Text='<%# Bind("city") %>' />
                <br />
                state:
                <asp:TextBox ID="stateTextBox" runat="server" 
                    Text='<%# Bind("state") %>' />
                <br />
                emailAddress:
                <asp:TextBox ID="emailAddressTextBox" runat="server" 
                    Text='<%# Bind("emailAddress") %>' />
                <br />
                password:
                <asp:TextBox ID="passwordTextBox" runat="server" 
                    Text='<%# Bind("password") %>' />
                <br />
                photoPath:
                <asp:TextBox ID="photoPathTextBox" runat="server" 
                    Text='<%# Bind("photoPath") %>' />
                <br />
                fullName:
                <asp:TextBox ID="fullNameTextBox" runat="server" 
                    Text='<%# Bind("fullName") %>' />
                <br />
                telephone:
                <asp:TextBox ID="telephoneTextBox" runat="server" 
                    Text='<%# Bind("telephone") %>' />
                <br />
                zipCode:
                <asp:TextBox ID="zipCodeTextBox" runat="server" 
                    Text='<%# Bind("zipCode") %>' />
                <br />
                login:
                <asp:TextBox ID="loginTextBox" runat="server" Text='<%# Bind("login") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                ID:
                <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                <br />
                givenName:
                <asp:Label ID="givenNameLabel" runat="server" Text='<%# Bind("givenName") %>' />
                <br />
                surname:
                <asp:Label ID="surnameLabel" runat="server" Text='<%# Bind("surname") %>' />
                <br />
                sex:
                <asp:Label ID="sexLabel" runat="server" Text='<%# Bind("sex") %>' />
                <br />
                title:
                <asp:Label ID="titleLabel" runat="server" Text='<%# Bind("title") %>' />
                <br />
                familiarName:
                <asp:Label ID="familiarNameLabel" runat="server" 
                    Text='<%# Bind("familiarName") %>' />
                <br />
                streetAddress:
                <asp:Label ID="streetAddressLabel" runat="server" 
                    Text='<%# Bind("streetAddress") %>' />
                <br />
                city:
                <asp:Label ID="cityLabel" runat="server" Text='<%# Bind("city") %>' />
                <br />
                state:
                <asp:Label ID="stateLabel" runat="server" Text='<%# Bind("state") %>' />
                <br />
                emailAddress:
                <asp:Label ID="emailAddressLabel" runat="server" 
                    Text='<%# Bind("emailAddress") %>' />
                <br />
                password:
                <asp:Label ID="passwordLabel" runat="server" Text='<%# Bind("password") %>' />
                <br />
                photoPath:
                <asp:Label ID="photoPathLabel" runat="server"  
                    Text='<%# Bind("photoPath") %>' />
                <br />
                fullName:
                <asp:Label ID="fullNameLabel" runat="server" Text='<%# Bind("fullName") %>' />
                <br />
                telephone:
                <asp:Label ID="telephoneLabel" runat="server" Text='<%# Bind("telephone") %>' />
                <br />
                zipCode:
                <asp:Label ID="zipCodeLabel" runat="server" Text='<%# Bind("zipCode") %>' />
                <br />
                login:
                <asp:Label ID="loginLabel" runat="server" Text='<%# Bind("login") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                    CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                    CommandName="New" Text="New" />
            </ItemTemplate>
            <EmptyDataTemplate>
                There are no individuals in this community.
            </EmptyDataTemplate>
        </asp:FormView>
    </div>
    <asp:ObjectDataSource ID="personDataSource" runat="server" TypeName="Person" 
        DeleteMethod="DeletePerson" InsertMethod="AddPerson" 
        SelectMethod="GetPerson" UpdateMethod="UpdatePerson">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="givenName" Type="String" />
            <asp:Parameter Name="surname" Type="String" />
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="familiarName" Type="String" />
            <asp:Parameter Name="sex" Type="String" />
            <asp:Parameter Name="telephone" Type="String" />
            <asp:Parameter Name="extension" Type="String" />
            <asp:Parameter Name="emailAddress" Type="String" />
            <asp:Parameter Name="streetAddress" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="state" Type="String" />
            <asp:Parameter Name="zipCode" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="photoPath" Type="String" />
            <asp:Parameter Name="status" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="givenName" Type="String" />
            <asp:Parameter Name="surname" Type="String" />
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="familiarName" Type="String" />
            <asp:Parameter Name="sex" Type="String" />
            <asp:Parameter Name="telephone" Type="String" />
            <asp:Parameter Name="extension" Type="String" />
            <asp:Parameter Name="emailAddress" Type="String" />
            <asp:Parameter Name="streetAddress" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="state" Type="String" />
            <asp:Parameter Name="zipCode" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="photoPath" Type="String" />
            <asp:Parameter Name="status" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="givenName" Type="String" />
            <asp:Parameter Name="surname" Type="String" />
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="familiarName" Type="String" />
            <asp:Parameter Name="sex" Type="String" />
            <asp:Parameter Name="telephone" Type="String" />
            <asp:Parameter Name="extension" Type="String" />
            <asp:Parameter Name="emailAddress" Type="String" />
            <asp:Parameter Name="streetAddress" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="state" Type="String" />
            <asp:Parameter Name="zipCode" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="photoPath" Type="String" />
            <asp:Parameter Name="status" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    
    <!-- Show existing community memberships -->
    <h3>eval</h3>
    <asp:BulletedList ID="BulletedList1" runat="server" 
        DataSourceID="personMembership" DataTextField="ID" 
        DataValueField="communityID">
    </asp:BulletedList>
    
    <!-- Show comunityies that can be added -->
    <asp:DropDownList ID="communityList" runat="server">
    </asp:DropDownList>
    
    <asp:ObjectDataSource ID="personMembership" runat="server" 
        DeleteMethod="DeleteMembership" InsertMethod="AddMembership" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetMembershipByPerson" TypeName="Membership" 
        UpdateMethod="UpdateMembership">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="communityID" Type="Int32" />
            <asp:Parameter Name="personID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="communityID" Type="Int32" />
            <asp:Parameter Name="personID" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="Session.currentUser" Name="personID" 
                SessionField="currentPerson" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="communityID" Type="Int32" />
            <asp:Parameter Name="personID" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
    
</asp:Content>
