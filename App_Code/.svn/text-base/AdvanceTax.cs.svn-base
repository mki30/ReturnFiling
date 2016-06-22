using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using ReturnFilingModel;
using System.Web.UI;


namespace ReturnFilingModel
{
    public partial class AdvanceTax
    {
        public string Message = "";
        public AdvanceTax()
        {

        }

        public static AdvanceTax GetByID(int ID)
        {
            using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
            {
                return context.AdvanceTaxes.FirstOrDefault(m => m.ID == ID);
            }
        }

        public static List<AdvanceTax> GetByCandidateID(int CandidateID)
        {
            using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
            {
                return context.AdvanceTaxes.Where(m => m.CandidateID == CandidateID).ToList();
            }
        }

        public int Save()
        {
            try
            {
                using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
                {
                    AdvanceTax tempObj=null;
					if(ID!=0)
						tempObj = context.AdvanceTaxes.FirstOrDefault(m => m.ID == ID);

                    Boolean IsNew = tempObj == null;

                    if (IsNew)
                    {
                        ID = 1;
                        SequenceNumber = 1;
                        try
                        {
							ID = context.AdvanceTaxes.Max(m => m.ID) + 1;
                            SequenceNumber = context.AdvanceTaxes.Where(m => m.CandidateID == CandidateID).Max(m => m.SequenceNumber) + 1;
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
                        context.AddToAdvanceTaxes(this);
                    else
                    {
                        if (tempObj != null)
                            context.CreateObjectSet<AdvanceTax>().Detach(tempObj);
                        context.CreateObjectSet<AdvanceTax>().Attach(this);
                        context.ObjectStateManager.ChangeObjectState(this, EntityState.Modified);
                    }
                    context.SaveChanges();
                }
                return ID;
            }
            catch (Exception ex)
            {
                Cmn.LogError(ex, "AdvanceTax()");
                Message += ex.Message;
                return 0;
            }
        }
	}
}