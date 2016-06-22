using iTextSharp.text.pdf;
using iTextSharp.text.pdf.parser;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReturnFilingModel;

public partial class GetForm16Password :System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		Title = "Upload form16 - return-filing.in";
		pnlSummary.Visible = false;
		pnlPassword.Visible = false;
		pnlUploadPDF.Visible = true;

		if (!IsPostBack && Global.EmailID != "")
		{
			PersonalInfo ci = PersonalInfo.GetByEmailID(Global.EmailID);
			if (ci != null)
			{
				txtDob.Text = Cmn.ToDate(ci.DOB).ToString("dd-MMM-yyyy");
				txtFatherName.Text  = ci.FatherName;
				ddGender.SelectedValue = ci.Gender.ToString();
			}
		}
    }

	protected void btnPdfUpload_Click(object sender, EventArgs e)
	{
		if (FileUpload1.HasFile)
		{
			Global.DOB = txtDob.Text;
			Global.Gender = Cmn.ToInt(ddGender.SelectedValue);
			Global.PDFName = FileUpload1.FileName;
			Global.FatherName = txtFatherName.Text;
			string Save_Location = Server.MapPath("~/Data/PDF/" + FileUpload1.FileName);
			FileUpload1.SaveAs(Save_Location);

			pnlUploadPDF.Visible = false;

			string txt = ReadPdfFile(Save_Location, "");
			if (txt != "")
				ProcessPDF(txt);
			else
				pnlPassword.Visible = true;
		}
		else
		{
			ltStatus.Text = Global.ErrorMessage("Please choose form16 pdf first");
		}
	}
	string PANNumber = "", AssessmentYear = "", PANoftheDeductor = "",
				  TanOfDeductor = "", NameOfEmployer = "",
				  AddressOfEmployer = "", NameOfEmployee = "",
				  AddressOfEmployee = "", EmployerEMail = "",
				  TaxableIncomeFromSalary = "", GrossTotalIncome = "",
				  DeductibleAmount = "", TotalIncome = "",
				  TaxPayble = "", TaxPaid = "";


	protected void btnPasswordSubmit_Click(object sender, EventArgs e)
	{
		string password = txtPassword.Text;
		string pdfFile = Server.MapPath("/Data/PDF/" + Global.PDFName + "");
		string txt = ReadPdfFile(pdfFile, password);
		if (txt != "")
			ProcessPDF(txt);
		else
			ShowSummaryOfIncome();
	}

	public void ProcessPDF(string data)
	{
		try
		{
			string[] Fields = {   
                                  "Name and address of the Employer",//EmployerrName
                                  "Name and address of the Employee",//EmployeeName
                                  "PAN of the Deductor",//DeductorPan
                                  "TAN of the Deductor",//DeductorTan
                                  "PAN of the Employee",//EmplyeePan
                                  "Employee Reference No.provided by the Employer (If available)",//EmplyeeRefNo
                                  "CIT (TDS)",  //CITTDS
                                  "Assessment Year",//AssessmentYear
                                  "Period with the Employer",
                                  "8.Gross Total Income(6+7)",
                                  "Deductible Amount",
                                  "TotalIncome",
                                  "TaxPaid",
                                  "Refund"
                                };
			string[] FieldData = new string[Fields.Length];


			int step = -1;
			//string[] Lines = ReadPdfFile(pdfFile, password).Split('\n');
			string[] Lines = data.Split('\n');

			int ctr = -1;
			foreach (string s in Lines)
			{
				ctr++;
				switch (s.Trim())
				{
					case "PAN of the Employee":
						PANNumber = PANNumber == "" ? Lines[ctr + 1] : PANNumber;
						break;
					case "Assessment Year":
						AssessmentYear = AssessmentYear == "" ? Lines[ctr + 1] : AssessmentYear;
						AssessmentYear = AssessmentYear.Split('-')[0];
						break;
					case "PAN of the Deductor":
						PANoftheDeductor = PANoftheDeductor == "" ? Lines[ctr + 1] : PANoftheDeductor;
						break;
					case "TAN of the Deductor":
						TanOfDeductor = TanOfDeductor == "" ? Lines[ctr + 1] : TanOfDeductor;
						break;
					case "Name and address of the Employer":
						int subctr = 1;
						NameOfEmployer = NameOfEmployer == "" ? Lines[ctr + subctr] : NameOfEmployer;
						while (Lines[ctr + subctr + 1] != "Name and address of the Employee")
						{
							subctr++;
							AddressOfEmployer += Lines[ctr + subctr];
							if (Lines[ctr + subctr].Contains("@"))
							{
								EmployerEMail = Lines[ctr + subctr];
								AddressOfEmployer = AddressOfEmployer.Replace(EmployerEMail, "");
							}
						}
						break;
					case "Name and address of the Employee":
						int subctr1 = 1;
						NameOfEmployee = NameOfEmployee == "" ? Lines[ctr + 1] : NameOfEmployee;

						while (Lines[ctr + subctr1 + 1] != "PAN of the Deductor")
						{
							subctr1++;
							AddressOfEmployee += Lines[ctr + subctr1];
						}
						break;
					case "80CCD(1) shall not exceed one lakh rupees.":
						TaxableIncomeFromSalary = TaxableIncomeFromSalary == "" ? Lines[ctr + 2] : TaxableIncomeFromSalary;
						break;
					case "Gross Amount":
						GrossTotalIncome = GrossTotalIncome == "" ? Lines[ctr + 6] : GrossTotalIncome;
						break;
					case "Qualifying amount":
						DeductibleAmount = DeductibleAmount == "" ? Lines[ctr + 3] : GrossTotalIncome;
						TotalIncome = TotalIncome == "" ? Lines[ctr + 4] : TotalIncome;
						TaxPayble = TaxPayble == "" ? Lines[ctr + 10] : TaxPayble;
						break;
					case "d)Date of payment into Government treasury Various dates as mentioned on Part A of the Form 16":
						TaxPaid = TaxPaid == "" ? Lines[ctr - 1].Replace("c)Total Tax Paid", "") : Lines[ctr - 1];
						break;
				}

				bool found = false;
				for (int i = 0; i < Fields.Length; i++)
				{
					if (s == Fields[i])
					{
						step = i;
						found = true;
					}
				}
				if (found)
					continue;

				if (step > -1)
					FieldData[step] += s + "</br>";

			}

			if (!string.IsNullOrWhiteSpace(PANNumber) && !string.IsNullOrWhiteSpace(AssessmentYear))
				GetPersonalInfo(PANNumber, AssessmentYear);

			ShowSummaryOfIncome();
        }

		catch (Exception ex)
		{
			if (ex.Message == "Bad user password")
			{
				txtPassword.Text = "";
				ltValidationMsg.Text = Global.ErrorMessage("Password seems incorrect or empty!");
			}
			else
				ShowSummaryOfIncome();
		}
	}

	private void ShowSummaryOfIncome()
	{
		pnlSummary.Visible = true;
		pnlPassword.Visible = false;
		pnlUploadPDF.Visible = false;
		if (TaxableIncomeFromSalary == "" && GrossTotalIncome == "") //show message to user that your file is submitted
		{
			divSummary.InnerHtml = "<div class='alert alert-success' role='alert'>" +
										"<h3>Your Form 16 is submitted successfully.</h3>" +
										"<p>Please fill in your bank details, as these details are mandatory to complete filing process.</p>" +
									"</div>" +
									"<div class='alert alert-info' role='alert'>" +
										"<p>Our associate will contact you shortly.</p>" +
									"</div>";
			lblRefund.Visible = false;

		}
		else
		{
			lblTaxableIncome.Text = TaxableIncomeFromSalary;
			lblGrossTotalIncome.Text = GrossTotalIncome;
			lblTotalDeductions.Text = DeductibleAmount;
			lblTotalIncome.Text = TotalIncome;
			lblTaxDue.Text = TaxPayble;
			lblTaxPaid.Text = TaxPaid;
			lblRefund.Text = (Cmn.ToInt(TaxPaid.Replace(",", "").Replace("\t", "").Replace(".00", "").Trim()) - (Cmn.ToInt(TaxPayble.Replace(",", "").Replace("\t", "").Replace(".00", "").Trim()))).ToString("##,##.00");
			lblRefundProceed.Text = "You have refund of Rs. " + lblRefund.Text;
			lblRefund.Visible = true;
		}
	}

	public string ReadPdfFile(string fileName, string password)
	{
		StringBuilder text = new StringBuilder("");
		if (File.Exists(fileName))
		{
			try
			{
				PdfReader pdfReader = new PdfReader(fileName, Encoding.ASCII.GetBytes(password));
				for (int page = 1; page <= pdfReader.NumberOfPages; page++)
				{
					ITextExtractionStrategy strategy = new SimpleTextExtractionStrategy();
					string currentText = PdfTextExtractor.GetTextFromPage(pdfReader, page, strategy);
					currentText = Encoding.UTF8.GetString(ASCIIEncoding.Convert(Encoding.Default, Encoding.UTF8, Encoding.Default.GetBytes(currentText)));
					text.Append(currentText);
				}
				pdfReader.Close();
			}
			catch (Exception ex)
			{
				return "";
			}
		}
		return text.ToString();
	}

	void GetPersonalInfo(string PANNumber, string AssessmentYear)
	{
		
		try
		{
			PersonalInfo ci = PersonalInfo.GetUnique(AssessmentYear, PANNumber);
			if (ci == null)
			{
				ci = new PersonalInfo();
				ci.ID = 0;
				ci.PANNumber = PANNumber;
				ci.AssessmentYear = AssessmentYear;
				ci.DOB = Cmn.ToDate(Global.DOB);
				ci.FatherName = Global.FatherName;
				ci.Gender = Global.Gender;
				ci.Save();

				try
				{
					string PDF_New = Server.MapPath("~/Data/PDF/" + ci.ID + ".pdf");
					if (File.Exists(PDF_New))
						File.Delete(PDF_New);
                    
                    File.Move(Server.MapPath("~/Data/PDF/" + Global.PDFName), PDF_New); //Creating Form16 PDF by the ID of the candidate
				}
				catch (Exception eX)
				{ }
			}

			Global.CandidateID = (int)ci.ID;
			Global.AssessmentYear = AssessmentYear;
			Global.PANNumber = PANNumber;
			Global.EmailID = ci.EmailID;

			//aPermanentForm.HRef = "/permanent/" + ci.ID; //displaying data fetchd from PDF direcly on the form
		}
		catch (Exception ex)
		{

		}
	}
	protected void btnSaveBankInfo_Click(object sender, EventArgs e)
	{
		try
		{
			AdditionalInfo AI = AdditionalInfo.GetByCandidateID(Global.CandidateID);
			if (AI == null)
			{
				AI = new AdditionalInfo();
				AI.ID = 0;
				AI.CandidateID = Global.CandidateID;
			}

			//AI.BankAccountNumber = txtBankAccountNumber.Text;
			//AI.BankIFSC = txtBankIFSC.Text;
			//AI.AccountType = ddAccountType.Text;
			//AI.Save();
			ltStatus.Text = Global.SuccesMessage("Saved");

			pnlSummary.Visible = false;
			pnlPassword.Visible = false;
			pnlUploadPDF.Visible = false;
			pnlSuccess.Visible = true;
		}
		catch (Exception ex)
		{
			ltStatus.Text = Global.ErrorMessage("Error, not saved." + ex.Message);
		}
	}
}