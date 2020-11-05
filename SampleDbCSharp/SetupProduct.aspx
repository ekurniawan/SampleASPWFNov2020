<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SetupProduct.aspx.cs" Inherits="SampleDbCSharp.SetupProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Button Text="Get Data" ID="btnGetData" runat="server" 
        OnClick="btnGetData_Click" /><br />
    <asp:GridView runat="server" ID="gvProduct" AutoGenerateColumns="true"></asp:GridView>
</asp:Content>
