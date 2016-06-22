using System;
using System.Net.Mail;
using System.IO;
using System.Web;

/// <summary>
/// Summary description for email
/// </summary>
public class email
{
	public email()
	{
		//
		// TODO: Add constructor logic here
		//
	}

	public static string SendEmail2(string _Subject, string EmailFrom, string EmailTo, string Password, string Body, Stream stream)
	{
		SmtpClient client = new SmtpClient();

		client.DeliveryMethod = SmtpDeliveryMethod.Network;
		client.EnableSsl = true;
		client.Host = "smtp.gmail.com";
		client.Port = 587;

		// setup Smtp authentication
		System.Net.NetworkCredential credentials = new System.Net.NetworkCredential(EmailFrom, Password);

		client.UseDefaultCredentials = false;
		client.Credentials = credentials;

		MailMessage msg = new MailMessage(EmailFrom, EmailTo)
		{
			Subject = _Subject,
			IsBodyHtml = true,
			Body = string.Format("<html><head></head><body>" + Body + "</body>")
		};

		try
		{
			client.Send(msg);
			return "Your message has been successfully sent.";
		}
		catch (Exception ex)
		{
			return "Error occured while sending your message." + ex.Message;
		}
	}

	public static string SendEmail(string Subject, string EmailTo, string Body)
	{
		string Data = File.ReadAllText(HttpContext.Current.Server.MapPath(@"~\App_Data\Admin.mdb"));
		string[] Fields = Data.Split(',');
		SmtpClient client = new SmtpClient();

		client.DeliveryMethod = SmtpDeliveryMethod.Network;
		client.EnableSsl = true;
		client.Host = "smtp.gmail.com";
		client.Port = 587;

		// setup Smtp authentication
		System.Net.NetworkCredential credentials = new System.Net.NetworkCredential(Fields[0].Trim(),Fields[1].Trim());

		client.UseDefaultCredentials = false;
		client.Credentials = credentials;

		EmailTo = EmailTo == "" ? Fields[1] : EmailTo;

		MailMessage msg = new MailMessage();
		msg.From = new MailAddress(Fields[0]);
		msg.Bcc.Add(new MailAddress(EmailTo));
		msg.To.Add(new MailAddress(Fields[0]));

		msg.Subject = Subject;
		msg.IsBodyHtml = true;
		//msg.Body = string.Format("<html><head></head><body>" + Body + "</body>");
		msg.Body = Body;

		try
		{
			client.Send(msg);
			Cmn.LogError(null, "Mail Sent Successfully");
			return "Mail Send";
		}
		catch (Exception ex)
		{
			Cmn.LogError(ex, ex.Message);
			return "Error occured while sending your message." + ex.Message;
		}
	}
}
