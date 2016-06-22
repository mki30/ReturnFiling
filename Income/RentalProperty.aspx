<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RentalProperty.aspx.cs" Inherits="Income_RentalProperty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">
<h2>Edit Rental Property Details</h2>
<form action="/paytax/y2014/0/EditRentalProperty/1" method="post">    <div class="span-24 last">
        
    </div>
    <div class="span-18">
    <fieldset>
    <legend>Income earned from Rental Property</legend>
    <p>
        <label for="detailsOfRentedProperty_annualRent">Annual Rent Received by you</label><br>
        <span class="quiet">Please specify the portion of the rent received by you if the property is co-owned.</span>
        <span class="field-validation-valid notice" data-valmsg-for="detailsOfRentedProperty.annualRent" data-valmsg-replace="true"></span><br>
        <input class="text Numeric" id="detailsOfRentedProperty_annualRent" name="detailsOfRentedProperty.annualRent" type="text" value="0" maxlength="10" />
 
    </p>
    <p>
        <label for="detailsOfRentedProperty_municipalTaxPaidAmount">House Tax paid by you</label>  <br>
        <span class="quiet">Specifying House Tax you Paid reduces your tax liability.</span> <br>
        <input class="text Numeric" id="detailsOfRentedProperty_municipalTaxPaidAmount" name="detailsOfRentedProperty.municipalTaxPaidAmount" type="text" value="" maxlength="10" />
 <span class="field-validation-valid notice" data-valmsg-for="detailsOfRentedProperty.municipalTaxPaidAmount" data-valmsg-replace="true"></span>
    </p>
    <p>
        <label for="detailsOfRentedProperty_tenantName">Name of Tenant</label>  <br>
        <input class="text Alpha" id="detailsOfRentedProperty_tenantName" name="detailsOfRentedProperty.tenantName" type="text" value="" maxlength="50" />
    </p>
    <p>
        <label for="detailsOfRentedProperty_tenantPan_accountNumber">PAN of Tenant</label>  <br>
        <span class="quiet">Optional.</span> <br>
        <input class="text" id="detailsOfRentedProperty_tenantPan_accountNumber" type="text" value="" maxlength="10" />
    </p>
    </fieldset>
    <fieldset>
        <legend>Interest paid on housing loan for this rental property</legend>
        <p>
            <label for="detailsOfRentedProperty_collectionOfInterestDeductions_0__amount">Interest paid by you on loan for this rental property</label>  <br>
            <input class="text Numeric" id="detailsOfRentedProperty_collectionOfInterestDeductions_0__amount" type="text" value="0" />
 <span class="field-validation-valid notice" data-valmsg-for="detailsOfRentedProperty.collectionOfInterestDeductions[0].amount" data-valmsg-replace="true"></span>
        </p>
    </fieldset>
    
    <fieldset>
        
        <legend>Your Property Address</legend>
        <p>
            <label for="address_flatDoorBlockNumber">Flat/Door/Block Number</label> <span class="redstar"> *</span>
            <span class="field-validation-valid notice" data-valmsg-for="address.flatDoorBlockNumber" data-valmsg-replace="true"></span><br> 
            <input class="text" id="address_flatDoorBlockNumber" name="address.flatDoorBlockNumber" type="text" value="">
        </p>
        <p>
            <label for="address_roadStreetPostOffice">Road / Street</label>
            <span class="field-validation-valid notice" data-valmsg-for="address.roadStreetPostOffice" data-valmsg-replace="true"></span><br> 
            <span class="quiet">This field is optional.</span><br>
            <input class="text" id="address_roadStreetPostOffice" name="address.roadStreetPostOffice" type="text" value="">
        </p>
        <p>
            <label for="address_areaLocality">Area / Locality</label> <span class="redstar"> *</span>
            <span class="field-validation-valid notice" data-valmsg-for="address.areaLocality" data-valmsg-replace="true"></span><br>
            <input class="text" id="address_areaLocality" name="address.areaLocality" type="text" value="">
        </p>
        <p>
            <label for="address_townCityDistrict">Town / City</label> <span class="redstar"> *</span>
            <span class="field-validation-valid notice" data-valmsg-for="address.townCityDistrict" data-valmsg-replace="true"></span><br>
            <input class="text Alpha" id="address_townCityDistrict" name="address.townCityDistrict" type="text" value="">
        </p>
        <p>
            <label for="address_stateInIndia">State</label> <span class="redstar"> *</span>
            <span class="field-validation-valid notice" data-valmsg-for="address.stateInIndia" data-valmsg-replace="true"></span><br>
            <select data-val="true" data-val-required="The stateInIndia field is required." id="address_stateInIndia" name="address.stateInIndia"><option value="ANDAMANANDNICOBARISLANDS">ANDAMAN AND NICOBAR ISLANDS</option>
