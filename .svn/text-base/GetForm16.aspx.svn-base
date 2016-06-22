<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GetForm16.aspx.cs" Inherits="GetForm16Password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />
    <div class="container" id="divMain1">
        <asp:Panel ID="pnlUploadPDF" runat="server">
            <h1>
                Upload your Form-16 PDF.<br>
                We prepare your Income Tax Return. Automatically.
            </h1>
            <br />
            <p>
                Please only upload PDF version of your Form-16. Scanned images don't work.
            </p>
            <div class="jumbotron">
                <div class="row">
                    <div class="col-md-6">
                        <p>
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtDob" runat="server" placeholder="Date of Birth" class="form-control input-sm date" MaxLength="12"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <asp:RequiredFieldValidator ID="RequiredtxtDob" Style="font-size: 12px;" SetFocusOnError="true" runat="server" ErrorMessage="Required" ControlToValidate="txtDob" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </p>
                        <p>
                            <asp:DropDownList class="form-control input-sm" Style="max-width: 100px;" ID="ddGender" runat="server">
                                <asp:ListItem Value="0">Male</asp:ListItem>
                                <asp:ListItem Value="1">female</asp:ListItem>
                            </asp:DropDownList>
                        </p>

                        <p>
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtFatherName" runat="server" placeholder="Father's Name" class="form-control input-sm" MaxLength="30"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Style="font-size: 12px;" SetFocusOnError="true" runat="server" ErrorMessage="Required" ControlToValidate="txtFatherName" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </p>

                        <p style="font-size: 12px;">
                            <asp:FileUpload ID="FileUpload1" runat="server" class="btn btn-sm btn-primary" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please chose only pdf file" ControlToValidate="FileUpload1" Display="Dynamic" ForeColor="Red" ValidationExpression="^.*\.(pdf|PDF)$"></asp:RegularExpressionValidator>
                        </p>
                        <p style="font-size: 12px;">
                            <asp:Button ID="btnPdfUpload" runat="server" Text="Upload Form 16 PDF" class="btn btn-primary" OnClick="btnPdfUpload_Click" />
                            <asp:Literal ID="ltStatus" runat="server"></asp:Literal>
                        </p>
                    </div>
                    <div class="col-md-6">
                    </div>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="pnlPassword" runat="server" Visible="false">
            <h1>Enter your Form-16 PDF password</h1>
            <br />
            <p>Your Form-16 PDF is password protected. We need the Form-16 PDF password to open it. Please provide your Form-16 password.</p>
            <br />
            <div class="row">
                <div class="col-md-3">
                    <asp:TextBox ID="txtPassword" runat="server" class="form-control input-sm" MaxLength="20"></asp:TextBox>
                    <br />
                    <asp:Literal ID="ltValidationMsg" runat="server"></asp:Literal>
                </div>
                <div class="col-md-3">
                    <asp:Button ID="btnPasswordSubmit" runat="server" Text="Next >>" class="btn btn-primary btn-sm" OnClick="btnPasswordSubmit_Click" />
                </div>
                <div class="col-md-3"></div>
                <div class="col-md-3"></div>
            </div>
        </asp:Panel>
        <asp:Panel ID="pnlSummary" runat="server" Visible="false">

            <div class="col-lg-6" id="divSummary" runat="server">
                <h2>Results from reading Form-16</h2>
                <strong>Based on what we understood from your Form-16, we calculated your tax due.</strong>
                <br />
                <p>We will ask you further details to help prepare your Income Tax Return. We have a step-by-step procedure to make tax filing really simple.</p>
                <div class="prepend-6 span-10 append-8 last">
                    <%--<a class="btn btn-success" id="aPermanentForm" runat="server" href="#">--%>
                    <asp:Label ID="lblRefundProceed" runat="server" Text="Label" class="btn btn-success"></asp:Label>
                    <%--</a>--%>
                </div>
                <br />
                <br />

                <h3>Summary of Income, Deductions and Taxes</h3>
                <table class="table">
                    <tbody>
                        <tr>
                            <td>Taxable Income From Salary</td>
                            <td>
                                <asp:Label ID="lblTaxableIncome" runat="server" class="span"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Gross Total Income</td>
                            <td>
                                <asp:Label ID="lblGrossTotalIncome" runat="server" class="span"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Total Deductions</td>
                            <td>
                                <asp:Label ID="lblTotalDeductions" runat="server" class="span"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Total Income</td>
                            <td>
                                <asp:Label ID="lblTotalIncome" runat="server" class="span"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Tax Due</td>
                            <td>
                                <asp:Label ID="lblTaxDue" runat="server" class="span"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Tax Paid</td>
                            <td>
                                <asp:Label runat="server" ID="lblTaxPaid" class="span"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Refund</td>
                            <td>
                                <asp:Label runat="server" ID="lblRefund" class="span"></asp:Label></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-lg-2">&nbsp;</div>

            <div class="highlight col-lg-4">
                <a href="/personalinfo" class="btn btn-warning btn-lg">Submit Personal Details</a>
                </div>

            <%--<div class="highlight col-lg-4">
                <h4>Enter Bank Account Details</h4>
                <p>
                    <label for="txtBankAccountNumber">Bank Account Number</label>
                    <span class="redstar">*</span>
                    <asp:TextBox ID="txtBankAccountNumber" runat="server" class="form-control" MaxLength="20"></asp:TextBox>
                </p>

                <p>
                    <label for="txtBankIFSC">IFSC code of your Branch</label>
                    <span class="redstar">*</span>
                    <asp:TextBox ID="txtBankIFSC" runat="server" class="form-control" MaxLength="10"></asp:TextBox>
                    <span class="p">The Indian Financial System Code (IFSC) is an 11-character alphanumeric code that identifies your bank and branch.<br />
                    </span>
                </p>

                <p>
                    <label for="ddAccountType">Type of Bank Account</label>
                    <span class="redstar">*</span>
                    <br />
                    <asp:DropDownList ID="ddAccountType" CssClass="form-control pull-left" Style="max-width: 150px;" runat="server">
                        <asp:ListItem>Saving Account</asp:ListItem>
                        <asp:ListItem>Current Account</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="btnSaveBankInfo" runat="server" Text="Save" OnClick="btnSaveBankInfo_Click" CssClass="btn btn-primary pull-right" />
                </p>

            </div>--%>
            <br />
            <br />
            <div>

                <%--                <div class="row">
                    <br />
                    <br />
                    <div class="col-lg-12">
                        <a class="btn btn-success pull-left" href="#">The results look incorrect. I want GSC staff to help me &gt;&gt;</a>
                        <p class="p">
                            <br />
                            <br />
                            <br />
                            In case there are minor problems with the results, don't worry. You can edit the values before filing your returns.
                        </p>
                    </div>
                </div>--%>
            </div>
        </asp:Panel>
        <asp:Panel ID="pnlSuccess" runat="server" Visible="false">
            <div class="alert alert-success" role="alert">
                <h3>Your application and bank details submitted successfully.</h3>
                <p>It's all  we need to ask. Our associate will contact you shortly.</p>
            </div>

            <div class="col-lg-6 alert-info">
                <br />
                <strong><span class="glyphicon glyphicon-info-sign"></span>&nbsp;&nbsp;Please refer following details for submitting our fees.</strong>
                <br />
                <br />
                <table class="table">
                    <tbody>
                        <tr>
                            <th>Account Number</th>
                            <td>45854488548578</td>
                        </tr>
                        <tr>
                            <th>Bank Name</th>
                            <td>ABC Bank</td>
                        </tr>
                        <tr>
                            <th>Branch Name</th>
                            <td>Indirapuram, Ghaziabad</td>
                        </tr>
                        <tr>
                            <th>IFSC Code</th>
                            <td>22233344456</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </asp:Panel>
    </div>
    <script type="text/javascript">
        $(document).ready(function()
        {
            $("#divMain1").css('min-height', $(window).height() - 105 - ($(".header-panel").height() + $(".back-top").height() + $(".footer-panel").height()));
        });
    </script>
</asp:Content>

