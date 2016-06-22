using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace ReturnFilingModel
{
    public partial class CapitalGain
    {
        public string Message = "";
        public CapitalGain()
        {

        }

		public static List<CapitalGain> GetByCandidateID(int CandidateID)
		{
			using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
			{
				return context.CapitalGains.Where(m => m.CandidateID == CandidateID).ToList();
			}
		}

        public static CapitalGain GetByID(int CandidateID, int ID)
        {
            using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
            {
                return context.CapitalGains.FirstOrDefault(m => m.ID == ID && m.CandidateID == CandidateID);
            }
        }

        public int Save()
        {
            try 
            {
                using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
                {
                    CapitalGain tempObj=null;

					if (ID != 0)
						tempObj = context.CapitalGains.FirstOrDefault(m => m.ID == ID && m.CandidateID == CandidateID);

                    Boolean IsNew = tempObj == null;

                    if (IsNew)
                    {
                        ID = 1;
						SequenceNumber = 1;
                        try
                        {
                            ID = context.CapitalGains.Max(m => m.ID) + 1;
							SequenceNumber = context.CapitalGains.Where(m => m.CandidateID == CandidateID).Max(m => m.ID) + 1;
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
                        context.AddToCapitalGains(this);
                    else
                    {
                        if (tempObj != null)
                            context.CreateObjectSet<CapitalGain>().Detach(tempObj);
                        context.CreateObjectSet<CapitalGain>().Attach(this);
                        context.ObjectStateManager.ChangeObjectState(this, EntityState.Modified);
                    }
                    context.SaveChanges();
                }
                return ID;
            }
            catch (Exception ex)
            {
                Cmn.LogError(ex, "CapitalGain()");
                Message += ex.Message;
                return 0;
            }
        }
    }
}
