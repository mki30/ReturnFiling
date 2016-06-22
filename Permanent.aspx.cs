using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReturnFilingModel;

public partial class Permanent :BasePage
{
	protected new void Page_Load(object sender, EventArgs e)
	{
		base.Page_Load(sender, e);
		Title = "Personal Info - return-filing.in";
		if (!IsPostBack)
			ShowDetails();
	}

	void ShowDetails()
	{
		PersonalInfo PI = PersonalInfo.GetByEmailID(Global.EmailID);
		if (PI == null)
		{
			txtEmail.Text = Global.EmailID;
			return;
		}
		else
			FillDetails(Cmn.ToInt(PI.ID));
	}

	void FillDetails(int CandidateID)
	{
		PersonalInfo ci = PersonalInfo.GetByID(CandidateID);
		if (ci != null)
		{
			Global.CandidateID = Cmn.ToInt(ci.ID);
			txtFirstName.Text = ci.FirstName;
			txtMiddleName.Text = ci.MiddleName;
			txtLastName.Text = ci.LastName;
			ddGender.SelectedValue = ci.Gender.ToString();
			txtDob.Text = Cmn.ToDate(ci.DOB).ToString("dd-MMM-yyyy");
			txtPan.Text = ci.PANNumber;
			txtFathersName.Text = ci.FatherName;
			txtEmail.Text = ci.EmailID;
			//aAddress.HRef = "/address/" + ci.ID;
			//aAddress.Visible = true;
			spnID.InnerText = ci.ID.ToString();
		}
	}
	protected void btnSave_Click1(object sender, EventArgs e)
	{
		if (txtEmail.Text.Trim() == "abc@xyz.com")
		{
			ltStatus.Text = Global.ErrorMessage("Please enter valid email id.");
			txtEmail.Text = "";
			txtEmail.Focus();
			return;
		}

		PersonalInfo ci = null;
		if (Global.CandidateID != 0)
			ci = PersonalInfo.GetByID(Global.CandidateID);
		else
			ci = PersonalInfo.GetUnique(Global.AssessmentYear, txtPan.Text);

		try
		{
			if (ci == null)
			{
				ci = new PersonalInfo();
				ci.ID = 0;
				ci.AssessmentYear = Global.AssessmentYear;
			}

			ci.FirstName = txtFirstName.Text;
			ci.MiddleName = txtMiddleName.Text;
			ci.LastName = txtLastName.Text;
			ci.Gender = Cmn.ToInt(ddGender.SelectedValue);
			ci.DOB = Cmn.ToDate(txtDob.Text);
			ci.PANNumber = txtPan.Text;
			ci.FatherName = txtFathersName.Text;
			ci.EmailID = txtEmail.Text;
			ci.Save();
			Global.EmailID = txtEmail.Text;
			Global.CandidateID = (int)ci.ID;
			//ltStatus.Text = Global.SuccesMessage("Saved Succssfully");
			//aAddress.HRef = "/address/" + ci.ID;
			//aAddress.Visible = true;
			Response.Redirect("/address/" + ci.ID + "/0"); //Data2 is used to identify in address page, it is directed after save, to display saved message in address page
		}
		catch (Exception ex)
		{
			ltStatus.Text = Global.ErrorMessage("Error, not saved." + ex.Message);

			if (ex.Message == "The property 'PANNumber' is part of the object's key information and cannot be modified.")
				ltStatus.Text = Global.ErrorMessage("Pan no can't be modified");
		}
	}
}