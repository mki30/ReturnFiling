<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="HouseProperty.aspx.cs" Inherits="Income_HouseProperty" %>

<%@ Register Src="~/Controls/IncomeSourceMenu.ascx" TagPrefix="uc1" TagName="IncomeSourceMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:IncomeSourceMenu runat="server" ID="IncomeSourceMenu" />

    <div class="container">
        <span id="spnID" runat="server" style="display: none">0</span>
            <div class="row">
                <input type="text" id="txtID" runat="server" value="0" style="display:none" />
            <div class="col-lg-12" id="divExistingProperty" runat="server" visible="false">
                
                </div>
                </div>

        <div class="row">
            <div class="col-lg-6">
                <h1>House Property</h1>
                <div class="highlight">
                    <h3>Interest paid on housing loan for Self occupied property</h3>
                    <p>If you have a housing loan against a house you live in (Self Occupied property) then you can claim a tax deduction of upto Rs. 1,50,000</p>
                    <span class="span">interest paid on loan for self occupied property </span>
                    <p class="p">
                        The loan should have been taken after April 1, 1999
                    </p>
                    <asp:TextBox ID="txtIntersetPaidOnLoan" runat="server" CssClass="form-control Numeric" MaxLength="10"></asp:TextBox>
                    <br />
                </div>

                <div class="highlight">
                    <h3>Interest paid during the pre-construction period of self occupied property
                    </h3>
                    <br />
                    <a href="#">In depth explanation of this section is here</a>
                    <br />

                    <span class="span">The financial year previous to completion of construction 
                    </span>
                    <p class="p">For example: If construction completed on 17th July 2010, you need to specify 2009-10 </p>


                    <asp:DropDownList runat="server" ID="ddFinancialYear" CssClass="form-control">
                        <asp:ListItem Value="2011-2012">2011-2012</asp:ListItem>
                        <asp:ListItem Value="2010-2011">2010-2011</asp:ListItem>
                        <asp:ListItem Value="2009-2010">2009-2010</asp:ListItem>
                        <asp:ListItem Value="2008-2009">2008-2009</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />

                    <span class="span">Total interest amount paid during the pre-construction period 
                    </span>
                    <p class="p">
                        Interest paid from date of borrowing till 31st March of previous financial year. 
                    </p>

                    <asp:TextBox ID="txtTotalInterestAmount" runat="server" CssClass="form-control Numeric" MaxLength="10"></asp:TextBox>
                    <br />

                </div>
                <div class="highlight">
                    <h3>Your House Address
                    </h3>
                    <a href="#">In depth explanation of this section is here</a>
                    <br />
                    <span class="span">Flat/Door/Block Number <span class="redstar">*</span>
                        <asp:RequiredFieldValidator ID="RequiredtxtFlatNo" runat="server" ErrorMessage="Required" ControlToValidate="txtFlatNo" ForeColor="Red"></asp:RequiredFieldValidator>
                    </span>
                    <p class="p"></p>
                    <asp:TextBox ID="txtFlatNo" runat="server" CssClass="form-control" MaxLength="30"></asp:TextBox>
                    <br />
                    <span class="span">Road / Street </span>
                    <p>This field is asp:ListItemal.</p>
                    <asp:TextBox ID="txtRoadStreet" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />
                    <span class="span">Area / Locality <span class="redstar">*</span>
                        <asp:RequiredFieldValidator ID="RequiredtxtArea" runat="server" ErrorMessage="Required" ControlToValidate="txtArea" ForeColor="Red"></asp:RequiredFieldValidator></span>
                    <p></p>
                    <asp:TextBox ID="txtArea" runat="server" CssClass="form-control" MaxLength="30"></asp:TextBox>
                    <br />
                    <span class="span">Town / City <span class="redstar">*</span>
                        <asp:RequiredFieldValidator ID="RequiredtxtCity" runat="server" ErrorMessage="Required" ControlToValidate="txtCity" ForeColor="Red"></asp:RequiredFieldValidator></span>
                    <p></p>
                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control Alpha" MaxLength="30"></asp:TextBox>
                    <br />
                    <span class="span">State <span class="redstar">*</span> </span>
                    <p></p>
                    <asp:DropDownList runat="server" ID="ddState" CssClass="form-control">
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
                        <asp:RequiredFieldValidator ID="RequiredtxtPincode" runat="server" ErrorMessage="Required" ControlToValidate="txtPincode" ForeColor="Red"></asp:RequiredFieldValidator></span>
                    <p></p>
                    <asp:TextBox ID="txtPincode" runat="server" CssClass="form-control Numeric" MaxLength="6"></asp:TextBox>
                    <br />
                </div>
                <div class="highlight">
                    <h3>Property Ownership</h3>
                    <p class="span">Your ownership share of the Property (Percentage %) <span class="redstar">*</span>
                        <asp:RequiredFieldValidator ID="RequiredtxtOwnershipShare" runat="server" ErrorMessage="Required" ControlToValidate="txtOwnershipShare" ForeColor="Red"></asp:RequiredFieldValidator></p>
                    <asp:TextBox ID="txtOwnershipShare" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />
                    <p>In case this property is jointly owned, please specify co-owners:</p>
                    <a href="#">specify co-owners for this property</a>
                </div>
                <p>
                    <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary btn-sm" Text="save" OnClick="btnSave_Click" />
                    <asp:Literal ID="ltStatus" runat="server"></asp:Literal>
                </p>
            </div>
        </div>
    </div>
        <script type="text/javascript">
            $(document).ready(function()
            {
                $("#divExistingProperty #r_" + $("#spnID").text()).addClass("currentrecord");
            });
    </script>
</asp:Content>

