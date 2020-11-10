<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SetupProductDapper.aspx.cs" Inherits="SampleDbCSharp.SetupProductDapper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ObjectDataSource runat="server" ID="odsProduct" TypeName="SampleDbCSharp.DAL.ProductsDAL"
        SelectMethod="GetAll" InsertMethod="InsertProduct">
        <InsertParameters>
            <asp:Parameter Name="ProductName" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="ImagePath" Type="String" />
            <asp:Parameter Name="UnitPrice" Type="Double" />
            <asp:Parameter Name="CategoryID" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource runat="server" ID="odsKategori" TypeName="SampleDbCSharp.DAL.CategoryDAL"
        SelectMethod="GetAll"></asp:ObjectDataSource>

    <div class="row">
        <h3>List Of Category</h3>
        <div class="col-md-4">
            <div class="form-group">
                <label>Kategori :</label>
                <asp:DropDownList CssClass="form-control" runat="server" ID="ddKategori" AppendDataBoundItems="true"
                    DataSourceID="odsKategori" DataTextField="CategoryName" DataValueField="CategoryID">
                    <asp:ListItem Text="select category" Selected="True" />
                </asp:DropDownList>
            </div>
            <div class="form-group" >
                <label>Product Name :</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtProductName" />
                <asp:RequiredFieldValidator ErrorMessage="Product Name Required" CssClass="alert alert-danger" ControlToValidate="txtProductName" runat="server" />   
            </div>
            <div class="form-group">
                <label>Description :</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtDescription" />
                <asp:RequiredFieldValidator ErrorMessage="Description Required"  CssClass="alert alert-danger" ControlToValidate="txtDescription" runat="server" />
            </div>
            <div class="form-group">
                <label>Image :</label>
                <asp:FileUpload ID="fpImagePath" CssClass="form-control" runat="server" />
            </div>
             <div class="form-group">
                <label>Unit Price :</label>
                <asp:TextBox runat="server" Text="0" CssClass="form-control" ID="txtUnitPrice" />
                 <asp:CompareValidator ErrorMessage="Harus Tipe Desimal" Type="Double" CssClass="alert alert-danger" ControlToValidate="txtUnitPrice" runat="server" />
            </div>
            <asp:Button Text="Insert" ID="btnInsertProduct" CssClass="btn btn-primary" runat="server" OnClick="btnInsertProduct_Click" />
        </div>
        <div class="col-md-8">
            <asp:GridView CssClass="table table-striped" runat="server" ID="gvProduct" DataSourceID="odsProduct" AllowPaging="True"
                AutoGenerateColumns="False" PageSize="5">
                <Columns>
                    <asp:BoundField DataField="ProductID" HeaderText="ProductID" SortExpression="ProductID" />
                    <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="ImagePath" HeaderText="ImagePath" SortExpression="ImagePath" />
                    <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
                    <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
                </Columns>
            </asp:GridView>
        </div>
    </div>


</asp:Content>
