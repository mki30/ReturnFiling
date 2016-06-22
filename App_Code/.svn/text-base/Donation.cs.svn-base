using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using ReturnFilingModel;
using System.Web.UI;


namespace ReturnFilingModel
{
    public partial class Donation
    {
        public string Message = "";
        public Donation()
        {

        }

        public static Donation GetByID(int ID)
        {
            using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
            {
                return context.Donations.FirstOrDefault(m => m.ID == ID);
            }
        }

        public static List<Donation> GetByCandidateID(int CandidateID)
        {
            using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
            {
                return context.Donations.Where(m => m.CandidateID == CandidateID).ToList();
            }
        }

        public int Save()
        {
            try
            {
                using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
                {
					Donation tempObj = null;
					if (ID != 0)
						tempObj = context.Donations.FirstOrDefault(m => m.ID == ID);

                    Boolean IsNew = tempObj == null;

                    if (IsNew)
                    {
                        ID = 1;
                        SequenceNumber = 1;
                        try
                        {
                            ID = context.Donations.Max(m => m.ID) + 1;
                            SequenceNumber = context.Donations.Where(m => m.CandidateID == CandidateID).Max(m => m.SequenceNumber) + 1;
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
                        context.AddToDonations(this);
                    else
                    {
                        if (tempObj != null)
                            context.CreateObjectSet<Donation>().Detach(tempObj);
                        context.CreateObjectSet<Donation>().Attach(this);
                        context.ObjectStateManager.ChangeObjectState(this, EntityState.Modified);
                    }
                    context.SaveChanges();
                }
                return ID;
            }
            catch (Exception ex)
            {
                Cmn.LogError(ex, "Donation()");
                Message += ex.Message;
                return 0;
            }
        }
    }
}

