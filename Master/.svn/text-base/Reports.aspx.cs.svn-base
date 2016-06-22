using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReturnFilingModel;

public partial class Reports :BasePage
{
	protected void Page_Load(object sender, EventArgs e)
	{
		base.Page_Load(sender, e);

		//if (Global.UserType == -1)
		//{
		//	Global.PreviousURL = Request.RawUrl;
		//	Response.Redirect("~/Master/Login.aspx");
		//}

		Control ctl = Master.FindControl("btnLogout");
		if (ctl != null)
			ctl.Visible = true;

		Global.UserType = (int)RoleType.Master;

		if (!IsPostBack)
		{
			ShowReports();
			FillAssociate();
			FillApplicationStatuOptions();
		}
	}

	void FillAssociate()
	{
		ddAssociate.Items.Clear();
		ddAssociate.Items.Add(new ListItem("Select Associate", "-1"));
		List<UserManagement> Associates = UserManagement.GetAssociates();
		foreach (UserManagement asc in Associates)
		{
			ddAssociate.Items.Add(new ListItem(asc.Name, asc.ID.ToString()));
		}
	}

	void FillApplicationStatuOptions()
	{
		int ctr = 0;
		ddChangeStatus.Items.Clear();
		foreach (var srv in Enum.GetValues(typeof(ApplicationStatus)))
		{
			ddChangeStatus.Items.Add(new ListItem(srv.ToString().Replace("_", " "), ctr.ToString()));
			ctr++;
		}
		ddChangeStatus.SelectedValue = ((int)ApplicationStatus.Complete).ToString();
	}


	void ShowReports()
	{
		StringBuilder str = new StringBuilder("");
		str.Append("<br/><table class='table table-condensed table-bordered'><tr>" +
		"<th>#" +
		"<th>Name" +
		"<th>DOB" +
		"<th>Father's Name" +
		"<th>PAN" +
		"<th>Year" +
		"<th>Associate" +
		"<th>Status" +
		"<th>Form16 PDF" +
		"<th>Upload"
		);


		List<PersonalInfo> users = PersonalInfo.DataForAssesmentYear(Global.AssessmentYear, Global.UserType);
		int ctr = 0;
		foreach (PersonalInfo usr in users)
		{
			string Form16DownloadLink = "-";
			if (File.Exists(Server.MapPath("~/Data/PDF/" + usr.ID + ".pdf")))
				Form16DownloadLink = "<a href='/Data/PDF/" + usr.ID + ".pdf' download><span class='glyphicon glyphicon-download'></span>&nbsp;Download</a>";

			str.Append("<tr>" +
				"<td>" + (++ctr) +
				"<td><a href='/reportdetail/" + usr.ID + "'><span class='glyphicon glyphicon-list-alt'></span>&nbsp;" + usr.FirstName + " " + usr.MiddleName + " " + usr.LastName + "</a>" +
				"<td>" + Cmn.ToDate(usr.DOB).ToString("dd-MMM-yyyy") +
				"<td>" + usr.FatherName +
				"<td>" + usr.PANNumber +
				"<td>" + usr.AssessmentYear +
				"<td>" + GetAssociateData(usr) +
				"<td>" + GetApplicationStatus(Cmn.ToInt(usr.Status)) +
				"<td>" + Form16DownloadLink +
				"<td>" + GetUploadText(Cmn.ToInt(usr.ID))
				);
		}

		if (ctr == 0)
			str.Append("<tr><td colspan='8'>No profiles found for this assesment year.");

		str.Append("</table>");
		divReports.InnerHtml = str.ToString();
	}

	string GetUploadText(int ID)
	{
		string FileName = Server.MapPath("~/Data/FinalSubmit/" + Global.AssessmentYear + "/" + ID + ".jpg");
		if (File.Exists(FileName))
			return "Uploaded <a href='#' class='pull-right' onclick='return UploadFile(" + ID + ")'><span class='glyphicon glyphicon-edit'></span>&nbsp;Change</a>";

		return "<a href='#' onclick='return UploadFile(" + ID + ")'>Upload</a>";
	}

