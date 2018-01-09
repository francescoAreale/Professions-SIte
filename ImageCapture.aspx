<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImageCapture.aspx.cs" Inherits="WebApplication1.ImageCapture" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form2" runat="server" enctype="multipart/form-data">
        <input type="file" id="photo" name="photo" />
        <asp:Button runat="server" ID="btnUpload" OnClick="btnUploadClick" Text="Upload" />
    </form>


    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
</body>
</html>
