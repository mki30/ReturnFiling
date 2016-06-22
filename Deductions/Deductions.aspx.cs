using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReturnFilingModel;

public partial class Deductions_Deductions :BasePage
{
	protected void Page_Load(object sender, EventArgs e)
	{

		base.Page_Load(sender, e);
		ShowData();
	}
	protected void btnSave_Click(object sender, EventArgs e)
	{
		Save();
	}
	public void Save()
	{
		Global.CandidateID = 1;
		List<string> sections = new List<string>() { "80C", "80TTA" };
		try
		{
			foreach (string s in sections)
			{
				Deduction d = Deduction.GetUnique(Global.CandidateID, s);
				if (d == null)
				{
					d = new Deduction();
					d.ID = 0;
				}
				d.CandidateID = Global.CandidateID;
				d.SectionName = s;
				d.Amount = Cmn.ToDbl((s == "80C" ? txt_80C.Text : txt_80TTA.Text));
				d.Save();
				ltMsg.Text = Global.SuccesMessage("Saved");
			}
		}
		catch (Exception ex)
		{
			ltMsg.Text = Global.ErrorMessage("Error -  Not Saved. " + ex.InnerException.Message);
		}
	}

	public void ShowData()
	{
		Global.CandidateID = 1;
		List<Deduction> DeductionList = Deduction.GetByCandidateID(Global.CandidateID);
		foreach (Deduction ded in DeductionList)
		{
			switch (ded.SectionName)
			{
				case "80C": txt_80C.Text = ded.Amount.ToString(); break;
				case "80TTA": txt_80TTA.Text = ded.Amount.ToString(); break;
			}
		}
	}
}