﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlServerCe;

public class DBCheck
{
	//CheckDatabase
	//CheckTable

	public static void RunSQLFile(DatabaseCE db, string data)
	{
		string[] Commands = data.Split(new string[] { "GO\r\n" }, StringSplitOptions.RemoveEmptyEntries);
		IDbCommand cmd = new SqlCeCommand();
		cmd.Connection = db.myconnection;
		foreach (string s in Commands)
		{
			cmd.CommandText = s;
			cmd.ExecuteNonQuery();
		}
	}

	public static void CheckTable(DatabaseCE db, string TableName, Dictionary<string, string> Fields, string[] PrimaryKeys)
	{
		//fields to be added to all table
		//Fields.Add("ObjectType", "[int]");
		Fields.Add("LUDate", "[datetime]");
		Fields.Add("LUBy", "[nvarchar](50)");
		//Fields.Add("MachineID", "[nvarchar](36)");
		//Fields.Add("DirtyFlag", "[int]"); // 1-Servr Updated 2-Owner Update 3- Other Client Update

		//create table
		string SQL = "CREATE TABLE [" + TableName + "] (";
		string PK = " PRIMARY KEY (";
		foreach (string s in PrimaryKeys)
		{
			SQL += " [" + s + "] " + Fields[s] + ",";
			PK += " [" + s + "] " + ",";
		}

		PK = PK.Substring(0, PK.Length - 1) + ") ";
		SQL = SQL + PK + ") ";

		string err = db.RunQuery(SQL);

		//check for fields
		foreach (string s in Fields.Keys)
		{
			string Err = db.RunQuery("ALTER TABLE [" + TableName + "] ADD [" + s + "] " + Fields[s]);
		}
	}

