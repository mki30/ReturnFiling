using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReturnFilingModel;

public partial class Address :BasePage
{
	PersonalInfo ci = null;
	protected void Page_Load(object sender, EventArgs e)
	{
		base.Page_Load(sender, e);
		Title = "Address - return-filing.in";

		if (Global.CandidateID == 0)
			Response.Redirect("/permanent");

		ci = PersonalInfo.GetByID(Global.CandidateID);

		//ShowPrimaryInfo(ci);
		divSavedMsg.Visible = false;
		if (!IsPostBack && ci != null)
		{
			ShowDetails();
			if (Data2 == "0")
			{
				divSavedMsg.InnerHtml = Global.SuccesMessage("Personal Info Saved Succssfully, Update address now.");
				divSavedMsg.Visible = true;
			}
		}
	}
	protected void btnSave_Click(object sender, EventArgs e)
	{
		if (!Global.IfUserExists(ltStatus))
			return;

		try
		{
			PersonalInfo ci = PersonalInfo.GetByID(Global.CandidateID);
			if (ci != null)
			{
				ci.Address1 = txtAddress1.Text;
				ci.Address2 = txtAddress2.Text;
				ci.Area = txtArea.Text;
				ci.City = txtCity.Text;
				ci.State = ddState.SelectedValue;
				ci.Country = ddCountry.SelectedValue;
				ci.PinCode = txtPinCode.Text;
				ci.Save();
				ltStatus.Text = Global.SuccesMessage("Saved Succssfully");
			}
		}
		catch (Exception ex)
		{
			ltStatus.Text = Global.ErrorMessage("Error, not saved." + ex.Message);
		}
	}

	void ShowDetails()
	{
		if (ci != null)
		{
			txtAddress1.Text = ci.Address1;
			txtAddress2.Text = ci.Address2;
			txtArea.Text = ci.Area;
			txtCity.Text = ci.City;
			ddState.SelectedValue = ci.State;
			ddCountry.SelectedValue = ci.Country;
			txtPinCode.Text = ci.PinCode;
		}
	}

	void ShowPrimaryInfo(PersonalInfo pi)
	{
		StringBuilder str = new StringBuilder("<h3>Personal Info</h3>");
		str.Append("<table class='table table-condensed table-bordered'>");
		if (pi != null)
		{
			Global.CandidateID = Cmn.ToInt(pi.ID);
			str.Append("<tr><td colspan='2'><b>Name : </b>" + pi.FirstName + " " + pi.MiddleName + " " + pi.LastName);

			str.Append("<tr><td><b>DOB : </b>" + Cmn.ToDate(pi.DOB).ToString("dd-MMM-yyyy") +
						   "<td><b>Gender : </b>" + (pi.Gender == 0 ? "Male" : "Female"));

			str.Append("<tr><td><b>PAN : </b>" + pi.PANNumber +
						   "<td><b>Father's Name : </b>" + pi.FatherName);

			str.Append("<tr><td colspan='2'><b>Email : </b>" + pi.EmailID);
		}
		str.Append("</table>");
		divBasicInfo.InnerHtml = str.ToString();
		divBasicInfo.Visible = true;
	}
}