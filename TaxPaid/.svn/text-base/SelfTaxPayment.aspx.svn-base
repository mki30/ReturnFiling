<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SelfTaxPayment.aspx.cs" Inherits="TaxPaid_AddTaxesPaid" %>

<%@ Register Src="~/Controls/IncomeSourceMenu.ascx" TagPrefix="uc1" TagName="IncomeSourceMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:IncomeSourceMenu runat="server" ID="IncomeSourceMenu" />
    <div class="container">
        <h2>Summary of Taxes Paid: Advance Tax and Self Assessment Tax</h2>
        <div class="row">
            <div class="col-md-12">
                <h3>Would you like to add entry on Taxes Paid?</h3>
                <p class="narrate">Add entries here if you <b>voluntarily</b> deposited taxes to the government. Note: This is separate from TDS. This is tax you deposited to the government via Challan 280.</p>
            </div>
        </div>

        <div id="divExisting" runat="server" visible="false"></div>
        
        <div class="row">
            <div class="col-md-6">
                <a href="/selftaxpayment/0" class="btn btn-info btn-sm">Add Entry</a>
            </div>
            <div class="col-md-6">
                <a href="/additionalinformation" class="btn btn-warning btn-sm pull-right">Go To Next &gt;&gt;</a>
            </div>
        </div>
        <div>
            <p>
                <br/>
            </p>
        </div>
        <asp:Panel ID="Panel1" runat="server" CssClass="">
            <h2>Add an Advance Tax or Self Assessment Tax entry</h2>
            <div class="highlight col-lg-6">
                <span id="spnID" runat="server" style="display:none"></span>
                <input type="text" id="txtID" runat="server" value="0" style="display:none" />
                <h3>Tax Paid</h3>
                <br />
                <span>Provide details about any Advance Tax or Self Assessment Tax paid</span>
                <p class="span">Amount Paid  <span class="redstar">*</span>
                    <asp:RequiredFieldValidator ID="RequiredtxtAmountPaid" runat="server" ErrorMessage="Required" ControlToValidate="txtAmountPaid" ForeColor="Red"></asp:RequiredFieldValidator></p>
                <asp:TextBox ID="txtAmountPaid" runat="server" CssClass="form-control Numeric" MaxLength="10"></asp:TextBox>
                <br />
                <p class="span">Date of Payment <span class="redstar">*</span>
                    <asp:RequiredFieldValidator ID="RequiredtxtDateOfPayment" runat="server" ErrorMessage="Required" ControlToValidate="txtDateOfPayment" ForeColor="Red"></asp:RequiredFieldValidator></p>
                <asp:TextBox ID="txtDateOfPayment" runat="server" CssClass="form-control date" MaxLength="15"></asp:TextBox>
                <br />
                <p class="span">BSR Code of the bank you deposited with  <span class="redstar">*</span>
                    <asp:RequiredFieldValidator ID="RequiredtxtBSRCode" runat="server" ErrorMessage="Required" ControlToValidate="txtBSRCode" ForeColor="Red"></asp:RequiredFieldValidator></p>
                <asp:TextBox ID="txtBSRCode" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>
                <br />
                <p class="span">Challan number  <span class="redstar">*</span>
                    <asp:RequiredFieldValidator ID="RequiredtxtChallanNo" runat="server" ErrorMessage="Required" ControlToValidate="txtChallanNo" ForeColor="Red"></asp:RequiredFieldValidator></p>
                <asp:TextBox ID="txtChallanNo" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>
                <br />
                <p>
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click1" />
                <asp:Literal ID="ltStatus" runat="server"></asp:Literal>
            </div>
        </asp:Panel>
    </div>
    
</asp:Content>

