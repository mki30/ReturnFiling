using Microsoft.AspNet.Identity;
using System;
using System.Web;
using ReturnFiling;


public partial class Account_PasswordRecover : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        string userid = Request.QueryString["user"],
            token = HttpUtility.HtmlDecode(Request.QueryString["token"]), m = Request.QueryString["m"];

        pnlerror.Visible = false;
        if (m != null && m.ToLower() == "checkmail")
        {
            pnlerror.Visible = true;
            pnlDetails.Visible = false;
            errormsg.InnerHtml = "An email has been sent to you with login data.<br/><br/>Check your email now.";
        }
        if (m != null && m.ToLower() == "pwdchanged")
        {
            pnlForgot.Visible = false;
            pnlCreate.Visible = true;
            pnlDetail1.Visible = false;
            subtitle1.Visible = false;
            pnlerr1.Visible = true;
            errortxt.InnerHtml = "Password Changed Success! <a href='/account/login.aspx'>Click Here To Login</a>";
            errortxt.Attributes.Add("class", "alert alert-success");
            lblCreateText.Text = "Password Changed!";
        }
        if (!string.IsNullOrWhiteSpace(userid) && !string.IsNullOrWhiteSpace(token))
        {
            pnlForgot.Visible = false;
            pnlCreate.Visible = true;
            txtUserID.Value = userid;
            txtToken.Value = token;
            UserManager manager = new UserManager();
            var user = manager.FindById(userid);
            if (user != null)
            {
                lblUser.Text = user.FirstName;
            }
        }
    }

    protected void btnSendMail_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrWhiteSpace(txtEmail.Text))
        {
            var vlu = txtValue.Value;
            string msg = string.Empty;
            UserManager manager = new UserManager();
            var user = manager.FindByEmail(txtEmail.Text);
            if (user != null)
            {
				string code = manager.GeneratePasswordResetToken(user.Id),
					callbackUrl = (Global.IsLocalHost ? "http://localhost:50710/" : "http://return-filing.in/") + "account/passwordrecover.aspx?user=" + user.Id + "&token=" + HttpUtility.UrlEncode(code);

				string txt = "Hello <b>" + user.FirstName + "</b>,<br/><br/>This mail has been sent from <a href='http://return-filing.in'>return-filing.in</a> as you have requested password reset.<br/><br/>To Reset Password <a href=\"" + callbackUrl + "\">Click Here</a>.<br/><br/><p>Your Username: " + user.UserName + "</p><p>Your Password: <a href=\"" + callbackUrl + "\">Click Here To Reset</a></p><br/><p>Please note your password reset token will expire in one day and you can use it only one time.</p><br/><br/><p><b>Team return-filing.in</b></p>";

				//if (Request.Url.Host.ToLower().Contains("localhost"))
					msg = email.SendEmail("Reset Password", user.Email, txt);
				//else
				//	msg = manager.SendOnwWayMail(user.Email, "Reset Password", txt);

                if (msg == "Mail Send")
                {
                    Response.Redirect("/account/PasswordRecover.aspx?m=checkmail");
                }
            }
            else
            {
                pnlerror.Visible = true;
                errormsg.InnerHtml = "WARNING: the email " + txtEmail.Text + " has not been registered yet";
            }
        }
        else
        {
            pnlerror.Visible = true;
            errormsg.InnerHtml = "Please Enter Email!";
        }
    }

    protected void btnResetPassword_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtPassword.Text) && string.IsNullOrWhiteSpace(txtPassword1.Text))
        {
            errortxt.InnerHtml = "Plese Type Password & Re-Enter Password";
            pnlerr1.Visible = true;
            return;
        }
        if (txtPassword.Text.Trim() != txtPassword1.Text.Trim())
        {
            errortxt.InnerHtml = "Password & Re-Enter Password Not Matched";
            pnlerr1.Visible = true;
            return;
        }
        pnlerr1.Visible = false;
        errortxt.InnerHtml = "";

        UserManager manager = new UserManager();
        var user = manager.FindById(txtUserID.Value);
        if (user != null)
        {
            var result = manager.ResetPassword(user.Id, txtToken.Value, txtPassword.Text.Trim());
            if (result.Succeeded)
            {
                string msg = string.Empty;
                if (Request.Url.Host.ToLower().Contains("localhost"))
                    msg = email.SendEmail("Password Changed", user.Email, "Your Password has been chnaged.<a href='http://localhost:38005/account/login.aspx'>To Login click here</a>.<br/><br/><b>Team eBuild.in</b>");
                else
                    msg = manager.SendOnwWayMail(user.Email, "Password Changed", "Your Password has been chnaged.<a href='http://localhost:38005/account/login.aspx'>To Login click here</a>.<br/><br/><b>Team eBuild.in</b>");
                if (msg == "Mail Send")
                {
                    Response.Redirect("/account/PasswordRecover.aspx?m=pwdchanged&user=" + user.UserName);
                }
            }
            else
            {
                pnlerr1.Visible = true;
                errortxt.InnerHtml = string.Join("<br/>", result.Errors);
            }
        }
    }
}