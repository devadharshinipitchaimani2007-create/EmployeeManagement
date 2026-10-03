
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeeManagement
{
    public partial class EmployeeList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEmployees();
            }
        }

        private void LoadEmployees()
        {
            string connectionString =
                ConfigurationManager.ConnectionStrings["EmployeeDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Employees";

                SqlDataAdapter da = new SqlDataAdapter(query, con);

                DataTable dt = new DataTable();

                da.Fill(dt);

                gvEmployees.DataSource = dt;
                gvEmployees.DataBind();
            }
        }

        // Search Employee
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string search = txtSearch.Text.Trim();

            string cs = ConfigurationManager.ConnectionStrings["EmployeeDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT * FROM Employees
                                 WHERE EmployeeID LIKE @Search
                                 OR EmployeeName LIKE @Search";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Search", "%" + search + "%");

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();

                da.Fill(dt);

                gvEmployees.DataSource = dt;
                gvEmployees.DataBind();
            }
        }

        // Show All Employees
        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            LoadEmployees();
        }

        // Edit Employee
        protected void gvEmployees_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvEmployees.EditIndex = e.NewEditIndex;
            LoadEmployees();
        }

        // Cancel Edit
        protected void gvEmployees_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvEmployees.EditIndex = -1;
            LoadEmployees();
        }

        // Update Employee
        protected void gvEmployees_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string id = gvEmployees.DataKeys[e.RowIndex].Value.ToString();

            string name = ((TextBox)gvEmployees.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
            string email = ((TextBox)gvEmployees.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
            string phone = ((TextBox)gvEmployees.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
            string department = ((TextBox)gvEmployees.Rows[e.RowIndex].Cells[5].Controls[0]).Text;
            string designation = ((TextBox)gvEmployees.Rows[e.RowIndex].Cells[6].Controls[0]).Text;
            string salary = ((TextBox)gvEmployees.Rows[e.RowIndex].Cells[7].Controls[0]).Text;

            string cs = ConfigurationManager.ConnectionStrings["EmployeeDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"UPDATE Employees SET
                                 EmployeeName=@Name,
                                 Email=@Email,
                                 Phone=@Phone,
                                 Department=@Department,
                                 Designation=@Designation,
                                 Salary=@Salary
                                 WHERE EmployeeID=@ID";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@ID", id);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Phone", phone);
                cmd.Parameters.AddWithValue("@Department", department);
                cmd.Parameters.AddWithValue("@Designation", designation);
                cmd.Parameters.AddWithValue("@Salary", decimal.Parse(salary));

                con.Open();
                cmd.ExecuteNonQuery();
            }

            gvEmployees.EditIndex = -1;
            LoadEmployees();
        }

        // Delete Employee
        protected void gvEmployees_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = gvEmployees.DataKeys[e.RowIndex].Value.ToString();

            string cs = ConfigurationManager.ConnectionStrings["EmployeeDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "DELETE FROM Employees WHERE EmployeeID=@ID";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@ID", id);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            LoadEmployees();
        }
    }
}