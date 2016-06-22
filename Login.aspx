<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-md-4">
        </div>
        <div class="col-md-4">
            <br />
            <br />
            <div style="border:1px solid #e5e5e5; padding:20px; background-color:#F3F3F3">
            <h3 class="form-signin-heading">Lets get you started with your Income Tax Return</h3>
             <p>
                <label for="txtDob">Date of Birth</label>
                <span class="redstar">*</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtDob" ClientIDMode="AutoID" CssClass="redstar" ErrorMessage="required" SetFocusOnError="true" ValidateRequestMode="Disabled" runat="server"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txtDob" runat="server" class="form-control"></asp:TextBox>
                
            </p>
                <p>
                <label for="txtPan">Pan</label>
                <span class="redstar">*</span>
                <asp:RequiredFieldValidator ID="RequiredtxtPan" ControlToValidate="txtPan" ClientIDMode="AutoID" CssClass="redstar" ErrorMessage="required" SetFocusOnError="true" ValidateRequestMode="Disabled" runat="server"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txtPan" runat="server" class="form-control"></asp:TextBox>
            </p>
            <p>
                <label for="txtEmail">Email</label>
                <span class="redstar">*</span>
                <asp:RequiredFieldValidator ID="RequiredtxtEmail" ControlToValidate="txtEmail" ClientIDMode="AutoID" CssClass="redstar" ErrorMessage="required" SetFocusOnError="true" ValidateRequestMode="Disabled" runat="server"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressiontxtEmail" runat="server" ControlToValidate="txtEmail" CssClass="redstar" ErrorMessage="Email id seems to be uncorrect" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <br />
                <asp:TextBox ID="txtEmail" runat="server" class="form-control"></asp:TextBox>
            </p>
            
            <div class="checkbox">
                <label>
                    <input type="checkbox" value="remember-me" runat="server">
                    Remember me
                </label>
            </div>
            <asp:Button ID="btnSave" runat="server" Text="Click Here to continue"  class="btn btn-lg btn-primary btn-block" OnClick="btnSave_Click" />
            <asp:Literal ID="ltStatus" runat="server"></asp:Literal>
             </div>
        </div>
        <div class="col-md-4">
        </div>
    </div>
</asp:Content>

