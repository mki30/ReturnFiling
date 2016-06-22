using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using ReturnFilingModel;

namespace ReturnFilingModel
{
    public partial class UserManagement
    {
        public string Message = "";
		public UserManagement()
        {

        }

		public static String GetAssociateName(int AssociateID)
		{
			using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
			{
				UserManagement usr = context.UserManagements.FirstOrDefault(m => m.ID == AssociateID);
				return usr == null ? "" : usr.Name;
			}
		}

		public static List<UserManagement> GetAssociates()
		{
			using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
			{
				return context.UserManagements.Where(m => m.Role == (int)RoleType.Associate).OrderBy(m => m.Name).ToList();
			}
		}

		public static List<UserManagement> GetData()
		{
			using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
			{
				return context.UserManagements.OrderBy(m => m.Role).ThenBy(m=>m.Name).ToList();
			}
		}

		public static UserManagement GetUnique(string  Username, string Name)
        {
            using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
            {
				return context.UserManagements.FirstOrDefault(m => m.Username == Username && m.Name == Name);
            }
        }

		public static UserManagement GetByID(int ID)
        {
			using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
            {
				return context.UserManagements.FirstOrDefault(m => m.ID == ID);
            }
        }
		        
        public int Save()
        {
            try
            {
				using (ReturnFilingEntities context = new ReturnFilingEntities(Global.ConnectionStringEntity))
                {
					UserManagement tempObj;
					tempObj = context.UserManagements.FirstOrDefault(m => m.ID == ID);

					Boolean IsNew = tempObj == null;

                    if (IsNew)
                    {
                        ID = 1;
                        try
                        {
                            ID = context.UserManagements.Max(m => m.ID) + 1;
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
                        context.AddToUserManagements(this);
                    else
                    {
						if (tempObj != null)
							context.CreateObjectSet<UserManagement>().Detach(tempObj);
						context.CreateObjectSet<UserManagement>().Attach(this);
                        context.ObjectStateManager.ChangeObjectState(this, EntityState.Modified);
                    }
                    context.SaveChanges();
                }
                return ID;
            }
            catch (Exception ex)
            {
				Cmn.LogError(ex, "UserManagement()");
                Message += ex.Message;
                return 0;
            }
        }
    }
}

