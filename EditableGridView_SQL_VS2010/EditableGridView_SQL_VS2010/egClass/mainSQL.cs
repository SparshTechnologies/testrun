/*
* Created By Shemeer NS 
* This Code is created for demo purpose and uploaded in Codeproject
* My Other Articles in codeproject - http://www.codeproject.com/script/Articles/MemberArticles.aspx?amid=3175840
* */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.SqlClient;
using System.Web.Configuration;
using EditableGridView.egClass;

namespace EditableGridView.egClass
{
    public class mainSQL
    {
        static private string sqlConString
        {
            get { return WebConfigurationManager.ConnectionStrings["egSQLConString"].ConnectionString; }
        }        
        public List<EmployeeInfo> getEmployeeList()
        {
            List<EmployeeInfo> eList = new List<EmployeeInfo>();
            EmployeeInfo objEmp = null;
            string queryString = "SELECT [ID],[EmployeeCode],[EmployeeName],[DepartmentId],[DepartmentName],[EmployeeGroup],[Email],[isActive] FROM [dbo].[Employee]";
            using (SqlConnection connection = new SqlConnection(sqlConString))
            {
                using (SqlCommand command = new SqlCommand(queryString, connection))
                {
                    command.Connection.Open();
                    using (SqlDataReader dataReader = command.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            objEmp = new EmployeeInfo();
                            objEmp.ID = Convert.ToInt64(dataReader["ID"]);
                            objEmp.EmployeeCode = Convert.ToString(dataReader["EmployeeCode"]);
                            objEmp.EmployeeName = Convert.ToString(dataReader["EmployeeName"]);
                            objEmp.DepartmentId = Convert.ToInt32(dataReader["DepartmentId"]);
                            objEmp.DepartmentName = Convert.ToString(dataReader["DepartmentName"]);
                            objEmp.EmployeeGroup = Convert.ToString(dataReader["EmployeeGroup"]);
                            objEmp.Email = Convert.ToString(dataReader["Email"]);
                            objEmp.isActive = Convert.ToBoolean(dataReader["isActive"]);
                            eList.Add(objEmp);
                        }
                    }
                }
            }
            return eList;
        }
        public List<Department> getDepartmentList()
        {
            List<Department> dList = new List<Department>();
            Department objDep = null;
            objDep = new Department();
            objDep.Id = 1;
            objDep.Name = "Sales";
            dList.Add(objDep);
            objDep = new Department();
            objDep.Id = 2;
            objDep.Name = "Marketing";
            dList.Add(objDep);
            objDep = new Department();
            objDep.Id = 3;
            objDep.Name = "IT";
            dList.Add(objDep);
            return dList;
        }
        public Boolean insertEmployeeInfo(EmployeeInfo eInfo)
        {
            string queryString = "INSERT INTO [Employee] ([EmployeeCode], [EmployeeName], [DepartmentId],[DepartmentName], [EmployeeGroup],[Email] ,[isActive]) " +
                                  "VALUES ('" + eInfo.EmployeeCode + "', '" + eInfo.EmployeeName + "', " + eInfo.DepartmentId + ",'" + eInfo.DepartmentName + "', '" + eInfo.EmployeeGroup + "', '" +
                                  eInfo.Email + "', " + Convert.ToInt32(eInfo.isActive) + ")";

            return Convert.ToBoolean(executeQuery(queryString));
        }
        public Boolean updateEmployeeInfo(EmployeeInfo eInfo)
        {
            string queryString = "UPDATE [Employee] SET  [EmployeeCode] = '" + eInfo.EmployeeCode + "',  [EmployeeName] = '"
                + eInfo.EmployeeName + "',  [DepartmentId] = " + eInfo.DepartmentId + ", [DepartmentName] = '" + eInfo.DepartmentName + "', [EmployeeGroup] = '" 
                + eInfo.EmployeeGroup + "',  [isActive] = " +
                Convert.ToInt32(eInfo.isActive) + " WHERE [ID] = " + eInfo.ID;

            return Convert.ToBoolean(executeQuery(queryString));
        }
        public Boolean deleteEmployeeInfo(long ID)
        {
            string queryString = "DELETE FROM Employee WHERE [ID] = " + ID;
            return Convert.ToBoolean(executeQuery(queryString));
        }
        public int executeQuery(string queryString)
        { 
            int rowsAffected = 0;
            using (SqlConnection connection = new SqlConnection(sqlConString))
            {
                using (SqlCommand command = new SqlCommand(queryString, connection))
                {
                    command.Connection.Open();
                    rowsAffected = command.ExecuteNonQuery();
                }
            }
            return rowsAffected;
        }
    }
}