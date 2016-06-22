using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReturnFilingModel;

public partial class ReportDetails :BasePage
{
	int CandidateID = 0;
	protected void Page_Load(object sender, EventArgs e)
	{
		base.Page_Load(sender, e);
		//if (Global.UserType == -1)
		//{
		//	Global.PreviousURL = Request.RawUrl;
		//	Response.Redirect("~/Master/Login.aspx");
		//}

		Control ctl = Master.FindControl("btnLogout");
		if (ctl != null)
			ctl.Visible = true;

		CandidateID = Cmn.ToInt(Data1);
		Global.UserType = (int)RoleType.Master;
		ShowReports();
	}

	void ShowReports()
	{
		DisplayPersonalInfo();
		//DisplayDeductions();
		//DisplayAssets();
		//DisplayHouseProperty();
		//DisplaySalaries();
	}

	void DisplayPersonalInfo()
	{
		if (Global.UsersList.Count == 0) //load associates list
			Global.LoadUsers();

		PersonalInfo usr = PersonalInfo.GetByID(CandidateID);
		if (usr == null)
			return;

		StringBuilder str = new StringBuilder("");
		str.Append("<h3>Personal Info</h3>");
		str.Append("<table class='table table-condensed table-bordered'>");

		//4 columns display
		str.Append("<tr><td><b>Name </b>: " + usr.FirstName + " " + usr.MiddleName + " " + usr.LastName);
		str.Append("<td><b>Father's Name </b>: " + usr.FatherName);
		str.Append("<td><b>DOB </b>: " + Cmn.ToDate(usr.DOB).ToString("dd-MMM-yyyy"));
		str.Append("<td><b>Gender</b> : " + (usr.Gender == 0 ? "Male" : "Female"));

		str.Append("<tr><td><b>PAN Number </b>: " + usr.PANNumber);
		str.Append("<td><b>Email ID </b>: " + usr.EmailID);
		str.Append("<td colspan='2'><b>Mobile </b>: " + usr.Mobile);


		AdditionalInfo AI = AdditionalInfo.GetByCandidateID(Global.CandidateID);
		if (AI != null)
		{
			str.Append("<tr><td><b>Bank A/C Number </b>: " + AI.BankAccountNumber);
			str.Append("<td><b>IFSC Code </b>: " + AI.BankIFSC);
			str.Append("<td colspan='2'><b>Account Type </b>: " + AI.AccountType);
		}

		string status = Enum.GetName(typeof(ApplicationStatus), (usr.Status == null ? 0 : usr.Status)).Replace("_", " ");
		str.Append("<tr><td colspan='2' style='background-color:" + (status == "Complete" ? "rgb(195, 226, 195)" : "rgb(240, 212, 212)") + "'><b>Application Status</b>: " + status);
		UserManagement asc = Global.UsersList.Values.FirstOrDefault(m => m.ID == usr.AssociateID);
		str.Append("<td colspan='2' style='background-color:rgb(240, 240, 200)'><b>Associate Assigned </b>: " + (usr.AssociateID == null ? "Not Assigned" : (asc==null ? "" : asc.Name)));

		//str.Append("<tr><td colspan='2'><b>Flat/Door/Block Number </b>: " + usr.Address1);
		//str.Append("<td colspan='2'><b>Road / Street </b> : " + usr.Address2);

		//str.Append("<tr><td colspan='2'><b>Area </b>: " + usr.Area);
		//str.Append("<td><b>City </b>: " + usr.City);
		//str.Append("<td><b>State </b>: " + usr.State + (string.IsNullOrWhiteSpace(usr.PinCode) ? "" : " (" + usr.PinCode + ")"));

		str.Append("</table><hr />");
		divPersonalInfo.InnerHtml = str.ToString();
		divPersonalInfo.Visible = true;
	}

