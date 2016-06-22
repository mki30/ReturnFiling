<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Income/AddAssets.aspx.cs" Inherits="Income_AddAssets" %>

<%@ Register Src="~/Controls/IncomeSourceMenu.ascx" TagPrefix="uc1" TagName="IncomeSourceMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:IncomeSourceMenu runat="server" ID="IncomeSourceMenu" />
    <div class="container" id="divMain" runat="server">
        <h2>Immovable Asset</h2>
        <div class="highlight">
            <span class="span">Land</span>
            <div class="row">
                <div class="col-lg-6">
                    <p class="p">Assets (Cost) (Rs.) (A)</p>
                    <asp:TextBox ID="txt_Land_Cost" runat="server" CssClass="col-xs-4 form-control input-sm Numeric" MaxLength="10"></asp:TextBox>
                </div>
                <div class="col-lg-6">
                    <p class="p">Liability in this respect (Rs.)</p>
                    <asp:TextBox ID="txt_Land_Liability" runat="server" CssClass="col-xs-4 form-control input-sm" MaxLength="10"></asp:TextBox>
                </div>
            </div>
            <br />
            <span class="span">Building</span>
            <div class="row">
                <div class="col-lg-6">
                    <p class="p">Assets (Cost) (Rs.) (A)</p>
                    <asp:TextBox ID="txt_Building_Cost" runat="server" CssClass="col-xs-4 form-control input-sm Numeric" MaxLength="10"></asp:TextBox>
                </div>
                <div class="col-lg-6">
                    <p class="p">Liability in this respect (Rs.)</p>
                    <asp:TextBox ID="txt_Building_Liability" runat="server" CssClass="col-xs-4 form-control input-sm Numeric" MaxLength="10"></asp:TextBox>
                </div>
            </div>
        </div>

        <h2>Movable Asset</h2>
        <div class="highlight">
            <h3>a. Financial Asset</h3>
            <span class="span"></span>
            <p class="span">i. Deposits in Bank (including balance in any account)</p>
            <div class="row">
                <div class="col-lg-6">
                    <p class="p">Assets (Cost) (Rs.) (A)</p>
                    <asp:TextBox ID="txt_Bank_Cost" runat="server" CssClass="col-xs-4 form-control input-sm Numeric" MaxLength="10"></asp:TextBox>
                </div>
                <div class="col-lg-6">
                    <p class="p">Liability in this respect (Rs.)</p>
                    <asp:TextBox ID="txt_Bank_Liability" runat="server" CssClass="col-xs-4 form-control input-sm Numeric" MaxLength="10"></asp:TextBox>
                </div>
            </div>
            <br />

            <p class="span">ii. Shares and securities</p>
            <div class="row">
                <div class="col-lg-6">
                    <p class="p">Assets (Cost) (Rs.) (A)</p>
                    <asp:TextBox ID="txt_Shares_Cost" runat="server" CssClass="col-xs-4 form-control input-sm Numeric" MaxLength="10"></asp:TextBox>
                </div>
                <div class="col-lg-6">
                    <p class="p">Liability in this respect (Rs.)</p>
                    <asp:TextBox ID="txt_Shares_Liability" runat="server" CssClass="col-xs-4 form-control input-sm Numeric" MaxLength="10"></asp:TextBox>
                </div>
            </div>
            <br />
            <p class="span">iii. Insurance policies</p>
            <div class="row">
                <div class="col-lg-6">
                    <p class="p">Assets (Cost) (Rs.) (A)</p>
                    <asp:TextBox ID="txt_Insurance_Cost" runat="server" CssClass="col-xs-4 form-control input-sm Numeric" MaxLength="10"></asp:TextBox>
                </div>
                <div class="col-lg-6">
                    <p class="p">Liability in this respect (Rs.)</p>
                    <asp:TextBox ID="txt_Insurance_Liability" runat="server" CssClass="col-xs-4 form-control input-sm Numeric" MaxLength="10"></asp:TextBox>
                </div>
            </div>
            <br />
            <p class="span">iv. Loans and Advances given</p>
            <div class="row">
                <div class="col-lg-6">
                    <p class="p">Assets (Cost) (Rs.) (A)</p>
                    <asp:TextBox ID="txt_Loan_Cost" runat="server" CssClass="col-xs-4 form-control input-sm Numeric" MaxLength="10"></asp:TextBox>
                </div>
                <div class="col-lg-6">
                    <p class="p">Liability in this respect (Rs.)</p>
                    <asp:TextBox ID="txt_Loan_Liability" runat="server" CssClass="col-xs-4 form-control input-sm Numeric" MaxLength="10"></asp:TextBox>
                </div>
            </div>
            <br />
            <p class="span">v. Cash in hand</p>
            <div class="row">
                <div class="col-lg-6">
                    <p class="p">Assets (Cost) (Rs.) (A)</p>
                    <asp:TextBox ID="txt_Cash_Cost" runat="server" CssClass="col-xs-4 form-control input-sm Numeric" MaxLength="10"></asp:TextBox>
                </div>
                <div class="col-lg-6">
                    <p class="p">Liability in this respect (Rs.)</p>
                    <asp:TextBox ID="txt_Cash_Liability" runat="server" CssClass="col-xs-4 form-control input-sm Numeric" MaxLength="10"></asp:TextBox>
                </div>
            </div>

        </div>

        <div class="highlight">
            <h3>b. Jewellery, bullion etc.</h3>
            <span class="span"></span>
            <div class="row">
                <div class="col-lg-6">
                    <p class="p">Assets (Cost) (Rs.) (A)</p>
                    <asp:TextBox ID="txt_Jewellery_Cost" runat="server" CssClass="col-xs-4 form-control input-sm Numeric" MaxLength="10"></asp:TextBox>
                </div>
                <div class="col-lg-6">
                    <p class="p">Liability in this respect (Rs.)</p>
                    <asp:TextBox ID="txt_Jewellery_Liability" runat="server" CssClass="col-xs-4 form-control input-sm Numeric" MaxLength="10"></asp:TextBox>
                </div>
            </div>
            <br />
        </div>

        <div class="highlight">
            <h3>c. Archeological collections, drawings, paintings, sculpture or any work of art</h3>
            <span class="span"></span>
            <div class="row">
                <div class="col-lg-6">
                    <p class="p">Assets (Cost) (Rs.) (A)</p>
                    <asp:TextBox ID="txt_Archeological_Cost" runat="server" CssClass="col-xs-4 form-control input-sm Numeric" MaxLength="10"></asp:TextBox>
                </div>
                <div class="col-lg-6">
                    <p class="p">Liability in this respect (Rs.)</p>
                    <asp:TextBox ID="txt_Archeological_Liability" runat="server" CssClass="col-xs-4 form-control input-sm Numeric" MaxLength="10"></asp:TextBox>
                </div>
            </div>
            <br />
        </div>

        <div class="highlight">
            <h3>d. Vehicles, yachts, boats and aircrafts</h3>
            <span class="span"></span>
            <div class="row">
                <div class="col-lg-6">
                    <p class="p">Assets (Cost) (Rs.) (A)</p>
                    <asp:TextBox ID="txt_Vehicles_Cost" runat="server" CssClass="col-xs-4 form-control input-sm Numeric" MaxLength="10"></asp:TextBox>
                </div>
                <div class="col-lg-6">
                    <p class="p">Liability in this respect (Rs.)</p>
                    <asp:TextBox ID="txt_Vehicles_Liability" runat="server" CssClass="col-xs-4 form-control input-sm Numeric" MaxLength="10"></asp:TextBox>
                </div>
            </div>
            <br />
        </div>

        <p>
            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" class="btn btn-primary btn-sm Numeric" MaxLength="10" />
            <asp:Literal ID="ltStatus" runat="server"></asp:Literal>
        </p>

    </div>
</asp:Content>



