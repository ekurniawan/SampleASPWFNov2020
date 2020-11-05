<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SetupCategory.aspx.cs" Inherits="SampleDbCSharp.SetupCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource runat="server" ID="sdsCategory" ConnectionString="<%$ ConnectionStrings:WingToysDbConnectionString %>" SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]" />
    <div class="container">
        <h3>List Of Product</h3>

        <asp:ListView ID="lvProduct" DataSourceID="sdsCategory" DataKeyNames="CategoryID" runat="server">
            <LayoutTemplate>
                <div class="row">
                    <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                </div>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="col-md-4">
                    <div class="panel panel-default">
                        <div class="panel-heading"><%# Eval("CategoryName") %></div>
                        <div class="panel-body">
                            <a runat="server" 
                                href='<%# Eval("CategoryID","~/ListProductByCategory.aspx?id={0}") %>'><%# Eval("Description") %></a> 
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>


</asp:Content>
