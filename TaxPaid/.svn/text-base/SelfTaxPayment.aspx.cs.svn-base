using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReturnFilingModel;

public partial class TaxPaid_AddTaxesPaid : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
		Title = "Self Tax Payment - return-filing.in";
        base.Page_Load(sender, e);

		if (!IsPostBack)
		{
			ShowData();
			ShowDetails();
		}
    }

	void ShowDetails()
	{
		if (Data1 == "0")
			return;

		AdvanceTax AT = AdvanceTax.GetByID(Cmn.ToInt(Data1));
		if (AT != null)
		{
			txtID.Value = AT.ID.ToString();
			spnID.InnerText = AT.ID.ToString();
			txtAmountPaid.Text = AT.AmountDeposited.ToString();
			txtDateOfPayment.Text = Cmn.ToDate(AT.DateOfDeposit).ToString("dd-MMM-yyyy");
			txtBSRCode.Text = AT.BSRCode;
			txtChallanNo.Text = AT.ChallanNo;
		}
	}

	void ShowData()
	{
		List<AdvanceTax> AdvList = AdvanceTax.GetByCandidateID(Global.CandidateID);

		if (AdvList.Count > 0)
		{
			int ctr = 0;
			StringBuilder str = new StringBuilder("<h3>Existing Records</h3>");
			str.Append("<table class='table table-condensed table-bordered'>");
			str.Append("<tr>" +
				"<th>#" +
				"<th>Amount Paid" +
				"<th>Payment Date" +
				"<th>BSR Code" +
				"<th>Challan No" +
				"<th style='width:50px;'>&nbsp"
				);

			foreach (AdvanceTax AT in AdvList)
			{
				str.Append("<tr id='r_" + AT.ID + "'>" +
				"<td>" + (++ctr) +
				"<td><a href='/selftaxpayment/" + AT.ID + "' title='click to view/edit details'><span class='glyphicon glyphicon-pencil'></span>&nbsp;&nbsp;" + AT.AmountDeposited + "</a>" +
				"<td>" + AT.DateOfDeposit +
				"<td>" + AT.BSRCode +
				"<td>" + AT.ChallanNo +
				"<td><a href='#' data-id='" + AT.ID + "' title='click to delete' class='btn btn-xs btn-danger del' data-prop='advtax'>&nbsp;&nbsp;<span class='glyphicon glyphicon-trash'></span>&nbsp;&nbsp;</a>"
				);
			}

			str.Append("</table>");
			divExisting.InnerHtml = str.ToString();
			divExisting.Visible = true;
		}
	}

	protected void btnSave_Click1(object sender, EventArgs e)
	{
		if (!Global.IfUserExists(ltStatus))
			return;

		try
		{
			AdvanceTax AT = AdvanceTax.GetByID(Cmn.ToInt(txtID.Value));
			if (AT == null)
			{
				AT = new AdvanceTax();
				AT.ID = 0;
				
			}
			AT.CandidateID = Global.CandidateID;
			AT.AmountDeposited = Cmn.ToDbl(txtAmountPaid.Text);
			AT.DateOfDeposit = Cmn.ToDate(txtDateOfPayment.Text);
			AT.BSRCode = txtBSRCode.Text;
			AT.ChallanNo = txtChallanNo.Text;
			AT.Save();
			Response.Redirect("/selftaxpayment/" + AT.ID);
		}
		catch (Exception ex)
		{
			ltStatus.Text = Global.ErrorMessage("Error, not saved." + ex.Message);
		}
	}
}