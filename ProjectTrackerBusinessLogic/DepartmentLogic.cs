using ProjectTrackerEntities;
using ProjectTrackerDataAccess;
using System.Collections.Generic;
using System;

namespace ProjectTrackerBusinessLogic
{
    public class DepartmentLogic
    {
        public static List<Department> GetDepartments()
        {
            DepartmentDataAccess department = new DepartmentDataAccess();

            return department.GetDepartments();
        }
    }
}
