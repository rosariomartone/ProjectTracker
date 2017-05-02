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

        public static BaseUser CheckUser(string username, string password)
        {
            UserDataAccess u = new UserDataAccess();

            return u.CheckUser(username, password);
        }

        public static long ChangeUser(long userID, string password)
        {
            UserDataAccess u = new UserDataAccess();

            return u.ChangeUser(userID, password);
        }

        public static long GetUserIdByEMail(string email)
        {
            UserDataAccess u = new UserDataAccess();

            return u.GetUserIdByEmail(email);
        }

        public static BaseUser GetUserIdByToken(string token)
        {
            UserDataAccess u = new UserDataAccess();

            return u.GetUserIdByToken(token);
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

        public static int SaveUserSettings_Delete(BaseUser user)
        {
            UserDataAccess u = new UserDataAccess();

            return u.SaveUserSettings_Delete(user);
        }
    }
}
