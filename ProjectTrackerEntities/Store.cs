﻿using System;

using ProjectTrackerEnum;

namespace ProjectTrackerEntities
{
    public class Store
    {
        public Int64 Id { get; set; }

        public string Name { get; set; }

        public Company Company { get; set; }
    }
}