<option value="ANDHRAPRADESH">ANDHRA PRADESH</option>
<option value="ARUNACHALPRADESH">ARUNACHAL PRADESH</option>
<option value="ASSAM">ASSAM</option>
<option value="BIHAR">BIHAR</option>
<option value="CHANDIGARH">CHANDIGARH</option>
<option value="CHHATISHGARH">CHHATISHGARH</option>
<option value="DADRANAGARHAVELI">DADRA &amp; NAGAR HAVELI</option>
<option value="DAMANDIU">DAMAN &amp; DIU</option>
<option selected="selected" value="DELHI">DELHI</option>
<option value="GOA">GOA</option>
<option value="GUJARAT">GUJARAT</option>
<option value="HARYANA">HARYANA</option>
<option value="HIMACHALPRADESH">HIMACHAL PRADESH</option>
<option value="JAMMUKASHMIR">JAMMU &amp; KASHMIR</option>
<option value="JHARKHAND">JHARKHAND</option>
<option value="KARNATAKA">KARNATAKA</option>
<option value="KERALA">KERALA</option>
<option value="LAKHSWADEEP">LAKHSWADEEP</option>
<option value="MADHYAPRADESH">MADHYA PRADESH</option>
<option value="MAHARASHTRA">MAHARASHTRA</option>
<option value="MANIPUR">MANIPUR</option>
<option value="MEGHALAYA">MEGHALAYA</option>
<option value="MIZORAM">MIZORAM</option>
<option value="NAGALAND">NAGALAND</option>
<option value="ORISSA">ORISSA</option>
<option value="PONDICHERRY">PONDICHERRY</option>
<option value="PUNJAB">PUNJAB</option>
<option value="RAJASTHAN">RAJASTHAN</option>
<option value="SIKKIM">SIKKIM</option>
<option value="TAMILNADU">TAMIL NADU</option>
<option value="TRIPURA">TRIPURA</option>
<option value="UTTARANCHAL">UTTARANCHAL</option>
<option value="UTTARPRADESH">UTTAR PRADESH</option>
<option value="WESTBENGAL">WEST BENGAL</option>
<option value="StateoutsideIndia">State outside India</option>
</select>
        </p>
        <p>
            <label for="address_pinCode">Pincode</label> <span class="redstar"> *</span><br>
            <span class="quiet">Enter 999999 in case of Foreign Address</span>
            <span class="field-validation-valid notice" data-valmsg-for="address.pinCode" data-valmsg-replace="true"></span><br>
            <input class="text Numeric" data-val="true" data-val-number="The field pinCode must be a number." id="address_pinCode" name="address.pinCode" type="text" value="">
        </p>
    </fieldset>
    </div>
    <div class="span-18">
    <fieldset>
    <legend>Property Ownership</legend>
    <p>
        <label for="ownershipForITR">Your ownership share of the Property (Percentage %)</label> <span class="redstar"> *</span>
        <span class="field-validation-valid notice" data-valmsg-for="ownershipForITR" data-valmsg-replace="true"></span> <br>
        
        <input class="text" id="ownershipForITR" name="ownershipForITR" type="text" value="100">
 
    </p>
    <div class="span-10">
    <p><br> In case this property is jointly owned, please specify co-owners: </p>
    </div>
    <div class="span-7 last">
        <button type="submit" class="small awesome blue" name="submitButton" value="PropertyListCoowners">
            Specify Co-Owners for this property
        </button>
    </div>
    </fieldset>
    </div>
    <div class="span-24">
        <button type="submit" class="large awesome magenta">
            Save
        </button>
    </div>
</form><div class="span-12 last">
<p><br></p>
<a class="small awesome black" href="#">Back without saving</a>
<p><br></p>
</div>

</div>
</asp:Content>

