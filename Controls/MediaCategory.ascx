<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MediaCategory.ascx.cs" Inherits="ShilohWeb.Controls.MediaCategory" %>
<div style="width: 300px; float:left;">
    <h2>
        <asp:Label ID="lblCatName" runat="server" Text=""></asp:Label>
    </h2>
    <ul>
        <asp:DataList ID="dlMedia" runat="server">
            <ItemTemplate>
                <li>
                    <asp:LinkButton runat="server" ID="lbVideoLink" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id") %>'
                        OnCommand="LinkButton_Command"><%# DataBinder.Eval(Container.DataItem, "Name") %></asp:LinkButton>
                </li>
            </ItemTemplate>
        </asp:DataList>
    </ul>
</div>
