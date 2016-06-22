using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReturnFilingModel;

public partial class Deductions_MoreDeductions :BasePage
{
	Dictionary<string, string> DeductionSectionNames = new Dictionary<string, string>();
	protected void Page_Load(object sender, EventArgs e)
	{
		Title = "Deductions - return-filing.in";
		base.Page_Load(sender, e);
		
	 	DeductionSectionNames =  Deduction.GetSectionNames();
		List<Deduction> AlreadyAdded = ShowData();
		foreach (KeyValuePair<string, string> kvp in DeductionSectionNames)
		{
			if (AlreadyAdded.FirstOrDefault(m => m.SectionName == kvp.Key) == null)
				ddDeductionList.Items.Add(new ListItem(kvp.Value, kvp.Key));
		}
	}

	protected void btnAddSection_Click(object sender, EventArgs e)
	{
		if (!Global.IfUserExists(ltStatus))
			return;

		string SectionName = ddDeductionList.SelectedValue;
		Deduction d = Deduction.GetUnique(Global.CandidateID, SectionName);
		if (d == null)
		{
			d = new Deduction();
			d.ID = 0;
		}
		d.CandidateID = Global.CandidateID;
		d.SectionName = SectionName.ToUpper();
		d.Amount = 0;
		d.Save();
		Response.Redirect(Request.RawUrl);
	}

	public List<Deduction> ShowData()
	{


		List<Deduction> DeductionList = Deduction.GetByCandidateID(Global.CandidateID);
		StringBuilder str = new StringBuilder("<br/>");
		foreach (Deduction ded in DeductionList)
		{
			Boolean IsBasicDeduction = ded.SectionName == "80C" || ded.SectionName == "80TTA";

			//Nothing to do, since these two are basic deductions
			if (!IsBasicDeduction)
			{
				str.Append("<div class='highlight1' name='divAddedDeductions' runat='server'>");
				str.Append("<table style='width:100%'><tr>");
			}

			switch (ded.SectionName)
			{
				case "80D":
					str.Append("<td style='width:20%'><h6>" + DeductionSectionNames[ded.SectionName] + "</h6></td>");
					str.Append("<td style='width:3%'><span class='sh1'>Amount</span> <input type='text' name='txt_" + ded.SectionName + "' value='" + ded.Amount + "' runat='server' class='form-control' />");
					str.Append("<td style='width:10%'><span class='sh1'>Is Senior</span><select name='" + ded.SectionName + "_data1' class='form-control'>" +
									"<option value='NotSeniorCitizen' " + (ded.Data1 == "NotSeniorCitizen" ? "selected='selected'" : "") + ">No policy holder is a senior citizen</option>" +
									"<option value='SeniorCitizen'  " + (ded.Data1 == "SeniorCitizen" ? "selected='selected'" : "") + ">Policy holder is senior citizen</option>" +
							   "</select>");
					str.Append("<td style='width:10%'><span class='sh1'>Premium for your parents</span><input type='text' name='" + ded.SectionName + "_data2' value='" + ded.Data2 + "' runat='server' class='form-control' />");
					str.Append("<td style='width:10%'><span class='sh1'>Is Senior</span><select name='" + ded.SectionName + "_data3' class='form-control'>" +
									"<option value='NotSeniorCitizen' " + (ded.Data3 == "NotSeniorCitizen" ? "selected='selected'" : "") + ">No policy holder is a senior citizen</option>" +
									"<option value='SeniorCitizen'  " + (ded.Data3 == "SeniorCitizen" ? "selected='selected'" : "") + ">Policy holder is senior citizen</option>" +
							   "</select>");
					break;
				case "80DDB":
					str.Append("<td style='width:20%'><h6>" + DeductionSectionNames[ded.SectionName] + "</h6></td>");
					str.Append("<td style='width:3%'><span class='sh1'>Amount</span> <input type='text' name='txt_" + ded.SectionName + "' value='" + ded.Amount + "' runat='server' class='form-control' />");
					str.Append("<td style='width:10%'><span class='sh1'>Is Senior</span><select name='" + ded.SectionName + "_data2' class='form-control'>" +
									"<option value='NotSeniorCitizen' " + (ded.Data2 == "NotSeniorCitizen" ? "selected='selected'" : "") + ">No policy holder is a senior citizen</option>" +
									"<option value='SeniorCitizen'  " + (ded.Data2 == "SeniorCitizen" ? "selected='selected'" : "") + ">Policy holder is senior citizen</option>" +
							   "</select>");
					break;
				case "80GG":
					str.Append("<td style='width:20%'><h6>" + DeductionSectionNames[ded.SectionName] + "</h6></td>");
					str.Append("<td style='width:3%'><span class='sh1'>Amount</span> <input type='text' name='txt_" + ded.SectionName + "' value='" + ded.Amount + "' runat='server' class='form-control' />");
					str.Append("<td style='width:5%'><span class='sh1'>Number of Months Rent Paid</span><select name='" + ded.SectionName + "_data1' class='form-control'>");

					for (int i = 1; i <= 12; i++)
					{
						str.Append("<option value='" + i + "' " + (ded.Data1 == i.ToString() ? "selected='selected'" : "") + ">" + i + "</option>");
					}
					str.Append("</select>");
					break;


				case "80C": txt_80C.Text = ded.Amount.ToString(); break;
				case "80TTA": txt_80TTA.Text = ded.Amount.ToString(); break;

				default:
					str.Append("<td style='width:40%'><h6>" + DeductionSectionNames[ded.SectionName] + "</h6></td>");
					str.Append("<td style='width:5%'><input type='text' name='txt_" + ded.SectionName + "' value='" + ded.Amount + "' runat='server' class='form-control' />");
					break;
			}

			if (!IsBasicDeduction)
				str.Append("</tr></table></div>");
		}
		divAddedSections.Text = str.ToString();
		return DeductionList;
	}

	protected void btnSaveDeductions_Click(object sender, EventArgs e)
	{
		if (!Global.IfUserExists(ltStatus))
			return;

		List<Deduction> DeductionList = Deduction.GetByCandidateID(Global.CandidateID);

		DeductionList.Add(new Deduction() { SectionName = "80C", Amount = 0 });
		DeductionList.Add(new Deduction() { SectionName = "80TTA", Amount = 0 });

		string Data1 = "", Data2 = "", Data3 = "", Amount = "0";
		foreach (Deduction ded in DeductionList)
		{
			if(ded.SectionName=="80C" || ded.SectionName=="80TTA")
				Amount = GetFormString("ctl00$ContentPlaceHolder1$txt_" + ded.SectionName);
			else
				Amount = GetFormString("txt_" + ded.SectionName);

			Data1 = GetFormString(ded.SectionName + "_data1");
			Data2 = GetFormString(ded.SectionName + "_data2");
			Data3 = GetFormString(ded.SectionName + "_data3");

			if (Cmn.ToInt(Amount) > 0)
			{
				ded.Amount = Cmn.ToDbl(Amount);
				ded.CandidateID = Global.CandidateID;
				ded.Data1 = Data1;
				ded.Data2 = Data2;
				ded.Data3 = Data3;
				ded.Save();
			}
		}
		Response.Redirect(Request.RawUrl);
	}
}