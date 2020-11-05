<%@ Page Title="Setup Kategori" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SetupKategori.aspx.cs" Inherits="SampleDbCSharp.SetupKategori" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" ClientIDMode="Static" runat="server">
    <asp:SqlDataSource runat="server" ID="sdsKategori"
        ConnectionString="<%$ ConnectionStrings:SampleDbConnectionString %>"
        DeleteCommand="DELETE FROM [Kategori] WHERE [id_kat] = @id_kat"
        InsertCommand="INSERT INTO [Kategori] ([nama_kat]) VALUES (@nama_kat)"
        SelectCommand="SELECT [id_kat], [nama_kat] FROM [Kategori] ORDER BY [nama_kat]"
        UpdateCommand="UPDATE [Kategori] SET [nama_kat] = @nama_kat WHERE [id_kat] = @id_kat">
        <DeleteParameters>
            <asp:Parameter Name="id_kat" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nama_kat" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="nama_kat" Type="String" />
            <asp:Parameter Name="id_kat" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <div class="row">
        <div class="form-group">
            <label for="txtNamaKategori">Nama Kategori :</label>
            <asp:TextBox runat="server" ID="txtNamaKategori" CssClass="form-control" />
        </div>
        <div class="form-group">
            <asp:Button Text="Submit" ID="btnSubmit" OnClick="btnSubmit_Click" CssClass="btn btn-primary" runat="server" />
        </div>
        <br />
        <asp:Literal ID="ltKeterangan" runat="server" />
    </div>
    <div class="row">
        <asp:GridView runat="server" CssClass="table table-striped" ID="gvKategori" AutoGenerateColumns="False" DataKeyNames="id_kat" DataSourceID="sdsKategori" 
            AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="id_kat" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_kat" />
                <asp:BoundField DataField="nama_kat" HeaderText="Nama" SortExpression="nama_kat" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
