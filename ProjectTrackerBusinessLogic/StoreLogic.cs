using ProjectTrackerEntities;
using ProjectTrackerDataAccess;
using System.Collections.Generic;
using System;

namespace ProjectTrackerBusinessLogic
{
    public class StoreLogic
    {
        public static List<Store> GetStores()
        {
            StoreDataAccess store = new StoreDataAccess();

            return store.GetStores();
        }
    }
}
