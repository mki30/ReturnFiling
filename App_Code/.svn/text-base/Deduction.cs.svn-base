using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using ReturnFilingModel;
using System.Web.UI;


namespace ReturnFilingModel
{
    public partial class Deduction
    {
        public string Message = "";
        public Deduction()
        {

        }

		public static Dictionary<string, string> DeductionSectionNames = new Dictionary<string, string>();
		public static Dictionary<string, string> GetSectionNames()
		{
			DeductionSectionNames.Clear();
			DeductionSectionNames.Add("-1", "Select Section To Add");
			DeductionSectionNames.Add("80D", "Section 80D: Deductions for Medical Insurance");
			DeductionSectionNames.Add("80CCG", "Section 80CCG - Rajiv Gandhi Equity Saving Scheme");
			DeductionSectionNames.Add("80E", "Section 80E - Education Loan on higher studies (Graduate or PostGraduate)");
			DeductionSectionNames.Add("80EE", "Section 80EE - Interest on Home Loan");
			DeductionSectionNames.Add("80CCC", "Section 80CCC - Contribution to Pension Plan / Annuity Fund");
			DeductionSectionNames.Add("80CCD_1", "Section 80CCD(1) - Employee Contribution to New Pension Scheme (NPS)");
			DeductionSectionNames.Add("80CCD_2", "Section 80CCD(2) - Employer Contribution in NPS");
			DeductionSectionNames.Add("80GG", "Section 80GG - Deduction for House Rent. Self-employed or Salary with no HRA.");
			DeductionSectionNames.Add("80DDB", "Section 80DDB: Deductions for treatment of specified diseases and ailments");
			DeductionSectionNames.Add("80QQB", "Section 80QQB - Royalty Received on books");
			DeductionSectionNames.Add("80RRB", "Section 80RRB - Income on Patents/Inventions");
			DeductionSectionNames.Add("80GGA", "Section 80GGA - Contribution To Research or Rural Development");
			DeductionSectionNames.Add("80GGC", "Section 80GGC - Contribution To Political Party");
			DeductionSectionNames.Add("80JJA", "Section 80JJA");
			DeductionSectionNames.Add("80C", "Contributions to LIC, NSC, PF, PPF, Mutual Funds etc. You can claim a deduction of upto Rs 1 Lakh under this section.");
			DeductionSectionNames.Add("80TTA", "Deduction for Interest earned on Savings Bank Account.");
			return DeductionSectionNames;
		}


        public static Deduction GetUnique(int CandidateID, string SectionName)
        {
            using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
            {
                return context.Deductions.FirstOrDefault(m => m.CandidateID == CandidateID && m.SectionName == SectionName);
            }
        }

        public static Deduction GetByID(int ID)
        {
            using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
            {
                return context.Deductions.FirstOrDefault(m => m.ID == ID);
            }
        }

        public static List<Deduction> GetByCandidateID(int CandidateID)
        {
            using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
            {
                return context.Deductions.Where(m => m.CandidateID == CandidateID).ToList();
            }


        }
        public int Save()
        {
            try
            {
                using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
                {
					Deduction tempObj = null;
					if (ID != 0)
						tempObj = context.Deductions.FirstOrDefault(m => m.ID == ID);

                    Boolean IsNew = tempObj == null;

                    if (IsNew)
                    {
                        ID = 1;
						SequenceNumber = 1;
                        try
                        {
                            ID = context.Deductions.Max(m => m.ID) + 1;
							SequenceNumber = context.Deductions.Where(m=>m.CandidateID==CandidateID).Max(m => m.SequenceNumber) + 1;
							SequenceNumber = SequenceNumber == null ? 1 : SequenceNumber;
                        }
                        catch (Exception ex)
                        {
                            ID = 1;
                        }
                        IsNew = true;
                    }
                    else
                        ID = tempObj.ID;
                    LUDate = DateTime.Now;
                    if (IsNew)
                        context.AddToDeductions(this);
                    else
                    {
                        if (tempObj != null)
                            context.CreateObjectSet<Deduction>().Detach(tempObj);
                        context.CreateObjectSet<Deduction>().Attach(this);
                        context.ObjectStateManager.ChangeObjectState(this, EntityState.Modified);
                    }
                    context.SaveChanges();
                }
                return ID;
            }
            catch (Exception ex)
            {
                Cmn.LogError(ex, "Deduction()");
                Message += ex.Message;
                return 0;
            }
        }
    }
}

