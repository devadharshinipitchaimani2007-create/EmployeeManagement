
using System;
using System.Configuration;
using System.Data.SqlClient;

namespace EmployeeManagement
{
    public partial class LeaveManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadLeaveRecords();
            }
        }

        protected void btnApplyLeave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtEmployeeID.Text) ||
                string.IsNullOrWhiteSpace(ddlLeaveType.SelectedValue) ||
                string.IsNullOrWhiteSpace(txtFromDate.Text) ||
                string.IsNullOrWhiteSpace(txtToDate.Text))
            {
                lblMessage.Text = "Please fill all required fields.";
                return;
            }

            DateTime fromDate, toDate;

            if (!DateTime.TryParse(txtFromDate.Text, out fromDate) ||
                !DateTime.TryParse(txtToDate.Text, out toDate) ||
                toDate < fromDate)
            {
                lblMessage.Text = "Please enter valid leave dates.";
                return;
            }

            string cs = ConfigurationManager.ConnectionStrings["EmployeeDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"INSERT INTO dbo.LeaveRequests
                    (EmployeeID, LeaveType, FromDate, ToDate, Reason, LeaveStatus)
                    VALUES
                    (@EmployeeID, @LeaveType, @FromDate, @ToDate, @Reason, 'Pending')";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@EmployeeID", txtEmployeeID.Text.Trim());
                    cmd.Parameters.AddWithValue("@LeaveType", ddlLeaveType.SelectedValue);
                    cmd.Parameters.AddWithValue("@FromDate", fromDate);
                    cmd.Parameters.AddWithValue("@ToDate", toDate);
                    cmd.Parameters.AddWithValue("@Reason", txtReason.Text.Trim());

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            lblMessage.Text = "Leave application submitted successfully!";

            LoadLeaveRecords();
            ClearFields();
        }

        private void LoadLeaveRecords()
        {
            string cs = ConfigurationManager.ConnectionStrings["EmployeeDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT LeaveID, EmployeeID, LeaveType,
                    FromDate, ToDate, Reason, LeaveStatus
                    FROM dbo.LeaveRequests
                    ORDER BY LeaveID DESC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        gvLeave.DataSource = reader;
                        gvLeave.DataBind();
                    }
                }
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearFields();
            lblMessage.Text = "";
        }

        private void ClearFields()
        {
            txtEmployeeID.Text = "";
            ddlLeaveType.SelectedIndex = 0;
            txtFromDate.Text = "";
            txtToDate.Text = "";
            txtReason.Text = "";
        }
    }
}