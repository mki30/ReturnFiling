using System;


public partial class AdminMasterPage :System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
		
    }

	protected void btnLogout_Click(object sender, EventArgs e)
	{
		Global.UserID = 0;
		Global.UserType = -1;
		Response.Redirect("~/Master/Login.aspx");
	}
}
