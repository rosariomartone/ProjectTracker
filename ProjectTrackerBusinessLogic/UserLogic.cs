using ProjectTrackerEntities;
using ProjectTrackerDataAccess;
using System.Collections.Generic;

namespace ProjectTrackerBusinessLogic
{
    public static class UserLogic
    {
        public static BaseUser GetUser(string username, string password)
        {
            UserDataAccess u = new UserDataAccess();

            return u.GetUser(username, password);
        }

        public static List<BaseUser> GetUsers()
        {
            UserDataAccess u = new UserDataAccess();

            return u.GetUsers();
        }

        public static long RegisterNewUser(ClientUser user)
        {
            UserDataAccess u = new UserDataAccess();

            return u.RegisterNewUser(user);
        }

        public static long RetrieveUser(ClientUser user)
        {
            UserDataAccess u = new UserDataAccess();

            return u.RetrieveUser(user);
        }

        public static int SaveUserSettings(BaseUser user)
        {
            UserDataAccess u = new UserDataAccess();

            return u.SaveUserSettings(user);
        }
    }
}
