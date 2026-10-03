
using System;
using System.Configuration;
using System.Data.SqlClient;

namespace EmployeeManagement
{
    public partial class Employee_Management : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDashboardCount();
            }
        }

        private void LoadDashboardCount()
        {
            string cs = ConfigurationManager.ConnectionStrings["EmployeeDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // Total Employees
                string query = "SELECT COUNT(*) FROM dbo.Employees";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    lblTotalEmployees.Text = cmd.ExecuteScalar().ToString();
                }

                // Total Departments
                string deptQuery = @"SELECT COUNT(DISTINCT Department)
                                     FROM dbo.Employees
                                     WHERE Department IS NOT NULL
                                     AND LTRIM(RTRIM(Department)) <> ''";

                using (SqlCommand deptCmd = new SqlCommand(deptQuery, con))
                {
                    lblTotalDepartments.Text = deptCmd.ExecuteScalar().ToString();
                }

                // Present Today
                string attendanceQuery = @"SELECT COUNT(DISTINCT EmployeeID)
                                           FROM dbo.Attendance
                                           WHERE CAST(AttendanceDate AS DATE) = CAST(GETDATE() AS DATE)
                                           AND Status = 'Present'";

                using (SqlCommand attendanceCmd = new SqlCommand(attendanceQuery, con))
                {
                    lblPresentToday.Text = attendanceCmd.ExecuteScalar().ToString();
                }

                // Leave Requests
                string leaveQuery = "SELECT COUNT(*) FROM dbo.LeaveRequests";

                using (SqlCommand leaveCmd = new SqlCommand(leaveQuery, con))
                {
                    lblLeaveRequests.Text = leaveCmd.ExecuteScalar().ToString();
                }
            }
        }

        protected void btnEmployees_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeList.aspx");
        }
    }
}