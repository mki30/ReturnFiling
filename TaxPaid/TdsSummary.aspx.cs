using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReturnFilingModel;
using System.Text;

public partial class TaxPaid_TdsSummary : BasePage
{   
    protected new void Page_Load(object sender, EventArgs e)
    {
		Title = "TDS Summary - return-filing.in";
        base.Page_Load(sender, e);

        if (!IsPostBack)
            ShowDetails();
    }

	void FillDetails(int ID)
    {
		TDSEntry TDSE = TDSEntry.GetByID(ID);
        if (TDSE != null)
        {
			spnID.InnerText = ID.ToString();
			txtID.Value = ID.ToString();
            txtTanOfDeductor.Text = TDSE.DeductorTAN;
            txtNameOfDeductor.Text = TDSE.DeductorName;
            txtTotalTaxDeducted.Text = TDSE.ToatalTaxDeducted.ToString();
            txtTaxDeductedClaimed.Text = TDSE.ToatalDeductedClaimed.ToString();
            ddFinancialYear.SelectedValue = TDSE.FinancialYear.ToString();
        }
    }
    
	protected void btnsaveCapitalGain_Click(object sender, EventArgs e)
	{
		if (!Global.IfUserExists(ltStatus))
			return;

		try
		{
			TDSEntry TDSE = TDSEntry.GetByID(Cmn.ToInt(txtID.Value));

			if (TDSE == null)
			{
				TDSE = new TDSEntry();
				TDSE.ID = 0;
			}

			TDSE.CandidateID = Global.CandidateID;
			TDSE.DeductorTAN = txtTanOfDeductor.Text;
			TDSE.DeductorName = txtNameOfDeductor.Text;
			TDSE.FinancialYear = Cmn.ToInt(ddFinancialYear.SelectedValue);
			TDSE.ToatalDeductedClaimed = Cmn.ToDbl(txtTaxDeductedClaimed.Text);
			TDSE.ToatalTaxDeducted = Cmn.ToDbl(txtTotalTaxDeducted.Text);
			TDSE.Save();
			//Response.Redirect(Request.RawUrl);
			ltStatus.Text = Global.SuccesMessage("Saved Succssfully");
		}
		catch (Exception ex)
		{
			ltStatus.Text = Global.ErrorMessage("Error, not saved." + ex.Message);
		}
	}

	void ShowDetails()
	{
		List<TDSEntry> TDSLists = TDSEntry.GetByCandidateID(Global.CandidateID);
		if (TDSLists.Count == 0)
			return;

		if (Data1 != "-1")
			FillDetails(Cmn.ToInt(Data1));
		//else
		//	FillDetails(Cmn.ToInt(TDSLists[0].ID));

		int ctr = 0;
		StringBuilder str = new StringBuilder("<h3>Existing TDS Entries</h3>");
		str.Append("<table class='table table-condensed table-bordered'>");
		str.Append("<tr>" +
			"<th>#" +
			"<th>Deductor TAN" +
			"<th>Deductor Name" +
			"<th>Tax Deducted" +
			"<th>Tax Deducted Claimed" +
			"<th style='width:50px;'>&nbsp"
			);
		foreach (TDSEntry tds in TDSLists)
		{
			str.Append("<tr id='r_" + tds.ID + "'>" +
			"<td>" + (++ctr) +
			"<td><a href='/tds/" + tds.ID + "' title='click to view/edit details'><span class='glyphicon glyphicon-pencil'></span>&nbsp;&nbsp;" + tds.DeductorTAN + "</a>" +
			"<td>" + tds.DeductorName +
			"<td>" + tds.ToatalTaxDeducted +
			"<td>" + tds.ToatalDeductedClaimed +
			"<td><a href='#' data-id='" + tds.ID + "' title='click to delete' class='btn btn-xs btn-danger del' data-prop='tds'>&nbsp;&nbsp;<span class='glyphicon glyphicon-trash'></span>&nbsp;&nbsp;</a>"
			);
		}

		str.Append("</table>");
		divExistingRecords.InnerHtml = str.ToString();
		divExistingRecords.Visible = true;
	}
}