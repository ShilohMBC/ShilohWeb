<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="EventsList.aspx.cs" Inherits="ShilohWeb.Administration.EventsList" %>
<%@ Register src="/Controls/FilterMonthYear.ascx" tagname="FilterMonthYear" tagprefix="uc1" %>
<%@ Register src="/Controls/TabsAdmin.ascx" tagname="AdminTabs" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">    
    
    <uc1:AdminTabs ID="ucAdminTabs" runat="server" SelectedIndex="1" SelectedCssClass="current" />       
    
    <div class="defaultMargin" style="position: relative;">
    <h2>Calendar Events</h2>    
            <asp:GridView ID="grdEvents" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="ID" 
                Width="100%" onrowdeleting="grdEvents_RowDeleting" DataSourceID="sqldcEvents" 
                onrowdeleted="grdEvents_RowDeleted" Font-Size="Small">
                <EmptyDataTemplate>
                    <h2>No Events Were Created For This Month</h2>
                </EmptyDataTemplate>
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>                    
                    <asp:BoundField DataField="ID" HeaderText="Id" SortExpression="ID" 
                        Visible="False" />
                    <asp:BoundField DataField="activityStart" HeaderText="Start Date">
                    <ItemStyle Width="70px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="activityEnd" HeaderText="End Date">
                    <ItemStyle Width="70px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Event Name">
                        <ItemTemplate>
                            <%# SubString(DataBinder.Eval(Container.DataItem, "name").ToString(),150)%>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Description">
                        <ItemTemplate>
                            <%# SubString(DataBinder.Eval(Container.DataItem, "description").ToString(),300)%>
                        </ItemTemplate>
                        
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Change">
                        <ItemTemplate>                                        
                            <a href='EventEntry.aspx?eid=<%# DataBinder.Eval(Container.DataItem, "ID").ToString() %>' title="Change Event">
                                <img src="/Images/Edit.png" alt="X" style="width: 16px; height: 16px; border: none;" />
                            </a>
                        </ItemTemplate>
                        <ItemStyle Width="20px" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="25px" HeaderText="Delete" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgDelete" ImageAlign="Middle" ImageUrl="~/Images/Delete.png" OnClientClick="return confirm('Are you sure you want to delete this calendar event?');" CommandName="Delete" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="False" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="False" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
            
            <br />        

            <!-- New Event Button -->                                        
            <div style="position: absolute; top: -8px; right: 200px; z-index: 104; border: 1px solid silver; vertical-align: middle; padding: 6px;">
                <a href="EventEntry.aspx" title="Create new calendar event">
                    <span class="label">Create New Event</span>&nbsp;
                    <img src="../Images/CalendarAdd24x24.png" alt="New Event" style="width: 24px;height:24px;border: none; vertical-align: middle;" />                
                </a>
            </div>
            
            <!-- Filter -->
            <div style="position: absolute; top: -8px; right: 0px; z-index: 100;">
                <uc1:FilterMonthYear ID="ucFilterMonthYear" runat="server" YearsBeforeCurrentDate="4" YearsAfterCurrentDate="2" />
            </div>
    </div>
    <asp:SqlDataSource ID="sqldcEvents" runat="server" 
        ConnectionString="<%$ ConnectionStrings:shilohConnectionString %>" 
        OldValuesParameterFormatString="original_{0}"         
        DeleteCommand="DELETE FROM [activity] WHERE [ID] = @original_ID" 
        SelectCommand="SELECT [ID], [name], [tag], [activityStart], [activityEnd], [description], [location] FROM [activity] WHERE (([activityStart] &gt;= @activityStart) AND ([activityStart] &lt;= @activityStart2)) ORDER BY [activityStart]" 
        onselecting="sqldcEvents_Selecting" 
        InsertCommand="INSERT INTO [activity] ([name], [tag], [activityStart], [activityEnd], [description], [location]) VALUES (@name, @tag, @activityStart, @activityEnd, @description, @location)" 
        UpdateCommand="UPDATE [activity] SET [name] = @name, [tag] = @tag, [activityStart] = @activityStart, [activityEnd] = @activityEnd, [description] = @description, [location] = @location WHERE [ID] = @original_ID">
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />
        </DeleteParameters>        
        <SelectParameters>
            <asp:SessionParameter Name="activityStart" SessionField="EventStartDate" 
                Type="DateTime" />
            <asp:SessionParameter Name="activityStart2" SessionField="EventEndDate" 
                Type="DateTime" />
        </SelectParameters>
        <FilterParameters>
            <asp:SessionParameter Name="StartDate" Type="DateTime" SessionField="EventStartDate" />
            <asp:SessionParameter Name="EndDate" Type="DateTime" SessionField="EventEndDate" />
        </FilterParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="tag" Type="String" />
            <asp:Parameter Name="activityStart" Type="DateTime" />
            <asp:Parameter Name="activityEnd" Type="DateTime" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="location" Type="String" />
            <asp:Parameter Name="original_ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="tag" Type="String" />
            <asp:Parameter Name="activityStart" Type="DateTime" />
            <asp:Parameter Name="activityEnd" Type="DateTime" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="location" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
        
</asp:Content>
