
using System;
using System.Configuration;
using System.Data.SqlClient;

namespace EmployeeManagement
{
    public partial class Salary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            decimal basicSalary;

            if (string.IsNullOrWhiteSpace(txtEmployeeID.Text) ||
                !decimal.TryParse(txtBasicSalary.Text, out basicSalary) ||
                basicSalary < 0 ||
                string.IsNullOrWhiteSpace(txtSalaryMonth.Text))
            {
                lblNetSalary.Text = "Enter valid employee ID, salary and month.";
                return;
            }

            decimal netSalary = basicSalary;

            string cs = ConfigurationManager.ConnectionStrings["EmployeeDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"INSERT INTO dbo.Salary
                    (EmployeeID, BasicSalary, NetSalary, SalaryMonth)
                    VALUES
                    (@EmployeeID, @BasicSalary, @NetSalary, @SalaryMonth)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@EmployeeID", txtEmployeeID.Text.Trim());
                    cmd.Parameters.AddWithValue("@BasicSalary", basicSalary);
                    cmd.Parameters.AddWithValue("@NetSalary", netSalary);
                    cmd.Parameters.AddWithValue("@SalaryMonth",
                        DateTime.Parse(txtSalaryMonth.Text + "-01"));

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            lblNetSalary.Text = "Salary saved successfully! Net Salary: ₹" + netSalary.ToString("N2");
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtEmployeeID.Text = "";
            txtBasicSalary.Text = "";
            txtAllowances.Text = "";
            txtDeductions.Text = "";
            txtSalaryMonth.Text = "";
            lblNetSalary.Text = "";
        }
    }
}