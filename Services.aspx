<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Services.aspx.cs" Inherits="Services" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function()
        {
            $('.li_services').addClass('active')
            $("#divMain1").css('min-height', $(window).height() - 250 - $(".header-panel").height() + $(".back-top").height() + $(".footer-panel").height());
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />
    <div class="container" id="divMain1">
        <div class="col-md-12 highlight">
            <h1>Services</h1>
            <br />
            <p class="p1">www.return-filing.in is a professionally managed service which helps you file your tax returns with the ease and expertise. The service has been started with induction of ITR filing but the organization intends to introduce various other facilities to its portal in the times to come.</p>
            <br />
            <p class="p1">
                We provide Income Tax consultancy services to our clients as per their requirements. Our financial experts and CA professionals are well aware of various tax laws and rules. 
                They assist our clients in various income tax related services that include <strong>filling of income tax returns, transfer pricing</strong> and others. 
                Our consultancy services are strictly in accordance with respective regulations for different categories such as for <strong>individuals, proprietorship firms, private limited companies, corporate houses </strong>and many others. While preparing for income tax returns, our services also include assistance in terms of return assessment, return of loss, belated return and revised return etc. We also assist our clients in getting their income tax related documents such as PAN and TAN cards prepared by authorized agencies.
            </p>
        </div>
    </div>
</asp:Content>
