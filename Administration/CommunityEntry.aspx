<%@ Page Title="Shiloh Missionary Baptist Church - Community Entry" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="CommunityEntry.aspx.cs" Inherits="ShilohWeb.Admimnistration.CommunityEntry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="robots" content="all" />    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">    
    <div id="subjectHeading">
        <h1>Administration</h1>
        <ul>
            <li><a href="Home.aspx">Home</a></li>
            <li class="current">Communities</li>
            <li><a href="EventEntry.aspx">Events</a></li>
            <li><a href="MemberEntry.aspx">Members</a></li>
            <li><a href="PromotionScheduler.aspx">Promotions</a></li>
        </ul>
    </div>
    <div class="defaultMargin">
        <!-- Menu list to switch between communities -->
        <!-- TODO: This should be a user control -->
        <div class="entryMenu">
            <h2>Select a Community</h2>
            <asp:Repeater ID="communityMenu" runat="server" 
                DataSourceID="communityMenuDataSource">
                <HeaderTemplate><ul></HeaderTemplate>
                    <ItemTemplate><li><a href='CommunityEntry.aspx?ID=<%# Eval("ID") %>'><%# Eval("name") %></a></li></ItemTemplate>
                <FooterTemplate></ul></FooterTemplate>
            </asp:Repeater>
            <asp:ObjectDataSource ID="communityMenuDataSource" runat="server" TypeName="Community"
                 SelectMethod="GetCommunity">
            </asp:ObjectDataSource>
        </div>
        
        <!-- Show details for the selected community - each template shares common HTML and CSS formatting -->
        <!-- Only show editing controls to community coordinators -->
        <asp:FormView ID="communityForm" runat="server" AllowPaging="True" DataSourceID="communityDataSource" DataKeyNames="ID" >
            <ItemTemplate>
                <h2><asp:Label ID="nameLabel" runat="server" Text='<%# Bind("name") %>' /></h2>
                <p>
                    <asp:Label ID="descriptionLabel" runat="server" Text='<%# Bind("description") %>' />
                </p>
                <fieldset>
                    <legend><asp:Label ID="typeLabel" runat="server" Text='<%# Bind("type") %>' />&nbsp;Contact Information</legend>
                    <dl>
                        <dt>Telephone:</dt><dd><asp:Label ID="telephoneLabel" runat="server" Text='<%# Bind("telephone") %>' /></dd>
                        <dt>Email Address:</dt><dd><asp:Label ID="emailAddressLabel" runat="server" Text='<%# Bind("emailAddress") %>' /></dd>
                        <dt>Mailing Address:</dt>
                            <dd>
                                <asp:Label ID="streetAddressLabel" runat="server" Text='<%# Bind("streetAddress") %>' />
                                <br />
                                <asp:Label ID="cityLabel" runat="server" Text='<%# Bind("city") %>' />
                                <asp:Label ID="stateLabel" runat="server" Text='<%# Bind("state") %>' />
                                <asp:Label ID="zipCodeLabel" runat="server" Text='<%# Bind("zipCode") %>' />
                            </dd>
                    </dl>
                </fieldset>
                <b>It is part of the church community:&nbsp;<b>
                <asp:Label ID="parentIDLabel" runat="server" Text='<%# Bind("parentID") %>' />
                <br />
                imagePath: <asp:Label ID="imagePathLabel" runat="server" Text='<%# Bind("imagePath") %>' />
                <br />
                status: <asp:Label ID="statusLabel" runat="server" Text='<%# Bind("status") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"  />
                &nbsp;
                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' CssClass="itemHeadingEntry" Width="30.0em" />
                <br />
                <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' Wrap="true" CssClass="itemTextBoxEntry" Width="30.0em" Height="5.0em"/>
                <fieldset>
                    <legend>
                        <asp:DropDownList ID="communityTypeDropList" runat="server" DataTextField='<%# Bind("type") %>' DataValueField='<%# Bind("type") %>' CssClass="legendDropList">
                            <asp:ListItem Text="Church" Value="Church">Church</asp:ListItem>
                            <asp:ListItem Text="Ministry" Value="Ministry">Ministry</asp:ListItem>
                            <asp:ListItem Text="Program" Value="Program">Program</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;Contact Information
                    </legend>
                    <dl>
                        <dt>Telephone:</dt><dd><asp:TextBox ID="telephoneTextBox" runat="server" Text='<%# Bind("telephone") %>' /></dd>
                        <dt>Email Address:</dt><dd><asp:TextBox ID="emailAddressTextBox" runat="server" Text='<%# Bind("emailAddress") %>' /></dd>
                        <dt>Mailing Address:</dt>
                            <dd>
                                <asp:TextBox ID="streetAddressTextBox" runat="server" Text='<%# Bind("streetAddress") %>' />
                                <br />
                                <asp:TextBox ID="cityTextBox" runat="server" Text='<%# Bind("city") %>'  />
                                <asp:TextBox ID="stateTextBox" runat="server" Text='<%# Bind("state") %>' />
                                <asp:TextBox ID="zipCodeTextBox" runat="server" Text='<%# Bind("zipCode") %>' />
                            </dd>
                    </dl>
                </fieldset>
                <b>It is part of the church community:&nbsp;<b>
                <asp:DropDownList ID="communityParentDropList" runat="server"
                    DataSourceID="communityParentDataSource" DataTextField='<%# Bind("name") %>' DataValueField='<%# Bind("ID") %>' >
                </asp:DropDownList>
                imagePath:
                <asp:TextBox ID="imagePathTextBox" runat="server"  Text='<%# Bind("imagePath") %>' />
                <br />
                status:
                <asp:TextBox ID="statusTextBox" runat="server" Text='<%# Bind("status") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;
                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                name:
                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' CssClass="itemHeadingEntry" Width="30.0em" />
                description:
                <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' Wrap="true" CssClass="itemTextBoxEntry" Width="30.0em" Height="5.0em" />
                <br />
                <fieldset>
                    <legend>
                        <asp:DropDownList ID="communityTypeDropList" runat="server" DataTextField='<%# Bind("type") %>' DataValueField='<%# Bind("type") %>' CssClass="legendDropList">
                            <asp:ListItem Text="Church" Value="Church">Church</asp:ListItem>
                            <asp:ListItem Text="Ministry" Value="Ministry">Ministry</asp:ListItem>
                            <asp:ListItem Text="Program" Value="Program">Program</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;Contact Information
                    </legend>
                    <dl>
                        <dt>Telephone:</dt><dd><asp:TextBox ID="telephoneTextBox" runat="server" Text='<%# Bind("telephone") %>' /></dd>
                        <dt>Email Address:</dt><dd><asp:TextBox ID="emailAddressTextBox" runat="server" Text='<%# Bind("emailAddress") %>' /></dd>
                        <dt>Mailing Address:</dt>
                            <dd>
                                <asp:TextBox ID="streetAddressTextBox" runat="server" Text='<%# Bind("streetAddress") %>' />
                                <br />
                                <asp:TextBox ID="cityTextBox" runat="server" Text='<%# Bind("city") %>'  />
                                <asp:TextBox ID="stateTextBox" runat="server" Text='<%# Bind("state") %>' />
                                <asp:TextBox ID="zipCodeTextBox" runat="server" Text='<%# Bind("zipCode") %>' />
                            </dd>
                    </dl>
                </fieldset>
                <b>It is part of the church community:&nbsp;<b>
                <asp:DropDownList ID="communityParentDropList" runat="server"
                    DataSourceID="communityParentDataSource" DataTextField='<%# Eval("name") %>' DataValueField='<%# Eval("ID") %>'  >
                </asp:DropDownList>
                    imagePath:
                <asp:TextBox ID="imagePathTextBox" runat="server" Text='<%# Bind("imagePath") %>' />
                <br />
                status:
                <asp:TextBox ID="statusTextBox" runat="server" Text='<%# Bind("status") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;
                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
        </asp:FormView>
    </div>
    
    <!-- Community object interface -->
    <asp:ObjectDataSource ID="communityDataSource" runat="server" TypeName="Community"
        DeleteMethod="DeleteCommunityByID" InsertMethod="AddCommunity" 
        SelectMethod="GetCommunityByID" UpdateMethod="UpdateComunity" 
        OldValuesParameterFormatString="original_{0}">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="type" Type="String" />
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="telephone" Type="String" />
            <asp:Parameter Name="streetAddress" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="state" Type="String" />
            <asp:Parameter Name="zipCode" Type="String" />
            <asp:Parameter Name="emailAddress" Type="String" />
            <asp:Parameter Name="imagePath" Type="String" />
            <asp:Parameter Name="status" Type="String" />
            <asp:Parameter Name="parentID" Type="Int32" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1" Name="ID" QueryStringField="ID" 
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="type" Type="String" />
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="telephone" Type="String" />
            <asp:Parameter Name="streetAddress" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="state" Type="String" />
            <asp:Parameter Name="zipCode" Type="String" />
            <asp:Parameter Name="emailAddress" Type="String" />
            <asp:Parameter Name="imagePath" Type="String" />
            <asp:Parameter Name="status" Type="String" />
            <asp:Parameter Name="parentID" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="communityParentDataSource" runat="server"
        SelectMethod="GetParentCommunityByID" TypeName="Community">
        <SelectParameters>
            <asp:ControlParameter ControlID="communityForm" DefaultValue="1" 
                Name="parentID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>