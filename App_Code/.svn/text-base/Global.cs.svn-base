using System;
using System.Collections.Generic;
using System.Web;
using ReturnFiling;
using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using ReturnFilingModel;
using System.Security.Claims;
using System.Linq;
using System.Web.UI.WebControls;

public enum RoleType :int
{
	Master = 1,
	Associate = 0
};

public enum ApplicationStatus :int
{
	Analyzing_Application = 0,
	Associate_Assigned = 1,
	Complete = 2
};

public class Global
{
	public Global()
	{
		//
		// TODO: Add constructor logic here
		//
	}

	public static Boolean IsLocalHost
	{
		get
		{
			return false; // HttpContext.Current.Request.Url.AbsoluteUri.Contains("127.0.0.1");
		}
	}

	public static Boolean IfUserExists(Literal lt)
	{
		try
		{
			PersonalInfo pi = PersonalInfo.GetByEmailID(EmailID);
			if (pi == null)
			{
				pi = new PersonalInfo();
				pi.ID = 0;
				pi.EmailID = EmailID;
				pi.PANNumber = "-";
				pi.AssessmentYear = Global.AssessmentYear;
				pi.Save();
			}
			Global.CandidateID = Cmn.ToInt(pi.ID);
			return true;
		}
		catch (Exception ex)
		{
			lt.Text = Global.ErrorMessage("Record cannot be saved, becaue user not identified. Please try to login again.");
			return false;
		}
	}

	public static Boolean CreateNewUser(string EmailID, string Password)
	{
		try
		{
			var manager = new UserManager();
			var user = new ApplicationUser() { UserName = EmailID, Email = EmailID };
			IdentityResult result = manager.Create(user, Password);
			if (result.Succeeded)
			{
				IdentityHelper.SignIn(manager, user, isPersistent:false);
				return true;
			}
		}
		catch (Exception ex)
		{

		}
		return false;
	}

	public static void CheckLogin()
	{
		//EmailID = "ap.anshulgarg@gmail.com";
		//Global.EmailID = EmailID;

		if (string.IsNullOrWhiteSpace(EmailID))
		{
			HttpCookie cookie = HttpContext.Current.Request.Cookies["EmailID"];
			if (cookie == null || cookie.Value == "")
				HttpContext.Current.Response.Redirect("~/Account/Login");

			Global.EmailID = cookie.Value;
		}
	}


	public static string GoogleAppID { get { return "643127112919-n3mfhl0892gjtv0j2o5qkotmdftugf9i.apps.googleusercontent.com"; } }
	public static string GoogleAppSecret { get { return "ADewe-ruXmC1vLUQ3BLp5CCR"; } }

	public static string FacebookAppID { get { return "720631857995720"; } }
	public static string FacebookAppSecret { get { return "46aa581ba47f9977a656d140f8b49d69"; } }

	public static string CurrentUserID
	{
		get
		{
			string id = HttpContext.Current.User.Identity.GetUserId();
			return id == null ? "" : id;
		}
	}


	public static string CurrentAssessmentYear
	{
		get
		{
			return DateTime.Now.Year.ToString();
		}
	}

	public static string AppTitle
	{
		get
		{
			return " - ReturnFilling.com";
		}
	}

	public static Dictionary<int, UserManagement> UsersList = new Dictionary<int, UserManagement>();

	public static void LoadUsers()
	{
		UsersList.Clear();
		using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
		{
			foreach (UserManagement usr in context.UserManagements)
			{
				UsersList.Add(usr.ID, usr);
			}
		}
	}

	public static void LoadGlobalData()
	{
		LoadUsers();
	}

	public static string SuccesMessage(string msg)
	{
		return "<span class='success'>" + msg + "</span>";
	}
	public static string ErrorMessage(string msg)
	{
		return "<span class='error'>" + msg + "</span>";
	}

	public static string BlogID { get; set; }
	public static void LogoutReset()
	{
		Global.UserType = -1;
		Global.UserName = "";
		Global.UserID = 0;
		Global.LogInDone = false;
	}

	public static string ConnectionStringEntity
	{
		get
		{
			return @"metadata=res://*/App_Code.ReturnFilingModel.csdl|res://*/App_Code.ReturnFilingModel.ssdl|res://*/App_Code.ReturnFilingModel.msl;provider=System.Data.SqlServerCe.4.0;provider connection string=""Data Source=|DataDirectory|\ReturnFiling.sdf;""";
		}
	}

	public static string ConnectionString
	{
		get
		{
			return @"Data Source=|DataDirectory|\ReturnFiling.sdf";
		}
	}

	public static Boolean LogInDone
	{
		get
		{
			if (HttpContext.Current.Session["LOGINDONE"] == null)
				return false;
			else
				return HttpContext.Current.Session["LOGINDONE"].ToString() == "1" ? true : false;
		}
		set
		{
			HttpContext.Current.Session["LOGINDONE"] = value ? "1" : "0";
		}
	}

	public static string UserName
	{
		get
		{
			if (HttpContext.Current.Session["USERNAME"] == null)
				return "";
			else
				return HttpContext.Current.Session["USERNAME"].ToString();
		}

		set
		{
			HttpContext.Current.Session["USERNAME"] = value;
		}
	}

	public static string MenuPDFData
	{
		get
		{
			if (HttpContext.Current.Session["MENUPDFDATA"] == null)
				return "";
			else
				return HttpContext.Current.Session["MENUPDFDATA"].ToString();
		}

		set
		{
			HttpContext.Current.Session["MENUPDFDATA"] = value;
		}
	}


