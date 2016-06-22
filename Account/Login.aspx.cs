using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Web.UI;
using ReturnFiling;

public partial class Account_Login :Page
{
	string _returnURL = "";
	protected void Page_Load(object sender, EventArgs e)
	{
		registerOnEdilportaleButton.NavigateUrl = "Register";

		_returnURL = Request.QueryString["ReturnUrl"] != null ? Request.QueryString["ReturnUrl"] : "";
		_returnURL = _returnURL.IndexOf("#_=_") > 0 ? "" : _returnURL;

		OpenAuthLogin.ReturnUrl = _returnURL;
		var returnUrl = HttpUtility.UrlEncode(_returnURL);
		if (!String.IsNullOrEmpty(returnUrl))
		{
			registerOnEdilportaleButton.NavigateUrl += "?ReturnUrl=" + returnUrl;
		}
	}

	protected void LogIn(object sender, EventArgs e)
	{
		if (IsValid)
		{
			// Validate the user password
			var manager = new UserManager();
			ApplicationUser user = manager.Find(txtUsername.Text, txtPassword.Text);
			if (user != null)
			{
				IdentityHelper.SignIn(manager, user, true); //, RememberMe.Checked);
				Global.EmailID = txtUsername.Text;
				IdentityHelper.RedirectToReturnUrl(_returnURL.Replace("#_=_", ""), Response);
			}
			else
			{
				FailureText.Text = "Invalid username or password.";
				ErrorMessage.Visible = true;
			}
		}
	}

	
}