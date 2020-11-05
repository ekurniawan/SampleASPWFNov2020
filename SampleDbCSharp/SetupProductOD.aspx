<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SetupProductOD.aspx.cs" Inherits="SampleDbCSharp.SetupProductOD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ObjectDataSource runat="server" ID="odProduct" TypeName="SampleDbCSharp.DAL.CategoryDAL"
        SelectMethod="GetAll" InsertMethod="Insert">
        <InsertParameters>
            <asp:Parameter Name="CategoryName" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label>Category Name :</label>
                <asp:TextBox runat="server" ID="txtCategoryName" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label>Description :</label>
                <asp:TextBox runat="server" ID="txtDescription" TextMode="MultiLine" CssClass="form-control" />
            </div>
            <div class="form-group">
                <asp:Button Text="Insert" ID="btnInsert" OnClick="btnInsert_Click" CssClass="btn btn-primary" runat="server" />
            </div>
            <asp:Label ID="lblKet" runat="server" />
        </div>
        <div class="col-md-6">
            <asp:GridView CssClass="table table-striped" runat="server" ID="gvProduct"
                DataSourceID="odProduct" AutoGenerateColumns="False" AllowPaging="True" PageSize="3">
                <Columns>
                    <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
                    <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                </Columns>
            </asp:GridView>
        </div>
    </div>


</asp:Content>
