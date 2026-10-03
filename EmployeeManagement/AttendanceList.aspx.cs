
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace EmployeeManagement
{
    public partial class AttendanceList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAttendance();
            }
        }

        private void LoadAttendance()
        {
            string cs = ConfigurationManager
                .ConnectionStrings["EmployeeDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT AttendanceID,
                                        EmployeeID,
                                        AttendanceDate,
                                        Status
                                 FROM dbo.Attendance
                                 ORDER BY AttendanceDate DESC";

                using (SqlDataAdapter da = new SqlDataAdapter(query, con))
                {
                    DataTable dt = new DataTable();

                    da.Fill(dt);

                    gvAttendance.DataSource = dt;
                    gvAttendance.DataBind();
                }
            }
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            LoadAttendance();
        }
    }
}