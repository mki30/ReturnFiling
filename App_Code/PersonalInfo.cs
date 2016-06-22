using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using ReturnFilingModel;

namespace ReturnFilingModel
{
    public partial class PersonalInfo
    {
        public string Message = "";
        public PersonalInfo()
        {

        }

		public static PersonalInfo GetByEmailID(string EmailID)
		{
			using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
			{
				return context.PersonalInfoes.FirstOrDefault(m => m.EmailID == EmailID && m.AssessmentYear == Global.AssessmentYear);
			}
		}

        public static List<PersonalInfo> DataForAssesmentYear(string AssessmentYear, int UserType)
        {
            using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
            {
                if (UserType == -1)
                    return null;

                if (UserType == (int)RoleType.Master)
                    return context.PersonalInfoes.Where(m => m.AssessmentYear == AssessmentYear).ToList();
                else
                    return context.PersonalInfoes.Where(m => m.AssessmentYear == AssessmentYear && m.AssociateID == Global.UserID).ToList();
            }
        }


        public static PersonalInfo GetUnique(string AssessmentYear, string PANNumber)
        {
            using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
            {
				return context.PersonalInfoes.FirstOrDefault(m => m.AssessmentYear == AssessmentYear && m.PANNumber == PANNumber);
            }
        }


        public static PersonalInfo GetByID(int ID)
        {
            using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
            {
                return context.PersonalInfoes.FirstOrDefault(m => m.ID == ID);
            }
        }

        public int Save()
        {
            try
            {
                using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
                {
					PersonalInfo tempObj = null;

					if (ID != 0)
						tempObj = context.PersonalInfoes.FirstOrDefault(m => m.AssessmentYear == AssessmentYear && m.PANNumber == PANNumber);

                    Boolean IsNew = tempObj == null;

                    if (IsNew)
                    {
                        ID = 1;
                        try
                        {
                            ID = context.PersonalInfoes.Max(m => m.ID) + 1;
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
                        context.AddToPersonalInfoes(this);
                    else
                    {
                        if (tempObj != null)
                            context.CreateObjectSet<PersonalInfo>().Detach(tempObj);
                        context.CreateObjectSet<PersonalInfo>().Attach(this);
                        context.ObjectStateManager.ChangeObjectState(this, EntityState.Modified);
                    }
                    context.SaveChanges();
                }
                return (int)ID;
            }
            catch (Exception ex)
            {
                Cmn.LogError(ex, "PersonalInfo()");
                Message += ex.Message;
                return 0;
            }
        }

        public static PersonalInfo GetByPAN(string pan)
        {
            using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
            {
                return context.PersonalInfoes.FirstOrDefault(m => m.PANNumber == pan);
            }
        }
    }
}