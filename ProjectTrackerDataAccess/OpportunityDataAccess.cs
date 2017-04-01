using System;

using ProjectTrackerEntities;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using ProjectTrackerFactory;
using System.Collections.Generic;

namespace ProjectTrackerDataAccess
{
    public class OpportunityDataAccess
    {
        public List<Opportunity> GetOpportunities()
        {
            List<Opportunity> opportunities = new List<Opportunity>();

            var connectionString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;

            using (var connection = new SqlConnection(connectionString))
            {
                var command = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure,
                    CommandText = "usp_GetOpportunities"
                };

                connection.Open();
                var reader = command.ExecuteReader(CommandBehavior.CloseConnection);
                Opportunity opportunity = null;

                while (reader.Read())
                {
                    opportunity = new Opportunity();

                    opportunity.Id = reader.GetInt64(0);
                    opportunity.Name = reader.GetString(1);

                    opportunities.Add(opportunity);
                }
            }

            return opportunities;
        }
    }
}
