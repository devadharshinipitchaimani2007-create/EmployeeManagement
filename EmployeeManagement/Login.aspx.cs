using System;
using System.Web.UI;

namespace EmployeeManagement
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtUsername.Text == "admin" && txtPassword.Text == "123")
            {
                Response.Redirect("Employee Management.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid Username or Password');</script>");
            }
        }
    }
}