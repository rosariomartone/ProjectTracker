using System;

using ProjectTrackerEnum;

namespace ProjectTrackerEntities
{
    public class Department
    {
        public Int64 Id { get; set; }

        public string Name { get; set; }

        public Store Store { get; set; }
    }
}
