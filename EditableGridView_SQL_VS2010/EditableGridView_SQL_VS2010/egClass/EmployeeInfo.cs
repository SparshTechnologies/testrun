/*
* Created By Shemeer NS 
* This Code is created for demo purpose and uploaded in Codeproject
* My Other Articles in codeproject - http://www.codeproject.com/script/Articles/MemberArticles.aspx?amid=3175840
* */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EditableGridView.egClass
{
    public class EmployeeInfo
    {
        public Int64 ID { get; set; }
        public string EmployeeCode { get; set; }
        public string EmployeeName { get; set; }
        public int DepartmentId { get; set; }
        public string DepartmentName { get; set; }
        public string EmployeeGroup { get; set; }
        public string Email { get; set; }
        public bool isActive { get; set; }
    }
}