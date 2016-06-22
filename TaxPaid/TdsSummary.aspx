<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TdsSummary.aspx.cs" Inherits="TaxPaid_TdsSummary" %>

<%@ Register Src="~/Controls/IncomeSourceMenu.ascx" TagPrefix="uc1" TagName="IncomeSourceMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:IncomeSourceMenu runat="server" ID="IncomeSourceMenu" />
    <div class="container">
        <h2>Summary of Taxes deducted at Source (TDS)</h2>
        <div>
        </div>
        <div>
            <p></p>
            <div>
                <p class="largenarrate">Specify TDS which was deducted between the period of April 1, 2013 to March 31, 2014.</p>
                <p class="mediumnarrate">Tax deductions from your Salary by your employer should NOT be entered here.</p>
            </div>
        </div>
        <div>
            <div>
                <span>Go to next if you do not have any TDS entries.</span>
                <asp:Button ID="btnAddTDS" runat="server" Text="GoToNext >>" CssClass="btn btn-warning btn-sm pull-right" />
            </div>
        </div>
        <div>
            <p class="largenarrate">Return Filling can automatically import your TDS entries from the Income Tax department.</p>
        </div>
        <div>
            <span>This is optional, but the recommended no-hassle way.</span>
            <a href="#" class="btn btn-danger btn-sm pull-right">Recommended: Automatically Import TDS Entries</a>
        </div>
        <div>
            <br />
            <p>
                Or you can choose to add these entries manually. 
                For example you can add: TDS certificates are issued by your bank over interest income (Specify details of all Form-16A you have received).<br>
                <br/>
                <a href="/tds/0" class="btn btn-info btn-sm" >✚ Add Non-Salary TDS Entry</a>
            </p>
        </div>
        <div>
            <div id="divExistingRecords" runat="server" visible="false" ></div>
        </div>
        <hr />
        <asp:Panel ID="PanelTDSForm" runat="server">
            <h2>Add a TDS entry (Tax Deducted at Source)</h2>
            <div class="highlight col-lg-6">
                <input type="text" id="txtID" runat="server" style="display:none" value="0" />
                <h3>Tax Deducted At Source</h3>
                <br />
                <p class="p">Provide this information from TDS certificate provided by deductor</p>
                <p class="span">TAN of Deductor <span class="redstar">*</span> <asp:RequiredFieldValidator ID="txtTanOfDeductorRequired" runat="server" ErrorMessage="Required" ControlToValidate="txtTanOfDeductor" ForeColor="Red"></asp:RequiredFieldValidator></p>
                <asp:TextBox ID="txtTanOfDeductor" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>
                <br />
                <p class="span">Name of Deductor <span class="redstar">*</span> <asp:RequiredFieldValidator ID="txtNameOfDeductorRequired" runat="server" ErrorMessage="Required" ControlToValidate="txtNameOfDeductor" ForeColor="Red"></asp:RequiredFieldValidator></p>
                <asp:TextBox ID="txtNameOfDeductor" runat="server" CssClass="form-control Alpha" MaxLength="30"></asp:TextBox>
                <br />
                <p class="span">Total Tax Deducted <span class="redstar">*</span> <asp:RequiredFieldValidator ID="txtTotalTaxDeductedRequired" runat="server" ErrorMessage="Required" ControlToValidate="txtTotalTaxDeducted" ForeColor="Red"></asp:RequiredFieldValidator></p>
                <asp:TextBox ID="txtTotalTaxDeducted" runat="server" CssClass="form-control Numeric" MaxLength="10"></asp:TextBox>
                <br />
                <span class="span">Tax Deducted claimed for this year <span class="redstar">*</span> <asp:RequiredFieldValidator ID="txtTaxDeductedClaimedRequired" runat="server" ErrorMessage="Required" ControlToValidate="txtTaxDeductedClaimed" ForeColor="Red"></asp:RequiredFieldValidator></span>
                <p class="p">( Usually this amount is same as Total Tax Deducted. ) </p>
                <asp:TextBox ID="txtTaxDeductedClaimed" runat="server" CssClass="form-control Numeric" MaxLength="10"></asp:TextBox>
                <br />
                <p class="span">Financial Year in which TDS was deducted</p>
                <p class="p">Usually this is the same as the Financial Year of the return (2013-2014).</p>
                <asp:DropDownList ID="ddFinancialYear" runat="server" CssClass="form-control">
                    <asp:ListItem Value="2013">2013-2014</asp:ListItem>
                    <asp:ListItem Value="2012">2012-2013</asp:ListItem>
                    <asp:ListItem Value="2011">2011-2012</asp:ListItem>
                    <asp:ListItem Value="2010">2010-2011</asp:ListItem>
                    <asp:ListItem Value="2009">2009-2010</asp:ListItem>
                    <asp:ListItem Value="2008">2008-2009</asp:ListItem>
                    <asp:ListItem Value="2007">2007-2008</asp:ListItem>
                    <asp:ListItem Value="2006">2006-2007</asp:ListItem>
                    <asp:ListItem Value="2005">2005-2006</asp:ListItem>
                    <asp:ListItem Value="2004">2004-2005</asp:ListItem>
                    <asp:ListItem Value="2003">2003-2004</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:Button ID="btnsaveCapitalGain" runat="server" CssClass="btn btn-primary" Text="save" OnClick="btnsaveCapitalGain_Click" />
                <asp:Literal ID="ltStatus" runat="server"></asp:Literal>
                            <span id="spnID" runat="server" style="display: none">0</span>
            </div>
        </asp:Panel>
         <%--<div>
            <h5>TDS from Salary</h5>
            <p>
                TDS from your Salary income should be entered on the
            <strong><a href="/paytax/y2014/0/Salary">Income from Salary</a></strong> page. 
            Do not enter them here.
            </p>
            <table cellspacing="0" cellpadding="0" border="0">
                <tbody>
                    <tr>
                        <th class="span-1">S.No.</th>
                        <th class="span-4">Name of Employer</th>
                        <th class="span-4">TDS deducted</th>
                    </tr>
                    <tr>
                        <td class="span-1">1 </td>
                        <td class="span-4">DBOI GLOBAL SERVICES PRIVATE LIMITED</td>
                        <td class="span-4">Rs. 44,525</td>
                    </tr>
                </tbody>
            </table>
        </div>--%>
    </div>
        <script type="text/javascript">
            $(document).ready(function()
            {
                $("#divExistingRecords #r_" + $("#spnID").text()).addClass("currentrecord");
            });
    </script>
</asp:Content>

