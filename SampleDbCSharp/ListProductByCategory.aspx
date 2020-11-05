<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListProductByCategory.aspx.cs" Inherits="SampleDbCSharp.ListProductByCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource runat="server" ID="sdsProduct" 
        ConnectionString="<%$ ConnectionStrings:WingToysDbConnectionString %>" 
        SelectCommand="SELECT * FROM [Products] WHERE ([CategoryID] = @CategoryID)" >
        <SelectParameters>
            <asp:QueryStringParameter Name="CategoryID" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <div class="row">
        <h3>List Of Products</h3>
        <asp:GridView CssClass="table table-striped" runat="server" ID="gvProduct" AutoGenerateColumns="False" DataKeyNames="ProductID" DataSourceID="sdsProduct">
            <Columns>
                <asp:BoundField DataField="ProductID" HeaderText="Product ID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
                <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="ImagePath" HeaderText="ImagePath" SortExpression="ImagePath" />
                <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
                <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
            </Columns>

        </asp:GridView>
    </div>
</asp:Content>
