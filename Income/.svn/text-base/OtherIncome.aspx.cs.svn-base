using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReturnFilingModel;

public partial class Income_OtherIncome : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
		Title = "Other Income - return-filing.in";
        base.Page_Load(sender, e);

        if (!IsPostBack)
            ShowDetails();
    }
    void ShowDetails()
    {
        OtherIncome OI = OtherIncome.GetByID(Global.CandidateID,1);
        if (OI != null)
        {
            txtInterestIncomeFromBank.Text = OI.IncomeFromSavingBankAndPostOffice.ToString();
            txtOtherInterestIncome.Text = OI.IncomeFromFixedDeposits.ToString();
            txtAnyOtherIncome.Text = OI.AnyOtherIncome.ToString();
            txtDividedEarned.Text = OI.DividendEarned.ToString();
            txtExpemtInterestIncome.Text = OI.ExemptInterestIncome.ToString();
            txtOtherExpemtIncome.Text = OI.MiscExemptIncome.ToString();
            txtAgrIncome.Text = OI.AgricultureIncome.ToString();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
		if (!Global.IfUserExists(ltStatus))
			return;

        try
        {
            OtherIncome OI = OtherIncome.GetByID(Global.CandidateID, 1);
            if (OI == null)
            {
                OI = new OtherIncome();
                OI.ID = 0;
                OI.CandidateID = Global.CandidateID;
            }
            OI.IncomeFromSavingBankAndPostOffice = Cmn.ToInt(txtInterestIncomeFromBank.Text);
            OI.IncomeFromFixedDeposits = Cmn.ToInt(txtOtherInterestIncome.Text);
            OI.AnyOtherIncome = Cmn.ToInt(txtAnyOtherIncome.Text);
            OI.DividendEarned = Cmn.ToInt(txtDividedEarned.Text);
            OI.ExemptInterestIncome = Cmn.ToInt(txtExpemtInterestIncome.Text);
            OI.MiscExemptIncome = Cmn.ToInt(txtOtherExpemtIncome.Text);
            OI.AgricultureIncome = Cmn.ToInt(txtAgrIncome.Text);
            OI.Save();
            ltStatus.Text = Global.SuccesMessage("Saved Succssfully");
        }
        catch (Exception ex)
        {
            ltStatus.Text = Global.ErrorMessage("Error, not saved." + ex.Message);
        }
    }
}