using System;

using ProjectTrackerEntities;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using ProjectTrackerFactory;
using System.Collections.Generic;

namespace ProjectTrackerDataAccess
{
    public class MenuVoicesDataAccess
    {
        public List<MenuBarVoices> GetMenuVoicesByMenuId(Int64 id)
        {
            List<MenuBarVoices> menuVoices = new List<MenuBarVoices>();
            var connectionString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;

            using (var connection = new SqlConnection(connectionString))
            {
                var command = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure,
                    CommandText = "usp_GetMenuVoicesByMenuId"
                };

                var parameter = new SqlParameter("@menuId", SqlDbType.Int) { Value = id };
                command.Parameters.Add(parameter);

                connection.Open();
                var reader = command.ExecuteReader(CommandBehavior.CloseConnection);

                while (reader.Read())
                {
                    MenuBarVoices menu = new MenuBarVoices
                    {
                        Id = int.Parse(reader["ID_Menu_Voice"].ToString()),
                        IdMenu = int.Parse(reader["ID_Menu"].ToString()),
                        text = reader["text"].ToString(),
                        icon = reader["icon"].ToString()
                    };

                    menuVoices.Add(menu);
                }
            }

            return menuVoices;
        }
    }
}
