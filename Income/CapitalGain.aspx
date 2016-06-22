﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CapitalGain.aspx.cs" Inherits="Income_CapitalGain" %>

<%@ Register Src="~/Controls/IncomeSourceMenu.ascx" TagPrefix="uc1" TagName="IncomeSourceMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <uc1:IncomeSourceMenu runat="server" ID="IncomeSourceMenu" />
    <div class="container" id="divMain1">
        <h1>Capital Gain</h1>
        <p>Did you sell any asset (shares, property, house, land, building, etc) between the period of April 1, 2013 to March 31, 2014?</p>
        <p>You can go to next, if you did not sell any asset.</p>
        <div>
            <a class="btn btn-warning btn-sm" href="#">Go To Next &gt;&gt;</a>
        </div>
        <div class="row">
            <div class="span12" id="divExistingGain" runat="server" visible="false"></div>
        </div>

        <h3>Long Term Capital Gains</h3>
        <hr />
        <div class="row">
            <div class="col-md-4"><a class="btn btn-info btn-sm" href="/capitalgain/1">Add detail of Sale of Shares</a></div>
            <div class="col-md-4"><a class="btn btn-primary btn-sm" href="/capitalgain/2">Add detail of Sale of land or building (property)</a></div>
            <div class="col-md-4"><a class="btn btn-success btn-sm" href="/capitalgain/3">detail of Sale of any other asset</a></div>
        </div>
        <h3>Short Term Capital Gains</h3>
        <hr />
        <div class="row">
            <div class="col-md-4"><a class="btn btn-info btn-sm" href="/capitalgain/4">Add detail of Sale of Shares</a></div>
            <div class="col-md-4"><a class="btn btn-primary btn-sm" href="/capitalgain/5">Add detail of Sale of land or building (property)</a></div>
            <div class="col-md-4"><a class="btn btn-success btn-sm" href="/capitalgain/6">detail of Sale of any other asset</a></div>
        </div>
        <br />



        <hr />
        <input type="text" id="txtID" runat="server" style="display: none" value="0" />

        <div class="highlight col-lg-6" runat="server" id="formDiv" visible="false">
            <h4 id="h3TypeInfo" runat="server" class="pull-right"></h4><br />
            <div id="AssetSoldDiv" runat="server">
                <span class="span">Description of Asset Sold  <span class="redstar"><span class="redstar">*</span></span>
                    <asp:RequiredFieldValidator ID="RequiredtxtAssetSold" runat="server" ErrorMessage="Required" ControlToValidate="txtAssetSold" ForeColor="Red"></asp:RequiredFieldValidator></span>
                <p class="p">
                    Example: Sale of Shares or Sale of House
                </p>
                <asp:TextBox ID="txtAssetSold" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
                <br />
            </div>
            <div id="SalePriceDiv" runat="server">
                <span class="span">Sale Price  <span class="redstar"><span class="redstar">*</span></span>
                    <asp:RequiredFieldValidator ID="RequiredtxtSalePrice" runat="server" ErrorMessage="Required" ControlToValidate="txtSalePrice" ForeColor="Red"></asp:RequiredFieldValidator></span>
                <p class="p">
                </p>
                <asp:TextBox ID="txtSalePrice" runat="server" CssClass="form-control Numeric" MaxLength="10"></asp:TextBox>
                <br />
            </div>
            <div id="ValueOfPropertyDiv" runat="server">
                <span class="span">Value of Property on which stamp duty paid (in Rs.)  <span class="redstar"><span class="redstar">*</span></span> </span>
                <p class="p">
                    When property is sold, Stamp duty is paid on the value of property. 
                    Please mention the value of property on which you paid
                        stamp duty. Typically this amount is the same as Sale price.
                </p>
                <asp:TextBox ID="txtValueOfProperty" runat="server" CssClass="form-control Numeric" MaxLength="10"></asp:TextBox>
                <br />
            </div>
            <div id="TrasferExpensDiv" runat="server">
                <span class="span">Transfer Expenses  </span>
                <p class="p">
                    Example: Brokerage fees on sale of shares
                </p>
                <asp:TextBox ID="txtTrasferExpens" runat="server" CssClass="form-control Numeric" MaxLength="10"></asp:TextBox>
                <br />
            </div>
            <div id="PurchasePriceDiv" runat="server">
                <span class="span">Purchase Price  </span>
                <p class="p">
                </p>
                <asp:TextBox ID="txtPurchasePrice" runat="server" CssClass="form-control Numeric" MaxLength="10"></asp:TextBox>
                <br />
            </div>
            <div id="DateOfSaleDiv" runat="server">
                <span class="span">Date of Sale  <span class="redstar"><span class="redstar">*</span></span>
                    <asp:RequiredFieldValidator ID="RequiredtxtDateOfSale" runat="server" ErrorMessage="Required" ControlToValidate="txtDateOfSale" ForeColor="Red"></asp:RequiredFieldValidator>
                </span>
                <p class="p">
                </p>
                <asp:TextBox ID="txtDateOfSale"  runat="server" CssClass="form-control date" MaxLength="15"></asp:TextBox>
                <br />
            </div>
            <div id="DateOfPurchaseDiv" runat="server">
                <span class="span">Date of Purchase  <span class="redstar"><span class="redstar">*</span></span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="txtDateOfPurchase" ForeColor="Red"></asp:RequiredFieldValidator>
                </span>
                <br />
                <asp:TextBox ID="txtDateOfPurchase" runat="server" CssClass="form-control date" MaxLength="15"></asp:TextBox>
            </div>
            <div id="cbPaySttDiv" runat="server">
                <span class="span">Did you pay STT? </span>
                <br />
                <asp:CheckBox ID="cbPayStt" Text="" runat="server" />
                <br />
            </div>
            <div id="ddTypeOfShareDiv" runat="server">
                <span class="span">Type Share</span>
                <p class="p">Typical shares are Listed Securities</p>
                <asp:DropDownList runat="server" ID="ddTypeOfShare" CssClass="form-control">
                    <asp:ListItem Value="ListedSecurities">Listed Securities</asp:ListItem>
                    <asp:ListItem Value="NonListedSecurities">Non Listed Securities</asp:ListItem>
                    <asp:ListItem Value="ListedDebentures">Listed Debentures</asp:ListItem>
                    <asp:ListItem Value="NonListedDebentures">Non Listed Debentures</asp:ListItem>
                </asp:DropDownList>
                <br />
            </div>
            <div id="InvestUnder54Div" runat="server">
                <span class="span">Investment Under Section 54 </span>
                <p class="p">
                </p>
                <asp:TextBox ID="txtInvestUnder54" runat="server" CssClass="form-control Numeric" MaxLength="10"></asp:TextBox>
                <br />
            </div>
            <div id="InvestUnder54ECDiv" runat="server">
                <span class="span">Investment Under Section 54EC  </span>
                <p class="p">
                </p>
                <asp:TextBox ID="txtInvestUnder54EC" runat="server" CssClass="form-control Numeric" MaxLength="10"></asp:TextBox>
                <br />
            </div>
            <div id="InvestUnder54FDiv" runat="server">
                <span class="span">Investment Under Section 54F </span>
                <asp:TextBox ID="txtInvestUnder54F" runat="server" CssClass="form-control Numeric" MaxLength="10"></asp:TextBox>
                <br />
                <a href="#">Click here</a>if you want to add cost of improvement
            </div>
            <br />
            <asp:Button ID="btnsaveCapitalGain" runat="server" OnClick="btnsaveCapitalGain_Click" CssClass="btn btn-primary" Text="save" />
            <asp:Literal ID="ltStatus" runat="server"></asp:Literal>
            <span id="spnID" runat="server" style="display: none">0</span>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function()
        {
            $("#divMain1").css('min-height', $(window).height() - 200 - ($(".header-panel").height() + $(".back-top").height() + $(".footer-panel").height()));
            $("#divExistingGain #r_" + $("#spnID").text()).addClass("currentrecord");
        });
    </script>
</asp:Content>

