/*
* Created By Shemeer NS 
* This Code is created for demo purpose and uploaded in Codeproject
* My Other Articles in codeproject - http://www.codeproject.com/script/Articles/MemberArticles.aspx?amid=3175840
* */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using EditableGridView_SQL_VS2010.ServiceReference1;



//using EditableGridView.egClass;


namespace EditableGridView
{
   
    public partial class egSQL : System.Web.UI.Page
    {
        
        Service1Client objService = new Service1Client();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillEmployeeGrid();
            }
        }
        private void FillEmployeeGrid()
        {
            List<EmployeeInfo> objEmpList = new List<EmployeeInfo>();
           // objEmpList = objService.getEmployeeList();
          //  objEmpList = new mainSQL().getEmployeeList();
            gvEG.DataSource = objService.getEmployeeList();
            //gvEG.DataSource = objEmpList;
            gvEG.DataBind();
        }
        protected void gvEG_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddlDepartment = (DropDownList)e.Row.FindControl("ddlDepartment");
                if (ddlDepartment != null)
                {
                    ddlDepartment.DataSource =objService.getDepartmentList();
                    //ddlDepartment.DataSource = new mainSQL().getDepartmentList();
                    ddlDepartment.DataBind();
                    ddlDepartment.SelectedValue = gvEG.DataKeys[e.Row.RowIndex].Values[1].ToString();
                }
            }
            if (e.Row.RowType == DataControlRowType.EmptyDataRow)
            {
                DropDownList ddlDepartment = (DropDownList)e.Row.FindControl("ddlDepartment");
                if (ddlDepartment != null)
                {
                    ddlDepartment.DataSource = objService.getDepartmentList();
                    //ddlDepartment.DataSource = new mainSQL().getDepartmentList();
                    ddlDepartment.DataBind();
                }
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                DropDownList ddlDepartment = (DropDownList)e.Row.FindControl("ddlDepartment");
                ddlDepartment.DataSource =objService.getDepartmentList(); 
               // ddlDepartment.DataSource = new mainSQL().getDepartmentList(); ;
                ddlDepartment.DataBind();
            }
        }
        protected void gvEG_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Insert"))
            {
                EmployeeInfo eInfo = new EmployeeInfo();
                eInfo.EmployeeCode = Convert.ToString(((TextBox)gvEG.FooterRow.FindControl("txtEmployeeCode")).Text);
                eInfo.EmployeeName = ((TextBox)gvEG.FooterRow.FindControl("txtEmployeeName")).Text;
                eInfo.DepartmentId = Convert.ToInt32(((DropDownList)gvEG.FooterRow.FindControl("ddlDepartment")).SelectedValue);
                eInfo.DepartmentName = Convert.ToString(((DropDownList)gvEG.FooterRow.FindControl("ddlDepartment")).SelectedItem.Text);
                eInfo.EmployeeGroup = ((DropDownList)gvEG.FooterRow.FindControl("ddlEmployeeGroup")).SelectedValue;
                eInfo.Email = ((TextBox)gvEG.FooterRow.FindControl("txtEmail")).Text;
                eInfo.isActive = ((CheckBox)gvEG.FooterRow.FindControl("chkActive")).Checked;
                //new mainSQL().insertEmployeeInfo(eInfo);
               objService.insertEmployeeInfo(eInfo);
                FillEmployeeGrid();
            }
        }
        protected void gvEG_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvEG.EditIndex = e.NewEditIndex;
            FillEmployeeGrid();
        }
        protected void gvEG_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            EmployeeInfo eInfo = new EmployeeInfo();
            eInfo.ID = Convert.ToInt64(gvEG.DataKeys[e.RowIndex].Values[0].ToString());
            eInfo.EmployeeCode = Convert.ToString(((TextBox)gvEG.Rows[e.RowIndex].FindControl("txtEmployeeCode")).Text);
            eInfo.EmployeeName = ((TextBox)gvEG.Rows[e.RowIndex].FindControl("txtEmployeeName")).Text;
            eInfo.DepartmentId = Convert.ToInt32(((DropDownList)gvEG.Rows[e.RowIndex].FindControl("ddlDepartment")).SelectedValue);
            eInfo.DepartmentName = Convert.ToString(((DropDownList)gvEG.Rows[e.RowIndex].FindControl("ddlDepartment")).SelectedItem.Text);
            eInfo.EmployeeGroup = ((DropDownList)gvEG.Rows[e.RowIndex].FindControl("ddlEmployeeGroup")).SelectedValue;
            eInfo.isActive = ((CheckBox)gvEG.Rows[e.RowIndex].FindControl("chkActive")).Checked;
            //new mainSQL().updateEmployeeInfo(eInfo);
         objService.updateEmployeeInfo(eInfo);
            gvEG.EditIndex = -1;
            FillEmployeeGrid();
        }
        protected void gvEG_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvEG.EditIndex = -1;
            FillEmployeeGrid();
        }
        protected void gvEG_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Int64 ID = Convert.ToInt64(gvEG.DataKeys[e.RowIndex].Values[0].ToString());
            objService.deleteEmployeeInfo(ID);
            //new mainSQL().deleteEmployeeInfo(ID);
            FillEmployeeGrid();
        }
    }
}