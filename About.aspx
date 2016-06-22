<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function()
        {
            $("#divMain1").css('min-height', $(window).height() - 250 - $(".header-panel").height() + $(".back-top").height() + $(".footer-panel").height());
        });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />
    <div class="container" id="divMain1">
        <!-- Main component for a primary marketing message or call to action -->
        <div class="row">
            <div class="col-md-12  highlight">
                <h1>About Us</h1>
                <br />
                <p class="p1">
                Garg Shekhar & Co. is a Chartered Accountant firm (herein after called GSC) in India based in Ghaziabad. We are young & dynamic Chartered Accountants 
                actively involved in this profession for the last 5 years. Strength of firm lies 
                in its delivering capacity through its own Colleague & panel of professionals. The firm consists of permanent staff 
                & other professionals capable of executing any task in advanced computerized environment. We have wide network of Chartered Accountants,
                Company Secretaries, MBA’s, CMA and other professionals so that all services can be provided from single platform
                </p>
        </div>
        </div>
    </div>
</asp:Content>

