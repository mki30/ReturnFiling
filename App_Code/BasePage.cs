﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Text;
using System.Collections.Specialized;
using System.Drawing;
using System.Threading;
using System.Globalization;
using System.IO.Compression;
using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;


public enum Language
{
	English,
	Hindi
}

public class BasePage :System.Web.UI.Page
{
	public string Action = "";
	public string Data1 = "";
	public string Data2 = "";
	public string Data3 = "";
	public string Data4 = "";

	public Language CurrentLanguage
	{
		get
		{
			string Culture = CultureInfo.CurrentCulture.TwoLetterISOLanguageName;
			if (Culture == "en")
				return Language.English;
			else
				return Language.Hindi;
		}
	}

	public string MenuSelection = "product";

	public BasePage()
	{
		//
		// TODO: Add constructor logic here
		//
	}


	public Boolean IsLocalHost
	{
		get
		{
			return false;
			//return Request.Url.Host.ToLower().Contains("localhost");
		}
	}

	public int GetFormInt(string FieldName)
	{
		NameValueCollection nvc = Request.Form;
		if (nvc[FieldName] != null)
			return Cmn.ToInt(nvc[FieldName]);

		return 0;
	}

	public double GetFormDbl(string FieldName)
	{
		NameValueCollection nvc = Request.Form;
		if (nvc[FieldName] != null)
			return Cmn.ToDbl(nvc[FieldName]);

		return 0;
	}

	public string GetFormString(string FieldName)
	{
		NameValueCollection nvc = Request.Form;
		if (nvc[FieldName] != null)
			return nvc[FieldName];

		return "";
	}

	public void WriteClientScript()
	{
		string str = "";
		GetAllClientID(this, ref str);
		WriteClientScript(str);
	}

	public string RouteString(string Key, string Default = "")
	{
		return RouteData.Values[Key] != null ? RouteData.Values[Key].ToString() : Default;
	}

	public string QueryString(string Key, string Default = "")
	{
		return Request.QueryString[Key] != null ? Request.QueryString[Key].ToString() : Default;
	}

	public string RouteValue(string Name)
	{
		return RouteData.Values[Name] != null ? RouteData.Values[Name].ToString() : "";
	}

	public string GetCookie(string Key)
	{
		HttpCookie c = Request.Cookies.Get(Key);
		return c != null ? c.Value : "";
	}

	public void SetCookie(string Key, string Value)
	{
		HttpCookie c = Response.Cookies.Get(Key);
		if (c != null)
			c.Value = Value;
		else
			Response.Cookies.Add(new HttpCookie(Key, Value));

	}

	protected void Page_Load(object sender, EventArgs e)
	{
		string Debug = Request.QueryString["Debug"] != null ? Request.QueryString["Debug"].ToString() : "";
		//if (Debug != "")
		//  Global.Debug = true;

		Action = RouteData.Values["Action"] != null ? RouteData.Values["Action"].ToString() : "";
		Data1 = RouteData.Values["Data1"] != null ? RouteData.Values["Data1"].ToString() : "";
		Data2 = RouteData.Values["Data2"] != null ? RouteData.Values["Data2"].ToString() : "";
		Data3 = RouteData.Values["Data3"] != null ? RouteData.Values["Data3"].ToString() : "";
		Data4 = RouteData.Values["Data4"] != null ? RouteData.Values["Data4"].ToString() : "";

		Global.CheckLogin(); //Navigate to default page if Candidate ID in Session is 0.

		if (Debug.Length == 0)
		{
			if (!string.IsNullOrEmpty(Request.Headers["Accept-Encoding"]))
			{
				string enc = Request.Headers["Accept-Encoding"].ToUpperInvariant();

				//preferred: gzip or wildcard 
				if (enc.Contains("GZIP") || enc.Contains("*"))
				{
					Response.AppendHeader("Content-encoding", "gzip");
					Response.Filter = new GZipStream(Response.Filter, CompressionMode.Compress);
				}

				//deflate 
				else if (enc.Contains("DEFLATE"))
				{
					Response.AppendHeader("Content-encoding", "deflate");
					Response.Filter = new DeflateStream(Response.Filter, CompressionMode.Compress);
				}
			}
		}
	}

	public void GetAllClientID(Control parent, ref string strCtl)
	{
		foreach (Control ctl in parent.Controls)
		{
			//if (ctl.GetType().ToString().Equals("System.Web.UI.WebControls.TextBox"))
			if (ctl.ID != null)
				strCtl += "var " + ctl.ID + "=\"#" + ctl.ClientID + "\";\n";

			try
			{
				if (ctl.Controls.Count > 0)
					GetAllClientID(ctl, ref strCtl);
			}
			catch (Exception Ex)
			{
				string str = Ex.Message;
			}
		}
	}

	public void WriteClientScript(string Client_Script)
	{
		ClientScriptManager cs = ClientScript;
		string csname1 = "S1";
		if (!cs.IsClientScriptBlockRegistered(GetType(), csname1))
		{
			StringBuilder cstext2 = new StringBuilder();
			cstext2.Append("<script language='javascript' type=text/javascript> \n");
			cstext2.Append(Client_Script);
			cstext2.Append("</script>");
			cs.RegisterClientScriptBlock(GetType(), csname1, cstext2.ToString(), false);
		}
	}

	protected void Page_Prerender(object sender, EventArgs e)
	{
		string Script = "Action='" + Action + "';\n";
		Script += "CurrentPage='" + Action + "';\n";
		//string topMenu = "top_permanent";
		//string subMenu = "sub_permanent";

		//switch (Action)
		//{
		//	case "salary":
		//	case "otherincome":
		//	case "houseproperty":
		//	case "capitalgain":
		//		topMenu = "top_incomesource";
		//		subMenu = "sub_incomesource";
		//		break;

		//	case "deduction":
		//	case "moredeductions":
		//		topMenu = "top_deduction";
		//		subMenu = "sub_deduction";
		//		break;
		//	case "tds":
		//	case "selftaxpayment":
		//		topMenu = "top_tds";
		//		subMenu = "sub_tds";
		//		break;
		//}
		//Script += "$(document).ready(function(){ $('.li_" + Data1 + "').addClass('active'); $('." + Action + "').addClass('currentpage'); $('.subm').hide(); $('." + subMenu + "').show(); $('." + topMenu + "').addClass('topSel');  });\n";
		//WriteClientScript(Script);
	}

	public Bitmap ResizeImage(Bitmap src, int newWidth, int newHeight)
	{
		Bitmap result = new Bitmap(newWidth, newHeight);
		using (Graphics Gr = Graphics.FromImage((System.Drawing.Image)result))
		{
			Gr.DrawImage(src, 0, 0, newWidth, newHeight);
		}
		return result;
	}
}