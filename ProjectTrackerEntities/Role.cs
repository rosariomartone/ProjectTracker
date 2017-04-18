using System;

using ProjectTrackerEnum;
using System.Collections.Generic;

namespace ProjectTrackerEntities
{
    public class Role
    {
        public Int64 RoleId { get; set; }

        public string Name { get; set; }

        public UserEnumeration UserType { get; set; }

        public List<MenuBarVoices> Menu { get; set; }
    }
}
