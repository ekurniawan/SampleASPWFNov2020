<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TestSession.aspx.cs" Inherits="SampleDbCSharp.TestSession" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource runat="server" ID="sdsProduct" ConnectionString="<%$ ConnectionStrings:WingToysDbConnectionString %>" SelectCommand="SELECT * FROM [Products] WHERE ([ProductID] = @ProductID)" >
        <SelectParameters>
            <asp:SessionParameter Name="ProductID" SessionField="ProductID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Button Text="Buat Session" ID="btnSession" OnClick="btnSession_Click" runat="server" />
    <asp:Button Text="Cek Session" ID="btnCekSession" OnClick="btnCekSession_Click" runat="server" />
    <asp:Label ID="lblKeterangan" runat="server" />
    <asp:GridView runat="server" ID="gvProduct" AutoGenerateColumns="False" DataKeyNames="ProductID" DataSourceID="sdsProduct">
        <Columns>
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
            <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="ImagePath" HeaderText="ImagePath" SortExpression="ImagePath" />
            <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
        </Columns>
    </asp:GridView>
</asp:Content>
