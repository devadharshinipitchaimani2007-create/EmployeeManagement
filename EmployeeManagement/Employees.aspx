
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="EmployeeManagement.Employees" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Employee Management</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
        }

        .header {
            background-color: #123c69;
            color: white;
            padding: 22px;
            text-align: center;
        }

        .header h1 {
            margin: 0;
            font-size: 28px;
        }

        .container {
            width: 80%;
            max-width: 900px;
            margin: 35px auto;
            background-color: white;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.10);
        }

        h2 {
            color: #123c69;
            text-align: center;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }

        .input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            outline: none;
        }

        .input:focus {
            border-color: #1769aa;
            box-shadow: 0 0 4px rgba(23,105,170,0.25);
        }

        .button-group {
            margin-top: 25px;
            text-align: center;
        }

        .btn {
            background-color: #1769aa;
            color: white;
            border: none;
            padding: 12px 25px;
            cursor: pointer;
            border-radius: 6px;
            margin: 5px;
            font-size: 14px;
        }

        .btn:hover {
            background-color: #0d4f80;
        }

        .clear-btn {
            background-color: #6c757d;
        }

        .clear-btn:hover {
            background-color: #545b62;
        }

        .footer {
            text-align: center;
            color: #777;
            font-size: 13px;
            margin-top: 25px;
        }

        @media (max-width: 768px) {
            .container {
                width: 95%;
                padding: 20px;
            }
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

    <div class="header">
        <h1>Employee Management System</h1>
    </div>

    <div class="container">

        <h2>Add New Employee</h2>

        <div class="form-group">
            <label>Employee ID</label>
            <asp:TextBox ID="txtEmployeeID"
                runat="server"
                CssClass="input"
                placeholder="Enter Employee ID">
            </asp:TextBox>
        </div>

        <div class="form-group">
            <label>Employee Name</label>
            <asp:TextBox ID="txtEmployeeName"
                runat="server"
                CssClass="input"
                placeholder="Enter Employee Name">
            </asp:TextBox>
        </div>

        <div class="form-group">
            <label>Email Address</label>
            <asp:TextBox ID="txtEmail"
                runat="server"
                CssClass="input"
                TextMode="Email"
                placeholder="Enter Email Address">
            </asp:TextBox>
        </div>

        <div class="form-group">
            <label>Phone Number</label>
            <asp:TextBox ID="txtPhone"
                runat="server"
                CssClass="input"
                TextMode="Phone"
                placeholder="Enter Phone Number">
            </asp:TextBox>
        </div>

        <div class="form-group">
            <label>Department</label>
            <asp:TextBox ID="txtDepartment"
                runat="server"
                CssClass="input"
                placeholder="Enter Department">
            </asp:TextBox>
        </div>

        <div class="form-group">
            <label>Designation</label>
            <asp:TextBox ID="txtDesignation"
                runat="server"
                CssClass="input"
                placeholder="Enter Designation">
            </asp:TextBox>
        </div>

        <div class="form-group">
            <label>Salary</label>
            <asp:TextBox ID="txtSalary"
                runat="server"
                CssClass="input"
                TextMode="Number"
                placeholder="Enter Salary">
            </asp:TextBox>
        </div>

        <div class="button-group">

            <asp:Button ID="btnSave"
                runat="server"
                Text="Save Employee"
                CssClass="btn"
                OnClick="btnSave_Click" />

            <asp:Button ID="btnClear"
                runat="server"
                Text="Clear"
                CssClass="btn clear-btn"
                CausesValidation="false"
                OnClick="btnClear_Click" />

        </div>

        <div class="footer">
            Employee Management System | HR Module
        </div>

    </div>

</form>

</body>
</html>