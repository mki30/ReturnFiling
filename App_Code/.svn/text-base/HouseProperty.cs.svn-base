using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using ReturnFilingModel;

namespace ReturnFilingModel
{
    public partial class HouseProperty
    {
        public string Message = "";
		public HouseProperty()
        {

        }

		public static List<HouseProperty> GetByCandidateID(int CandidateID)
		{
			using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
			{
				return context.HouseProperties.Where(m => m.CandidateID == CandidateID).ToList();
			}
		}

		public static HouseProperty GetByID(int ID)
        {
			using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
            {
				return context.HouseProperties.FirstOrDefault(m => m.ID == ID);
            }
        }
		        
        public int Save()
        {
            try
            {
				using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
                {
					HouseProperty tempObj = null;
					if (ID != 0)
						tempObj = context.HouseProperties.FirstOrDefault(m => m.ID == ID && m.CandidateID==CandidateID);

					Boolean IsNew = tempObj == null;

                    if (IsNew)
                    {
                        ID = 1;
                        try
                        {
                            ID = context.HouseProperties.Max(m => m.ID) + 1;
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
                        context.AddToHouseProperties(this);
                    else
                    {
						if (tempObj != null)
							context.CreateObjectSet<HouseProperty>().Detach(tempObj);
						context.CreateObjectSet<HouseProperty>().Attach(this);
                        context.ObjectStateManager.ChangeObjectState(this, EntityState.Modified);
                    }
                    context.SaveChanges();
                }
                return ID;
            }
            catch (Exception ex)
            {
				Cmn.LogError(ex, "HouseProperty()");
                Message += ex.Message;
                return 0;
            }
        }
    }
}

