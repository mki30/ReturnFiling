<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Permanent.aspx.cs" Inherits="Permanent" %>
<%@ Register Src="~/Controls/IncomeSourceMenu.ascx" TagPrefix="uc1" TagName="IncomeSourceMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:IncomeSourceMenu runat="server" ID="IncomeSourceMenu" />
    <div class="container" id="divMain" style="margin-top: -20px;">
        <div class="highlight col-lg-6">
            <p>
                <label for="firstName">First Name</label>
                <span class="redstar">*</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtFirstName" ClientIDMode="AutoID" CssClass="redstar" ErrorMessage="required" SetFocusOnError="true" ValidateRequestMode="Disabled" runat="server"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txtFirstName" runat="server" class="form-control Alpha" MaxLength="20"></asp:TextBox>

            </p>
            <p>
                <label for="txtMiddleName">Middle Name</label>
                <br />
                <asp:TextBox ID="txtMiddleName" runat="server" class="form-control Alpha" MaxLength="20"></asp:TextBox>
            </p>
            <p>
                <label for="txtLastName">Last Name</label>
                <span class="redstar">*</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtLastName" ClientIDMode="AutoID" CssClass="redstar" ErrorMessage="required" SetFocusOnError="true" ValidateRequestMode="Disabled" runat="server"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txtLastName" runat="server" class="form-control Alpha" MaxLength="20"></asp:TextBox>

            </p>
            <p>
                <label for="txtEmail">Email</label>
                <span class="redstar">*</span>
                <asp:RequiredFieldValidator ID="RequiredtxtEmail" ControlToValidate="txtEmail" ClientIDMode="AutoID" CssClass="redstar" ErrorMessage="required" SetFocusOnError="true" ValidateRequestMode="Disabled" runat="server"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressiontxtEmail" runat="server" ControlToValidate="txtEmail" CssClass="redstar" ErrorMessage="Email id seems to be uncorrect" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <br />
                <asp:TextBox ID="txtEmail" runat="server" class="form-control" MaxLength="50"></asp:TextBox>
            </p>
            <p>
                <label for="ddGender">Gender</label>
                <br />
                <asp:DropDownList ID="ddGender" runat="server" class="form-control">
                    <asp:ListItem Value="0">Male</asp:ListItem>
                    <asp:ListItem Value="1">Female</asp:ListItem>
                </asp:DropDownList>
            </p>

            <p>
                <label for="txtDob">Date of Birth</label>
                <span class="redstar">*</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtDob" ClientIDMode="AutoID" CssClass="redstar" ErrorMessage="required" SetFocusOnError="true" ValidateRequestMode="Disabled" runat="server"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txtDob" runat="server" class="form-control date" MaxLength="12"></asp:TextBox>

            </p>

            <p>
                <label for="txtPan">PAN number</label>
                <span class="redstar">*</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtPan" ClientIDMode="AutoID" CssClass="redstar" ErrorMessage="required" SetFocusOnError="true" ValidateRequestMode="Disabled" runat="server"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txtPan" runat="server" class="form-control" MaxLength="10"></asp:TextBox>

            </p>
            <p>
                <label for="txtFathersName">Father's Name</label>
                <span class="redstar">*</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtFathersName" ClientIDMode="AutoID" CssClass="redstar" ErrorMessage="required" SetFocusOnError="true" ValidateRequestMode="Disabled" runat="server"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txtFathersName" runat="server" class="form-control Alpha" MaxLength="50"></asp:TextBox>
            </p>
            <br />

            <p>
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click1" class="btn btn-primary btn-sm" />
                <asp:Literal ID="ltStatus" runat="server"></asp:Literal>
                <%--<a href='/Address' class='span pull-right' id="aAddress" runat="server" visible="false">Add / Update Address</a>--%>
            </p>
        </div>
        <span id="spnID" runat="server" style="display: none">0</span>
    </div>
    <script type="text/javascript">
        $(document).ready(function()
        {
            $("#divMain").css('min-height', $(window).height() - 150 - ($(".header-panel").height() + $(".back-top").height() + $(".footer-panel").height()));
        });
    </script>
</asp:Content>
