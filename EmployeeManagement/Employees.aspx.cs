
using System;
using System.Configuration;
using System.Data.SqlClient;

namespace EmployeeManagement
{
    public partial class Employees : System.Web.UI.Page
    {
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtEmployeeID.Text) ||
                string.IsNullOrWhiteSpace(txtEmployeeName.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                Response.Write("<script>alert('Please fill required fields');</script>");
                return;
            }

            string cs = ConfigurationManager.ConnectionStrings["EmployeeDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"INSERT INTO Employees
                    (EmployeeID, EmployeeName, Email, Phone, Department, Designation, Salary)
                    VALUES
                    (@EmployeeID, @EmployeeName, @Email, @Phone, @Department, @Designation, @Salary)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@EmployeeID", txtEmployeeID.Text.Trim());
                    cmd.Parameters.AddWithValue("@EmployeeName", txtEmployeeName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.Trim());
                    cmd.Parameters.AddWithValue("@Department", txtDepartment.Text.Trim());
                    cmd.Parameters.AddWithValue("@Designation", txtDesignation.Text.Trim());

                    decimal salary = 0;
                    decimal.TryParse(txtSalary.Text, out salary);

                    cmd.Parameters.AddWithValue("@Salary", salary);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            Response.Write("<script>alert('Employee saved successfully!');</script>");
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtEmployeeID.Text = "";
            txtEmployeeName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtDepartment.Text = "";
            txtDesignation.Text = "";
            txtSalary.Text = "";
        }
    }
}