<%@ Page Title="Log in - return-filing.in" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Account_Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>
<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="head">
    <link href="/Account/css/default.css" rel="stylesheet" />
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1">
    <br />
    <div class="content" id="divMain1">
        <div style="overflow: hidden">
            <div class="sxcol">
                <div class="optional">
                    <h3 class="mb10">Sign in return-filing.in</h3>
                </div>
                <div class="contInputBar">
                    <label for="txtUsername" id="lblUsername" class="inputBar">
                        <span class="mark">Email ID</span>
                        <asp:TextBox runat="server" ID="txtUsername" MaxLength="100" />
                        <asp:RequiredFieldValidator ID="RequiredtxtEmail" ControlToValidate="txtUsername" ClientIDMode="AutoID" CssClass="redstar" ErrorMessage="required" SetFocusOnError="true" ValidateRequestMode="Disabled" runat="server"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressiontxtEmail" runat="server" ControlToValidate="txtUsername" CssClass="redstar" ErrorMessage="Email id seems to be uncorrect" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </label>
                </div>
                <div class="contInputBar">
                    <label for="txtPassword" id="lblPassword" class="inputBar">
                        <span class="mark">Password</span>
                        <asp:TextBox runat="server" ID="txtPassword" MaxLength="100" TextMode="Password" CssClass="form-control" />
                    </label>
                </div>
                <div class="txt-c">
                    <asp:Button ID="Button1" runat="server" OnClick="LogIn" Text="Log in" CssClass="btn log" />
                </div>
                <div class="contLink">
                    <a href="/Account/PasswordRecover.aspx" id="lostPasswordButton">Forgot your password?</a>
                </div>
                <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                    <p class="text-danger">
                        <asp:Literal runat="server" ID="FailureText" />
                    </p>
                </asp:PlaceHolder>
            </div>
            <div class="dxcol">
                <div class="or">
                    <span>or</span>
                </div>
                <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
            </div>
        </div>
        <div class="bottom">
            <div class="footico"></div>
            <div class="contLink firsttime" style="border: 3px">
                <asp:HyperLink runat="server" ID="registerOnEdilportaleButton" ViewStateMode="Disabled">First time on return-filing.in? Register now</asp:HyperLink>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function()
        {
            $("#divMain1").css('min-height', $(window).height() - 174 - ($(".header-panel").height() + $(".footer-panel").height()));
        });
    </script>
</asp:Content>