	public static int UserType
	{
		get
		{
			if (HttpContext.Current.Session["USERTYPE"] == null)
				return -1;
			else
				return Cmn.ToInt(HttpContext.Current.Session["USERTYPE"]);
		}
		set
		{
			HttpContext.Current.Session["USERTYPE"] = value;
		}
	}

	public static int UserID
	{
		get
		{
			if (HttpContext.Current.Session["USERID"] == null)
				return -1;
			else
				return Cmn.ToInt(HttpContext.Current.Session["USERID"]);
		}
		set
		{
			HttpContext.Current.Session["USERID"] = value;
		}
	}

	public static string Culture
	{
		get
		{
			if (HttpContext.Current.Session["Culture"] == null)
				return "en-US";
			else
				return HttpContext.Current.Session["Culture"].ToString();
		}

		set
		{
			HttpContext.Current.Session["Culture"] = value;
		}
	}


	public static string UserEmailID
	{
		get
		{
			if (HttpContext.Current.Session["UserEmailID"] == null)
				return "";
			else
				return HttpContext.Current.Session["UserEmailID"].ToString();
		}
		set
		{
			HttpContext.Current.Session["UserEmailID"] = value;
		}
	}

	public static Boolean IsAdmin
	{
		get
		{
			if (HttpContext.Current.Session["ISADMIN"] == null)
				return false;
			else
				return HttpContext.Current.Session["ISADMIN"].ToString() == "1" ? true : false;
		}
		set
		{
			HttpContext.Current.Session["ISADMIN"] = value ? "1" : "0";
		}
	}

	public static string GetRootPathVirtual       //get vertual path
	{
		get
		{
			string host = (HttpContext.Current.Request.Url.IsDefaultPort) ?
			HttpContext.Current.Request.Url.Host :
			HttpContext.Current.Request.Url.Authority;
			host = String.Format("{0}://{1}", HttpContext.Current.Request.Url.Scheme, host);
			if (HttpContext.Current.Request.ApplicationPath == "/")
				return host;
			else
				return host + HttpContext.Current.Request.ApplicationPath;
		}
	}

	public static string DOB
	{
		get
		{
			if (HttpContext.Current.Session["DOB"] == null)
				return "";
			else
				return HttpContext.Current.Session["DOB"].ToString();
		}
		set
		{
			HttpContext.Current.Session["DOB"] = value;
		}
	}

	public static string FatherName
	{
		get
		{
			if (HttpContext.Current.Session["FATHERNAME"] == null)
				return "";
			else
				return HttpContext.Current.Session["FATHERNAME"].ToString();
		}
		set
		{
			HttpContext.Current.Session["FATHERNAME"] = value;
		}
	}


	public static int Gender
	{
		get
		{
			if (HttpContext.Current.Session["GENDER"] == null)
				return -1;
			else
				return Cmn.ToInt(HttpContext.Current.Session["GENDER"]);
		}
		set
		{
			HttpContext.Current.Session["GENDER"] = value;
		}
	}

	public static string PDFName
	{
		get
		{
			if (HttpContext.Current.Session["PDFNAME"] == null)
				return "";
			else
				return HttpContext.Current.Session["PDFNAME"].ToString();
		}
		set
		{
			HttpContext.Current.Session["PDFNAME"] = value;
		}
	}

	public static int CandidateID
	{
		get
		{
			if (HttpContext.Current.Session["CANDIDATEID"] == null)
				return Cmn.ToInt(Cmn.LoadFromCookie("CANDIDATEID", "0"));
			else
				return Cmn.ToInt(HttpContext.Current.Session["CANDIDATEID"].ToString());
		}
		set
		{
			HttpContext.Current.Session["CANDIDATEID"] = value;
			Cmn.SaveInCookie("CANDIDATEID", value.ToString());
		}
	}

	public static string PANNumber
	{
		get
		{
			if (HttpContext.Current.Session["PANNUMBER"] == null)
				return "";
			else
				return HttpContext.Current.Session["PANNUMBER"].ToString();
		}
		set
		{
			HttpContext.Current.Session["PANNUMBER"] = value;
		}
	}

	public static string AssessmentYear
	{
		get
		{
			if (HttpContext.Current.Session["ASSESSMENTYEAR"] == null)
				return Cmn.LoadFromCookie("ASSESSMENTYEAR", "2014");
			else
				return HttpContext.Current.Session["ASSESSMENTYEAR"].ToString();
		}
		set
		{
			HttpContext.Current.Session["ASSESSMENTYEAR"] = value;
		}
	}

	public static string PreviousURL
	{
		get
		{
			if (HttpContext.Current.Session["PREVIOUSURL"] == null)
				return "";
			else
				return HttpContext.Current.Session["PREVIOUSURL"].ToString();
		}
		set
		{
			HttpContext.Current.Session["PREVIOUSURL"] = value;
		}
	}

	public static string EmailID
	{
		get
		{
			if (HttpContext.Current.Session["EMAILID"] == null)
			{
				HttpCookie cookie = HttpContext.Current.Request.Cookies["EmailID"];
				if (cookie != null)
					return cookie.Value;
				return "";
			}
			return HttpContext.Current.Session["EMAILID"].ToString();
		}
		set
		{
			HttpContext.Current.Session["EMAILID"] = value;
			Cmn.SaveInCookie("EmailID", value.ToString());
		}
	}
}
