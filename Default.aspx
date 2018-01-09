<%@ Page Title="Home page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Welcome in your innovative reservation platform</h1>
            </hgroup>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3>Our services:</h3>
    <ol class="round">
        <li class="one">
            <h5>Register a new account</h5>
            Make a sample registration <a href="./Account/Register.aspx">here</a>, and start to use our services.
        </li>
        <li class="two">
            <h5>Require an Appointment </h5>
           Select one of our professional and send him a request to 
        </li>
        <li class="three">
            <h5>If you are a Professional</h5>
            Display your personal page and decide to accept or not a pending request.
        </li>
    </ol>
</asp:Content>
