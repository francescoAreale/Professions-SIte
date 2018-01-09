<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AppuntamentiPendenti.aspx.cs" Inherits="WebApplication1.AppuntamentiPendenti" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">


    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>


</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    


<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns = "false"
    OnRowCommand = "Gridview1_RowCommand" 
Font-Names = "Arial">
<Columns>
    <asp:TemplateField>
    <ItemTemplate>
        <asp:HiddenField ID="ID"  runat="server" 
                         Value='<%# Eval("ID") %>' />
    </ItemTemplate>
    <EditItemTemplate>
        <asp:HiddenField ID="ID"  runat="server" 
                         Value='<%# Eval("ID") %>' />
    </EditItemTemplate>
</asp:TemplateField>
    <asp:BoundField DataField="userName" HeaderText="userName"/>
        <asp:TemplateField HeaderText = "DateTimeScheduled" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:Label ID="DateTimeScheduled" runat="server" Text='<%# Eval("DateTimeScheduled") %>'></asp:Label>
            </ItemTemplate>
    </asp:TemplateField>
    <asp:BoundField DataField="Title" HeaderText="Title"  ItemStyle-Width="150"/>
    <asp:BoundField DataField="Message" HeaderText="Message" ItemStyle-Width="150"/>
   
    <asp:ImageField DataImageUrlField = "Foto"
     ControlStyle-Width = "100" ControlStyle-Height = "100"
     HeaderText = "Preview Image"/>
   
                <asp:ButtonField  Text="Accept" runat="server" CommandName="Accept" ItemStyle-Width="150" />
                <asp:ButtonField Text="Reject" runat="server" CommandName="Reject" ItemStyle-Width="150" />
               
</Columns>
</asp:GridView>

    </asp:Content>



