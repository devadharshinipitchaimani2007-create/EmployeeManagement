
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Salary.aspx.cs" Inherits="EmployeeManagement.Salary" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Salary Management</title>

    <style>
        body {
            margin: 0;
            padding: 30px;
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
        }

        .container {
            max-width: 1000px;
            margin: auto;
            padding: 30px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 3px 12px #ddd;
        }

        h1 {
            text-align: center;
            color: #123c69;
        }

        .form-group {
            margin-bottom: 18px;
        }

        label {
            display: block;
            margin-bottom: 7px;
            font-weight: bold;
            color: #333;
        }

        .input {
            width: 100%;
            padding: 11px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .btn {
            background-color: #1769aa;
            color: white;
            padding: 11px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 8px;
        }

        .btn:hover {
            background-color: #123c69;
        }

        .grid {
            width: 100%;
            margin-top: 25px;
            border-collapse: collapse;
        }

        .grid th {
            background-color: #1769aa;
            color: white;
            padding: 12px;
        }

        .grid td {
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        .message {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <div class="container">

        <h1>Salary Management</h1>

        <div class="form-group">
            <label>Employee ID</label>
            <asp:TextBox ID="txtEmployeeID" runat="server"
                CssClass="input"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Basic Salary</label>
            <asp:TextBox ID="txtBasicSalary" runat="server"
                TextMode="Number" CssClass="input"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Allowances</label>
            <asp:TextBox ID="txtAllowances" runat="server"
                TextMode="Number" CssClass="input"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Deductions</label>
            <asp:TextBox ID="txtDeductions" runat="server"
                TextMode="Number" CssClass="input"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Salary Month</label>
            <asp:TextBox ID="txtSalaryMonth" runat="server"
                TextMode="Month" CssClass="input"></asp:TextBox>
        </div>

        <asp:Button ID="btnCalculate" runat="server"
            Text="Calculate Salary"
            CssClass="btn"
            OnClick="btnCalculate_Click" />

        <asp:Button ID="btnClear" runat="server"
            Text="Clear"
            CssClass="btn"
            OnClick="btnClear_Click"
            CausesValidation="false" />

        <br />

        <asp:Label ID="lblNetSalary" runat="server"
            CssClass="message"></asp:Label>

        <h2>Salary Records</h2>

        <asp:GridView ID="gvSalary" runat="server"
            AutoGenerateColumns="true"
            CssClass="grid"
            EmptyDataText="No salary records found.">
        </asp:GridView>

    </div>

</form>
</body>
</html>