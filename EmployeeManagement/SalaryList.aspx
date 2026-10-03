
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SalaryList.aspx.cs" Inherits="EmployeeManagement.SalaryList" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Salary Records</title>

    <style>
        body {
            margin: 0;
            padding: 30px;
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
        }

        .container {
            max-width: 1100px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 3px 12px #ddd;
        }

        h1 {
            text-align: center;
            color: #123c69;
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

        .btn {
            background-color: #1769aa;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #123c69;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <div class="container">

        <h1>Employee Salary Records</h1>

        <asp:Button ID="btnRefresh" runat="server"
            Text="Refresh"
            CssClass="btn"
            OnClick="btnRefresh_Click" />

        <asp:GridView ID="gvSalary" runat="server"
            AutoGenerateColumns="true"
            CssClass="grid"
            EmptyDataText="No salary records found.">
        </asp:GridView>

    </div>

</form>
</body>
</html>