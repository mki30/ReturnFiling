using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReturnFilingModel;

public partial class TaxFiling_AdditionalInformation : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
		base.Page_Load(sender, e);

		if (!IsPostBack)
			ShowDetails();
    }

	protected void btnSave_Click(object sender, EventArgs e)
	{
		if (!Global.IfUserExists(ltStatus))
			return;

		try
		{
			AdditionalInfo AI = AdditionalInfo.GetByID(Cmn.ToInt(txtID.Value));
			if (AI == null)
			{
				AI = new AdditionalInfo();
				AI.ID = 0;
				AI.CandidateID = Global.CandidateID;
			}

			AI.IncomeTaxWard = txtIncomeTaxWard.Text;
			AI.EmailID= txtEmail.Text;
			AI.SecondayEmailID = txtSecondayEmail.Text;
			AI.Mobile = txtMobile.Text;
			AI.SecondaryMobile= txtSecondayMobile.Text;
			AI.STDCode = txtSTDCode.Text;
			AI.Phone = txtPhone.Text;
			AI.BankAccountNumber = txtBankAccountNumber.Text;
			AI.BankIFSC = txtBankIFSC.Text;
			AI.AccountType = ddAccountType.Text;
			AI.ReliefUnder89 = Cmn.ToDbl(txtReliefUnder89.Text);
			AI.Save();
			ltStatus.Text = Global.SuccesMessage("Saved");
		}
		catch (Exception ex)
		{
			ltStatus.Text = Global.ErrorMessage("Error, not saved." + ex.Message);
		}
	}

	void ShowDetails()
	{
		AdditionalInfo AI = AdditionalInfo.GetByCandidateID(Global.CandidateID);
		if (AI != null)
		{
			txtID.Value = AI.ID.ToString();
			txtIncomeTaxWard.Text = AI.IncomeTaxWard;
			txtEmail.Text = AI.EmailID;
			txtSecondayEmail.Text = AI.SecondayEmailID;
			txtMobile.Text = AI.Mobile;
			txtSecondayMobile.Text = AI.SecondaryMobile;
			txtSTDCode.Text = AI.STDCode;
			txtPhone.Text = AI.Phone;
			txtBankAccountNumber.Text = AI.BankAccountNumber;
			txtBankIFSC.Text = AI.BankIFSC;
			ddAccountType.Text = AI.AccountType;
			txtReliefUnder89.Text = AI.ReliefUnder89.ToString();
		}
	}
}