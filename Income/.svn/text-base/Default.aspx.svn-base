<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Income/Default.aspx.cs" Inherits="Default" %>

<%@ Register Src="~/Controls/IncomeSourceMenu.ascx" TagPrefix="uc1" TagName="IncomeSourceMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:IncomeSourceMenu runat="server" ID="IncomeSourceMenu" />
    <div class="container">
        <div class="row">
            <div class="col-lg-12" id="divExistingSalaries" runat="server" visible="false"></div>
        </div>

        <div class="row">
            <div class="col-lg-6">
                <div class="highlight">
                    <h3>Income From Salary</h3>
                    <span class="span">Income Chargeable under the head 'Salaries' <span class="redstar"><span class="redstar">*</span></span>
                        <asp:RequiredFieldValidator ID="RequiredtxtChargeableIncome" runat="server" ErrorMessage="Required" ControlToValidate="txtChargeableIncome" ForeColor="Red"></asp:RequiredFieldValidator></span>
                    <p class="p">In your Form-16, find this information under Part-B - Details of Salary Paid (Heading 6) </p>
                    <asp:TextBox ID="txtChargeableIncome" runat="server" class="form-control input-sm Numeric" MaxLength="10"></asp:TextBox>
                    <p class="span">
                        Name of the Employer <span class="redstar"><span class="redstar">*</span></span>
                        <asp:RequiredFieldValidator ID="RequiredtxtEmployerName" runat="server" ErrorMessage="Required" ControlToValidate="txtEmployerName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </p>
                    <p class="p">The name of Company / Organization</p>
                    <asp:TextBox ID="txtEmployerName" runat="server" class="form-control input-sm Alpha" MaxLength="50"></asp:TextBox>

                    <p class="span">Employer Type/Category<span class="redstar"> <span class="redstar">*</span></span></p>
                    <asp:DropDownList runat="server" ID="ddEmptype" class="form-control">
                        <asp:ListItem>Private</asp:ListItem>
                        <asp:ListItem>Government</asp:ListItem>
                        <asp:ListItem>Public Sector Unit</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                </div>
                <div class="highlight">
                    <h3>TDS for Salary</h3>
                    Tax Deducted at Source by Employer: Provide this information from your Form 16
            <span class="span">TAN of the Employer <span class="redstar">*</span>
                <asp:RequiredFieldValidator ID="RequiredtxtEmpTan" runat="server" ErrorMessage="Required" ControlToValidate="txtEmpTan" ForeColor="Red"></asp:RequiredFieldValidator></span>
                    <p class="p">In your Form-16, find this under Part-A - TAN of Deductor  </p>

                    <asp:TextBox ID="txtEmpTan" runat="server" class="form-control input-sm" MaxLength="10"></asp:TextBox>
                    <br />
                    <span class="span">Tax Deducted at source on Salary <span class="redstar">*</span>
                        <asp:RequiredFieldValidator ID="RequiredtxtTaxDeducted" runat="server" ErrorMessage="Required" ControlToValidate="txtTaxDeducted" ForeColor="Red"></asp:RequiredFieldValidator></span>
                    <br />
                    <p class="p">TIn your Form-16, find this under Part-B (Heading 17 or 18):<b>Tax Deducted at Source</p>
                    <asp:TextBox ID="txtTaxDeducted" runat="server" class="form-control input-sm Numeric" MaxLength="10"></asp:TextBox>
                    <br />
                </div>
                <div class="highlight">
                    <h3>Address of Employer</h3>
                    <span class="span">Address Line <span class="redstar">*</span><asp:RequiredFieldValidator ID="RequiredtxtEmpAddress" runat="server" ErrorMessage="Required" ControlToValidate="txtEmpAddress" ForeColor="Red"></asp:RequiredFieldValidator></span>
                    <p></p>
                    <asp:TextBox ID="txtEmpAddress" runat="server" class="form-control input-sm" MaxLength="30"></asp:TextBox>
                    <br />
                    <span class="span">Town / City <span class="redstar">*</span>
                        <asp:RequiredFieldValidator ID="RequiredtxtEmpCity" runat="server" ErrorMessage="Required" ControlToValidate="txtEmpCity" ForeColor="Red"></asp:RequiredFieldValidator></span>
                    <p></p>
                    <asp:TextBox ID="txtEmpCity" runat="server" class="form-control input-sm Alpha" MaxLength="30"></asp:TextBox>
                    <br />
                    <span class="span">State <span class="redstar">*</span></span>
                    <p></p>
                    <asp:DropDownList runat="server" ID="ddState" class="form-control">
                        <asp:ListItem Value="ANDHRAPRADESH">ANDHRA PRADESH</asp:ListItem>
                        <asp:ListItem Value="ARUNACHALPRADESH">ARUNACHAL PRADESH</asp:ListItem>
                        <asp:ListItem Value="ASSAM">ASSAM</asp:ListItem>
                        <asp:ListItem Value="BIHAR">BIHAR</asp:ListItem>
                        <asp:ListItem Value="CHANDIGARH">CHANDIGARH</asp:ListItem>
                        <asp:ListItem Value="CHHATISHGARH">CHHATISHGARH</asp:ListItem>
                        <asp:ListItem Value="DADRANAGARHAVELI">DADRA &amp; NAGAR HAVELI</asp:ListItem>
                        <asp:ListItem Value="DAMANDIU">DAMAN &amp; DIU</asp:ListItem>
                        <asp:ListItem Value="DELHI">DELHI</asp:ListItem>
                        <asp:ListItem Value="GOA">GOA</asp:ListItem>
                        <asp:ListItem Value="GUJARAT">GUJARAT</asp:ListItem>
                        <asp:ListItem Value="HARYANA">HARYANA</asp:ListItem>
                        <asp:ListItem Value="HIMACHALPRADESH">HIMACHAL PRADESH</asp:ListItem>
                        <asp:ListItem Value="JAMMUKASHMIR">JAMMU &amp; KASHMIR</asp:ListItem>
                        <asp:ListItem Value="JHARKHAND">JHARKHAND</asp:ListItem>
                        <asp:ListItem Value="KARNATAKA">KARNATAKA</asp:ListItem>
                        <asp:ListItem Value="KERALA">KERALA</asp:ListItem>
                        <asp:ListItem Value="LAKHSWADEEP">LAKHSWADEEP</asp:ListItem>
                        <asp:ListItem Value="MADHYAPRADESH">MADHYA PRADESH</asp:ListItem>
                        <asp:ListItem Value="MAHARASHTRA">MAHARASHTRA</asp:ListItem>
                        <asp:ListItem Value="MANIPUR">MANIPUR</asp:ListItem>
                        <asp:ListItem Value="MEGHALAYA">MEGHALAYA</asp:ListItem>
                        <asp:ListItem Value="MIZORAM">MIZORAM</asp:ListItem>
                        <asp:ListItem Value="NAGALAND">NAGALAND</asp:ListItem>
                        <asp:ListItem Value="ORISSA">ORISSA</asp:ListItem>
                        <asp:ListItem Value="PONDICHERRY">PONDICHERRY</asp:ListItem>
                        <asp:ListItem Value="PUNJAB">PUNJAB</asp:ListItem>
                        <asp:ListItem Value="RAJASTHAN">RAJASTHAN</asp:ListItem>
                        <asp:ListItem Value="SIKKIM">SIKKIM</asp:ListItem>
                        <asp:ListItem Value="TAMILNADU">TAMIL NADU</asp:ListItem>
                        <asp:ListItem Value="TRIPURA">TRIPURA</asp:ListItem>
                        <asp:ListItem Value="UTTARANCHAL">UTTARANCHAL</asp:ListItem>
                        <asp:ListItem Value="UTTARPRADESH">UTTAR PRADESH</asp:ListItem>
                        <asp:ListItem Value="WESTBENGAL">WEST BENGAL</asp:ListItem>
                        <asp:ListItem Value="StateoutsideIndia">State outside India</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <span class="span">Pincode <span class="redstar">*</span>
                        <asp:RequiredFieldValidator ID="RequiredtxtPinCode" runat="server" ErrorMessage="Required" ControlToValidate="txtPinCode" ForeColor="Red"></asp:RequiredFieldValidator></span>
                    <p></p>
                    <asp:TextBox ID="txtPinCode" runat="server" class="form-control input-sm Numeric" MaxLength="6"></asp:TextBox>
                    <br />
                </div>
                <p>
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" class="btn btn-primary btn-sm" />
                    <asp:Literal ID="ltStatus" runat="server"></asp:Literal>
                </p>
            </div>
            <div class="col-lg-1">&nbsp;</div>
            <span id="spnID" runat="server" style="display: none">0</span>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function()
        {
            $("#divExistingSalaries #r_" + $("#spnID").text()).addClass("currentrecord");
        });

    </script>
</asp:Content>
