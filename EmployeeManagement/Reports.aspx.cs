
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace EmployeeManagement
{
    public partial class Reports : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["EmployeeDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnEmployeeReport_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM dbo.Employees";

                using (SqlDataAdapter da = new SqlDataAdapter(query, con))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvEmployeeReport.DataSource = dt;
                    gvEmployeeReport.DataBind();
                }
            }
        }

        protected void btnDepartmentReport_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT Department, COUNT(*) AS TotalEmployees
                                 FROM dbo.Employees
                                 GROUP BY Department";

                using (SqlDataAdapter da = new SqlDataAdapter(query, con))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvDepartmentReport.DataSource = dt;
                    gvDepartmentReport.DataBind();
                }
            }
        }

        protected void btnAttendanceReport_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT * FROM dbo.Attendance";

                using (SqlDataAdapter da = new SqlDataAdapter(query, con))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvAttendanceReport.DataSource = dt;
                    gvAttendanceReport.DataBind();
                }
            }
        }
    }
}