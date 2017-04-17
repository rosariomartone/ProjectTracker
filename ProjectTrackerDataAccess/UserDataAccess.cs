﻿using System;

using ProjectTrackerEntities;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using ProjectTrackerFactory;
using System.Collections.Generic;

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
                    MenuVoicesDataAccess mt = new MenuVoicesDataAccess();
                    Role role = ut.GetRoleById(roleInt);
                    List<MenuBarVoices> menu = mt.GetMenuVoicesByMenuId(reader.GetInt64(6));
                    role.Menu = menu;
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

        public List<BaseUser> GetUsers()
        {
            List<BaseUser> users = new List<BaseUser>();
            var connectionString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;

            using (var connection = new SqlConnection(connectionString))
            {
                var command = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure,
                    CommandText = "usp_GetUsers"
                };

                connection.Open();
                var reader = command.ExecuteReader(CommandBehavior.CloseConnection);

                while (reader.Read())
                {
                    Int64 roleInt = reader.GetInt64(4);
                    UserTypeDataAccess ut = new UserTypeDataAccess();
                    MenuVoicesDataAccess mt = new MenuVoicesDataAccess();
                    Role role = ut.GetRoleById(roleInt);
                    List<MenuBarVoices> menu = mt.GetMenuVoicesByMenuId(reader.GetInt64(8));
                    role.Menu = menu;
                    ClientUser user = new ClientUser();
                    user.Id = reader.GetInt64(0);
                    user.Firstname = reader.GetString(1);
                    user.Surname = reader.GetString(2);
                    user.Email = reader.GetString(3);
                    user.Username = reader.GetString(6);
                    user.IsActive = reader.GetString(7);
                    user.Role = role;

                    users.Add(user);
                }
            }

            return users;
        }

        public long RegisterNewUser(ClientUser user)
        {
            long addUser = 0;
            var connectionString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;

            using (var connection = new SqlConnection(connectionString))
            {
                var command = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure,
                    CommandText = "usp_RegisterNewUser"
                };

                var parameterFirstname = new SqlParameter("@firstname", SqlDbType.VarChar) { Value = user.Firstname };
                var parameterSurname = new SqlParameter("@surname", SqlDbType.VarChar) { Value = user.Surname };
                var parameterEmail = new SqlParameter("@email", SqlDbType.VarChar) { Value = user.Email };
                var parameterUsername = new SqlParameter("@username", SqlDbType.VarChar) { Value = user.Email };
                var parameterPassword = new SqlParameter("@password", SqlDbType.VarChar) { Value = user.Password };
                command.Parameters.Add(parameterFirstname);
                command.Parameters.Add(parameterSurname);
                command.Parameters.Add(parameterEmail);
                command.Parameters.Add(parameterUsername);
                command.Parameters.Add(parameterPassword);

                connection.Open();
                var reader = command.ExecuteReader(CommandBehavior.CloseConnection);

                if (reader.Read())
                    addUser = reader.GetInt32(0);
            }

            return addUser;
        }

        public long RetrieveUser(ClientUser user)
        {
            long retrieveUser = 0;
            var connectionString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;

            using (var connection = new SqlConnection(connectionString))
            {
                var command = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure,
                    CommandText = "usp_RetrieveUser"
                };

                var parameterEmail = new SqlParameter("@email", SqlDbType.VarChar) { Value = user.Email };
                command.Parameters.Add(parameterEmail);

                connection.Open();
                var reader = command.ExecuteReader(CommandBehavior.CloseConnection);

                if (reader.Read())
                    retrieveUser = reader.GetInt32(0);
            }

            return retrieveUser;
        }

        public int SaveUserSettings(BaseUser user)
        {
            var connectionString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            int rowAffected = 0;

            using (var connection = new SqlConnection(connectionString))
            {
                var command = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure,
                    CommandText = "usp_SaveUserSettings"
                };

                var parameterIdUser = new SqlParameter("@idUser", SqlDbType.BigInt) { Value = user.Id };
                var parameterIsActive = new SqlParameter("@isActive", SqlDbType.VarChar) { Value = user.IsActive };
                command.Parameters.Add(parameterIdUser);
                command.Parameters.Add(parameterIsActive);

                connection.Open();
                rowAffected = command.ExecuteNonQuery();

                connection.Close();
            }

            return rowAffected;
        }
    }
}
