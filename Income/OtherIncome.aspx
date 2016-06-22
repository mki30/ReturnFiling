<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OtherIncome.aspx.cs" Inherits="Income_OtherIncome" %>

<%@ Register Src="~/Controls/IncomeSourceMenu.ascx" TagPrefix="uc1" TagName="IncomeSourceMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:IncomeSourceMenu runat="server" ID="IncomeSourceMenu" />
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="highlight">
                    <h3>Other Income</h3>
                    <span class="span">Interest Income from Saving Bank and Post office deposits
                      <asp:RequiredFieldValidator ID="RequiredtxtInterestIncomeFromBank" runat="server" ErrorMessage="" ControlToValidate="txtInterestIncomeFromBank"></asp:RequiredFieldValidator>
                    </span>
                    <p></p>
                    <asp:TextBox ID="txtInterestIncomeFromBank" runat="server" CssClass="form-control Numeric" MaxLength="10"></asp:TextBox>
                    <br />
                    <span class="span">Other Interest Income: From Fixed deposits etc 
                    </span>
                    <br />
                    <p class="p">
                        Interest from sweep accounts coverted to FDs also specified here
                    </p>
                    <asp:TextBox ID="txtOtherInterestIncome" runat="server" CssClass="form-control Numeric" MaxLength="10"></asp:TextBox>
                    <br />
                    <span class="span">Any Other Income 
                    </span>
                    <p class="p">
                    Report any other income which is not part of Income from Salary, 
                    House Property, Capital Gain or Business and Profession head.
                    Gifts can be declared as Income here.
                    </p>
                    <asp:TextBox ID="txtAnyOtherIncome" runat="server" CssClass="form-control Numeric" MaxLength="10"> </asp:TextBox>
                    <br />
                </div>

                <div class="highlight">
                    <h3>Exempt Income</h3>
                    <span class="span">Dividend earned   </span>
                    <p class="p">Dividend from shares. Income earned on investments in Mutual Funds, ULIPs, UTI.</p>

                    <asp:TextBox ID="txtDividedEarned" runat="server" CssClass="form-control Numeric" MaxLength="10"></asp:TextBox>
                    <br />
                    <span class="span">Exempt Interest Income 
                    </span>
                    <br />
                    <p class="p">
                        Example: Interest earned on PPF
                    </p>

                    <asp:TextBox ID="txtExpemtInterestIncome" runat="server" CssClass="form-control Numeric" MaxLength="10"></asp:TextBox>
                    <br />
                    <span class="span">Other miscellaneous exempt Income 
                    </span>
                    <br />
                    <p class="p">
                        Specify any other exempt income
                    </p>

                    <asp:TextBox ID="txtOtherExpemtIncome" runat="server" CssClass="form-control Numeric" MaxLength="10"></asp:TextBox>
                    <br />
                    <span class="span">Agriculture Income 
                    </span>

                    <br />
                    <p class="p">
                        Specify income from agriculture sources
                    </p>
                    <asp:TextBox ID="txtAgrIncome" runat="server" CssClass="form-control Numeric" MaxLength="10"></asp:TextBox>
                    <br />
                </div>
                <p>
                    <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary btn-sm" Text="save" OnClick="btnSave_Click" />
                    <asp:Literal ID="ltStatus" runat="server"></asp:Literal>
                </p>
            </div>
        </div>
    </div>
</asp:Content>

