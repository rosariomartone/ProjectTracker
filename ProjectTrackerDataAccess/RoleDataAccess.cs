using System;

using ProjectTrackerEntities;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using ProjectTrackerFactory;
using System.Collections.Generic;

namespace ProjectTrackerDataAccess
{
    public class RoleDataAccess
    {
        public Int64 GetRoleByName(string name)
        {
            Int64 roleInt = 0;
            var connectionString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;

            using (var connection = new SqlConnection(connectionString))
            {
                var command = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure,
                    CommandText = "usp_GetRoleByName"
                };

                var parameterRolename = new SqlParameter("@rolename", SqlDbType.VarChar) { Value = name };
                command.Parameters.Add(parameterRolename);

                connection.Open();
                var reader = command.ExecuteReader(CommandBehavior.CloseConnection);

                if (reader.Read())
                {
                    roleInt = reader.GetInt64(0);
                }
            }

            return roleInt;
        }
    }
}
