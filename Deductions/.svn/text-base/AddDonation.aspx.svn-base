<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Deductions/AddDonation.aspx.cs" Inherits="Deductions_AddDonation" %>
<%@ Register Src="~/Controls/IncomeSourceMenu.ascx" TagPrefix="uc1" TagName="IncomeSourceMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        select { max-width:200px !important; }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:IncomeSourceMenu runat="server" ID="IncomeSourceMenu" />
    <div class="container">
        <a class="btn btn-warning btn-sm pull-right" href="/donation">&lt;&lt; Prev</a>
        <br /><br />
        <span id="spnID" runat="server" style="display:none">0</span>
        <div class="highlight">
            <h3>
                Add Donation Entry for Section 80 G
            </h3>
            <br />
            <span class="span">Donation Amount </span>
            <asp:TextBox ID="txtDonationAmount" runat="server" class="form-control input-sm Numeric" MaxLength="10"></asp:TextBox>
            <br />
            
            <span class="span">Name of the Donee</span>
            <asp:TextBox ID="txtNameOfDonee" runat="server" class="form-control input-sm Alpha" MaxLength="30"></asp:TextBox>
            <br />

            <span class="span">PAN of Donee</span>
            <p class="p">Use 'GGGGG0000G' as PAN number if you have donated to Government Funds that do not have a PAN.</p>
            <asp:TextBox ID="txtPANOfDonee" runat="server" class="form-control input-sm" MaxLength="10"></asp:TextBox>
            <br />
            
            <span class="span">Limit of Deduction <span class="redstar"> *</span></span>
            <p class="p">For most people, the limit on deduction is Subject to Income.</p>
            <br />
            <asp:DropDownList runat="server" ID="ddLimitOnDeduction" class="form-control">
                <asp:ListItem>Subject To Income</asp:ListItem>
                <asp:ListItem>No Limit</asp:ListItem>
            </asp:DropDownList>
            <br />

            <span class="span">Qualifying Percentage <span class="redstar"> *</span></span>
            <p class="p">For most people, this percentage is 50%</p>
            <br />
            <asp:DropDownList runat="server" ID="ddQualifyingPercentage" class="form-control">
                <asp:ListItem>50%</asp:ListItem>
                <asp:ListItem>100%</asp:ListItem>
            </asp:DropDownList>
            <br />
        </div>
                
        <div class="highlight">
            <h3>Address of Donee</h3>
            <br />
            <span class="span">Address Line<span class="redstar">*</span></span>
            <asp:TextBox ID="txtDoneeAddress" runat="server" class="form-control input-sm" MaxLength="30"></asp:TextBox>
            <br />
            <span class="span">Town / City <span class="redstar">*</span>
            </span>
            <p></p>
            <asp:TextBox ID="txtDoneeCity" runat="server" class="form-control input-sm Alpha" MaxLength="30" ></asp:TextBox>
            <br />
            <span class="span">State <span class="redstar">*</span> </span>
            <p></p>
            <asp:DropDownList runat="server" ID="ddDoneeState" class="form-control" >
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
            </span>
            <p></p>
            <asp:TextBox ID="txtDoneePinCode" runat="server" class="form-control input-sm Numeric" MaxLength="6"></asp:TextBox>
            <br />
            <p>
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" class="btn btn-primary btn-sm" />
                <asp:Literal ID="ltStatus" runat="server"></asp:Literal>
            </p>
        </div>
    </div>
    
</asp:Content>

