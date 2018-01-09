<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Appuntamenti.aspx.cs" Inherits="WebApplication1.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns = "false"
    OnSelectedIndexChanged = "OnSelectedIndexChanged"
Font-Names = "Arial">
    
<Columns>

    <asp:TemplateField>
    <ItemTemplate>
        <asp:HiddenField ID="UserId" runat="server" 
                         Value='<%# Eval("UserId") %>' />
    </ItemTemplate>
    <EditItemTemplate>
        <asp:HiddenField ID="UserId" runat="server" 
                         Value='<%# Eval("UserId") %>' />
    </EditItemTemplate>
</asp:TemplateField>



    <asp:BoundField DataField="UserName" HeaderText="UserName"/>
        <asp:TemplateField HeaderText = "Email" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:Label ID="Email" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
            </ItemTemplate>
    </asp:TemplateField>
   
    <asp:ImageField DataImageUrlField = "Foto"
     ControlStyle-Width = "100" ControlStyle-Height = "100"
     HeaderText = "Preview Image"/>
    

        <asp:ButtonField Text="Contact" CommandName="Select" ItemStyle-Width="150" />
    
</Columns>
</asp:GridView>




    <asp:SqlDataSource ID="DatabaseProject" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseProject %>" SelectCommand="SELECT Ap.idUtente, Ap.DateTimeScheduled, Ap.Title, Ap.Message FROM Users AS U INNER JOIN AppointmentDiary AS Ap ON U.UserId = Ap.idUtente WHERE (Ap.StatusENUM = 1) "></asp:SqlDataSource>
    </asp:Content>