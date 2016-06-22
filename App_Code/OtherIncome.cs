using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using ReturnFilingModel;

namespace ReturnFilingModel
{
    public partial class OtherIncome
    {
        public string Message = "";
		public OtherIncome()
        {

        }

		public static OtherIncome GetByID(int CandidateID, int ID)
        {
			using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
            {
				return context.OtherIncomes.FirstOrDefault(m => m.ID == ID && m.CandidateID == CandidateID);
            }
        }
		        
        public int Save()
        {
            try
            {
				using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
                {
					OtherIncome tempObj = null;
					if (ID != 0)
						tempObj = context.OtherIncomes.FirstOrDefault(m => m.ID == ID && m.CandidateID==CandidateID);

					Boolean IsNew = tempObj == null;

                    if (IsNew)
                    {
                        ID = 1;
                        try
                        {
                            ID = context.OtherIncomes.Max(m => m.ID) + 1;
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
                        context.AddToOtherIncomes(this);
                    else
                    {
						if (tempObj != null)
							context.CreateObjectSet<OtherIncome>().Detach(tempObj);
						context.CreateObjectSet<OtherIncome>().Attach(this);
                        context.ObjectStateManager.ChangeObjectState(this, EntityState.Modified);
                    }
                    context.SaveChanges();
                }
                return ID;
            }
            catch (Exception ex)
            {
				Cmn.LogError(ex, "OtherIncome()");
                Message += ex.Message;
                return 0;
            }
        }

        //public static OtherIncome GetByCandidateID(int CandidateID)
        //{
            
        //}
    }
}

