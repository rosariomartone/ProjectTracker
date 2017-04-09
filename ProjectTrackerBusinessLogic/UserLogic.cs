using ProjectTrackerEntities;
using ProjectTrackerDataAccess;

namespace ProjectTrackerBusinessLogic
{
    public static class UserLogic
    {
        public static BaseUser GetUser(string username, string password)
        {
            UserDataAccess u = new UserDataAccess();

            return u.GetUser(username, password);
        }

        public static long RegisterNewUser(ClientUser user)
        {
            UserDataAccess u = new UserDataAccess();

            return u.RegisterNewUser(user);
        }
    }
}
