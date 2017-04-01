using ProjectTrackerDataAccess;
using ProjectTrackerEntities;

namespace ProjectTrackerBusinessLogic
{
    public static class UserTypeLogic
    {
        public static Role GetRoleById(int id)
        {
            UserTypeDataAccess ut = new UserTypeDataAccess();

            return ut.GetRoleById(id);
        }
    }
}