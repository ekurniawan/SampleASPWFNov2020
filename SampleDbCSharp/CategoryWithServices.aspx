<%@ Page Title="Sample Binding API" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CategoryWithServices.aspx.cs" Inherits="SampleDbCSharp.CategoryWithServices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ObjectDataSource runat="server" ID="odsCategory" TypeName="SampleDbCSharp.Services.CategoryServices"
        SelectMethod="GetAll" InsertMethod="InsertCategory" UpdateMethod="UpdateCategory" 
        DeleteMethod="DeleteCategory" OnObjectCreating="odsCategory_ObjectCreating" OnSelected="odsCategory_Selected">
        <DeleteParameters>
            <asp:Parameter Name="CategoryID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CategoryName" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CategoryName" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="CategoryID" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>

    <div class="row">
        <h3>Setup Category</h3>
        <div class="col-md-6">
            <asp:GridView CssClass="table table-striped" runat="server" ID="gvCategory" AutoGenerateColumns="False"
                DataSourceID="odsCategory" DataKeyNames="CategoryID" AllowPaging="True">
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Literal Text='<%# Eval("CategoryID") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="lblCategoryID" Text='<%# Bind("CategoryID") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <label>Category Name :</label>
                <asp:TextBox runat="server" ID="txtCategoryName" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label>Description :</label>
                <asp:TextBox runat="server" ID="txtDescription" CssClass="form-control" />
            </div>
            <div class="form-group">
                <asp:Button Text="Insert" ID="btnInsert" OnClick="btnInsert_Click" CssClass="btn btn-primary" runat="server" />
            </div>
            <br />
            <asp:Literal ID="ltKeterangan" runat="server" />
        </div>
    </div>
</asp:Content>
