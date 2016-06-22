using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_IncomeSourceMenu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
		string Action = this.Page.RouteData.Values["Action"] != null ? this.Page.RouteData.Values["Action"].ToString() : "";
		string Data1 = this.Page.RouteData.Values["Data1"] != null ? this.Page.RouteData.Values["Data1"].ToString() : "";

		string Script = "Action='" + Action + "';\n";
		Script += "CurrentPage='" + Action + "';\n";
		string topMenu = "top_permanent";
		string subMenu = "sub_permanent";

		switch (Action)
		{
			case "salary":
			case "otherincome":
			case "houseproperty":
			case "capitalgain":
			case "assets":
				topMenu = "top_incomesource";
				subMenu = "sub_incomesource";
				break;

			case "deduction":
			case "moredeductions":
				topMenu = "top_deduction";
				subMenu = "sub_deduction";
				break;
			case "tds":
			case "selftaxpayment":
				topMenu = "top_tds";
				subMenu = "sub_tds";
				break;
		}

		Script += "$(document).ready(function(){ $('." + Action + "').addClass('currentpage'); $('.subm').hide(); $('." + subMenu + "').show(); $('." + topMenu + "').addClass('topSel');  });\n";
		Cmn.WriteClientScript(this.Page, Script);
    }
}