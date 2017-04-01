using System.Collections.Generic;

using ProjectTrackerEntities;
using ProjectTrackerEnum;

namespace ProjectTrackerFactory
{
    public class UserFactory
    {
        private static Dictionary<UserEnumeration, BaseUser> customerFact = new Dictionary<UserEnumeration, BaseUser>();

        public static BaseUser getUser(Role role)
        {
            if (customerFact.Count == 0)
            {
                customerFact.Add(UserEnumeration.ClientUser, new ClientUser());
                customerFact.Add(UserEnumeration.ProximaUser, new ProximaUser());
            }
            
            BaseUser user = customerFact[role.UserType];

            return user;
        }
    }
}
