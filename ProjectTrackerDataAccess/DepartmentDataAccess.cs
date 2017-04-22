using System;

using ProjectTrackerEntities;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using ProjectTrackerFactory;
using System.Collections.Generic;

namespace ProjectTrackerDataAccess
{
    public class DepartmentDataAccess
    {
        public List<Department> GetDepartments()
        {
            List<Department> departments = new List<Department>();
            var connectionString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;

            using (var connection = new SqlConnection(connectionString))
            {
                var command = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure,
                    CommandText = "usp_GetDepartments"
                };

                connection.Open();
                var reader = command.ExecuteReader(CommandBehavior.CloseConnection);

                while (reader.Read())
                {
                    Department department = new Department();
                    department.Id = reader.GetInt64(0);
                    department.Store = new Store { Id = reader.GetInt64(1), Name = reader.GetString(3), Company = new Company { Id = reader.GetInt64(4), Name = reader.GetString(5) } };
                    department.Name = reader.GetString(2);

                    departments.Add(department);
                }
            }

            return departments;
        }
    }
}
