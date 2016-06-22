using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReturnFilingModel;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		Title = "Login - return-filing.in";
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        PersonalInfo PI = PersonalInfo.GetByPAN(txtPan.Text);
        if (PI == null)
        {
            PI = new PersonalInfo();
            PI.ID = 0;
            PI.DOB = Cmn.ToDate(txtDob.Text);
            PI.PANNumber = txtPan.Text;
            PI.EmailID = txtEmail.Text;
            PI.Save();
            Global.CandidateID = (int)PI.ID;
        }
        else if (PI != null)
        {
            Global.CandidateID = (int)PI.ID;
            Response.Redirect("/permanent");
        }
    }
}