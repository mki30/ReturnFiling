using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System.Web;
using System;
using ReturnFiling;
using System.Net.Mail;
using System.Security.Claims;
using System.Threading.Tasks;


namespace ReturnFiling
{
	public class ApplicationUser :IdentityUser
	{
		public string FirstName { get; set; }
		public string LastName { get; set; }
		//public async Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<ApplicationUser> manager)
		//{
		//	// Note the authenticationType must match the one defined in CookieAuthenticationOptions.AuthenticationType
		//	var userIdentity = manager.CreateIdentity(this, DefaultAuthenticationTypes.ApplicationCookie);
		//	// Add custom user claims here
		//	return userIdentity;
		//}
	}

	public class ApplicationDbContext :IdentityDbContext<ApplicationUser>
	{
		public ApplicationDbContext()
			: base("DefaultConnection")
		{
			
		}
	}

	#region Helpers
	public class UserManager :UserManager<ApplicationUser>
	{
		public UserManager()
			: base(new UserStore<ApplicationUser>(new ApplicationDbContext()))
		{
			var provider = new Microsoft.Owin.Security.DataProtection.DpapiDataProtectionProvider("returnfiling");
			UserTokenProvider = new Microsoft.AspNet.Identity.Owin.DataProtectorTokenProvider<ApplicationUser>(provider.Create("PasswordReset"));
		}

		public string SendOnwWayMail(string EmailTo, string subject, string Body)
		{
			string Message = string.Empty;
			System.Net.Mail.MailMessage oMail = new System.Net.Mail.MailMessage("team@ebuild.in", EmailTo);

			//System.Web.Mail.MailMessage oMail = new System.Web.Mail.MailMessage();
			//oMail.From = "team@ebuild.in";
			//oMail.To = EmailTo;
			oMail.Subject = subject + " " + DateTime.Now;
			oMail.IsBodyHtml = true;
			//oMail.BodyFormat = System.Web.Mail.MailFormat.Html;
			oMail.Priority = System.Net.Mail.MailPriority.High; // System.Web.Mail.MailPriority.High;
			oMail.Body = Body;

			SmtpClient client = new SmtpClient("dedrelay.secureserver.net");

			//System.Net.Mail.SmtpClient client= "dedrelay.secureserver.net";

			try
			{
				client.Send(oMail);
				//System.Web.Mail.SmtpMail.Send(oMail);
				Message = "Mail Send";
				oMail = null;
			}
			catch (Exception ex)
			{
				Message = ex.Message;
				Cmn.LogError(ex, "Mail Log");
			}
			return Message;
		}
	}
}


namespace ReturnFiling
{
    public static class IdentityHelper
    {
        // Used for XSRF when linking external logins
        public const string XsrfKey = "XsrfId";

        public static void SignIn(UserManager manager, ApplicationUser user, bool isPersistent)
        {
            IAuthenticationManager authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut(DefaultAuthenticationTypes.ExternalCookie);
            var identity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
            authenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = isPersistent }, identity);
        }

        public const string ProviderNameKey = "providerName";
        public static string GetProviderNameFromRequest(HttpRequest request)
        {
            return request[ProviderNameKey];
        }

        public static string GetExternalLoginRedirectUrl(string accountProvider)
        {
            return "/Account/RegisterExternalLogin?" + ProviderNameKey + "=" + accountProvider;
        }

        private static bool IsLocalUrl(string url)
        {
            return !string.IsNullOrEmpty(url) && ((url[0] == '/' && (url.Length == 1 || (url[1] != '/' && url[1] != '\\'))) || (url.Length > 1 && url[0] == '~' && url[1] == '/'));
        }

        public static void RedirectToReturnUrl(string returnUrl, HttpResponse response)
        {
            if (!String.IsNullOrEmpty(returnUrl) && IsLocalUrl(returnUrl))
            {
                response.Redirect(returnUrl);
            }
            else
            {
                response.Redirect("~/");
            }
        }
    }
    #endregion
}