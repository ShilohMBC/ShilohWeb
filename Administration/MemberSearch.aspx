<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="MemberSearch.aspx.cs" Inherits="ShilohWeb.Administration.MemberSearch" %>
<%@ Register Src="/Controls/TabsAdmin.ascx" TagName="AdminTabs" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <uc1:admintabs id="ucAdminTabs" runat="server" selectedindex="1" selectedcssclass="current" />
    
    <h1>Member Lookup</h1>
    Use this page to lookup church members online.  Enter in a member's first name, last name or whole name to do a look up.
    
    <div class="prayerRequest" style="padding: 3px 5px 10px 5px;">
        <label>Search</label>        
        <div>
        <span class="label">First name: </span>&nbsp;
        <asp:TextBox ID="txtFirstName" runat="server" Width="150px"></asp:TextBox>&nbsp;&nbsp;
        <span class="label">Last name: </span>&nbsp;
        <asp:TextBox ID="txtLastName" runat="server" Width="150px"></asp:TextBox>&nbsp;&nbsp;
        <asp:ImageButton ID="btnSearch" runat="server" onclick="btnSearch_Click" ImageUrl="~/Images/memberSearch_32x32.png" Width="32px" Height="32px" BorderStyle="Outset" />
        </div>
    </div>
    
    <asp:GridView ID="grdMembers" runat="server" AutoGenerateColumns="False" Visible="False"
        Width="100%" DataSourceID="sqldcMembers" DataKeyNames="firstName,lastName" 
        CellPadding="4" ForeColor="#333333" GridLines="None">
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <EmptyDataTemplate>
            <h2>No members were found with the search terms.</h2>
        </EmptyDataTemplate>
        <RowStyle BackColor="#E3EAEB" />
        <Columns>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <%# BuildMemberLink(DataBinder.Eval(Container.DataItem, "firstName").ToString(), DataBinder.Eval(Container.DataItem, "lastName").ToString(), Convert.ToInt32(DataBinder.Eval(Container.DataItem, "ID")))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="isActive" HeaderText="Active" />
            <asp:TemplateField HeaderText="Status"></asp:TemplateField>
            <asp:BoundField DataField="birthDate" HeaderText="Birthdate" DataFormatString="{0:MM/dd/yyyy}" />
            <asp:BoundField DataField="email" HeaderText="Email" />
            <asp:BoundField DataField="anniverisaryDate" HeaderText="Anniversary" DataFormatString="{0:MM/dd/yyyy}" />
        </Columns>
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#7C6F57" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    
    <asp:SqlDataSource ID="sqldcMembers" runat="server" 
        ConnectionString="<%$ ConnectionStrings:shilohConnectionString %>" 
        DeleteCommand="DELETE FROM [member] WHERE [lastName] = @lastName AND [firstName] = @firstName"         
        SelectCommand="p_member_simpleSearch" SelectCommandType="StoredProcedure" 
        onselecting="sqldcMembers_Selecting">        
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFirstName" Name="firstName" PropertyName="Text" Type="String" Direction="Input" ConvertEmptyStringToNull="false" />
            <asp:ControlParameter ControlID="txtLastName" Name="lastName" PropertyName="Text"
                ConvertEmptyStringToNull="false" Type="String" Direction="Input" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="lastName" Type="String" />
            <asp:Parameter Name="firstName" Type="String" />
        </DeleteParameters>
    </asp:SqlDataSource>
</asp:Content>
