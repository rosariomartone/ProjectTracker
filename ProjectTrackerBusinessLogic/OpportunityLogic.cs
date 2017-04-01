using System.Collections.Generic;

using ProjectTrackerEntities;
using ProjectTrackerDataAccess;

namespace ProjectTrackerBusinessLogic
{
    public static class OpportunityLogic
    {
        public static List<Opportunity> GetOpportunities()
        {
            OpportunityDataAccess o = new OpportunityDataAccess();

            return o.GetOpportunities();
        }
    }
}
