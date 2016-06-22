using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using ReturnFiling;

public partial class Account_Register : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}
	protected void CreateUser_Click(object sender, EventArgs e)
	{
		var manager = new UserManager();
		var user = new ApplicationUser() { UserName = UserName.Text, Email = UserName.Text };
		IdentityResult result = manager.Create(user, Password.Text);
		if (result.Succeeded)
		{
			IdentityHelper.SignIn(manager, user, isPersistent:false);
			string _returnURL = Request.QueryString["ReturnUrl"] != null ? Request.QueryString["ReturnUrl"] : "";
			_returnURL = _returnURL.IndexOf("#_=_") > 0 ? "" : _returnURL;

			IdentityHelper.RedirectToReturnUrl(_returnURL, Response);
		}
		else
		{
			ErrorMessage.Text = result.Errors.FirstOrDefault();
		}
	}
}