	public static Boolean UpdateDBStructure(DatabaseCE db, int Counter)
	{
		Dictionary<string, string> fields = new Dictionary<string, string>();

		switch (Counter)
		{
			case 1://
				fields.Add("ID", "[int]");
				fields.Add("FinancialYear", "[int]");
				fields.Add("AssessmentYear", "[int]");
				fields.Add("EmployerName", "[nvarchar](100)");
				fields.Add("EmployeeName", "[nvarchar](100)");
				fields.Add("DeductorPan", "[nvarchar](50)");
				fields.Add("EmployeePan", "[nvarchar](50)");
				fields.Add("CITTDS", "[nvarchar](50)");
				CheckTable(db, "Refund", fields, new string[] { "ID" });
				break;

			case 2://PersonalInfo
				fields.Add("ID", "[int]");
				fields.Add("PANNumber", "[nvarchar](15)");
				fields.Add("AssessmentYear", "[nvarchar](10)");
				fields.Add("FirstName", "[nvarchar](30)");
				fields.Add("MiddleName", "[nvarchar](30)");
				fields.Add("LastName", "[nvarchar](30)");
				fields.Add("Gender", "[int]");
				fields.Add("DOB", "[datetime]");
				fields.Add("FatherName", "[nvarchar](50)");
				fields.Add("Address1", "[nvarchar](50)");
				fields.Add("Address2", "[nvarchar](50)");
				fields.Add("Area", "[nvarchar](50)");
				fields.Add("City", "[nvarchar](50)");
				fields.Add("State", "[nvarchar](50)");
				fields.Add("Country", "[nvarchar](50)");
				fields.Add("PinCode", "[nvarchar](6)");
				fields.Add("EmailID", "[nvarchar](60)");
				fields.Add("Mobile", "[nvarchar](10)");
				fields.Add("AssociateID", "[int]");
				fields.Add("Status", "[int]");
				CheckTable(db, "PersonalInfo", fields, new string[] { "AssessmentYear" });
				break;

			case 3://Salary
				fields.Add("ID", "[int]");
				fields.Add("CandidateID", "[int]");
				fields.Add("SequenceNumber", "[int]");
				fields.Add("ChargeableIncome", "[float]");
				fields.Add("NameOfEmployer", "[nvarchar](50)");
				fields.Add("EmployerType", "[nvarchar](20)");

				fields.Add("EmployerTAN", "[nvarchar](20)");
				fields.Add("TaxDeducted", "[float]");

				fields.Add("EmployerAddress", "[nvarchar](100)");
				fields.Add("EmployerCity", "[nvarchar](50)");
				fields.Add("EmployerState", "[nvarchar](50)");
				fields.Add("EmployerPinCode", "[nvarchar](6)");

				CheckTable(db, "Salary", fields, new string[] { "ID" });
				break;

			case 4://OtherIncome
				fields.Add("ID", "[int]");
				fields.Add("CandidateID", "[int]");
				fields.Add("IncomeFromSavingBankAndPostOffice", "[float]");
				fields.Add("IncomeFromFixedDeposits", "[float]");
				fields.Add("AnyOtherIncome", "[float]");

				//Exempt Income
				fields.Add("DividendEarned", "[float]");
				fields.Add("ExemptInterestIncome", "[float]");
				fields.Add("MiscExemptIncome", "[float]");
				fields.Add("AgricultureIncome", "[float]");

				CheckTable(db, "OtherIncome", fields, new string[] { "ID" });
				break;

			case 5://HouseProperty
				fields.Add("ID", "[int]");
				fields.Add("CandidateID", "[int]");
				fields.Add("InterestOnSelfOccupiedProperty", "[float]");
				fields.Add("PreConsFinancialYear", "[int]");
				fields.Add("PreConsTotalInterest", "[float]");
				fields.Add("Address1", "[nvarchar](30)");
				fields.Add("Address2", "[nvarchar](30)");
				fields.Add("Area", "[nvarchar](30)");
				fields.Add("City", "[nvarchar](30)");
				fields.Add("State", "[nvarchar](30)");
				fields.Add("PinCode", "[nvarchar](6)");
				fields.Add("OwnershipShare", "[float]");

				fields.Add("CoOwnerName", "[nvarchar](50)");
				fields.Add("CoOwnerPAN", "[nvarchar](20)");
				fields.Add("CoOwnerShare", "[nvarchar](20)");

				CheckTable(db, "HouseProperty", fields, new string[] { "ID" });
				break;

			case 6://Deduction
				fields.Add("ID", "[int]");
				fields.Add("CandidateID", "[int]");
				fields.Add("SequenceNumber", "[int]");
				fields.Add("SectionName", "[nvarchar](20)");
				fields.Add("Data1", "[nvarchar](20)");
				fields.Add("Data2", "[nvarchar](20)");
				fields.Add("Data3", "[nvarchar](20)");
				fields.Add("Amount", "[float]");
				CheckTable(db, "Deduction", fields, new string[] { "ID" });
				break;

			case 7://CapitalGain
				fields.Add("ID", "[int]");
				fields.Add("CandidateID", "[int]");
				fields.Add("SequenceNumber", "[int]");
				fields.Add("AssetSold", "[nvarchar](200)");
				fields.Add("SalePrice", "[float]");
				fields.Add("ValueOfProperty", "[float]");
				fields.Add("TransferExpenses", "[float]");
				fields.Add("PurchasePrice", "[float]");
				fields.Add("DateOfSale", "[datetime]");
				fields.Add("DateOfPurchase", "[datetime]");
				fields.Add("STTPaid", "[int]");
				fields.Add("TypeOfShare", "[nvarchar](20)");
				fields.Add("InvestmentUnder54", "[float]");
				fields.Add("InvestmentUnder54EC", "[float]");
				fields.Add("InvestmentUnder54F", "[float]");
				fields.Add("Type", "[int]");//Capital Gain Type
				CheckTable(db, "CapitalGain", fields, new string[] { "ID" });
				break;

			case 8://Asset
				fields.Add("ID", "[int]");
				fields.Add("CandidateID", "[int]");
				fields.Add("SequenceNumber", "[int]");
				fields.Add("Particular", "[nvarchar](30)");
				fields.Add("Cost", "[float]");
				fields.Add("Liability", "[float]");
				CheckTable(db, "Asset", fields, new string[] { "ID" });
				break;

			case 9://Donation
				fields.Add("ID", "[int]");
				fields.Add("CandidateID", "[int]");
				fields.Add("SequenceNumber", "[int]");
				fields.Add("Amount", "[float]");
				fields.Add("NameOfDonee", "[nvarchar](30)");
				fields.Add("PANOfDonee", "[nvarchar](10)");
				fields.Add("LimitOfDeduction", "[nvarchar](20)");
				fields.Add("QualifyingPercentage", "[nvarchar](5)");
				fields.Add("AddressOfDonee", "[nvarchar](50)");
				fields.Add("CityOfDonee", "[nvarchar](20)");
				fields.Add("StateOfDonee", "[nvarchar](30)");
				fields.Add("PinCodeOfDonee", "[nvarchar](6)");
				CheckTable(db, "Donation", fields, new string[] { "ID" });
				break;

			case 10://TDS
				fields.Add("ID", "[int]");
				fields.Add("CandidateID", "[int]");
				fields.Add("SequenceNumber", "[int]");
				fields.Add("DeductorTAN", "[nvarchar](20)");
				fields.Add("DeductorName", "[nvarchar](100)");
				fields.Add("ToatalTaxDeducted", "[float]");
				fields.Add("ToatalDeductedClaimed", "[float]");
				fields.Add("FinancialYear", "[int]");
				CheckTable(db, "TDSEntry", fields, new string[] { "ID" });
				break;

			case 11://AdvanceTax
				fields.Add("ID", "[int]");
				fields.Add("CandidateID", "[int]");
				fields.Add("SequenceNumber", "[int]");
				fields.Add("AmountDeposited", "[float]");
				fields.Add("DateOfDeposit", "[datetime]");
				fields.Add("BSRCode", "[nvarchar](20)");
				fields.Add("ChallanNo", "[nvarchar](20)");
				CheckTable(db, "AdvanceTax", fields, new string[] { "ID" });
				break;

			case 12://UserManagement
				fields.Add("ID", "[int]");
				fields.Add("Name", "[nvarchar](30)");
				fields.Add("Username", "[nvarchar](20)");
				fields.Add("Password", "[nvarchar](10)");
				fields.Add("Role", "[int]");
				CheckTable(db, "UserManagement", fields, new string[] { "ID" });
				break;

			case 13://AdditionalInfo
				fields.Add("ID", "[int]");
				fields.Add("CandidateID", "[int]");
				fields.Add("IncomeTaxWard", "[nvarchar](50)");
				fields.Add("EmailID", "[nvarchar](30)");
				fields.Add("SecondayEmailID", "[nvarchar](30)");
				fields.Add("Mobile", "[nvarchar](10)");
				fields.Add("SecondaryMobile", "[nvarchar](10)");
				fields.Add("STDCode", "[nvarchar](5)");
				fields.Add("Phone", "[nvarchar](10)");
				fields.Add("BankAccountNumber", "[nvarchar](20)");
				fields.Add("BankIFSC", "[nvarchar](10)");
				fields.Add("AccountType", "[nvarchar](20)");
				fields.Add("ReliefUnder89", "[float]");
				CheckTable(db, "AdditionalInfo", fields, new string[] { "ID" });
				break;

			default:
				return false;
		}
		return true;
	}
}

