<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Reports.aspx.cs"
    Inherits="EmployeeManagement.Reports" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>HR Reports</title>

    <style>
        body {
            font-family: Arial;
            background: #f4f6f9;
            margin: 0;
            padding: 30px;
        }

        .container {
            max-width: 1000px;
            margin: auto;
        }

        h2 {
            color: #123c69;
        }

        .card {
            background: white;
            padding: 20px;
            margin: 15px 0;
            border-radius: 8px;
            box-shadow: 0 2px 8px #ddd;
        }

        .btn {
            background: #1769aa;
            color: white;
            padding: 10px 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .grid {
            width: 100%;
            margin-top: 15px;
        }

        .grid th {
            background: #1769aa;
            color: white;
            padding: 10px;
        }

        .grid td {
            padding: 10px;
            background: white;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

<div class="container">

    <h2>📊 Employee & HR Reports</h2>
    <p>View employee and HR related reports.</p>

    <div class="card">
        <h3>Employee Report</h3>

        <asp:Button ID="btnEmployeeReport" runat="server"
            Text="View Employee Report"
            CssClass="btn"
            OnClick="btnEmployeeReport_Click" />

        <asp:GridView ID="gvEmployeeReport" runat="server"
            CssClass="grid"
            AutoGenerateColumns="true">
        </asp:GridView>
    </div>

    <div class="card">
        <h3>Department-wise Employee Report</h3>

        <asp:Button ID="btnDepartmentReport" runat="server"
            Text="View Department Report"
            CssClass="btn"
            OnClick="btnDepartmentReport_Click" />

        <asp:GridView ID="gvDepartmentReport" runat="server"
            CssClass="grid"
            AutoGenerateColumns="true">
        </asp:GridView>
    </div>

    <div class="card">
        <h3>Attendance Report</h3>

        <asp:Button ID="btnAttendanceReport" runat="server"
            Text="View Attendance Report"
            CssClass="btn"
            OnClick="btnAttendanceReport_Click" />

        <asp:GridView ID="gvAttendanceReport" runat="server"
            CssClass="grid"
            AutoGenerateColumns="true">
        </asp:GridView>
    </div>

</div>

</form>
</body>
</html>