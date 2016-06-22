using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using ReturnFilingModel;
using System.Web.UI;


namespace ReturnFilingModel
{
    public partial class Asset
    {
        public string Message = "";
		public Asset()
        {

        }


		public static Asset GetUnique(int CandidateID, string Particular)
        {
            using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
            {
                return context.Assets.FirstOrDefault(m => m.CandidateID == CandidateID && m.Particular == Particular);
            }
        }

		public static Asset GetByID(int ID)
        {
            using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
            {
                return context.Assets.FirstOrDefault(m => m.ID == ID);
            }
        }

		public static List<Asset> GetByCandidateID(int CandidateID)
        {
            using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
            {
                return context.Assets.Where(m => m.CandidateID == CandidateID).ToList();
            }


        }
        public int Save()
        {
            try
            {
                using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
                {
					Asset tempObj = null;
					if (ID != 0)
						tempObj = context.Assets.FirstOrDefault(m => m.ID == ID);

                    Boolean IsNew = tempObj == null;

                    if (IsNew)
                    {
                        ID = 1;
						SequenceNumber = 1;
                        try
                        {
                            ID = context.Assets.Max(m => m.ID) + 1;
							SequenceNumber = context.Assets.Where(m=> m.CandidateID==CandidateID).Max(m => m.SequenceNumber) + 1;
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
                        context.AddToAssets(this);
                    else
                    {
                        if (tempObj != null)
							context.CreateObjectSet<Asset>().Detach(tempObj);
						context.CreateObjectSet<Asset>().Attach(this);
                        context.ObjectStateManager.ChangeObjectState(this, EntityState.Modified);
                    }
                    context.SaveChanges();
                }
                return ID;
            }
            catch (Exception ex)
            {
				Cmn.LogError(ex, "Asset()");
                Message += ex.Message;
                return 0;
            }
        }
    }
}

