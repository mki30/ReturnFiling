using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using ReturnFilingModel;

public partial class GetData :System.Web.UI.Page
{
	string Action, Data1, Data2, Data3, Data4, Data5, Data6, Data7, Message = "";
	StringBuilder sb = new StringBuilder();
	string encode = "no";

	protected void Page_Load(object sender, EventArgs e)
	{
		//Cmn.IsLoggedIn(this);
		Action = Request.QueryString["Action"] != null ? Request.QueryString["Action"].ToString() : "";
		Data1 = Request.QueryString["Data1"] != null ? Request.QueryString["Data1"].ToString() : "";
		Data2 = Request.QueryString["Data2"] != null ? Request.QueryString["Data2"].ToString() : "";
		Data3 = Request.QueryString["Data3"] != null ? Request.QueryString["Data3"].ToString() : "";
		Data4 = Request.QueryString["Data4"] != null ? Request.QueryString["Data4"].ToString() : "";
		Data5 = Request.QueryString["Data5"] != null ? Request.QueryString["Data5"].ToString() : "";
		Data6 = Request.QueryString["Data6"] != null ? Request.QueryString["Data6"].ToString() : "";
		Data7 = Request.QueryString["Data7"] != null ? Request.QueryString["Data7"].ToString() : "";
		string term = Request.QueryString["term"] != null ? Request.QueryString["term"].ToString() : "";
		encode = (Action == "NTES_GetImage") ? "" : Cmn.GetEncode(this);

		try
		{
			switch (Action)
			{
				case "Delete": Delete(Data1, Cmn.ToInt(Data2)); return;
			}
			Cmn.WriteResponse(this, sb.ToString(), encode);
		}
		catch (Exception ex)
		{
			//returning error at 0,1,2 index receiver may choose to read from any one of the index
			Cmn.WriteResponse(this, ex.Message + "~" + ex.Message + "~" + ex.Message, encode);
		}
		finally
		{
		}
	}

	void Delete(string What_To_Delete, int ID)
	{
		string TableName="";
		switch (What_To_Delete)
		{
			case "salary": TableName = "Salary"; break;
			case "capgain": TableName = "CapitalGain"; break;
			case "hp": TableName = "HouseProperty"; break;
			case "tds": TableName = "TDSEntry"; break;
			case "advtax": TableName = "AdvanceTax"; break;
		}

		if (!string.IsNullOrWhiteSpace(TableName))
		{
			using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
			{
				context.ExecuteStoreCommand("Delete from " + TableName + " WHERE ID=" + ID, null);
			}
		}
	}


}
