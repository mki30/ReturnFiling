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

public partial class Form16 : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {

        string password = "AMOPK6862A29101976";
        string pdfFile = Server.MapPath("/Data/PDF/1.pdf");
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
            string[] Lines = ReadPdfFile(pdfFile, password).Split('\n');

            //GetSalaryDetails(Lines);
            string PANNumber = "", AssessmentYear = "", PANoftheDeductor = "",
                  TanOfDeductor = "", NameOfEmployer = "",
                  AddressOfEmployer = "", NameOfEmployee = "", 
                  AddressOfEmployee = "", EmployerEMail = "",
                  TaxableIncomeFromSalary="",GrossTotalIncome = "",
                  TotalDeductions="",TotalIncome="",
                  TaxPayble="",TaxPaid="",Refund="";
            
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
                        break;
                    case "PAN of the Deductor":
                        PANoftheDeductor=PANoftheDeductor==""?Lines[ctr + 1]:PANoftheDeductor;
                        break;
                    case "TAN of the Deductor":
                        TanOfDeductor = TanOfDeductor == "" ? Lines[ctr + 1] : TanOfDeductor;
                        break;
                    case "Name and address of the Employer":
                        int subctr=1;
                        NameOfEmployer = NameOfEmployer == "" ? Lines[ctr + subctr] : NameOfEmployer;
                        while (Lines[ctr + subctr+1] != "Name and address of the Employee")
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
                        
                        while (Lines[ctr + subctr1+1] != "PAN of the Deductor")
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
                        TotalDeductions = TotalDeductions == "" ? Lines[ctr + 3] : GrossTotalIncome;
                        TotalIncome = TotalIncome == "" ? Lines[ctr + 4] : TotalIncome;
                        TaxPayble = TaxPayble == "" ? Lines[ctr + 10] : TaxPayble;
                        break;
                    case "d)Date of payment into Government treasury Various dates as mentioned on Part A of the Form 16":
                        TaxPaid=TaxPaid==""?Lines[ctr-1].Replace("c)Total Tax Paid",""):Lines[ctr-1];
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

            //string str = "<table border=1>";
            //for (int i = 0; i < Fields.Length; i++)
            //    str += "<tr><td>" + Fields[i] + "<td>" + FieldData[i];
            //str += "</table>";
            //Response.Write(str);

            string str1 = "Pan Of the Employee - " + PANNumber;
            str1 += "<br/>PAN Of deductor - " + PANoftheDeductor;
            str1 += "<br/>Tan Of Deductor - " + TanOfDeductor;
            str1 += "<br/>Assessment Year - " + AssessmentYear;
            str1 += "<br/> Name Of  Employer - " + NameOfEmployer;
            str1 += "<br/> Address Of  Employer - " + AddressOfEmployer;
            str1 += "<br/> EMail Of Employer - " + EmployerEMail;
            str1 += "<br/> Name Of  Employee - " + NameOfEmployee;
            str1 += "<br/> Address Of Employee - " + AddressOfEmployee;
            str1 += "<br/> Taxable Income From Salary - " + TaxableIncomeFromSalary;
            str1 += "<br/> Gross Total Income - " + GrossTotalIncome;
            str1 += "<br/> Deductible Amount - " + TotalDeductions;
            str1 += "<br/> Total Income - " + TotalIncome;
            str1 += "<br/> Tax Payble - " + TaxPayble;
            str1 += "<br/> Total Tax Paid - " + TaxPaid;
            str1 += "<br/>~~~~~~~~~~~~~~~~~~~~<br/>";
            Response.Write(str1);
            Response.Write(ReadPdfFile(pdfFile, password).Replace("\n", "<br/>"));
        }
        catch (Exception ex)
        {
        }

    }

    void GetSalaryDetails(string[] Lines)
    {
        int step = 0;

        Form16Data form16 = new Form16Data();

        for(int i=0;i<Lines.Length;i++)
        {
            if (Lines[i].Contains("80CCD(1) shall not exceed one lakh rupees"))
                step=1;
            
            //if (Lines[i].Contains("10.Aggregate of deductible amount under Chapter VI-A"))
            //    step = 3;

            switch(step)
            {
                case 1: if (Lines[i]== "Rs.") step++; break;  
                case 2:
                    //read next 6
                    form16._1_GrossSalary =(int) Cmn.ToDbl(Lines[i]);
                    form16._1a_GrossSalary = (int)Cmn.ToDbl(Lines[i + 1]);
                    form16._1b_GrossSalary = Cmn.ToInt(Lines[i + 2]);
                    form16._1c_GrossSalary = Cmn.ToInt(Lines[i + 3]);
                    form16._2_Allowance = Cmn.ToInt(Lines[i + 4]);
                    form16._4a_Deductions = Cmn.ToInt(Lines[i + 5]);
                    form16._4b_Deductions = Cmn.ToInt(Lines[i + 6]);
                    i += 6;
                    break;
                case 3:
                    break;
            }

        }
     }

    public string ReadPdfFile(string fileName, string password)
    {
        StringBuilder text = new StringBuilder();
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
                throw;
            }
        }
        return text.ToString();
    }
}