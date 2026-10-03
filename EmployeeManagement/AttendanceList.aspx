<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="AttendanceList.aspx.cs"
    Inherits="EmployeeManagement.AttendanceList" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Attendance List</title>

    <style>
        body {
            font-family: Arial;
            background-color: #f4f7fb;
            margin: 0;
            padding: 30px;
        }

        .container {
            background: white;
            padding: 25px;
            border-radius: 10px;
            max-width: 1000px;
            margin: auto;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        h2 {
            color: #123c69;
            text-align: center;
        }

        .btn {
            background-color: #1769aa;
            color: white;
            padding: 10px 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-bottom: 20px;
        }

        .grid {
            width: 100%;
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
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <div class="container">

            <h2>Attendance List</h2>

            <asp:Button ID="btnRefresh"
                runat="server"
                Text="Refresh Attendance"
                CssClass="btn"
                OnClick="btnRefresh_Click" />

            <asp:GridView ID="gvAttendance"
                runat="server"
                AutoGenerateColumns="true"
                CssClass="grid"
                EmptyDataText="No attendance records found.">
            </asp:GridView>

        </div>

    </form>
</body>
</html>