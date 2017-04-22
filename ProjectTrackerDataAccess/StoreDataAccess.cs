using System;

using ProjectTrackerEntities;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using ProjectTrackerFactory;
using System.Collections.Generic;

namespace ProjectTrackerDataAccess
{
    public class StoreDataAccess
    {
        public List<Store> GetStores()
        {
            List<Store> stores = new List<Store>();
            var connectionString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;

            using (var connection = new SqlConnection(connectionString))
            {
                var command = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure,
                    CommandText = "usp_GetStores"
                };

                connection.Open();
                var reader = command.ExecuteReader(CommandBehavior.CloseConnection);

                while (reader.Read())
                {
                    Store store = new Store();
                    store.Id = reader.GetInt64(0);
                    store.Name = reader.GetString(2);

                    stores.Add(store);
                }
            }

            return stores;
        }
    }
}
