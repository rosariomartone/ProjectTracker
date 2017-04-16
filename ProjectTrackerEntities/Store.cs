using System;

using ProjectTrackerEnum;

namespace ProjectTrackerEntities
{
    public class Store
    {
        public Int64 Id { get; set; }

        public string Name { get; set; }

        public Client Client { get; set; }
    }
}
