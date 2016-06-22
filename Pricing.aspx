<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Pricing.aspx.cs" Inherits="Pricing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .ct-box
        {
            background: #fff;
            -webkit-border-radius: 8px;
            border-radius: 8px;
            padding: 15px 14px;
            margin: 0 10px;
            border: 1px solid #aaa;
            border: 1px solid transparent;
            box-shadow: 0 3px 0 0 rgba(0,0,0,.2),0 0 2px 0 rgba(0,0,0,.25);
        }

        .m20
        {
            margin-top: 20px;
            margin-bottom: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />
    <div class="container" >
        <!-- Main component for a primary marketing message or call to action -->
        <div class="row" id="divMain1">
            <div class="col-md-12 alert alert-info" style="text-align: center;">
                <h2>Pricing plans for e-filing Income Tax Returns</h2>
            </div>
            <%--<div class="col-md-12">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-10 col-sm-offset-1 m60">

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 m20">

                                    <div id="plan-self" class="ct-box text-center">

                                        <h3 class="lead">
                                            <strong>Self e-Filing</strong><br>
                                            <small>One plan to rule them all.</small>
                                        </h3>

                                        <p class="bigger m20">
                                            Completely Free. No Strings Attached
                                        </p>

                                        <p class="m20">
                                            <a href="/permanent" class="btn btn-warning">Start e-Filing your Tax Return Now!</a>
                                        </p>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>


            <div class="col-md-10 col-md-offset-1 col-sm-12 col-sm-offset-0 text-center m60">
                <h3 class="subtitle">CA Assisted e-Filing<br>
                    <span class="small">Tax filing with total peace of mind</span>
                </h3>

                <%--<div class="row m40">
                    <div class="col-sm-4 margin-md">
                        <div class="ct-box">
                            <h3 class="lead">
                                <strong>Salary &amp; Other Income</strong>
                            </h3>
                            <p class="bigger m20">Rs. 499</p>
                            <p>
                                <a class="btn btn-success" href="#">Buy this plan</a>
                            </p>

                            <p style="font-family: georgia; font-style: italic;">
                                Covers Salary and Interest Income from Savings, Fixed Deposits, etc.
                            </p>
                        </div>
                    </div>

                    <div class="col-sm-4 margin-md">
                        <div class="ct-box">
                            <h3 class="lead">
                                <strong>House Property</strong>
                            </h3>

                            <p class="bigger m20">Rs. 749</p>

                            <p>
                                <a class="btn btn-success" href="#">Buy this plan</a>
                            </p>

                            <p style="font-family: georgia; font-style: italic;">
                                Own a house property? We can take care of everything!
                            </p>
                        </div>
                    </div>

                    <div class="col-sm-4 margin-md">
                        <div class="ct-box">
                            <h3 class="lead">
                                <strong>Capital Gains &amp; Losses</strong>
                            </h3>

                            <p class="bigger m20">Rs. 1500</p>

                            <p>
                                <a class="btn btn-success" href="#">Buy this plan</a>
                            </p>

                            <p style="font-family: georgia; font-style: italic;">
                                Covers the previous plans and also Capital Gains and Losses.
                            </p>
                        </div>
                    </div>

                </div>--%>
                <br />
                

            </div>

            <div class="col-md-12">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-10 col-sm-offset-1 m60">

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 m20">

                                    <div id="Div1" class="ct-box text-center">

                                        <h3 class="lead">
                                            <strong>Our Pricing</strong><br>
                                            <small> Rs. 250 (Inclusive of All Applicable Taxes)</small>
                                            </h3>
                                            <p class="m20">
                                            <a href="#" class="btn btn-success">Buy Our Plan Now!</a>
                                        </p>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row" id="ca-more">
                    <div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">
                        <div class="ct-box">
                            <div class="m20 text-left">
                                <ul class="bigger l2">
                                    <li>Our Chartered Accountants will prepare &amp; e-File your tax return for you</li>
                                    <li>Our experts work with you over phone and email. <strong>No office visits!</strong></li>
                                    <li>Get the maximum tax savings possible and rest easy with CA Assistance.</li>
                                </ul>

                            </div>
                        </div>
                    </div>
                </div>
            
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function()
        {
            $('.li_pricing').addClass('active');
            $(".back-top").hide();
            $("#divMain1").css('min-height', $(window).height() - 168 - $(".header-panel").height() + $(".back-top").height() + $(".footer-panel").height());
        });
    </script>
</asp:Content>

