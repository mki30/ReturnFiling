using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReturnFiling;
using ReturnFilingModel;
using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
public partial class PersonalInformation :System.Web.UI.Page
{
	protected new void Page_Load(object sender, EventArgs e)
	{
		Title = "Personal Info - return-filing.in";
		if (!IsPostBack)
			ShowDetails();
	}

	void ShowDetails()
	{
		PersonalInfo PI = PersonalInfo.GetByID(Global.CandidateID);
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
			txtMobile.Text = ci.Mobile;
			txtFathersName.Text = ci.FatherName;
			txtEmail.Text = ci.EmailID;
			//spnID.InnerText = ci.ID.ToString();
		}

		AdditionalInfo AI = AdditionalInfo.GetByCandidateID(Global.CandidateID);
		if (AI != null)
		{
			txtBankAccountNumber.Text = AI.BankAccountNumber;
			txtBankIFSC.Text = AI.BankIFSC;
			ddAccountType.Text = AI.AccountType;
		}
	}

	protected void btnSave_Click1(object sender, EventArgs e)
	{
		PersonalInfo ci = null;
		if (Global.CandidateID != 0)
			ci = PersonalInfo.GetByID(Global.CandidateID);
		else
			ci = PersonalInfo.GetUnique(Global.AssessmentYear, txtPan.Text);

		Boolean IsNew = ci == null;
		try
		{
			if (IsNew)
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
			ci.Mobile = txtMobile.Text;
			ci.Save();
			Global.EmailID = txtEmail.Text;
			Global.CandidateID = (int)ci.ID;


			AdditionalInfo AI = AdditionalInfo.GetByCandidateID(Global.CandidateID);
			if (AI == null)
			{
				AI = new AdditionalInfo();
				AI.ID = 0;
				AI.CandidateID = Global.CandidateID;
			}

			AI.BankAccountNumber = txtBankAccountNumber.Text;
			AI.BankIFSC = txtBankIFSC.Text;
			AI.AccountType = ddAccountType.Text;
			AI.Save();
			ltStatus.Text = Global.SuccesMessage("Saved");

			var manager = new UserManager();
			ApplicationUser user = manager.Find(txtEmail.Text, txtMobile.Text);
			if (user == null)
			{
				if (Global.CreateNewUser(txtEmail.Text, txtMobile.Text))
				{
					email.SendEmail("Account Details from return-filing.in", txtEmail.Text,
						"Welcome to <b>return-filing.in</b>" +
							"<br /><br /> Dear " + txtFirstName.Text + " " + txtMiddleName.Text + " " + txtLastName.Text + ", <br/>" +
											 "You can <a href='http://localhost:50710/Account/Login'>login<a> using below details to check your application status.<br/><br/>" +
											 "<b>Username : </b>" + txtEmail.Text + "<br/>" +
											 "<b>Password : </b>" + txtMobile.Text + "<br/><br/><br/><br/>" +
											 "Regards,<br/>" +
											 "<a href='www.return-filing.in'>Return-Filing Team</a>"
							);
				}
			}

			pnlInfo.Visible = false;
			IncomeSourceMenu.Visible = false;
			//pnlSuccess.Visible = true;
		}
		catch (Exception ex)
		{
			ltStatus.Text = Global.ErrorMessage("Error, not saved." + ex.Message);

			if (ex.Message == "The property 'PANNumber' is part of the object's key information and cannot be modified.")
				ltStatus.Text = Global.ErrorMessage("Pan no can't be modified");
		}
	}
	protected void btnSaveBankInfo_Click(object sender, EventArgs e)
	{
		try
		{
			AdditionalInfo AI = AdditionalInfo.GetByCandidateID(Global.CandidateID);
			if (AI == null)
			{
				AI = new AdditionalInfo();
				AI.ID = 0;
				AI.CandidateID = Global.CandidateID;
			}

			AI.BankAccountNumber = txtBankAccountNumber.Text;
			AI.BankIFSC = txtBankIFSC.Text;
			AI.AccountType = ddAccountType.Text;
			AI.Save();
			ltStatus.Text = Global.SuccesMessage("Saved");
		}
		catch (Exception ex)
		{
			ltStatus.Text = Global.ErrorMessage("Error, not saved." + ex.Message);
		}
	}
}