	string GetAssociateData(PersonalInfo usr)
	{
		string asc = "";
		if (Global.UsersList.Count == 0)
			Global.LoadUsers();
		//string asc = UserManagement.GetAssociateName((int)usr.AssociateID);
		UserManagement associate = Global.UsersList.Values.FirstOrDefault(m => m.ID == Cmn.ToInt(usr.AssociateID));
		asc = associate == null ? "" : associate.Name;

		if (Global.UserType == (int)RoleType.Master) //an associate cannot assign to change associates to clients only admin can do this
		{
			if (associate == null)
				asc += "<a href='#' onclick='return AssignAssociate(" + usr.ID + ",\"" + usr.FirstName + " " + usr.MiddleName + " " + usr.LastName + "\",-1)'>Assign</a>";
			else
				asc += "<a href='#' class='pull-right' onclick='return AssignAssociate(" + usr.ID + ",\"" + usr.FirstName + " " + usr.MiddleName + " " + usr.LastName + "\"," + usr.AssociateID + ")'><span class='glyphicon glyphicon-edit'></span>&nbsp;Change</a>";
		}
		return asc;
	}

	string GetApplicationStatus(int Status)
	{
		return Enum.GetName(typeof(ApplicationStatus), Status).Replace("_", " ");
	}

	protected void btnSave_Click(object sender, EventArgs e)
	{
		if (flUpload.HasFile)
		{
			string FolderPath = Server.MapPath("~/Data/FinalSubmit/" + Global.AssessmentYear + "/");

			if (!Directory.Exists(FolderPath))
				Directory.CreateDirectory(FolderPath);

			string Save_Location = FolderPath + txtCandidateID_upload.Value + ".jpg";
			flUpload.SaveAs(Save_Location);

			PersonalInfo usr = PersonalInfo.GetByID(Cmn.ToInt(txtCandidateID_upload.Value));
			if (usr != null)
			{
				usr.Status = Cmn.ToInt(ddChangeStatus.SelectedValue);
				usr.Save();

				email.SendEmail("Application Status Update from return-filing.in", usr.EmailID,
							"<br /><br /> Dear " + usr.FirstName + " " + usr.MiddleName + " " + usr.LastName + ", <br/><br/>" +
											"Application status for below request has been updated.<br/><br/>" +
											"<b>PAN Number </b>:" + usr.PANNumber + "<br/>" +
											"<b>Assessment Year </b>:" + usr.AssessmentYear + "<br/><br/>" +
											 "<span style='color:green;'><b>Current Status of your Application </b> : " + Enum.GetName(typeof(ApplicationStatus), (usr.Status == null ? 0 : usr.Status)).Replace("_", " ") + "</span><br/><br/>" +
											 "<br/>" +
											 "Regards,<br/>" +
											 "<a href='www.return-filing.in'>Return-Filing Team</a>"
							);

				Response.Redirect(Request.RawUrl);
			}
		}
		else
			ltMsg1.Text = Global.ErrorMessage("* required");
	}

	protected void btnAssignAssociate_Click(object sender, EventArgs e)
	{
		try
		{
			PersonalInfo usr = PersonalInfo.GetByID(Cmn.ToInt(txtCandidateID.Value));
			if (usr != null)
			{
				usr.AssociateID = Cmn.ToInt(ddAssociate.SelectedValue);
				usr.Status = (int)ApplicationStatus.Associate_Assigned;
				usr.Save();
				Response.Redirect(Request.RawUrl);
			}
			else
				ltMsg.Text = Global.ErrorMessage("No profile found with this ID");

		}
		catch (Exception ex)
		{
			ltMsg.Text = Global.ErrorMessage("Error, Not Saved!! (" + ex.InnerException.Message + ")");
		}
	}
}