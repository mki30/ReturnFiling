using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReturnFilingModel;

public partial class Deductions_Donation : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
		Title = "Donation - return-filing.in";
		base.Page_Load(sender, e);
		ShowDonations();
    }
	
	void ShowDonations()
	{
		Global.CandidateID = 1; //testing
		StringBuilder str = new StringBuilder("<table class='table table-condensed table-bordered'>");
		str.Append("<tr>" +
			"<th>#"  +
			"<th>Name"  +
			"<th>Amount"  +
			"<th>PAN"  +
			"<th>Limit"  +
			"<th>Percentage"  
			);

		List<Donation> donList = Donation.GetByCandidateID(Global.CandidateID);
		int ctr = 0;
		foreach (Donation don in donList)
		{
			str.Append("<tr>" +
			"<td>" + (++ctr) +
			"<td><b><a href='/donationadd/" + don.ID +"'>" + don.NameOfDonee + "</b></a>" + 
			"<td>" + don.Amount +
			"<td>" + don.PANOfDonee +
			"<td>" + don.LimitOfDeduction + 
			"<td>" + don.QualifyingPercentage    
			);
		}

		str.Append("</table>");
		divAddedDonations.InnerHtml = str.ToString();
	}
}