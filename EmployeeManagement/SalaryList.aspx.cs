
using System;
using System.Configuration;
using System.Data.SqlClient;

namespace EmployeeManagement
{
    public partial class SalaryList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSalaryRecords();
            }
        }

        private void LoadSalaryRecords()
        {
            string cs = ConfigurationManager.ConnectionStrings["EmployeeDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT SalaryID, EmployeeID,
                    BasicSalary, NetSalary, SalaryMonth
                    FROM dbo.Salary
                    ORDER BY SalaryID DESC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        gvSalary.DataSource = reader;
                        gvSalary.DataBind();
                    }
                }
            }
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            LoadSalaryRecords();
        }
    }
}