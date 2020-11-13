<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="SampleDbCSharp.LoginForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-4">
            <div class="form-group">
                <label>Username :</label>
                <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control" />
            </div>
             <div class="form-group">
                <label>Password :</label>
                <asp:TextBox runat="server" TextMode="Password" ID="txtPassword" CssClass="form-control" />
            </div>
             <div class="form-group">
                <asp:Button Text="Login" ID="btnLogin" OnClick="btnLogin_Click" CssClass="btn btn-primary" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>
