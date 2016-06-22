using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using ReturnFilingModel;

namespace ReturnFilingModel
{
	public partial class AdditionalInfo
	{
		public string Message = "";
		public AdditionalInfo()
		{

		}

		public static AdditionalInfo GetByCandidateID(int CandidateID)
		{
			using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
			{
				return context.AdditionalInfoes.FirstOrDefault(m => m.CandidateID == CandidateID);
			}
		}

		public static AdditionalInfo GetByID(int ID)
		{
			using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
			{
				return context.AdditionalInfoes.FirstOrDefault(m => m.ID == ID);
			}
		}

		public int Save()
		{
			try
			{
				using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
				{
					AdditionalInfo tempObj = null;

					if (ID != 0)
						tempObj = context.AdditionalInfoes.FirstOrDefault(m => m.CandidateID == CandidateID);

					Boolean IsNew = tempObj == null;

					if (IsNew)
					{
						ID = 1;
						try
						{
							ID = context.AdditionalInfoes.Max(m => m.ID) + 1;
							ID = ID == null ? 1 : ID;
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
						context.AddToAdditionalInfoes(this);
					else
					{
						if (tempObj != null)
							context.CreateObjectSet<AdditionalInfo>().Detach(tempObj);
						context.CreateObjectSet<AdditionalInfo>().Attach(this);
						context.ObjectStateManager.ChangeObjectState(this, EntityState.Modified);
					}
					context.SaveChanges();
				}
				return (int)ID;
			}
			catch (Exception ex)
			{
				Cmn.LogError(ex, "AdditionalInfo()");
				Message += ex.Message;
				return 0;
			}
		}
	}
}