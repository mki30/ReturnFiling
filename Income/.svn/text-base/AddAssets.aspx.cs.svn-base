using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReturnFilingModel;

public partial class Income_AddAssets :BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
		Title = "Add Assets - return-filing.in";
        base.Page_Load(sender, e);

		if (!IsPostBack)
			ShowData();
    }
	protected void btnSave_Click(object sender, EventArgs e)
	{
		if (!Global.IfUserExists(ltStatus))
			return;

		foreach (Control ctl in divMain.Controls)
		{
			if (ctl.GetType().ToString().Equals("System.Web.UI.WebControls.TextBox"))
			{
				TextBox txt = ((TextBox)ctl);
				string ID = txt.ID;
				if (ID.Contains("_Cost"))
				{
					string Particular = ID.Split('_')[1];
					double Cost = Cmn.ToDbl(txt.Text);
					TextBox txtLiability = ((TextBox)divMain.FindControl("txt_" + Particular + "_Liability"));
					double Liability = Cmn.ToDbl(txtLiability == null ? "0" : txtLiability.Text);

					Asset ast = Asset.GetUnique(Global.CandidateID, Particular);
					if (ast == null)
					{
						ast = new Asset();
						ast.ID = 0;
					}
					ast.CandidateID = Global.CandidateID;
					ast.Particular = Particular;
					ast.Cost = Cost;
					ast.Liability = Liability;
					ast.Save();
				}
			}
		}
	}

	void ShowData()
	{
		List<Asset> AllAssets = Asset.GetByCandidateID(Global.CandidateID);
		foreach (Asset ast in AllAssets)
		{
			TextBox txtCost = ((TextBox)divMain.FindControl("txt_" + ast.Particular + "_Cost"));
			TextBox txtLiability = ((TextBox)divMain.FindControl("txt_" + ast.Particular + "_Liability"));
			if (txtCost != null)
				txtCost.Text = (ast.Cost==0  ? ""  :ast.Cost.ToString());
			if (txtLiability != null)
				txtLiability.Text = (ast.Liability == 0 ? "" : ast.Liability.ToString());

		}
	}
}