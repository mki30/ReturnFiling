<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Donation.aspx.cs" Inherits="Deductions_Donation" %>
<%@ Register Src="~/Controls/IncomeSourceMenu.ascx" TagPrefix="uc1" TagName="IncomeSourceMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        select { max-width: 200px !important; }
    </style>
    <script type="text/javascript">
        $(document).ready(function()
        {
            $("#divMain").css('min-height', $(window).height() - 120 - ($(".header-panel").height() + $(".back-top").height() + $(".footer-panel").height()));
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:IncomeSourceMenu runat="server" ID="IncomeSourceMenu" />
    <div class="container" id="divMain">
        <h2>Summary of Deductions Under Section 80G</h2>
        <div class="span-24 last">
        </div>
        <br />
        <div style="text-indent: 150px;">
            <h4>Would you like to add any Donations made under Section 80G?</h4>
        </div>
        <br />
        <br />
        <a class="btn btn-primary btn-sm" href="/donationadd/0">Add Donation under Section 80G</a>
        <a class="btn btn-warning btn-sm pull-right" href="/moredeductions">Go To Next &gt;&gt;</a>
        <br />
        <hr />
        <div id="divAddedDonations" runat="server">
            <h3>You haven't added any Deduction under Section 80G entries.</h3>
        </div>
        <hr />
    </div>
</asp:Content>
