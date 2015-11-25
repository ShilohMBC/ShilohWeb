<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="MediaList.aspx.cs" Inherits="ShilohWeb.Administration.MediaList" %>
<%@ Register src="/Controls/FilterMonthYear.ascx" tagname="FilterMonthYear" tagprefix="uc1" %>
<%@ Register Src="/Controls/FilterDays.ascx" TagName="FilterDays" TagPrefix="uc1" %>
<%@ Register src="/Controls/TabsAdmin.ascx" tagname="AdminTabs" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">

<uc1:AdminTabs ID="ucAdminTabs" runat="server" SelectedIndex="4" SelectedCssClass="current" />    

 <div class="defaultMargin" style="position: relative;">
        <h2>Media</h2>            
        
            <asp:GridView ID="grdMedia" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" ForeColor="#333333" GridLines="None" 
                Width="100%" onrowdeleting="grdMedia_RowDeleting" 
                onrowdeleted="grdMedia_RowDeleted" Font-Size="Small" DataKeyNames="ID" 
                DataSourceID="sqldcMedia" >
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <EmptyDataTemplate>
                    <h2>No media was found for this month</h2>
                </EmptyDataTemplate>
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" 
                        Visible="False" />
                    <asp:BoundField DataField="MediaDate" DataFormatString="{0:M/dd/yyyy}" 
                        HeaderText="Date" HtmlEncode="False" ReadOnly="true">
                    <ItemStyle Width="75px" />
                    </asp:BoundField>
                    <asp:CheckBoxField DataField="IsActive" HeaderText="Is Visible" ReadOnly="False"
                        Visible="true">
                        <ItemStyle Width="20px" />
                    </asp:CheckBoxField>
                    <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="true">
                        <ItemStyle Width="200px" />
                    </asp:BoundField>
                    <asp:TemplateField ItemStyle-Width="25px" HeaderText="Edit" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <a href='MediaEntry.aspx?mid=<%# DataBinder.Eval(Container.DataItem, "Id").ToString() %>'>
                                <img src="../Images/Edit.png" alt="Edit" style="height: 16px; width: 16px;" />
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="25px" HeaderText="Delete" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgDelete" ImageAlign="Middle" ImageUrl="~/Images/Delete.png" OnClientClick="return confirm('Are you sure you want to delete this media?');" CommandName="Delete" runat="server" />
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
             <!-- New Media Button -->
             <div style="position: absolute; top: -8px; right: 170px; z-index: 104; border: 1px solid silver;
                 vertical-align: middle; padding: 6px;">
                 <a href="MediaEntry.aspx" title="Add new media"><span class="label">Add Media</span>&nbsp;
                     <img src="../Images/CameraAdd24x24.png" alt="New Event" style="width: 24px; height: 24px;
                         border: none; vertical-align: middle;" />
                 </a>
             </div>
             
             <!-- Filter -->
            <div style="position: absolute; top: -8px; right: 0px; z-index: 100;">
                <uc1:FilterDays ID="ucFilterDays" runat="server" ></uc1:FilterDays>
            </div>
   
            <asp:Panel ID="pnlDeleteMsg" runat="server" Visible="false">
                <div style="position: absolute; top: 0px; left: 0px; z-index: 110;">
                </div>
            </asp:Panel>
     
     <asp:SqlDataSource ID="sqldcMedia" runat="server" ConnectionString="<%$ ConnectionStrings:shilohConnectionString %>"
         DeleteCommand="DELETE FROM [media] WHERE [ID] = @ID" 
         SelectCommand="SELECT [Id],[Name],[Description],[IsActive],[IsStreaming],[Size],[MIMEType],[MediaDate] FROM [media]
                     WHERE (([mediaDate] &gt;= @dateReceived) AND ([mediaDate] &lt;= @dateReceived2)) ORDER BY [mediaDate] DESC"  
         OnSelecting="sqldcMedia_Selecting">
         <SelectParameters>
             <asp:SessionParameter DefaultValue="" Name="dateReceived" 
                 SessionField="MediaDateStartDate" Type="DateTime" />
             <asp:SessionParameter Name="dateReceived2" SessionField="MediaDateEndDate" 
                 Type="DateTime" />
         </SelectParameters>
         <DeleteParameters>
             <asp:Parameter Name="ID" Type="Int32" />
         </DeleteParameters>
     </asp:SqlDataSource>
</div>

</asp:Content>
