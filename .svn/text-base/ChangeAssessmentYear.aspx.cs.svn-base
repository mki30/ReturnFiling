using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReturnFilingModel;

public partial class ChangeAssessmentYear :System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		Title = "Change Assessment Year - return-filing.in";
	}

	protected void btnSaveAssessmentYear_Click(object sender, EventArgs e)
	{
		Global.AssessmentYear = ddAssessmentYear.SelectedItem.Text.Split('-')[0];
		//Response.Redirect(Global.PreviousURL != "" ? Global.PreviousURL : "/permanent");
		Response.Redirect("/");
	}
}