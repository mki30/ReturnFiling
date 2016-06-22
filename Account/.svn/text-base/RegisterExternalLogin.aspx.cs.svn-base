using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Linq;
using ReturnFiling;

public partial class Account_RegisterExternalLogin :System.Web.UI.Page
{
	protected string ProviderName
	{
		get { return (string)ViewState["ProviderName"] ?? String.Empty; }
		private set { ViewState["ProviderName"] = value; }
	}

	protected string ProviderAccountKey
	{
		get { return (string)ViewState["ProviderAccountKey"] ?? String.Empty; }
		private set { ViewState["ProviderAccountKey"] = value; }
	}

	protected void Page_Load()
	{
		// Process the result from an auth provider in the request
		ProviderName = IdentityHelper.GetProviderNameFromRequest(Request);
		if (String.IsNullOrEmpty(ProviderName))
		{
			Response.Redirect("~/Account/Login");
		}
		if (!IsPostBack)
		{
			string returnURL = Request.QueryString["ReturnUrl"] != null ? Request.QueryString["ReturnUrl"] : "";
			returnURL = returnURL.IndexOf("#_=_") > 0 ? "" : returnURL;

			var manager = new UserManager();
			var atu = Context.GetOwinContext().Authentication;
			var loginInfo = Context.GetOwinContext().Authentication.GetExternalLoginInfo();
			if (loginInfo == null)
			{
				Response.Redirect("~/Account/Login");
			}
			var user = manager.Find(loginInfo.Login);
			if (user != null)
			{
				IdentityHelper.SignIn(manager, user, isPersistent:false);
				Global.EmailID = loginInfo.Email;
				IdentityHelper.RedirectToReturnUrl(returnURL.Replace("#_=_", ""), Response);
			}
			else if (User.Identity.IsAuthenticated)
			{
				// Apply Xsrf check when linking
				var verifiedloginInfo = Context.GetOwinContext().Authentication.GetExternalLoginInfo(IdentityHelper.XsrfKey, User.Identity.GetUserId());
				if (verifiedloginInfo == null)
				{
					Response.Redirect("~/Account/Login");
				}

				var result = manager.AddLogin(User.Identity.GetUserId(), verifiedloginInfo.Login);
				if (result.Succeeded)
				{
					IdentityHelper.RedirectToReturnUrl(returnURL.Replace("#_=_", ""), Response);
				}
				else
				{
					AddErrors(result);
					return;
				}
			}
			else
			{
				userName.Text = loginInfo.DefaultUserName;

				string firstName = string.Empty, lastName = string.Empty, profilePic = string.Empty;
				if (ProviderName.ToLower() == "facebook")
				{
					firstName = loginInfo.ExternalIdentity.Claims.First(c => c.Type == "urn:facebook:first_name").Value;
					lastName = loginInfo.ExternalIdentity.Claims.First(c => c.Type == "urn:facebook:last_name").Value;
					profilePic = "http://graph.facebook.com/" + loginInfo.Login.ProviderKey + "/picture?type=large";
				}
				else if (ProviderName.ToLower() == "google")
				{
					firstName = loginInfo.ExternalIdentity.Claims.First(c => c.Type == "given_name").Value;
					lastName = loginInfo.ExternalIdentity.Claims.First(c => c.Type == "family_name").Value;
					profilePic = loginInfo.ExternalIdentity.Claims.First(c => c.Type == "picture").Value;
				}
			}
		}
	}

	protected void LogIn_Click(object sender, EventArgs e)
	{
		CreateAndLoginUser();
	}

	private void CreateAndLoginUser()
	{
		if (!IsValid)
		{
			return;
		}
		var manager = new UserManager();
		var user = new ApplicationUser() { UserName = userName.Text };
		IdentityResult result = manager.Create(user);
		if (result.Succeeded)
		{
			var loginInfo = Context.GetOwinContext().Authentication.GetExternalLoginInfo();
			if (loginInfo == null)
			{
				Response.Redirect("~/Account/Login");
				return;
			}
			result = manager.AddLogin(user.Id, loginInfo.Login);
			if (result.Succeeded)
			{
				Global.EmailID = userName.Text;
				IdentityHelper.SignIn(manager, user, isPersistent:false);
				IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);

				return;
			}
			AddErrors(result);
		}
		else
			spnError.InnerHtml = Global.ErrorMessage(((string[])(result.Errors))[0]);
	}

	private void AddErrors(IdentityResult result)
	{
		foreach (var error in result.Errors)
		{
			ModelState.AddModelError("", error);
		}
	}
}