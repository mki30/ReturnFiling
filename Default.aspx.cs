using iTextSharp.text.pdf;
using iTextSharp.text.pdf.parser;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReturnFilingModel;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		Title = "Home - return-filing.in";
		ShowLoggedUserApplication();
    }

	void ShowLoggedUserApplication()
	{
		if (Global.EmailID != "")
		{
			PersonalInfo ci = PersonalInfo.GetByEmailID(Global.EmailID);
			if (ci != null)
			{
				Global.CandidateID = Cmn.ToInt( ci.ID);
				lblName.Text = ci.FirstName + " " + ci.MiddleName + " " + ci.LastName;
				lblFatherName.Text = ci.FatherName;
				lblDOB.Text = Cmn.ToDate(ci.DOB).ToString("dd-MMM-yyyy");
				lblPAN.Text = ci.PANNumber;

				string status = Enum.GetName(typeof(ApplicationStatus), (ci.Status == null ? 0 : ci.Status)).Replace("_"," ");

				divStatus.InnerHtml = (status == "Complete" ? "<div class='alert alert-success'>" : "<div class='alert alert-danger'>") +
										status  + "</div>";

				lblEmail.Text = ci.EmailID;
				pnlInfo.Visible = true;
            }
		}
	}
}