	void DisplayDeductions()
	{
		Dictionary<string, string> DeductionSectionNames = Deduction.GetSectionNames();
		List<Deduction> DeductionList = Deduction.GetByCandidateID(Global.CandidateID);

		if (DeductionList.Count == 0)
			return;

		StringBuilder str = new StringBuilder("<h3>Deductions</h3>");
		str.Append("<table class='table table-condensed table-bordered'>");
		foreach (Deduction ded in DeductionList)
		{
			Boolean IsBasicDeduction = ded.SectionName == "80C" || ded.SectionName == "80TTA";
			switch (ded.SectionName)
			{
				case "80D":
					str.Append("<tr><td><h6>" + DeductionSectionNames[ded.SectionName] + "</h6></td>");
					str.Append("<td>Rs. " + ded.Amount + "</td>");
					str.Append("<td><b>Is Senior</b> : " + ded.Data1 + "</td>");
					str.Append("<td><b>Premium for your parents</b> : Rs." + ded.Data2);
					break;
				case "80DDB":
					str.Append("<tr><td><h6>" + DeductionSectionNames[ded.SectionName] + "</h6></td>");
					str.Append("<td>Rs. " + ded.Amount + "</td>");
					str.Append("<td colspan='2'><b>Is Senior</b> : " + ded.Data1 + "</td>");
					break;
				case "80GG":
					str.Append("<tr><td><h6>" + DeductionSectionNames[ded.SectionName] + "</h6></td>");
					str.Append("<td>Rs. " + ded.Amount + "</td>");
					str.Append("<td colspan='2'><b>Number of Months Rent Paid</b> : " + ded.Data1 + "</td>");
					break;

				default:
					str.Append("<tr><td><h6>" + DeductionSectionNames[ded.SectionName] + "</h6></td>");
					str.Append("<td colspan='3'>Rs. " + ded.Amount);
					break;
			}
		}
		str.Append("</table>");

		List<Donation> donList = Donation.GetByCandidateID(CandidateID);
		if (donList.Count > 0)
		{
			str.Append("<h4>Section 80G : Donations to charitable organizations.</h4>");
			str.Append("<table class='table table-condensed table-bordered'>");
			str.Append("<tr>" +
				"<th>#" +
				"<th>Name" +
				"<th>Amount" +
				"<th>PAN" +
				"<th>Limit" +
				"<th>Percentage"
				);

			int ctr = 0;
			foreach (Donation don in donList)
			{
				str.Append("<tr>" +
				"<td>" + (++ctr) + "." +
				"<td>" + don.NameOfDonee +
				"<td>" + don.Amount +
				"<td>" + don.PANOfDonee +
				"<td>" + don.LimitOfDeduction +
				"<td>" + don.QualifyingPercentage
				);
			}
			str.Append("</table>");
		}

		str.Append("<hr />");
		divDeductions.InnerHtml = str.ToString();
		divDeductions.Visible = true;
	}
	void DisplayAssets()
	{
		List<Asset> AllAssets = Asset.GetByCandidateID(CandidateID);

		if (AllAssets.Count == 0)
			return;

		StringBuilder str = new StringBuilder("<h3>Assets</h3>");
		str.Append("<table class='table table-condensed table-bordered'>");
		str.Append("<tr><th style='width:30px;'>#<th>Particular<th>Cost<th>Liability");
		int ctr = 0;
		foreach (Asset ast in AllAssets)
		{
			if (ast.Cost > 0 || ast.Liability > 0)
			{
				str.Append("<tr>" +
					"<td>" + (++ctr) + "." +
					"<td>" + ast.Particular +
					"<td>" + ast.Cost +
					"<td>" + ast.Liability
					);
			}
		}

		str.Append("</table><hr />");
		divAssets.InnerHtml = str.ToString();
		divAssets.Visible = true;
	}

	void DisplayHouseProperty()
	{
		List<HouseProperty> HPList = HouseProperty.GetByCandidateID(CandidateID);
		if (HPList.Count == 0)
			return;

		StringBuilder str = new StringBuilder("<h3>House Properties</h3>");

		int ctr = 0;
		foreach (HouseProperty HP in HPList)
		{
			str.Append("<h4>Property : " + (++ctr) + "</h4>");
			str.Append("<table class='table table-condensed table-bordered'>");
			str.Append("<tr><td colspan='4'><b>Interest paid on loan for self occupied property</b> : Rs.  " + HP.InterestOnSelfOccupiedProperty);
			str.Append("<tr><td colspan='3'><b>Interest paid during the pre-construction period of self occupied property</b> : Rs. " + HP.PreConsTotalInterest +
							"<td><b>Year </b>: " + HP.PreConsFinancialYear);

			str.Append("<tr><td colspan='2'><b>Flat/Door/Block Number </b>: " + HP.Address1);
			str.Append("<td colspan='2'><b>Road / Street </b> : " + HP.Address2);

			str.Append("<tr><td colspan='2'><b>Area </b>: " + HP.Area);
			str.Append("<td><b>City </b>: " + HP.City);
			str.Append("<td><b>State </b>: " + HP.State + (string.IsNullOrWhiteSpace(HP.PinCode) ? "" : " (" + HP.PinCode + ")"));


			str.Append("<tr><td><b>Ownership Share </b>: " + HP.OwnershipShare);
			str.Append("<td><b>Co-Ownership Name</b>: " + HP.CoOwnerName);
			str.Append("<td><b>Co-Ownership PAN</b>: " + HP.CoOwnerPAN);
			str.Append("<td><b>Co-Ownership Share</b>: " + HP.CoOwnerShare);
			str.Append("</table>");
		}
		str.Append("<hr />");
		divHouseProperty.InnerHtml = str.ToString();
		divHouseProperty.Visible = true;
	}

	void DisplaySalaries()
	{
		List<Salary> SalaryList = Salary.GetByCandidateID(CandidateID);
		if (SalaryList.Count == 0)
			return;

		StringBuilder str = new StringBuilder("<h3>Income Sources => Salaries</h3>");

		int ctr = 0;
		foreach (Salary sal in SalaryList)
		{
			str.Append("<h4>Salary : " + (++ctr) + "</h4>");
			str.Append("<table class='table table-condensed table-bordered'>");

			str.Append("<tr><td colspan='2'><b>Chargeable Income </b>: Rs. " + sal.ChargeableIncome);
			str.Append("<td colspan='2'><b>Tax Deducted </b>: Rs. " + sal.TaxDeducted);

			str.Append("<tr><td colspan='2'><b>Employer Name</b> : " + sal.NameOfEmployer);
			str.Append("<td><b>Employer TAN </b>: " + sal.EmployerTAN);
			str.Append("<td><b>Employer Type</b>: " + sal.EmployerType);

			str.Append("<tr><td colspan='2'><b>Employer Address </b>: " + sal.EmployerAddress);
			str.Append("<td><b>City </b>" + sal.EmployerCity);
			str.Append("<td><b>State </b>: " + sal.EmployerState + (string.IsNullOrWhiteSpace(sal.EmployerPinCode) ? "" : " (" + sal.EmployerPinCode + ")"));

			str.Append("</table>");

		}
		str.Append("<hr />");
		divSalary.InnerHtml = str.ToString();
		divSalary.Visible = true;
	}

	string GetApplicationStatus(int Status)
	{
		return Enum.GetName(typeof(ApplicationStatus), Status).Replace("_", " ");
	}
}