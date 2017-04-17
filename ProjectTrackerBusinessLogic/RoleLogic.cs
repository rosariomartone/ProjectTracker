using ProjectTrackerEntities;
using ProjectTrackerDataAccess;
using System.Collections.Generic;
using System;

namespace ProjectTrackerBusinessLogic
{
    public class RoleLogic
    {
        public static Int64 GetRoleByName(string name)
        {
            RoleDataAccess role = new RoleDataAccess();

            return role.GetRoleByName(name);
        }
    }
}
