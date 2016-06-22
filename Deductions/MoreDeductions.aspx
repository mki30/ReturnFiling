<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Deductions/MoreDeductions.aspx.cs" Inherits="Deductions_MoreDeductions" ClientIDMode="Static" %>

<%@ Register Src="~/Controls/IncomeSourceMenu.ascx" TagPrefix="uc1" TagName="IncomeSourceMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .highlight { display: none; }
        .highlight1 { padding: 9px 14px; margin-bottom: 14px; background-color: #f7f7f9; border: 1px solid #e1e1e8; border-radius: 4px; }
        .sh1 { font-size: 1em; color: #C30; }
        select { font-size: 1em !important; }
        .basicdeduction { background-color: rgb(243, 243, 238); }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:IncomeSourceMenu runat="server" ID="IncomeSourceMenu" />
    <div class="container" id="divMain" runat="server">
        <h3>
            <asp:Literal ID="ltStatus" runat="server"></asp:Literal>
            <asp:Button ID="btnSaveDeductions" runat="server" CssClass="btn btn-info pull-right" Text="Save All" OnClick="btnSaveDeductions_Click" />
        </h3>

        <%--Basic Deductions--%>
        <h2>Deductions Under Section 80</h2>
        <br />
        <div class="highlight1 basicdeduction">
            <table style="width: 100%">
                <tr>
                    <td style="width: 90%">
                        <h6><b>Section 80C</b>: Contributions to LIC, NSC, PF, PPF, Mutual Funds etc. You can claim a deduction of upto Rs 1 Lakh under this section.</h6>
                        <p class="p">Investments under Section 80C: In your Form-16, find this information under Part-B - Details of Salary Paid (Heading 6) </p>
                    </td>
                    <td style="width: 10%">
                        <asp:TextBox name="ctl00$ContentPlaceHolder1$txt_80C" ID="txt_80C" runat="server" CssClass="form-control Numeric" MaxLength="10"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <div class="highlight1 basicdeduction">
            <table style="width: 100%">
                <tr>
                    <td style="width: 90%">
                        <h6><b>Section 80TTA</b>: Deduction for Interest earned on Savings Bank Account.</h6>
                        <p class="p">Interest earned on Savings Bank Account</p>
                    </td>
                    <td style="width: 10%">
                        <asp:TextBox name="ctl00$ContentPlaceHolder1$txt_80TTA" ID="txt_80TTA" runat="server" CssClass="form-control Numeric" MaxLength="10"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <p style="color: rgb(250, 134, 134)">You do not need to enter a value for the 80TTA deduction here. return-filing.in automatically picks it up from your <a href="/otherincome">declared interest income from Saving Bank account and Post office deposits.</a></p>
                    </td>
                </tr>
            </table>
        </div>

        <div class="highlight1 basicdeduction">
            <table style="width: 100%">
                <tr>
                    <td style="width: 90%">
                        <h6><b>Section 80G</b>: Donations to charitable organizations.</h6>
                        <p class="p">The government requires itemized details of donations for Section 80G.</p>
                        <br />
                        <a href="/donation">Click here to add or remove Itemized Donations for Section 80G</a>
                    </td>
                </tr>
            </table>
        </div>
        <%--Basic Deduction Ends--%>




        <h4><span class="label label-warning">Added Sections</span></h4>
        <asp:Literal ID="divAddedSections" runat="server"></asp:Literal>
        <br />
        <hr />

        <h3>Add More deductions Under Section 80</h3>
        <asp:DropDownList runat="server" ID="ddDeductionList" onchange="DisplaySectionInfo()"></asp:DropDownList>
        <asp:Button ID="btnAddSection" runat="server" CssClass="btn btn-info pull-right" Text="Add" OnClick="btnAddSection_Click" />
        <br />
        <br />

        <div class="highlight" id="div_80D">
            <h4>Section 80D: Deductions for Medical Insurance</h4>
            <br />
            <p>Deductions for Medical Insurance Premium Paid by you</p>
            <p>Medical Insurance Premium for you, your spouse, or dependent children </p>
            <%--<asp:TextBox ID="txt_80D_1" runat="server" CssClass="form-control"></asp:TextBox>--%>
            <br />
            <p>Is any of the policy holder a senior citizen </p>
            <p>60 years or older</p>
            <%--<asp:DropDownList ID="dd_80D_1" runat="server" CssClass="form-control">
                <asp:ListItem Value="NotSeniorCitizen">No policy holder is a senior citizen</asp:ListItem>
                <asp:ListItem Value="SeniorCitizen">Policy holder is senior citizen</asp:ListItem>
            </asp:DropDownList>--%>
            <br />
            <p>Medical Insurance Premium for your parents </p>
            <p>Medical insurance premium paid by you for your parents.</p>
            <%--<asp:TextBox ID="txt_80D_2" runat="server" CssClass="form-control"></asp:TextBox>--%>
            <br />
            <p>Are your parents who hold the policy senior citizens? </p>
            <p>60 years or older </p>
            <%--<asp:DropDownList ID="dd_80D_2" runat="server" CssClass="form-control">
                <asp:ListItem Value="NotSeniorCitizen">No policy holder is a senior citizen</asp:ListItem>
                <asp:ListItem Value="SeniorCitizen">Policy holder is senior citizen</asp:ListItem>
            </asp:DropDownList>--%>
            <br />
        </div>
        <div class="highlight" id="div_80CCG">
            <h4>Section 80CCG - Rajiv Gandhi Equity Saving Scheme</h4>
            <br />
            <p>Investment made under Rajiv Gandhi Equity Saving Scheme</p>
            <%--<asp:TextBox ID="txt_80CCG" runat="server" CssClass="form-control"></asp:TextBox>--%>
            <br />
        </div>
        <div class="highlight" id="div_80E">
            <h4>Section 80E - Education Loan on higher studies (Graduate or PostGraduate)</h4>
            <br />
            <p>You can claim tax deduction on the interest paid on an education loan for higher studies</p>
            <p>Interest paid by you on loan taken out by you. Loan can be for yourself or your spouse or your children </p>
            <%--<asp:TextBox ID="txt_80E" runat="server" CssClass="form-control"></asp:TextBox>--%>
            <br />
        </div>
        <div class="highlight" id="div_80EE">
            <h4>Section 80EE - Interest on Home Loan</h4>
            <br />
            <p>Deductions on Interest on House Loan </p>
            <%--<asp:TextBox ID="txt_80EE" runat="server" CssClass="form-control"></asp:TextBox>--%>
            <br />
        </div>
        <%--        <h3>The following deductions are applicable less often.</h3>--%>
        <div class="highlight" id="div_80CCC">
            <h4>Section 80CCC - Contribution to Pension Plan / Annuity Fund</h4>
            <br />
            <p>Investment made under Rajiv Gandhi Equity Saving Scheme</p>
            <%--<asp:TextBox ID="txt_80CCC" runat="server" CssClass="form-control"></asp:TextBox>--%>
            <br />
        </div>
        <div class="highlight" id="div_80CCD_1">
            <h4>Section 80CCD(1) - Employee Contribution to New Pension Scheme (NPS)</h4>
            <br />
            <p>Employee's contribution to the New Pension System (NPS).</p>
            <p>This is subject to the upper limit of Rs. 1 Lakh total, that is, aggregate of Section 80C, 80CCC, 80CCD(1)</p>
            <p>Contribution towards Section 80CCD(1)</p>
            <%--<asp:TextBox ID="txt_80CCD1" runat="server" CssClass="form-control"></asp:TextBox>--%>
            <br />
        </div>
        <div class="highlight" id="div_80CCD_2">
            <h4>Section 80CCD(2) - Employer Contribution in NPS</h4>
            <br />
            <p>IEmployers contribution towards NPS (upto 10% of Salary). </p>
            <%--<asp:TextBox ID="txt_80CCS2" runat="server" CssClass="form-control"></asp:TextBox>--%>
            <br />
        </div>
        <div class="highlight" id="div_80GG">
            <h4>Section 80GG - Deduction for House Rent. Self-employed or Salary with no HRA.</h4>
            <br />
            <p>Not a commonly applicable deduction. Please be careful while claiming. If you receive HRA benefit, then you cannot claim this deduction.</p>
            <p>If you are looking to claim HRA, this is NOT the section.</p>
            <p>Eligibility: Your spouse or minor child should not own House Property in same town where paying rent. Self occupied house property Interest deduction should not have been availed.</p>
            <%--<p>Rent Paid Per Month</p>--%>
            <%--<asp:TextBox ID="txt_80GG" runat="server" CssClass="form-control"></asp:TextBox>--%>
            <%--<p>Number of Months Rent Paid</p>--%>
            <%--<asp:DropDownList ID="dd_80GG" runat="server">
                <asp:ListItem Value="1">1</asp:ListItem>
                <asp:ListItem Value="2">2</asp:ListItem>
                <asp:ListItem Value="3">3</asp:ListItem>
                <asp:ListItem Value="4">4</asp:ListItem>
                <asp:ListItem Value="5">5</asp:ListItem>
                <asp:ListItem Value="6">6</asp:ListItem>
                <asp:ListItem Value="7">7</asp:ListItem>
                <asp:ListItem Value="8">8</asp:ListItem>
                <asp:ListItem Value="9">9</asp:ListItem>
                <asp:ListItem Value="10">10</asp:ListItem>
                <asp:ListItem Value="11">11</asp:ListItem>
                <asp:ListItem Value="12">12</asp:ListItem>
            </asp:DropDownList>--%>
            <br />
        </div>
        <div class="highlight" id="div_80DDB">
            <h4>Section 80DDB: Deductions for treatment of specified diseases and ailments</h4>
            <br />
            <p>This deduction is for certain specified diseases. (It is not a commonly applicable deduction). Please be careful while claiming this deduction.</p>
            <p>Medical Treatment Costs for specified Diseases under Section 80DDB </p>
            <%--<asp:TextBox ID="txt_80DDB" runat="server" CssClass="form-control"></asp:TextBox>--%>
            <p>Is the subject senior citizen</p>
            <p>60 years or older</p>
            <%--<asp:DropDownList ID="dd_80DDB_1" runat="server">
                <asp:ListItem Value="Yes">Yes</asp:ListItem>
                <asp:ListItem Value="No">No</asp:ListItem>
            </asp:DropDownList>--%>
            <br />
        </div>

        <div class="highlight" id="div_80QQB">
            <h4>Section 80QQB - Royalty Received on books</h4>
            <br />
            <p>Deduction for Author of literary/scientific/artistic book. Royalty/copyright-fees/lump-sum consideration are eligible for deduction.</p>
            <%--<p>Enter the deduction amount </p>--%>
            <%--<asp:TextBox ID="txt_80QQB" runat="server" CssClass="form-control"></asp:TextBox>--%>
            <br />
        </div>
        <div class="highlight" id="div_80RRB">
            <h4>Section 80RRB - Income on Patents/Inventions</h4>
            <br />
            <p>Deduction for Patentee - Royalty/transfer-of-rights/lump-sum consideration are eligible for deduction.</p>
            <%--<p>Enter the deduction amount</p>
            <asp:TextBox ID="txt_80RRB" runat="server" CssClass="form-control"></asp:TextBox>--%>
            <br />
        </div>
        <div class="highlight" id="div_80GGA">
            <h4>Section 80GGA - Contribution To Research or Rural Development</h4>
            <br />
            <p>Contribution to Research & Development or Rural Development</p>
            <%--<asp:TextBox ID="txt_80GGA" runat="server" CssClass="form-control"></asp:TextBox>--%>
            <br />
        </div>
        <div class="highlight" id="div_80GGC">
            <h4>Section 80GGC - Contribution To Political Party</h4>
            <br />
            <p>Contribution or Donations to Political Party</p>
            <%--<asp:TextBox ID="txt_80GGC" runat="server" CssClass="form-control"></asp:TextBox>--%>
            <br />
        </div>
        <div class="highlight" id="div_80JJA">
            <h4>Section 80JJA </h4>
            <br />
            <p>Deduction exempting profits from bio-degradable waste business</p>
            <%--<asp:TextBox ID="txt_80JJA" runat="server" CssClass="form-control"></asp:TextBox>--%>
            <br />
        </div>

        <div class="col-md-12" style="display: none">
            <div class="col-md-4">
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function DisplaySectionInfo()
        {
            var val = $("#ddDeductionList").val();
            $(".highlight").hide();
            $("#div_" + val).show();
        }
    </script>
</asp:Content>
