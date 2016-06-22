using System;
using System.IO;
using System.Linq;
using ReturnFilingModel;

public partial class Login :BasePage
{
	protected void Page_Load(object sender, EventArgs e)
	{
		base.Page_Load(sender, e);
	}
	protected void btnLogin_Click(object sender, EventArgs e)
	{
		if (Global.UsersList.Count == 0)
			Global.LoadUsers();

		if (string.IsNullOrWhiteSpace(txtUsername.Value) || string.IsNullOrWhiteSpace(txtPassword.Value))
		{
			ltMsg.Text = Global.ErrorMessage("Please enter username / password");
			return;
		}

		UserManagement usr = Global.UsersList.Values.FirstOrDefault(m => m.Username == txtUsername.Value.Trim() && m.Password == txtPassword.Value.Trim());
		if (usr != null)
		{
			Global.UserType = (int)usr.Role;
			Global.UserID = (int)usr.ID;
			Response.Redirect(Global.PreviousURL != "" ? Global.PreviousURL : "/reports");
		}
		else
		{
			//using RRA Admin Login
			string[] f = File.ReadAllText(Server.MapPath("~/App_Data/adminpwd.mdb")).Split(',');
			if (f[0] == txtUsername.Value && f[1] == txtPassword.Value)
			{
				Global.UserType = (int)RoleType.Master;
				Response.Redirect(Global.PreviousURL != "" ? Global.PreviousURL : "/reports");
			}
			else
				ltMsg.Text = Global.ErrorMessage("No user found with these details");
		}
	}
}