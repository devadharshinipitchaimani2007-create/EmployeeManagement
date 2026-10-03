
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace EmployeeManagement
{
    public partial class Attendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtDate.Text = DateTime.Today.ToString("yyyy-MM-dd");
            }
        }

        protected void btnSaveAttendance_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtEmployeeID.Text))
            {
                lblMessage.Text = "Please enter Employee ID.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string cs = ConfigurationManager
                .ConnectionStrings["EmployeeDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                try
                {
                    con.Open();

                    // Check actual database connection
                    string checkQuery = @"
                        SELECT
                            DB_NAME() AS DatabaseName,
                            @@SERVERNAME AS ServerName,
                            OBJECT_ID('dbo.Attendance') AS TableID";

                    SqlCommand checkCmd =
                        new SqlCommand(checkQuery, con);

                    using (SqlDataReader reader = checkCmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string dbName = reader["DatabaseName"].ToString();
                            string serverName = reader["ServerName"].ToString();
                            string tableID = reader["TableID"].ToString();

                            if (string.IsNullOrEmpty(tableID))
                            {
                                lblMessage.Text =
                                    "Database: " + dbName +
                                    " | Server: " + serverName +
                                    " | Attendance table not found.";

                                lblMessage.ForeColor =
                                    System.Drawing.Color.Red;
                                return;
                            }
                        }
                    }

                    // Validate Employee ID
                    string employeeQuery = @"
                        SELECT COUNT(*)
                        FROM dbo.Employees
                        WHERE EmployeeID = @EmployeeID";

                    SqlCommand employeeCmd =
                        new SqlCommand(employeeQuery, con);

                    employeeCmd.Parameters.Add(
                        "@EmployeeID", SqlDbType.VarChar, 20
                    ).Value = txtEmployeeID.Text.Trim();

                    int employeeExists =
                        Convert.ToInt32(employeeCmd.ExecuteScalar());

                    if (employeeExists == 0)
                    {
                        lblMessage.Text =
                            "Employee ID not found. Enter a valid Employee ID.";

                        lblMessage.ForeColor =
                            System.Drawing.Color.Red;
                        return;
                    }

                    // Save Attendance
                    string query = @"
                        INSERT INTO dbo.Attendance
                        (EmployeeID, AttendanceDate, Status)
                        VALUES
                        (@EmployeeID, @AttendanceDate, @Status)";

                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.Add(
                        "@EmployeeID", SqlDbType.VarChar, 20
                    ).Value = txtEmployeeID.Text.Trim();

                    cmd.Parameters.Add(
                        "@AttendanceDate", SqlDbType.Date
                    ).Value = DateTime.Parse(txtDate.Text);

                    cmd.Parameters.Add(
                        "@Status", SqlDbType.VarChar, 20
                    ).Value = ddlStatus.SelectedValue;

                    cmd.ExecuteNonQuery();

                    lblMessage.Text = "Attendance saved successfully!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;

                    txtEmployeeID.Text = "";
                    ddlStatus.SelectedIndex = 0;
                    txtDate.Text = DateTime.Today.ToString("yyyy-MM-dd");
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "DATABASE ERROR: " + ex.Message;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}