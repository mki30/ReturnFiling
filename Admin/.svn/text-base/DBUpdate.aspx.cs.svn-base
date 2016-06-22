using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;

public partial class Partner_DBUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

	protected void btnUpdateDatabase_Click(object sender, EventArgs e)
	{
		string DbPath = HttpContext.Current.Server.MapPath(@"~\App_Data\ReturnFiling.sdf");
		string connstr = @"Data Source=|DataDirectory|\ReturnFiling.sdf";

		new DatabaseCE().CreateDB(DbPath, connstr);
		DatabaseCE db = new DatabaseCE();
		try
		{
			int Counter = 0;
			while (DBCheck.UpdateDBStructure(db, ++Counter))
			{
			}
			Response.Write("DBUpdate Done");
		}
		catch (Exception ex)
		{
			Cmn.LogError(ex, "DBUpdate");
			Response.Write("Error Occured while updating : " + ex.Message);
		}
		finally
		{
			db.Close();
		}
	}
}