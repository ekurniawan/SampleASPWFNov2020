<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SetupProductDapper.aspx.cs" Inherits="SampleDbCSharp.SetupProductDapper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ObjectDataSource runat="server" ID="odsProduct" TypeName="SampleDbCSharp.DAL.ProductsDAL"
        SelectMethod="GetAll" InsertMethod="InsertProduct" UpdateMethod="UpdateProduct">
        <InsertParameters>
            <asp:Parameter Name="ProductName" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="ImagePath" Type="String" />
            <asp:Parameter Name="UnitPrice" Type="Double" />
            <asp:Parameter Name="CategoryID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ProductID" Type="Int32" />
            <asp:Parameter Name="ProductName" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="ImagePath" Type="String" />
            <asp:Parameter Name="UnitPrice" Type="Double" />
            <asp:Parameter Name="CategoryID" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource runat="server" ID="odsKategori" TypeName="SampleDbCSharp.DAL.CategoryDAL"
        SelectMethod="GetAll"></asp:ObjectDataSource>

    <div class="row">
        <h3>List Of Category</h3>
        <div class="col-md-4">
            <asp:UpdatePanel ID="upInsertProduct" runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnInsertProduct" EventName="Click" />
                </Triggers>
                <ContentTemplate>
                    <asp:Literal ID="ltKeterangan" runat="server" />
                    <div class="form-group">
                        <label>Kategori :</label>
                        <asp:DropDownList CssClass="form-control" runat="server" ID="ddKategori" AppendDataBoundItems="true"
                            DataSourceID="odsKategori" DataTextField="CategoryName" DataValueField="CategoryID">
                            <asp:ListItem Text="select category" Selected="True" />
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label>Product Name :</label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtProductName" />
                        <asp:RequiredFieldValidator ValidationGroup="formInsert" ErrorMessage="Product Name Required" CssClass="alert alert-danger" ControlToValidate="txtProductName" runat="server" />
                    </div>
                    <div class="form-group">
                        <label>Description :</label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtDescription" />
                        <asp:RequiredFieldValidator ValidationGroup="formInsert" ErrorMessage="Description Required" CssClass="alert alert-danger" ControlToValidate="txtDescription" runat="server" />
                    </div>
                    <div class="form-group">
                        <label>Image :</label>
                        <asp:FileUpload ID="fpImagePath" CssClass="form-control" runat="server" />
                    </div>
                    <div class="form-group">
                        <label>Unit Price :</label>
                        <asp:TextBox runat="server" Text="0" CssClass="form-control" ID="txtUnitPrice" />
                        <asp:CompareValidator ErrorMessage="Harus Tipe Desimal"
                            Operator="DataTypeCheck" Type="Double" CssClass="alert alert-danger"
                            ControlToValidate="txtUnitPrice" ValidationGroup="formInsert" runat="server" />
                    </div>
                     <asp:Button Text="Insert" ValidationGroup="formInsert" ID="btnInsertProduct" CssClass="btn btn-primary" runat="server" OnClick="btnInsertProduct_Click" />
                </ContentTemplate>
            </asp:UpdatePanel>
           
        </div>
        <div class="col-md-8">
            <asp:Label ID="lblDate1" runat="server" />
            <asp:UpdatePanel ID="upGridProduct" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Label ID="lblDate2" runat="server" />
                    <asp:GridView CssClass="table table-striped" runat="server" ID="gvProduct" DataSourceID="odsProduct" AllowPaging="True"
                        AutoGenerateColumns="False" PageSize="5">
                        <Columns>
                            <asp:BoundField DataField="ProductID" HeaderText="Product ID" SortExpression="ProductID" />
                            <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" />
                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                            <asp:ImageField DataImageUrlField="ImagePath" DataImageUrlFormatString="~/Images/{0}" HeaderText="Pics">
                                <ControlStyle Width="85px" />
                            </asp:ImageField>
                            <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price" SortExpression="UnitPrice" DataFormatString="{0:N2}" />
                            <asp:TemplateField HeaderText="Kategori">
                                <EditItemTemplate>
                                    <asp:DropDownList runat="server" ID="ddKategoriSelect" DataSourceID="odsKategori"
                                        DataTextField="CategoryName" DataValueField="CategoryID"
                                        SelectedValue='<%# Bind("CategoryID") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("CategoryName") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" OnClientClick='return confirm("Are you sure you want to edit this item?");' Text="Update"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>


</asp:Content>
