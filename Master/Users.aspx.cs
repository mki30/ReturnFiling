using System;
using System.Linq;
using System.Text;
using System.Web.UI;
using ReturnFilingModel;

public partial class Users :BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
		base.Page_Load(sender, e);

		if (Global.UserType == -1)
		{
			Global.PreviousURL = Request.RawUrl;
			Response.Redirect("~/Master/Login.aspx");
		}

		Control ctl = Master.FindControl("btnLogout");
		if (ctl != null)
			ctl.Visible = true;

		if (Global.UserType == (int)RoleType.Master)
			ShowUsers();
		else
			divUsers.InnerHtml = "<h3>You do not have access to this page. Contact administrator.</h3>";
    }

	void ShowUsers()
	{
		StringBuilder str = new StringBuilder("<a class='btn btn-primary' href='#' data-toggle='modal' data-target='#modaluser'>Add New User</a>");
		str.Append("<br/><br/><table class='table table-condensed table-bordered'><tr><th>#<th>Name<th>Username<th>Password<th>Role");
		//List<UserManagement> users = UserManagement.GetData();
		int ctr = 0;
		foreach (UserManagement usr in Global.UsersList.Values)
		{
			str.Append("<tr>" +
				"<td>" + (++ctr) +
				"<td><a href='#' onclick='return EditUser(" + usr.ID + ",\"" + usr.Name +"\",\""  + usr.Username+ "\",\"" + usr.Password +"\"," +usr.Role + ")'>" + usr.Name + "</a>" +
				"<td>" + usr.Username +
				"<td>" + usr.Password + 
				"<td>" + (usr.Role==(int)RoleType.Master ? "Master" : "Associate" )
				);
		}

		if (ctr == 0)
			str.Append("<tr><td colspan='5'>No Users found, User 'Add New User' button to add user.");

		str.Append("</table>");
		divUsers.InnerHtml = str.ToString();
	}
	protected void btnUpdateUser_Click(object sender, EventArgs e)
	{
		if (string.IsNullOrWhiteSpace(txtUsername.Value) || string.IsNullOrWhiteSpace(txtPassword.Value) || string.IsNullOrWhiteSpace(txtName.Value))
		{
			ltMsg.Text = Global.ErrorMessage("Please enter Name / username / password");
			return;
		}

		//UserManagement usr = UserManagement.GetByID(Cmn.ToInt(txtID.Value));
		UserManagement usr = Global.UsersList.Values.FirstOrDefault(m => m.ID == Cmn.ToInt(txtID.Value));
		if (usr == null)
		{
			usr = new UserManagement();
			usr.ID = 0;
		}

		usr.Name = txtName.Value;
		usr.Username = txtUsername.Value;
		usr.Password = txtPassword.Value;
		usr.Role = Cmn.ToInt(ddUserType.Value);
		usr.Save();

		Global.LoadUsers(); 
		Response.Redirect(Request.RawUrl);
	}
}