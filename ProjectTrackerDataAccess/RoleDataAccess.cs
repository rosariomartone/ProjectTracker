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

        public List<Role> GetRoles()
        {
            List<Role> roles = new List<Role>();
            var connectionString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;

            using (var connection = new SqlConnection(connectionString))
            {
                var command = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure,
                    CommandText = "usp_GetRoles"
                };

                connection.Open();
                var reader = command.ExecuteReader(CommandBehavior.CloseConnection);

                while (reader.Read())
                {
                    Role role = new Role();
                    role.RoleId = reader.GetInt64(0);
                    role.Name = reader.GetString(1);

                    if (reader.GetInt32(2) == 1)
                        role.UserType = ProjectTrackerEnum.UserEnumeration.ProximaUser;
                    else
                        role.UserType = ProjectTrackerEnum.UserEnumeration.ClientUser;

                    roles.Add(role);
                }
            }

            return roles;
        }
    }
}
