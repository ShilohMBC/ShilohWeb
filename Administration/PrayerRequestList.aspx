<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="PrayerRequestList.aspx.cs" Inherits="ShilohWeb.Administration.PrayerRequestList" %>
<%@ Register src="/Controls/FilterMonthYear.ascx" tagname="FilterMonthYear" tagprefix="uc1" %>
<%@ Register Src="/Controls/FilterDays.ascx" TagName="FilterDays" TagPrefix="uc1" %>
<%@ Register src="/Controls/TabsAdmin.ascx" tagname="AdminTabs" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">

<uc1:AdminTabs ID="ucAdminTabs" runat="server" SelectedIndex="3" SelectedCssClass="current" />    

 <div class="defaultMargin" style="position: relative;">
        <h2>Prayer Requests</h2>            
        
            <asp:GridView ID="grdRequests" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" ForeColor="#333333" GridLines="None" 
                Width="100%" onrowdeleting="grdRequests_RowDeleting" 
                onrowdeleted="grdRequests_RowDeleted" Font-Size="Small" DataKeyNames="ID" 
                DataSourceID="sqldcRequests" onrowupdated="grdRequests_RowUpdated" 
                onrowupdating="grdRequests_RowUpdating">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <EmptyDataTemplate>
                    <h2>No Prayer Requests were found for this month</h2>
                </EmptyDataTemplate>
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="Id" SortExpression="ID" 
                        Visible="False" />
                    <asp:BoundField DataField="dateReceived" DataFormatString="{0:M/dd/yyyy}" 
                        HeaderText="Date" HtmlEncode="False" ReadOnly="true">
                    <ItemStyle Width="75px" />
                    </asp:BoundField>
                    <asp:CheckBoxField DataField="isConfidential" HeaderText="Private" 
                        ReadOnly="True" Visible="true">
                    <ItemStyle Width="20px" />
                    </asp:CheckBoxField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "firstName").ToString() %>&nbsp;
                            <%# DataBinder.Eval(Container.DataItem, "lastName").ToString() %>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Prayer Request (first 150 characters)">
                        <ItemTemplate>
                            <%# GetRequest(DataBinder.Eval(Container.DataItem, "prayerNeeds").ToString(), 150)%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Respond">
                        <ItemTemplate>                            
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ID", "PrayerResponse.aspx?rid={0}") %>'
                                Text="Click here to process">                                                                 
                            </asp:HyperLink>
                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("ID", "PrayerResponse.aspx?rid={0}") %>'
                                Text="Click here to process" Font-Size="11pt">                                                                                             
                                    <img src="../Images/PrayerResponseOff.png" alt="Respond to prayer" width="16" height="16" />
                            </asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle Width="150px" HorizontalAlign="Center"/>
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
            
            <!-- Filter -->
            <div style="position: absolute; top: -8px; right: 0px; z-index: 100;">
                <uc1:FilterDays ID="ucFilterDays" runat="server" ></uc1:FilterDays>
            </div>
   
            <asp:Panel ID="pnlDeleteMsg" runat="server" Visible="false">
                <div style="position: absolute; top: 0px; left: 0px; z-index: 110;">
                </div>
            </asp:Panel>
     
     <asp:SqlDataSource ID="sqldcRequests" runat="server" ConnectionString="<%$ ConnectionStrings:shilohConnectionString %>"
         DeleteCommand="DELETE FROM [prayerRequest] WHERE [ID] = @ID" 
         SelectCommand="SELECT  [prayerRequest].[ID], [prayerRequest].[dateReceived], [prayerRequest].[isConfidential],[prayerRequest].[prayerNeeds], [prayerRequest].[wasProcessed], [prayerRequest].[lastName], [prayerRequest].[firstName], [prayerRequest].[processedBy],isnull([prayerResponse].ID, 0) as ResponseId FROM
                    [prayerRequest] left outer join [prayerResponse] on [prayerRequest].[ID] = [prayerResponse].[requestId] WHERE (([dateReceived] &gt;= @dateReceived) AND ([dateReceived] &lt;= @dateReceived2)) AND wasProcessed = 0 ORDER BY [dateReceived] DESC"  UpdateCommand="UPDATE [prayerRequest] SET [wasProcessed] = @wasProcessed, [processedBy] = @processedBy WHERE [ID] = @ID"
         OnSelecting="sqldcRequests_Selecting">
         <SelectParameters>
             <asp:SessionParameter DefaultValue="" Name="dateReceived" 
                 SessionField="PrayerReqStartDate" Type="DateTime" />
             <asp:SessionParameter Name="dateReceived2" SessionField="PrayerReqEndDate" 
                 Type="DateTime" />
         </SelectParameters>
         <DeleteParameters>
             <asp:Parameter Name="ID" Type="Int32" />
         </DeleteParameters>
         <UpdateParameters>
             <asp:Parameter Name="wasProcessed" Type="Boolean"  DefaultValue="True"  />
             <asp:Parameter Name="processedBy" Type="String"/>
             <asp:Parameter Name="ID" Type="Int32" />
         </UpdateParameters>
     </asp:SqlDataSource>
</div>
</asp:Content>
