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

                    Store store = new Store();
                    store.Id = reader.GetInt64(7);
                    store.Name = reader.GetString(8);

                    Department department = new Department();
                    department.Id = reader.GetInt64(9);
                    department.Name = reader.GetString(10);

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
                    user.Store = store;
                    user.Department = department;
                    user.IsPasswordRecovered = reader.GetBoolean(11);
                }
            }

            return user;
        }

        public BaseUser CheckUser(string username, string password)
        {
            BaseUser user = new ClientUser();
            var connectionString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;

            using (var connection = new SqlConnection(connectionString))
            {
                var command = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure,
                    CommandText = "usp_CheckUser"
                };

                var parameterUsername = new SqlParameter("@username", SqlDbType.VarChar) { Value = username };
                var parameterPassword = new SqlParameter("@password", SqlDbType.VarChar) { Value = password };
                command.Parameters.Add(parameterUsername);
                command.Parameters.Add(parameterPassword);

                connection.Open();
                var reader = command.ExecuteReader(CommandBehavior.CloseConnection);

                if (reader.Read())
                    user.IsPasswordRecovered = reader.GetBoolean(0);
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
                    List<MenuBarVoices> menu = mt.GetMenuVoicesByMenuId(reader.GetInt64(6));
                    role.Menu = menu;

                    Store store = new Store();
                    store.Id = reader.GetInt64(9);
                    store.Name = reader.GetString(10);

                    Department department = new Department();
                    department.Id = reader.GetInt64(11);
                    department.Name = reader.GetString(12);

                    ClientUser user = new ClientUser();
                    user.Id = reader.GetInt64(0);
                    user.Firstname = reader.GetString(1);
                    user.Surname = reader.GetString(2);
                    user.Email = reader.GetString(3);
                    user.Username = reader.GetString(8);
                    user.IsActive = reader.GetBoolean(7);
                    user.Role = role;
                    user.Store = store;
                    user.Department = department;

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

        public long ChangeUser(long userID, string password)
        {
            long changeUser = 0;
            var connectionString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;

            using (var connection = new SqlConnection(connectionString))
            {
                var command = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure,
                    CommandText = "usp_ChangePasswordUser"
                };

                var parameterIdUser = new SqlParameter("@idUser", SqlDbType.BigInt) { Value = userID };
                var parameterPassword = new SqlParameter("@password", SqlDbType.VarChar) { Value = password };
                command.Parameters.Add(parameterIdUser);
                command.Parameters.Add(parameterPassword);

                connection.Open();
                var reader = command.ExecuteReader(CommandBehavior.CloseConnection);

                if (reader.Read())
                    changeUser = reader.GetInt32(0);
            }

            return changeUser;
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

        public long GetUserIdByEmail(string email)
        {
            long retrieveUser = 0;
            var connectionString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;

            using (var connection = new SqlConnection(connectionString))
            {
                var command = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure,
                    CommandText = "usp_getUserIdByEmail"
                };

                var parameterEmail = new SqlParameter("@email", SqlDbType.VarChar) { Value = email };
                command.Parameters.Add(parameterEmail);

                connection.Open();
                var reader = command.ExecuteReader(CommandBehavior.CloseConnection);

                if (reader.Read())
                    retrieveUser = reader.GetInt32(0);
            }

            return retrieveUser;
        }

        public BaseUser GetUserIdByToken(string token)
        {
            BaseUser retrieveUser = null;
            var connectionString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;

            using (var connection = new SqlConnection(connectionString))
            {
                var command = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure,
                    CommandText = "usp_getUserIdByToken"
                };

                var parameterEmail = new SqlParameter("@token", SqlDbType.VarChar) { Value = token };
                command.Parameters.Add(parameterEmail);

                connection.Open();
                var reader = command.ExecuteReader(CommandBehavior.CloseConnection);

                if (reader.Read())
                {
                    retrieveUser = new ClientUser();
                    retrieveUser.Id= reader.GetInt32(0);
                }
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

                SqlParameter parameterIdUser = new SqlParameter("@idUser", SqlDbType.BigInt) { Value = user.Id };
                SqlParameter parameterRole = new SqlParameter("@role", SqlDbType.BigInt) { Value = user.Role.RoleId };
                SqlParameter parameterDepartment = new SqlParameter("@department", SqlDbType.BigInt) { Value = user.Department.Id };
                SqlParameter parameterIsActive = null;

                if(user.IsActive)
                    parameterIsActive = new SqlParameter("@isActive", SqlDbType.VarChar) { Value = "1" };
                else
                    parameterIsActive = new SqlParameter("@isActive", SqlDbType.VarChar) { Value = "0" };

                command.Parameters.Add(parameterIdUser);
                command.Parameters.Add(parameterRole);
                command.Parameters.Add(parameterIsActive);
                command.Parameters.Add(parameterDepartment);

                connection.Open();
                rowAffected = command.ExecuteNonQuery();

                connection.Close();
            }

            return rowAffected;
        }

        public int SaveUserSettings_Delete(BaseUser user)
        {
            var connectionString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            int rowAffected = 0;

            using (var connection = new SqlConnection(connectionString))
            {
                var command = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure,
                    CommandText = "usp_SaveUserSettings_Delete"
                };

                var parameterIdUser = new SqlParameter("@idUser", SqlDbType.BigInt) { Value = user.Id };
                command.Parameters.Add(parameterIdUser);

                connection.Open();
                rowAffected = command.ExecuteNonQuery();

                connection.Close();
            }

            return rowAffected;
        }
    }
}
