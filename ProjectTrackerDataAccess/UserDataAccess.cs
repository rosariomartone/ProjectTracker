using System;

using ProjectTrackerEntities;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using ProjectTrackerFactory;

namespace ProjectTrackerDataAccess
{
    public class UserDataAccess
    {
        public BaseUser GetUser(string username, string password)
        {
            BaseUser user = null;
            var connectionString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;

            using (var connection = new SqlConnection(connectionString))
            {
                var command = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure,
                    CommandText = "usp_GetUser"
                };

                var parameterUsername = new SqlParameter("@username", SqlDbType.VarChar) { Value = username };
                var parameterPassword = new SqlParameter("@password", SqlDbType.VarChar) { Value = password };
                command.Parameters.Add(parameterUsername);
                command.Parameters.Add(parameterPassword);

                connection.Open();
                var reader = command.ExecuteReader(CommandBehavior.CloseConnection);

                if (reader.Read())
                {
                    Int64 roleInt = reader.GetInt64(4);
                    UserTypeDataAccess ut = new UserTypeDataAccess();
                    Role role = ut.GetRoleById(roleInt);
                    user = UserFactory.getUser(role);
                    user.Id = reader.GetInt64(0);
                    user.Firstname = reader.GetString(1);
                    user.Surname = reader.GetString(2);
                    user.Email = reader.GetString(3);
                    user.Username = username;
                    user.Password = password;
                    user.Role = role;
                }
            }

            return user;
        }
    }
}
