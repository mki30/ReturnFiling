using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReturnFilingModel;

public partial class Income_CapitalGain :BasePage
{
	int CapitalGainType = 0;
	protected new void Page_Load(object sender, EventArgs e)
	{
		Title = "Capital Gain - return-filing.in";
		base.Page_Load(sender, e);

		ShowData();
		ShowDetails();

		if (Data1 != "")
		{
			formDiv.Visible = true;
			CapitalGainType = Cmn.ToInt(Data1);
		}

		switch (Data1)
		{
			case "1":
				ValueOfPropertyDiv.Visible = false;
				InvestUnder54Div.Visible = false;
				h3TypeInfo.InnerText = "Long Term - Sale of Shares";
				break;
			case "2":
				cbPaySttDiv.Visible = false;
				ddTypeOfShareDiv.Visible = false;
				h3TypeInfo.InnerText = "Long Term - Sale of land / building";
				break;
			case "3":
				ValueOfPropertyDiv.Visible = false;
				cbPaySttDiv.Visible = false;
				ddTypeOfShareDiv.Visible = false;
				InvestUnder54Div.Visible = false;
				h3TypeInfo.InnerText = "Long Term - Sale of any other asset";
				break;
			case "4":
				ValueOfPropertyDiv.Visible = false;
				ddTypeOfShareDiv.Visible = false;
				InvestUnder54Div.Visible = false;
				InvestUnder54ECDiv.Visible = false;
				InvestUnder54FDiv.Visible = false;
				h3TypeInfo.InnerText = "Short Term - Sale of Shares";
				break;
			case "5":
				cbPaySttDiv.Visible = false;
				ddTypeOfShareDiv.Visible = false;
				InvestUnder54Div.Visible = false;
				InvestUnder54ECDiv.Visible = false;
				InvestUnder54FDiv.Visible = false;
				h3TypeInfo.InnerText = "Short Term - Sale of land / building";
				break;
			case "6":
				ValueOfPropertyDiv.Visible = false;
				cbPaySttDiv.Visible = false;
				ddTypeOfShareDiv.Visible = false;
				InvestUnder54Div.Visible = false;
				InvestUnder54ECDiv.Visible = false;
				InvestUnder54FDiv.Visible = false;
				h3TypeInfo.InnerText = "Short Term - Sale of any other asset";
				break;
			default:
				break;
		}
		
	}

	void ShowDetails()
	{
		if (Data2 == "0")
			return;

		CapitalGain CG = CapitalGain.GetByID(Global.CandidateID, Cmn.ToInt(Data2));
		if (CG != null)
		{
			txtID.Value = CG.ID.ToString();
			spnID.InnerText = CG.ID.ToString();
			txtAssetSold.Text = CG.AssetSold;
			txtSalePrice.Text = CG.SalePrice.ToString();
			txtValueOfProperty.Text = CG.ValueOfProperty.ToString();
			txtTrasferExpens.Text = CG.TransferExpenses.ToString();
			txtPurchasePrice.Text = CG.PurchasePrice.ToString();
			txtDateOfSale.Text = Cmn.ToDate(CG.DateOfSale).ToString("dd-MMM-yyyy");
			txtDateOfPurchase.Text = Cmn.ToDate(CG.DateOfPurchase).ToString("dd-MMM-yyyy");
			ddTypeOfShare.SelectedValue = CG.TypeOfShare;
			txtInvestUnder54.Text = CG.InvestmentUnder54.ToString();
			txtInvestUnder54EC.Text = CG.InvestmentUnder54EC.ToString();
			txtInvestUnder54F.Text = CG.InvestmentUnder54F.ToString();
		}
	}

	protected void btnSave_Click(object sender, EventArgs e)
	{

	}
	protected void btnLongTermDetailOfSaleOfSahare_Click(object sender, EventArgs e)
	{
		ddTypeOfShareDiv.Visible = false;
	}
	protected void btnsaveCapitalGain_Click(object sender, EventArgs e)
	{
		if (!Global.IfUserExists(ltStatus))
			return;

		try
		{
			CapitalGain CG = CapitalGain.GetByID(Global.CandidateID, Cmn.ToInt(txtID.Value));
			if (CG == null)
			{
				CG = new CapitalGain();
				CG.ID = 0;
				CG.CandidateID = Global.CandidateID;
			}

			CG.AssetSold = txtAssetSold.Text;
			CG.SalePrice = Cmn.ToDbl(txtSalePrice.Text);
			CG.ValueOfProperty = Cmn.ToDbl(txtValueOfProperty.Text);
			CG.TransferExpenses = Cmn.ToDbl(txtTrasferExpens.Text);
			CG.PurchasePrice = Cmn.ToDbl(txtPurchasePrice.Text);
			CG.DateOfSale = Cmn.ToDate(txtDateOfSale.Text);
			CG.DateOfPurchase = Cmn.ToDate(txtDateOfPurchase.Text);
			CG.TypeOfShare = ddTypeOfShare.SelectedValue.ToString();
			CG.InvestmentUnder54 = Cmn.ToDbl(txtInvestUnder54.Text);
			CG.InvestmentUnder54EC = Cmn.ToDbl(txtInvestUnder54EC.Text);
			CG.InvestmentUnder54F = Cmn.ToDbl(txtInvestUnder54F.Text);
			CG.Type = CapitalGainType;
			CG.Save();
			Response.Redirect("/capitalgain/" + CG.Type + "/" + CG.ID);
			//ltStatus.Text = Global.SuccesMessage("Saved Succssfully");
		}
		catch (Exception ex)
		{
			ltStatus.Text = Global.ErrorMessage("Error, not saved." + ex.Message);
		}
	}

	void ShowData()
	{
		List<CapitalGain> CGList = CapitalGain.GetByCandidateID(Global.CandidateID);

		if (CGList.Count > 0)
		{
			int ctr = 0;
			StringBuilder str = new StringBuilder("<h3>Existing Records</h3>");
			str.Append("<table class='table table-condensed table-bordered'>");
			str.Append("<tr>" +
				"<th>#" +
				"<th>Description" +
				"<th>Purchase Price" +
				"<th>Sale Price" +
				"<th>Transfer Expensed" +
				"<th>Type" +
				"<th style='width:50px;'>&nbsp"
				);

			foreach (CapitalGain CG in CGList)
			{
				str.Append("<tr id='r_" + CG.ID + "'>" +
				"<td>" + (++ctr) +
				"<td><a href='/capitalgain/" + CG.Type + "/" + CG.ID + "' title='click to view/edit details'><span class='glyphicon glyphicon-pencil'></span>&nbsp;&nbsp;" + CG.AssetSold + "</a>" +
				"<td>" + CG.PurchasePrice +
				"<td>" + CG.SalePrice +
				"<td>" + CG.TransferExpenses +
				"<td>" + (CG.Type <=3 ? "Long Term" : "Short Term") +
				"<td><a href='#' data-id='" + CG.ID + "' title='click to delete' class='btn btn-xs btn-danger del' data-prop='capgain'>&nbsp;&nbsp;<span class='glyphicon glyphicon-trash'></span>&nbsp;&nbsp;</a>"
				);
			}

			str.Append("</table>");
			divExistingGain.InnerHtml = str.ToString();
			divExistingGain.Visible = true;
		}


	}
}