
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaveManagement.aspx.cs" Inherits="EmployeeManagement.LeaveManagement" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Leave Management</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            padding: 30px;
        }

        .container {
            max-width: 1000px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 3px 12px #ddd;
        }

        h1 {
            color: #123c69;
            text-align: center;
        }

        h2 {
            color: #123c69;
            margin-top: 30px;
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

        .message {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: green;
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

        @media (max-width: 600px) {
            body {
                padding: 10px;
            }

            .container {
                padding: 15px;
            }
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <div class="container">

        <h1>Leave Management</h1>

        <div class="form-group">
            <label>Employee ID</label>
            <asp:TextBox ID="txtEmployeeID" runat="server"
                CssClass="input"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Leave Type</label>
            <asp:DropDownList ID="ddlLeaveType" runat="server"
                CssClass="input">
                <asp:ListItem Text="Select Leave Type" Value=""></asp:ListItem>
                <asp:ListItem Text="Casual Leave" Value="Casual Leave"></asp:ListItem>
                <asp:ListItem Text="Sick Leave" Value="Sick Leave"></asp:ListItem>
                <asp:ListItem Text="Earned Leave" Value="Earned Leave"></asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label>From Date</label>
            <asp:TextBox ID="txtFromDate" runat="server"
                TextMode="Date" CssClass="input"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>To Date</label>
            <asp:TextBox ID="txtToDate" runat="server"
                TextMode="Date" CssClass="input"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Reason</label>
            <asp:TextBox ID="txtReason" runat="server"
                TextMode="MultiLine" Rows="3"
                CssClass="input"></asp:TextBox>
        </div>

        <asp:Button ID="btnApplyLeave" runat="server"
            Text="Apply Leave"
            CssClass="btn"
            OnClick="btnApplyLeave_Click" />

        <asp:Button ID="btnClear" runat="server"
            Text="Clear"
            CssClass="btn"
            OnClick="btnClear_Click"
            CausesValidation="false" />

        <asp:Label ID="lblMessage" runat="server"
            CssClass="message"></asp:Label>

        <h2>Leave Records</h2>

        <asp:GridView ID="gvLeave" runat="server"
            AutoGenerateColumns="true"
            CssClass="grid"
            EmptyDataText="No leave records found.">
        </asp:GridView>

    </div>

</form>
</body>
</html>