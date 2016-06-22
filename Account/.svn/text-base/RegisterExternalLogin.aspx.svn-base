<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RegisterExternalLogin.aspx.cs" Inherits="Account_RegisterExternalLogin" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1">
<div class="container" id="divMain">
        <br /><br /><br />
        <div class="row">
            <div class="col-md-6">
                <%--<h2 class="pgtitle"><%: Page.Title %>.</h2>--%>
               
                <h3>Register with your <%: ProviderName %> account</h3>
                <asp:PlaceHolder ID="PlaceHolder1" runat="server">
                    <div class="form-horizontal">
                        <h4>Association Form</h4>
                        <hr />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
                        <p class="text-info">
                            You've authenticated with <strong><%: ProviderName %></strong>. Please enter a user name below for the current site
                and click the Log in button.
                        </p>

                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" AssociatedControlID="userName" CssClass="col-md-2 control-label">Email ID</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="userName" CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="userName" Display="Dynamic" CssClass="text-danger" ErrorMessage="User name is required" />
                                <asp:RegularExpressionValidator ID="RegularExpressiontxtEmail" runat="server" ControlToValidate="userName" CssClass="redstar" ErrorMessage="Email id seems to be uncorrect" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                <asp:ModelErrorMessage runat="server" ModelStateKey="UserName" CssClass="text-danger" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <asp:Button ID="Button1" runat="server" Text="Log in" CssClass="btn btn-primary" OnClick="LogIn_Click" />
                                <br /><span id="spnError" runat="server" ></span>
                            </div>
                        </div>
                    </div>

                </asp:PlaceHolder>
            </div>
        </div>
    </div>
</asp:Content>
