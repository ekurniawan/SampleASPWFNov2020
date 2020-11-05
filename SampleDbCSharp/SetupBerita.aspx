<%@ Page Title="Setup Berita" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SetupBerita.aspx.cs" Inherits="SampleDbCSharp.SetupBerita" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:SqlDataSource runat="server" ID="sdsBerita" 
        ConnectionString="<%$ ConnectionStrings:SampleDbConnectionString %>" 
        SelectCommand="SELECT Berita.id_berita, Berita.id_kat, Kategori.nama_kat, Berita.judul_berita, Berita.detail_berita, Berita.tanggal, Berita.isapprove, Berita.pics, Berita.pengarang, Berita.tahun_terbit FROM Berita INNER JOIN Kategori ON Berita.id_kat = Kategori.id_kat" 
        DeleteCommand="DELETE FROM [Berita] WHERE [id_berita] = @id_berita" 
        InsertCommand="INSERT INTO [Berita] ([id_kat], [judul_berita], [detail_berita], [tanggal], [isapprove], [pics], [pengarang], [tahun_terbit]) VALUES (@id_kat, @judul_berita, @detail_berita, @tanggal, @isapprove, @pics, @pengarang, @tahun_terbit)" 
        UpdateCommand="UPDATE [Berita] SET [id_kat] = @id_kat, [judul_berita] = @judul_berita, [detail_berita] = @detail_berita, [tanggal] = @tanggal, [isapprove] = @isapprove, [pics] = @pics, [pengarang] = @pengarang, [tahun_terbit] = @tahun_terbit WHERE [id_berita] = @id_berita" 
        FilterExpression="nama_kat like '%{0}%'">
        
        <FilterParameters>
              <asp:ControlParameter Name="nama_kat" ControlID="ddKategori"  />
        </FilterParameters>
        <DeleteParameters>
            <asp:Parameter Name="id_berita" Type="Int32" />
        </DeleteParameters>
       <%-- <SelectParameters>
            <asp:ControlParameter Name="id_kat" ControlID="ddKategori"  />
        </SelectParameters>--%>
        <InsertParameters>
            <asp:Parameter Name="id_kat" Type="Int32" />
            <asp:Parameter Name="judul_berita" Type="String" />
            <asp:Parameter Name="detail_berita" Type="String" />
            <asp:Parameter Name="tanggal" Type="DateTime" />
            <asp:Parameter Name="isapprove" Type="Boolean" />
            <asp:Parameter Name="pics" Type="String" />
            <asp:Parameter Name="pengarang" Type="String" />
            <asp:Parameter Name="tahun_terbit" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_kat" Type="Int32" />
            <asp:Parameter Name="judul_berita" Type="String" />
            <asp:Parameter Name="detail_berita" Type="String" />
            <asp:Parameter Name="tanggal" Type="DateTime" />
            <asp:Parameter Name="isapprove" Type="Boolean" />
            <asp:Parameter Name="pics" Type="String" />
            <asp:Parameter Name="pengarang" Type="String" />
            <asp:Parameter Name="tahun_terbit" Type="Int32" />
            <asp:Parameter Name="id_berita" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource runat="server" ID="sdsKategori" 
        ConnectionString="<%$ ConnectionStrings:SampleDbConnectionString %>" 
        SelectCommand="SELECT [id_kat], [nama_kat] FROM [Kategori] ORDER BY [nama_kat]" />

    <div class="row">
        <label>Filter by Nama Kategori :</label>
        <asp:DropDownList runat="server" ID="ddKategori" AutoPostBack="true"
            DataSourceID="sdsKategori" DataTextField="nama_kat" DataValueField="id_kat" 
            AppendDataBoundItems="true">
              <asp:ListItem Text="-- All Data --" Value="" Selected="True" />
        </asp:DropDownList><br />
      
         <asp:GridView runat="server" CssClass="table table-striped" ID="gvBerita" 
        AutoGenerateColumns="False" DataKeyNames="id_berita" DataSourceID="sdsBerita" AllowSorting="True">
        <Columns>
            <asp:TemplateField HeaderText="Kategori">
               <ItemTemplate>
                   <asp:Label Text='<%#Eval("nama_kat") %>' runat="server" />
               </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddIDKategori" runat="server" DataSourceID="sdsKategori" 
                        DataTextField="nama_kat" DataValueField="id_kat" 
                        SelectedValue='<%#Bind("id_kat") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="judul_berita" HeaderText="Judul" SortExpression="judul_berita" />
            <asp:BoundField DataField="tanggal" DataFormatString="{0:d}" HeaderText="Tanggal" SortExpression="tanggal" />
            <asp:CheckBoxField DataField="isapprove" HeaderText="Approve" SortExpression="isapprove" />
            <asp:BoundField DataField="pengarang" HeaderText="Pengarang" SortExpression="pengarang" />
            <asp:BoundField DataField="tahun_terbit" HeaderText="Tahun Terbit" SortExpression="tahun_terbit" />
            <asp:ImageField DataImageUrlField="pics" 
                DataImageUrlFormatString="~/Images/{0}" ControlStyle-Width="65" HeaderText="Pics">
<ControlStyle Width="65px"></ControlStyle>
            </asp:ImageField>
            <asp:CommandField ShowEditButton="True" />
        </Columns>

    </asp:GridView>
    </div>
   
</asp:Content>
