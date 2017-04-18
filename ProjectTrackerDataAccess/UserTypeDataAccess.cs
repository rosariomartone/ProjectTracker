using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

using ProjectTrackerEntities;
using ProjectTrackerEnum;

namespace ProjectTrackerDataAccess
{
    public class UserTypeDataAccess
    {
        public Role GetRoleById(Int64 id)
        {
            Role role = null;
            var connectionString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;

            using (var connection = new SqlConnection(connectionString))
            {
                var command = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure,
                    CommandText = "usp_GetRoleById"
                };

                var parameter = new SqlParameter("@roleId", SqlDbType.Int) { Value = id };
                command.Parameters.Add(parameter);

                connection.Open();
                var reader = command.ExecuteReader(CommandBehavior.CloseConnection);

                if (reader.Read())
                {
                    role = new Role
                    {
                        RoleId = int.Parse(reader["ID_Role"].ToString()),
                        Name = reader["name"].ToString(),
                        UserType = (UserEnumeration)int.Parse(reader["userType"].ToString())
                    };
                }
            }

            return role;
        }
    }
}
