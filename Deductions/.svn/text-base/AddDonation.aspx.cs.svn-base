using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReturnFilingModel;

public partial class Deductions_AddDonation : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
		base.Page_Load(sender, e);
		Title = "Add Donations - return-filing.in";
		int ID = Cmn.ToInt(Data1);
		if (!IsPostBack && ID != 0)
			ShowData(ID);
    }
	protected void btnSave_Click(object sender, EventArgs e)
	{
		if (!Global.IfUserExists(ltStatus))
			return;
		Save();
	}

	void ShowData(int ID)
	{
		Donation don = Donation.GetByID(ID);
		if (don != null)
		{
			spnID.InnerText = don.ID.ToString();
			txtDonationAmount.Text = don.Amount.ToString();
			txtNameOfDonee.Text = don.NameOfDonee;
			txtPANOfDonee.Text = don.PANOfDonee;
			ddLimitOnDeduction.SelectedValue = don.LimitOfDeduction;
			ddQualifyingPercentage.SelectedValue = don.QualifyingPercentage;
			txtDoneeAddress.Text = don.AddressOfDonee;
			txtDoneeCity.Text = don.CityOfDonee;
			ddDoneeState.SelectedValue = don.StateOfDonee;
			txtDoneePinCode.Text = don.PinCodeOfDonee;
		}
	}
		
	void Save()
	{
		Global.CandidateID = 1;//testing

		int ID = Cmn.ToInt(spnID.InnerText);
		Donation don = null;

		if (ID != 0)
			don = Donation.GetByID(ID);

		if (don == null)
		{
			don = new Donation();
			don.ID = 0;
		}

		don.CandidateID = Global.CandidateID;
		don.Amount = Cmn.ToDbl( txtDonationAmount.Text);
		don.NameOfDonee = txtNameOfDonee.Text;
		don.PANOfDonee = txtPANOfDonee.Text;
		don.LimitOfDeduction = ddLimitOnDeduction.SelectedValue;
		don.QualifyingPercentage = ddQualifyingPercentage.SelectedValue;
		don.AddressOfDonee = txtDoneeAddress.Text;
		don.CityOfDonee = txtDoneeCity.Text;
		don.StateOfDonee = ddDoneeState.SelectedValue;
		don.PinCodeOfDonee = txtDoneePinCode.Text;
		don.Save();
		ShowData(don.ID);
	}
}