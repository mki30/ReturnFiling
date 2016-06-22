<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Address.aspx.cs" Inherits="Address" %>

<%@ Register Src="~/Controls/IncomeSourceMenu.ascx" TagPrefix="uc1" TagName="IncomeSourceMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:IncomeSourceMenu runat="server" ID="IncomeSourceMenu" />
    <div class="container" style="margin-top: -20px;" id="divMain">

        
        <div class="col-lg-6">
            <h3>Please enter your address here.</h3>
            <div class="highlight">
                <div class="pull-right" id="divSavedMsg" runat="server" visible="false"></div>
            <p>
                <label for="txtAddress1">Flat/Door/Block Number</label>
                <span class="redstar">*</span>
                <asp:RequiredFieldValidator ID="RequiredtxtAddress1" ControlToValidate="txtAddress1" ClientIDMode="AutoID" CssClass="redstar" ErrorMessage="Required" SetFocusOnError="true" runat="server"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txtAddress1" runat="server" CssClass="form-control"></asp:TextBox>
            </p>
            <p>
                <label for="txtAddress2">Road / Street</label>
                <br />
                <span class="quiet">This field is optional.</span><br>
                <asp:TextBox ID="txtAddress2" runat="server" CssClass="form-control"></asp:TextBox>
            </p>
            <p>
                <label for="txtArea">Area / Locality</label>
                    <span class="redstar">*</span>
                <asp:RequiredFieldValidator ID="RequiredtxtArea" ControlToValidate="txtArea" ClientIDMode="AutoID" CssClass="redstar" ErrorMessage="Required" SetFocusOnError="true" runat="server"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txtArea" runat="server" CssClass="form-control"></asp:TextBox>
            </p>
            <p>
                <label for="txtCity">Town / City</label>
                <span class="redstar">*</span>
                <asp:RequiredFieldValidator ID="RequiredtxtCity" ControlToValidate="txtCity" ClientIDMode="AutoID" CssClass="redstar" ErrorMessage="Required" SetFocusOnError="true" runat="server"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control Alpha"></asp:TextBox>
            </p>
            <p>
                <label for="ddState">State</label>
                <span class="redstar">*</span>
                <asp:RequiredFieldValidator ID="RequiredddState" ControlToValidate="ddState" InitialValue="-1" ClientIDMode="AutoID" CssClass="redstar" ErrorMessage="Required" runat="server"></asp:RequiredFieldValidator>
                <br />
                <asp:DropDownList ID="ddState" runat="server" CssClass="form-control">
                    <asp:ListItem Value="-1">--Select--</asp:ListItem>
                    <asp:ListItem Value="ANDAMANANDNICOBARISLANDS">ANDAMAN AND NICOBAR ISLANDS</asp:ListItem>
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

            </p>
            <p>
                <label for="ddCountry">Country</label>
                <span class="redstar">*</span>
                <asp:RequiredFieldValidator ID="RequiredddCountry" ControlToValidate="ddCountry" InitialValue="-1" ClientIDMode="AutoID" CssClass="redstar" ErrorMessage="Required" runat="server"></asp:RequiredFieldValidator>
                <br />
                <asp:DropDownList ID="ddCountry" runat="server" CssClass="form-control">
                    <asp:ListItem Value="-1">--Select--</asp:ListItem>
                    <asp:ListItem Value="INDIA">INDIA</asp:ListItem>
                    <asp:ListItem Value="AFGHANISTAN">AFGHANISTAN</asp:ListItem>
                    <asp:ListItem Value="ALBANIA">ALBANIA</asp:ListItem>
                    <asp:ListItem Value="ALGERIA">ALGERIA</asp:ListItem>
                    <asp:ListItem Value="ANDORRA">ANDORRA</asp:ListItem>
                    <asp:ListItem Value="ANGOLA">ANGOLA</asp:ListItem>
                    <asp:ListItem Value="ANTIGUA_AND_BARBUDA">ANTIGUA AND BARBUDA</asp:ListItem>
                    <asp:ListItem Value="ARGENTINA">ARGENTINA</asp:ListItem>
                    <asp:ListItem Value="ARMENIA">ARMENIA</asp:ListItem>
                    <asp:ListItem Value="AUSTRALIA">AUSTRALIA</asp:ListItem>
                    <asp:ListItem Value="AUSTRIA">AUSTRIA</asp:ListItem>
                    <asp:ListItem Value="AZERBAIJAN">AZERBAIJAN</asp:ListItem>
                    <asp:ListItem Value="BAHAMAS">BAHAMAS</asp:ListItem>
                    <asp:ListItem Value="BAHRAIN">BAHRAIN</asp:ListItem>
                    <asp:ListItem Value="BANGLADESH">BANGLADESH</asp:ListItem>
                    <asp:ListItem Value="BARBADOS">BARBADOS</asp:ListItem>
                    <asp:ListItem Value="BELARUS">BELARUS</asp:ListItem>
                    <asp:ListItem Value="BELGIUM">BELGIUM</asp:ListItem>
                    <asp:ListItem Value="BELIZE">BELIZE</asp:ListItem>
                    <asp:ListItem Value="BENIN">BENIN</asp:ListItem>
                    <asp:ListItem Value="BHUTAN">BHUTAN</asp:ListItem>
                    <asp:ListItem Value="BOLIVIA">BOLIVIA</asp:ListItem>
                    <asp:ListItem Value="BOSNIA_AND_HERZEGOVINA">BOSNIA AND HERZEGOVINA</asp:ListItem>
                    <asp:ListItem Value="BOTSWANA">BOTSWANA</asp:ListItem>
                    <asp:ListItem Value="BRAZIL">BRAZIL</asp:ListItem>
                    <asp:ListItem Value="BRUNEI_DARUSSALAM">BRUNEI DARUSSALAM</asp:ListItem>
                    <asp:ListItem Value="BULGARIA">BULGARIA</asp:ListItem>
                    <asp:ListItem Value="BURKINA_FASO">BURKINA FASO</asp:ListItem>
                    <asp:ListItem Value="BURUNDI">BURUNDI</asp:ListItem>
                    <asp:ListItem Value="CAMBODIA">CAMBODIA</asp:ListItem>
                    <asp:ListItem Value="CAMEROON">CAMEROON</asp:ListItem>
                    <asp:ListItem Value="CANADA">CANADA</asp:ListItem>
                    <asp:ListItem Value="CAPE_VERDE">CAPE VERDE</asp:ListItem>
                    <asp:ListItem Value="CENTRAL_AFRICAN_REPUBLIC">CENTRAL AFRICAN REPUBLIC</asp:ListItem>
                    <asp:ListItem Value="CHAD">CHAD</asp:ListItem>
                    <asp:ListItem Value="CHILE">CHILE</asp:ListItem>
                    <asp:ListItem Value="CHINA">CHINA</asp:ListItem>
                    <asp:ListItem Value="COLOMBIA">COLOMBIA</asp:ListItem>
                    <asp:ListItem Value="COMOROS">COMOROS</asp:ListItem>
                    <asp:ListItem Value="CONGO_REPUBLIC_OF_THE">CONGO, REPUBLIC OF THE...</asp:ListItem>
                    <asp:ListItem Value="COSTA_RICA">COSTA RICA</asp:ListItem>
                    <asp:ListItem Value="COTE_DIVOIRE_IVORY_COAST">CÔTE D'IVOIRE (IVORY COAST)</asp:ListItem>
                    <asp:ListItem Value="CROATIA">CROATIA</asp:ListItem>
                    <asp:ListItem Value="CUBA">CUBA</asp:ListItem>
                    <asp:ListItem Value="CYPRUS">CYPRUS</asp:ListItem>
                    <asp:ListItem Value="CZECH_REPUBLIC">CZECH REPUBLIC</asp:ListItem>
                    <asp:ListItem Value="DEMOCRATIC_PEOPLES_REPUBLIC_OF_KOREA_NORTH_KOREA">DEMOCRATIC PEOPLE'S REPUBLIC OF KOREA (NORTH KOREA)</asp:ListItem>
                    <asp:ListItem Value="DEMOCRATIC_REPUBLIC_OF_THE_CONGO">DEMOCRATIC REPUBLIC OF THE CONGO</asp:ListItem>
                    <asp:ListItem Value="DENMARK">DENMARK</asp:ListItem>
                    <asp:ListItem Value="DJIBOUTI">DJIBOUTI</asp:ListItem>
                    <asp:ListItem Value="DOMINICA">DOMINICA</asp:ListItem>
                    <asp:ListItem Value="DOMINICAN_REPUBLIC">DOMINICAN REPUBLIC</asp:ListItem>
                    <asp:ListItem Value="ECUADOR">ECUADOR</asp:ListItem>
                    <asp:ListItem Value="EGYPT">EGYPT</asp:ListItem>
                    <asp:ListItem Value="EL_SALVADOR">EL SALVADOR</asp:ListItem>
                    <asp:ListItem Value="EQUATORIAL_GUINEA">EQUATORIAL GUINEA</asp:ListItem>
                    <asp:ListItem Value="ERITREA">ERITREA</asp:ListItem>
                    <asp:ListItem Value="ESTONIA">ESTONIA</asp:ListItem>
                    <asp:ListItem Value="ETHIOPIA">ETHIOPIA</asp:ListItem>
                    <asp:ListItem Value="FIJI_ISLANDS">FIJI ISLANDS</asp:ListItem>
                    <asp:ListItem Value="FINLAND">FINLAND</asp:ListItem>
                    <asp:ListItem Value="FRANCE">FRANCE</asp:ListItem>
                    <asp:ListItem Value="GABON">GABON</asp:ListItem>
                    <asp:ListItem Value="GAMBIA">GAMBIA</asp:ListItem>
                    <asp:ListItem Value="GEORGIA">GEORGIA</asp:ListItem>
                    <asp:ListItem Value="GERMANY">GERMANY</asp:ListItem>
                    <asp:ListItem Value="GHANA">GHANA</asp:ListItem>
                    <asp:ListItem Value="GREECE">GREECE</asp:ListItem>
                    <asp:ListItem Value="GRENADA">GRENADA</asp:ListItem>
                    <asp:ListItem Value="GUATEMALA">GUATEMALA</asp:ListItem>
                    <asp:ListItem Value="GUINEA">GUINEA</asp:ListItem>
                    <asp:ListItem Value="GUINEABISSAU">GUINEA-BISSAU</asp:ListItem>
                    <asp:ListItem Value="GUYANA">GUYANA</asp:ListItem>
                    <asp:ListItem Value="HAITI">HAITI</asp:ListItem>
                    <asp:ListItem Value="HONDURAS">HONDURAS</asp:ListItem>
                    <asp:ListItem Value="HUNGARY">HUNGARY</asp:ListItem>
                    <asp:ListItem Value="ICELAND">ICELAND</asp:ListItem>
                    <asp:ListItem Value="INDONESIA">INDONESIA</asp:ListItem>
                    <asp:ListItem Value="IRAN">IRAN</asp:ListItem>
                    <asp:ListItem Value="IRAQ">IRAQ</asp:ListItem>
                    <asp:ListItem Value="IRELAND">IRELAND</asp:ListItem>
                    <asp:ListItem Value="ISRAEL">ISRAEL</asp:ListItem>
                    <asp:ListItem Value="ITALY">ITALY</asp:ListItem>
                    <asp:ListItem Value="JAMAICA">JAMAICA</asp:ListItem>
                    <asp:ListItem Value="JAPAN">JAPAN</asp:ListItem>
                    <asp:ListItem Value="JORDAN">JORDAN</asp:ListItem>
                    <asp:ListItem Value="KAZAKHSTAN">KAZAKHSTAN</asp:ListItem>
                    <asp:ListItem Value="KENYA">KENYA</asp:ListItem>
                    <asp:ListItem Value="KIRIBATI">KIRIBATI</asp:ListItem>
                    <asp:ListItem Value="KUWAIT">KUWAIT</asp:ListItem>
                    <asp:ListItem Value="KYRGYZSTAN">KYRGYZSTAN</asp:ListItem>
                    <asp:ListItem Value="LAO_PEOPLES_DEMOCRATIC_REPUBLIC">LAO PEOPLE'S DEMOCRATIC REPUBLIC</asp:ListItem>
                    <asp:ListItem Value="LATVIA">LATVIA</asp:ListItem>
                    <asp:ListItem Value="LEBANON">LEBANON</asp:ListItem>
                    <asp:ListItem Value="LESOTHO">LESOTHO</asp:ListItem>
                    <asp:ListItem Value="LIBERIA">LIBERIA</asp:ListItem>
                    <asp:ListItem Value="LIBYA">LIBYA</asp:ListItem>
                    <asp:ListItem Value="LIECHTENSTEIN">LIECHTENSTEIN</asp:ListItem>
                    <asp:ListItem Value="LITHUANIA">LITHUANIA</asp:ListItem>
                    <asp:ListItem Value="LUXEMBOURG">LUXEMBOURG</asp:ListItem>
                    <asp:ListItem Value="MACEDONIA">MACEDONIA</asp:ListItem>
                    <asp:ListItem Value="MADAGASCAR">MADAGASCAR</asp:ListItem>
                    <asp:ListItem Value="MALAWI">MALAWI</asp:ListItem>
                    <asp:ListItem Value="MALAYSIA">MALAYSIA</asp:ListItem>
                    <asp:ListItem Value="MALDIVES">MALDIVES</asp:ListItem>
                    <asp:ListItem Value="MALI">MALI</asp:ListItem>
                    <asp:ListItem Value="MALTA">MALTA</asp:ListItem>
                    <asp:ListItem Value="MARSHALL_ISLANDS">MARSHALL ISLANDS</asp:ListItem>
                    <asp:ListItem Value="MAURITANIA">MAURITANIA</asp:ListItem>
                    <asp:ListItem Value="MAURITIUS">MAURITIUS</asp:ListItem>
                    <asp:ListItem Value="MEXICO">MEXICO</asp:ListItem>
                    <asp:ListItem Value="MICRONESIA_FEDERATED_STATES_OF">MICRONESIA, FEDERATED STATES OF...</asp:ListItem>
                    <asp:ListItem Value="MONACO">MONACO</asp:ListItem>
                    <asp:ListItem Value="MONGOLIA">MONGOLIA</asp:ListItem>
                    <asp:ListItem Value="MONTENEGRO">MONTENEGRO</asp:ListItem>
                    <asp:ListItem Value="MOROCCO">MOROCCO</asp:ListItem>
                    <asp:ListItem Value="MOZAMBIQUE">MOZAMBIQUE</asp:ListItem>
                    <asp:ListItem Value="MYANMAR">MYANMAR</asp:ListItem>
                    <asp:ListItem Value="NAMIBIA">NAMIBIA</asp:ListItem>
                    <asp:ListItem Value="NAURU">NAURU</asp:ListItem>
                    <asp:ListItem Value="NEPAL">NEPAL</asp:ListItem>
                    <asp:ListItem Value="NETHERLANDS">NETHERLANDS</asp:ListItem>
                    <asp:ListItem Value="NEW_ZEALAND">NEW ZEALAND</asp:ListItem>
                    <asp:ListItem Value="NICARAGUA">NICARAGUA</asp:ListItem>
                    <asp:ListItem Value="NIGER">NIGER</asp:ListItem>
                    <asp:ListItem Value="NIGERIA">NIGERIA</asp:ListItem>
                    <asp:ListItem Value="NORWAY">NORWAY</asp:ListItem>
                    <asp:ListItem Value="OMAN">OMAN</asp:ListItem>
                    <asp:ListItem Value="PAKISTAN">PAKISTAN</asp:ListItem>
                    <asp:ListItem Value="PALAU">PALAU</asp:ListItem>
                    <asp:ListItem Value="PANAMA">PANAMA</asp:ListItem>
                    <asp:ListItem Value="PAPUA_NEW_GUINEA">PAPUA NEW GUINEA</asp:ListItem>
                    <asp:ListItem Value="PARAGUAY">PARAGUAY</asp:ListItem>
                    <asp:ListItem Value="PERU">PERU</asp:ListItem>
                    <asp:ListItem Value="PHILIPPINES">PHILIPPINES</asp:ListItem>
                    <asp:ListItem Value="POLAND">POLAND</asp:ListItem>
                    <asp:ListItem Value="PORTUGAL">PORTUGAL</asp:ListItem>
                    <asp:ListItem Value="QATAR">QATAR</asp:ListItem>
                    <asp:ListItem Value="REPUBLIC_OF_KOREA_SOUTH_KOREA">REPUBLIC OF KOREA (SOUTH KOREA)</asp:ListItem>
                    <asp:ListItem Value="REPUBLIC_OF_MOLDOVA">REPUBLIC OF MOLDOVA</asp:ListItem>
                    <asp:ListItem Value="ROMANIA">ROMANIA</asp:ListItem>
                    <asp:ListItem Value="RUSSIAN_FEDERATION">RUSSIAN FEDERATION</asp:ListItem>
                    <asp:ListItem Value="RWANDA">RWANDA</asp:ListItem>
                    <asp:ListItem Value="SAINT_KITTS_AND_NEVIS">SAINT KITTS AND NEVIS</asp:ListItem>
                    <asp:ListItem Value="SAINT_LUCIA">SAINT LUCIA</asp:ListItem>
                    <asp:ListItem Value="SAINT_VINCENT_AND_THE_GRENADINES">SAINT VINCENT AND THE GRENADINES</asp:ListItem>
                    <asp:ListItem Value="SAMOA">SAMOA</asp:ListItem>
                    <asp:ListItem Value="SAN_MARINO">SAN MARINO</asp:ListItem>
                    <asp:ListItem Value="SAO_TOME_AND_PRINCIPE">SAO TOME AND PRINCIPE</asp:ListItem>
                    <asp:ListItem Value="SAUDI_ARABIA">SAUDI ARABIA</asp:ListItem>
                    <asp:ListItem Value="SENEGAL">SENEGAL</asp:ListItem>
                    <asp:ListItem Value="SERBIA">SERBIA</asp:ListItem>
                    <asp:ListItem Value="SEYCHELLES">SEYCHELLES</asp:ListItem>
                    <asp:ListItem Value="SIERRA_LEONE">SIERRA LEONE</asp:ListItem>
                    <asp:ListItem Value="SINGAPORE">SINGAPORE</asp:ListItem>
                    <asp:ListItem Value="SLOVAKIA">SLOVAKIA</asp:ListItem>
                    <asp:ListItem Value="SLOVENIA">SLOVENIA</asp:ListItem>
                    <asp:ListItem Value="SOLOMON_ISLANDS">SOLOMON ISLANDS</asp:ListItem>
                    <asp:ListItem Value="SOMALIA">SOMALIA</asp:ListItem>
                    <asp:ListItem Value="SOUTH_AFRICA">SOUTH AFRICA</asp:ListItem>
                    <asp:ListItem Value="SOUTH_SUDAN">SOUTH SUDAN</asp:ListItem>
                    <asp:ListItem Value="SPAIN">SPAIN</asp:ListItem>
                    <asp:ListItem Value="SRI_LANKA">SRI LANKA</asp:ListItem>
                    <asp:ListItem Value="SUDAN">SUDAN</asp:ListItem>
                    <asp:ListItem Value="SURINAME">SURINAME</asp:ListItem>
                    <asp:ListItem Value="SWAZILAND">SWAZILAND</asp:ListItem>
                    <asp:ListItem Value="SWEDEN">SWEDEN</asp:ListItem>
                    <asp:ListItem Value="SWITZERLAND">SWITZERLAND</asp:ListItem>
                    <asp:ListItem Value="SYRIAN_ARAB_REPUBLIC">SYRIAN ARAB REPUBLIC</asp:ListItem>
                    <asp:ListItem Value="TAJIKISTAN">TAJIKISTAN</asp:ListItem>
                    <asp:ListItem Value="THAILAND">THAILAND</asp:ListItem>
                    <asp:ListItem Value="TIMORLESTE">TIMOR-LESTE</asp:ListItem>
                    <asp:ListItem Value="TOGO">TOGO</asp:ListItem>
                    <asp:ListItem Value="TONGA">TONGA</asp:ListItem>
                    <asp:ListItem Value="TRINIDAD_AND_TOBAGO">TRINIDAD AND TOBAGO</asp:ListItem>
                    <asp:ListItem Value="TUNISIA">TUNISIA</asp:ListItem>
                    <asp:ListItem Value="TURKEY">TURKEY</asp:ListItem>
                    <asp:ListItem Value="TURKMENISTAN">TURKMENISTAN</asp:ListItem>
                    <asp:ListItem Value="TUVALU">TUVALU</asp:ListItem>
                    <asp:ListItem Value="UGANDA">UGANDA</asp:ListItem>
                    <asp:ListItem Value="UKRAINE">UKRAINE</asp:ListItem>
                    <asp:ListItem Value="UNITED_ARAB_EMIRATES">UNITED ARAB EMIRATES</asp:ListItem>
                    <asp:ListItem Value="UNITED_KINGDOM_OF_GREAT_BRITAIN_AND_NORTHERN_IRELAND">UNITED KINGDOM OF GREAT BRITAIN AND NORTHERN IRELAND</asp:ListItem>
                    <asp:ListItem Value="UNITED_REPUBLIC_OF_TANZANIA">UNITED REPUBLIC OF TANZANIA</asp:ListItem>
                    <asp:ListItem Value="UNITED_STATES_OF_AMERICA">UNITED STATES OF AMERICA</asp:ListItem>
                    <asp:ListItem Value="URUGUAY">URUGUAY</asp:ListItem>
                    <asp:ListItem Value="UZBEKISTAN">UZBEKISTAN</asp:ListItem>
                    <asp:ListItem Value="VANUATU">VANUATU</asp:ListItem>
                    <asp:ListItem Value="VENEZUELA_BOLIVARIAN_REPUBLIC_OF">VENEZUELA, BOLIVARIAN REPUBLIC OF...</asp:ListItem>
                    <asp:ListItem Value="VIETNAM">VIETNAM</asp:ListItem>
                    <asp:ListItem Value="YEMEN">YEMEN</asp:ListItem>
                    <asp:ListItem Value="ZAMBIA">ZAMBIA</asp:ListItem>
                    <asp:ListItem Value="ZIMBABWE">ZIMBABWE</asp:ListItem>
                    <asp:ListItem Value="OTHERS">OTHERS</asp:ListItem>
                </asp:DropDownList>
            </p>
            <p>
                <label for="txtPinCode">Pincode</label>
                <span class="redstar">*</span>
                <asp:RequiredFieldValidator ID="RequiredtxtPinCode" ControlToValidate="txtPinCode" ClientIDMode="AutoID" CssClass="redstar" ErrorMessage="Required" SetFocusOnError="true" runat="server"></asp:RequiredFieldValidator>
                <br />
                <span class="quiet">Enter 999999 in case of Foreign Address</span>
                <br />
                <asp:TextBox ID="txtPinCode" runat="server" CssClass="form-control Numeric"></asp:TextBox>
            </p>
            <p>
                <asp:Button ID="btnSave" Text="Save" runat="server" OnClick="btnSave_Click" CssClass="btn btn-primary btn-sm" />
                <asp:Literal ID="ltStatus" runat="server"></asp:Literal>
            </p>

        </div>
            </div>
        <div class="col-lg-1">&nbsp;</div>
        <div class="col-lg-5" id="divBasicInfo" runat="server" visible="false" ></div>
    </div>
</asp:Content>

