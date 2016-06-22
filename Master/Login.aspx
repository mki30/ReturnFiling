<%@ Page Title="" Language="C#" MasterPageFile="~/Master/AdminMasterPage.master" AutoEventWireup="true" CodeFile="~/Master/Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .frm { padding:20px; background-color:rgb(253, 249, 232); }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" id="divMain"  style="max-width: 400px;">
        <form class="form-signin" role="form" >
            <div class="frm">
        <h2 class="form-signin-heading">Please sign in</h2>
        <div class="form-group">
            <label for="txtUsername">Username</label>
            <input type="text" maxlength="20" runat="server" class="form-control" id="txtUsername" placeholder="User Name" />
        </div>
        <div class="form-group">
            <label for="txtPassword">Password</label>
            <input type="password" maxlength="10" runat="server" class="form-control" id="txtPassword" placeholder="Password" />
        </div>
        <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary" Text="Login" OnClick="btnLogin_Click" />
        <asp:Literal ID="ltMsg" runat="server"></asp:Literal>
                </div>
        </form>
    </div>
</asp:Content>
