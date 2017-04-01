using System;

using ProjectTrackerEnum;

namespace ProjectTrackerEntities
{
    public class Role
    {
        public Int64 Id { get; set; }

        public string Name { get; set; }

        public UserEnumeration UserType { get; set; }
    }
}
