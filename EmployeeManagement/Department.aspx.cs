using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace EmployeeManagement
{
    public partial class Department : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
            if (!IsPostBack)
            {
                LoadDepartments();
            }
        }

        private void LoadDepartments()
        {
            string cs = System.Configuration.ConfigurationManager
                .ConnectionStrings["EmployeeDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT DISTINCT Department
                         FROM dbo.Employees
                         WHERE Department IS NOT NULL
                         AND LTRIM(RTRIM(Department)) <> ''
                         ORDER BY Department";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();

                da.Fill(dt);

                gvDepartments.DataSource = dt;
                gvDepartments.DataBind();
            }
        }
            protected void btnSaveDepartment_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtDepartmentID.Text) ||
                string.IsNullOrWhiteSpace(txtDepartmentName.Text))
            {
                lblMessage.Text = "Please enter Department ID and Name.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            lblMessage.Text = "Department details received successfully!";
            lblMessage.ForeColor = System.Drawing.Color.Green;

            txtDepartmentID.Text = "";
            txtDepartmentName.Text = "";
            txtDescription.Text = "";
        }
    }

    }
    
