
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="EmployeeManagement.Attendance" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Employee Attendance</title>

    <style>
        body {
            font-family: Arial;
            background: #f2f5f9;
            margin: 0;
            padding: 40px;
        }

        .container {
            width: 450px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #123c69;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        .input {
            width: 100%;
            padding: 10px;
            margin-top: 7px;
            box-sizing: border-box;
        }

        .btn {
            background: #1769aa;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            width: 100%;
            margin-top: 20px;
            cursor: pointer;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <div class="container">

        <h2>Employee Attendance</h2>

        <label>Employee ID</label>
        <asp:TextBox ID="txtEmployeeID"
            runat="server"
            CssClass="input">
        </asp:TextBox>

        <label>Attendance Date</label>
        <asp:TextBox ID="txtDate"
            runat="server"
            TextMode="Date"
            CssClass="input">
        </asp:TextBox>

        <label>Attendance Status</label>
        <asp:DropDownList ID="ddlStatus"
            runat="server"
            CssClass="input">
            <asp:ListItem Text="Present" Value="Present" />
            <asp:ListItem Text="Absent" Value="Absent" />
            <asp:ListItem Text="Leave" Value="Leave" />
        </asp:DropDownList>

        <asp:Button ID="btnSaveAttendance"
            runat="server"
            Text="Save Attendance"
            CssClass="btn"
            OnClick="btnSaveAttendance_Click" />

        <asp:Label ID="lblMessage"
            runat="server">
        </asp:Label>

    </div>

</form>
</body>
</html>