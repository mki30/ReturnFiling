using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using ReturnFilingModel;
using System.Web.UI;


namespace ReturnFilingModel
{
    public partial class TDSEntry
    {
        public string Message = "";
        public TDSEntry()
        {

        }

        public static TDSEntry GetByID(int ID)
        {
            using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
            {
                return context.TDSEntries.FirstOrDefault(m => m.ID == ID);
            }
        }

        public static List<TDSEntry> GetByCandidateID(int CandidateID)
        {
            using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
            {
                return context.TDSEntries.Where(m => m.CandidateID == CandidateID).ToList();
            }
        }

        public int Save()
        {
            try
            {
                using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
                {
					TDSEntry tempObj = null;
					if (ID != 0)
						tempObj = context.TDSEntries.FirstOrDefault(m => m.ID == ID);

                    Boolean IsNew = tempObj == null;

                    if (IsNew)
                    {
                        ID = 1;
                        SequenceNumber = 1;
                        try
                        {
							ID = context.TDSEntries.Max(m => m.ID) + 1;
                            SequenceNumber = context.TDSEntries.Where(m => m.CandidateID == CandidateID).Max(m => m.SequenceNumber) + 1;
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
                        context.AddToTDSEntries(this);
                    else
                    {
                        if (tempObj != null)
                            context.CreateObjectSet<TDSEntry>().Detach(tempObj);
                        context.CreateObjectSet<TDSEntry>().Attach(this);
                        context.ObjectStateManager.ChangeObjectState(this, EntityState.Modified);
                    }
                    context.SaveChanges();
                }
                return ID;
            }
            catch (Exception ex)
            {
                Cmn.LogError(ex, "TDSEntry()");
                Message += ex.Message;
                return 0;
            }
        }

        public static List<TDSEntry> GetByCandidateIDandFinancialYear(int CandidateID, int FinancialYear)
        {
            using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
            {
                return context.TDSEntries.Where(m => m.CandidateID == CandidateID && m.FinancialYear == FinancialYear).ToList();
            }
        }
    }
}

