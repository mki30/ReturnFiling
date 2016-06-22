using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReturnFilingModel;

public partial class Default :BasePage
{
	protected void Page_Load(object sender, EventArgs e)
	{
		Title = "Salary - return-filing.in";
		base.Page_Load(sender, e);
		if (!IsPostBack)
			ShowDetails();
	}

	void FillDetails(int ID)
	{
		Salary sal = Salary.GetByID(ID);
		if (sal != null)
		{
			txtChargeableIncome.Text = sal.ChargeableIncome.ToString();
			txtEmployerName.Text = sal.NameOfEmployer;
			ddEmptype.SelectedValue = sal.EmployerType;
			txtEmpTan.Text = sal.EmployerTAN;
			txtTaxDeducted.Text = sal.TaxDeducted.ToString();
			txtEmpAddress.Text = sal.EmployerAddress;
			txtEmpCity.Text = sal.EmployerCity;
			ddState.SelectedValue = sal.EmployerState;
			txtPinCode.Text = sal.EmployerPinCode;
			spnID.InnerText = sal.ID.ToString();
		}
	}

	protected void btnSave_Click(object sender, EventArgs e)
	{
		if (!Global.IfUserExists(ltStatus))
			return;

		try
		{
			Salary sal = Salary.GetUnique(Global.CandidateID, txtEmpTan.Text);
			if (sal == null)
			{
				sal = new Salary();
				sal.ID = 0;
				sal.CandidateID = Global.CandidateID;
			}

			sal.ChargeableIncome = Cmn.ToDbl(txtChargeableIncome.Text);
			sal.NameOfEmployer = txtEmployerName.Text;
			sal.EmployerType = ddEmptype.SelectedValue;
			sal.EmployerTAN = txtEmpTan.Text;
			sal.TaxDeducted = Cmn.ToDbl(txtTaxDeducted.Text);
			sal.EmployerAddress = txtEmpAddress.Text;
			sal.EmployerCity = txtEmpCity.Text;
			sal.EmployerState = ddState.SelectedValue;
			sal.EmployerPinCode = txtPinCode.Text;
			sal.Save();
			ltStatus.Text = Global.SuccesMessage("Saved Succssfully");
			ShowDetails();
		}
		catch (Exception ex)
		{
			ltStatus.Text = Global.ErrorMessage("Error, not saved." + ex.Message);
		}
	}


	void ShowDetails()
	{
		List<Salary> SalLists = Salary.GetByCandidateID(Global.CandidateID);
		if (SalLists.Count == 0)
			return;

		if (Data1 != "-1")
			FillDetails(Cmn.ToInt(Data1));
		else
			FillDetails(Cmn.ToInt(SalLists[0].ID));

		int ctr = 0;
		StringBuilder str = new StringBuilder("<h3>Existing Salaries<a href='/salary/0' class='btn btn-xs btn-info pull-right' title='Add New Salary'>Add New</a></h3>");
		str.Append("<table class='table table-condensed table-bordered'>");
		str.Append("<tr>" +
			"<th>#" +
			"<th>Employer Name" +
			"<th>Chargeable Income" +
			"<th>Tax Deducted" +
			"<th style='width:50px;'>&nbsp"
			);
		foreach (Salary sal in SalLists)
		{
			str.Append("<tr id='r_" + sal.ID + "'>" +
			"<td>" + (++ctr) +
			"<td><a href='/salary/" + sal.ID + "' title='click to view/edit details'><span class='glyphicon glyphicon-pencil'></span>&nbsp;&nbsp;" + sal.NameOfEmployer + "</a>" +
			"<td>" + sal.ChargeableIncome +
			"<td>" + sal.TaxDeducted +
			"<td><a href='#' data-id='" + sal.ID + "' title='click to delete' class='btn btn-xs btn-danger del' data-prop='salary'>&nbsp;&nbsp;<span class='glyphicon glyphicon-trash'></span>&nbsp;&nbsp;</a>"
			);
		}

		str.Append("</table>");
		divExistingSalaries.InnerHtml = str.ToString();
		divExistingSalaries.Visible = true;
	}
}