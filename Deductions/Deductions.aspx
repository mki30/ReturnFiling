<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Deductions.aspx.cs" Inherits="Deductions_Deductions" %>

<%@ Register Src="~/Controls/IncomeSourceMenu.ascx" TagPrefix="uc1" TagName="IncomeSourceMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        input[type=text] { max-width:100px !important; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:IncomeSourceMenu runat="server" ID="IncomeSourceMenu" />
    <div class="container" id="divMain" runat="server">
        <h2>Deductions Under Section 80</h2>
        <div class="highlight">
            <h3>Investments under Section 80C</h3>
            <br />
            <span class="quiet">Section 80C: Contributions to LIC, NSC, PF, PPF, Mutual Funds etc. You can claim a deduction of upto Rs 1 Lakh under this section.</span>
            <p class="span">Investments under Section 80C</b></p>
            <p class="p">In your Form-16, find this information under Part-B - Details of Salary Paid (Heading 6) </p>
            <asp:TextBox ID="txt_80C" runat="server" CssClass="form-control Numeric" MaxLength="10" ></asp:TextBox>
            <br />
            <br />
        </div>
        <div class="highlight">
            <h3>Section 80TTA: Deduction for Interest earned on Savings Bank Account</h3>
            <br />
            <p class="span">Interest earned on Savings Bank Account </p>
            <asp:TextBox ID="txt_80TTA" runat="server" CssClass="form-control Numeric" MaxLength="10"></asp:TextBox>
            <br />
            <br />
                You do not need to enter a value for the 80TTA deduction here.
            <br />return-filing.in automatically picks it up from your <a href="/otherincome">declared interest income from Saving Bank account and Post office deposits.</a>
            <br />
        </div>

        <div class="highlight">
            <h3>Section 80G: Donations to charitable organizations</h3>
            <br />
            <p class="p">The government requires itemized details of donations for Section 80G.</p>
            <br />
            <a  href="/donation">Click here to add or remove Itemized Donations for Section 80G</a>
            <br />
            <br />
        </div>
        <p><asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-info btn-sm" OnClick="btnSave_Click" />
     <asp:Literal id="ltMsg" runat="server"></asp:Literal>
     </p>
    </div>

    

</asp:Content>


