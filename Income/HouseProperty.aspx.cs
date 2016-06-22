using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReturnFilingModel;

public partial class Income_HouseProperty : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
		Title = "House Property - return-filing.in";
		base.Page_Load(sender, e);
		ShowData();
    }

	void FillDetails(int ID)
    {
		HouseProperty HP = HouseProperty.GetByID(ID);
        if (HP != null)
        {
			txtID.Value = ID.ToString();
			spnID.InnerText = ID.ToString();
            txtIntersetPaidOnLoan.Text = HP.InterestOnSelfOccupiedProperty.ToString();
            ddFinancialYear.SelectedValue=HP.PreConsFinancialYear.ToString();
            txtTotalInterestAmount.Text = HP.PreConsTotalInterest.ToString();
            txtFlatNo.Text = HP.Address1;
            txtRoadStreet.Text = HP.Address2;
            txtArea.Text = HP.Area;
            txtCity.Text = HP.City;
            ddState.SelectedValue = HP.State;
            txtPincode.Text = HP.PinCode;
            txtOwnershipShare.Text = HP.OwnershipShare.ToString();
        }
    }
	protected void btnSave_Click(object sender, EventArgs e)
	{
		if (!Global.IfUserExists(ltStatus))
			return;

		try
		{
			HouseProperty HP = HouseProperty.GetByID(Cmn.ToInt(txtID.Value));
			if (HP == null)
			{
				HP = new HouseProperty();
				HP.ID = 0;
				HP.CandidateID = Global.CandidateID;
			}

			HP.InterestOnSelfOccupiedProperty = Cmn.ToInt(txtIntersetPaidOnLoan.Text);
			HP.PreConsFinancialYear = Cmn.ToInt(ddFinancialYear.SelectedValue.Split('-')[0]);
			HP.PreConsTotalInterest = Cmn.ToInt(txtTotalInterestAmount.Text);
			HP.Address1 = txtFlatNo.Text;
			HP.Address2 = txtRoadStreet.Text;
			HP.Area = txtArea.Text;
			HP.City = txtCity.Text;
			HP.State = ddState.SelectedValue;
			HP.PinCode = txtPincode.Text;
			HP.OwnershipShare = Cmn.ToInt(txtOwnershipShare.Text);
			HP.Save();
			Response.Redirect(Request.RawUrl);
			//ltStatus.Text = Global.SuccesMessage("Saved Succssfully");
		}
		catch (Exception ex)
		{
			ltStatus.Text = Global.ErrorMessage("Error, not saved." + ex.Message);
		}
	}

	void ShowData()
	{
		List<HouseProperty> CGList = HouseProperty.GetByCandidateID(Global.CandidateID);
		if (CGList.Count > 0)
		{
			if (Data1 != "-1")
				FillDetails(Cmn.ToInt(Data1));
			else
				FillDetails(Cmn.ToInt(CGList[0].ID));

			int ctr = 0;
			StringBuilder str = new StringBuilder("<h3>Existing Records</h3>");
			str.Append("<table class='table table-condensed table-bordered'>");
			str.Append("<tr>" +
				"<th>#" +
				"<th>Address" +
				"<th>City" +
				"<th>Ownership %" +
				"<th>Pre Cons Year" +
				"<th>Pre Cons Int." +
				"<th style='width:50px;'>&nbsp"
				);

			foreach (HouseProperty CG in CGList)
			{
				str.Append("<tr id='r_" + CG.ID + "'>" +
				"<td>" + (++ctr) +
				"<td><a href='/houseproperty/" + CG.ID  +"' title='click to view/edit details'><span class='glyphicon glyphicon-pencil'></span>&nbsp;&nbsp;" + CG.Address1 +" "  + CG.Address2 + "</a>" +
				"<td>" + CG.City+
				"<td>" + CG.OwnershipShare +
				"<td>" + CG.PreConsFinancialYear +
				"<td>" + CG.PreConsTotalInterest+
				"<td><a href='#' data-id='" + CG.ID + "' title='click to delete' class='btn btn-xs btn-danger del' data-prop='hp'>&nbsp;&nbsp;<span class='glyphicon glyphicon-trash'></span>&nbsp;&nbsp;</a>"
				);
			}

			str.Append("</table>");
			divExistingProperty.InnerHtml = str.ToString();
			divExistingProperty.Visible = true;
		}
	}

}