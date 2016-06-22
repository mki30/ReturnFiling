<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdditionalInformation.aspx.cs" Inherits="TaxFiling_AdditionalInformation" %>
<%@ Register Src="~/Controls/IncomeSourceMenu.ascx" TagPrefix="uc1" TagName="IncomeSourceMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:IncomeSourceMenu runat="server" ID="IncomeSourceMenu" />    
    <div class="container">
        <input type="text" id="txtID" runat="server" value="0" style="display:none" />
        <span id="spnID" runat="server"  style="display:none" ></span>

        <h2>Additional Information needed for Income Tax Return</h2>
        <div class="row">
            <div class="highlight col-lg-6">
                <p>
                    <label for="IncomeTaxWard">Income Tax Ward/Circle</label>
                    <br />
                    <span class="p">Leave empty if you don't know your ward/circle.</span>
                    <asp:TextBox ID="txtIncomeTaxWard" runat="server" class="form-control Alpha" MaxLength="30"></asp:TextBox>
                </p>

                <p>
                    <label for="txtEmail">Your Email Id for tax filing</label>
                    <span class="redstar">*</span>
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" MaxLength="30"></asp:TextBox>
                </p>

                <p>
                    <label for="txtSecondayEmail">Email Address (secondary)</label>
                    <asp:TextBox ID="txtSecondayEmail" runat="server" class="form-control" MaxLength="30"></asp:TextBox>
                </p>

                <p>
                    <label for="txtMobile">Mobile Phone number</label>
                    <span class="redstar">*</span>
                    <asp:TextBox ID="txtMobile" runat="server" class="form-control Numeric" MaxLength="10"></asp:TextBox>
                </p>
                <p>
                    <label for="txtSecondayMobile">Mobile Phone number (secondary)</label>
                    <asp:TextBox ID="txtSecondayMobile" runat="server" class="form-control Numeric" MaxLength="10"></asp:TextBox>
                </p>

                <p>
                    <label for="txtSTDCode">STD code of Landline Telephone</label>
                    <span class="redstar">*</span>
                    <br />
                    <span class="p">Type in only STD code (like 011)</span>

                    <asp:TextBox ID="txtSTDCode" runat="server" class="form-control Numeric" MaxLength="5"></asp:TextBox>
                </p>
                <p>
                    <label for="txtPhone">Landline Telephone number</label>
                    <br />
                    <span class="p">Leave empty if you don't have Landline Telephone number</span>
                    <asp:TextBox ID="txtPhone" runat="server" class="form-control Numeric" MaxLength="10"></asp:TextBox>
                </p>
            </div>
        </div>
        <div class="row">
            <div class="highlight col-lg-6">
                <h2>Bank Account Details</h2>
                <p>
                    <label for="txtBankAccountNumber">Bank Account Number</label>
                    <span class="redstar">*</span>
                    <asp:TextBox ID="txtBankAccountNumber" runat="server" class="form-control" MaxLength="20"></asp:TextBox>
                </p>


                <p>
                    <label for="txtBankIFSC">IFSC code of your Branch</label>
                    <span class="redstar">*</span>
                    <asp:TextBox ID="txtBankIFSC" runat="server" class="form-control" MaxLength="10"></asp:TextBox>
                    <span class="p">The Indian Financial System Code (IFSC) is an 11-character alphanumeric code<br />
                        that identifiesyour bank and branch.<br />
                    </span>
                </p>

                <p>
                    <label for="ddAccountType">Type of Bank Account</label>
                    <span class="redstar">*</span>
                    <asp:DropDownList ID="ddAccountType" CssClass="form-control" Style="max-width: 150px;" runat="server">
                        <asp:ListItem>Saving Account</asp:ListItem>
                        <asp:ListItem>Current Account</asp:ListItem>
                    </asp:DropDownList>
                </p>

            </div>
        </div>
        <div class="row">
            <div class="highlight col-lg-6">
                <h2>Relief Under Section 89</h2>
                <p>
                    <label for="txtReliefUnder89">Relief Under Section 89</label>
                    <span class="redstar">*</span>
                    <asp:TextBox ID="txtReliefUnder89" runat="server" class="form-control" MaxLength="20"></asp:TextBox>
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <p>
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" class="btn btn-primary btn-sm" />
                    <asp:Literal ID="ltStatus" runat="server"></asp:Literal>
                </p>
            </div>
        </div>
    </div>
</asp:Content>

