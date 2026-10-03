
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Department.aspx.cs" Inherits="EmployeeManagement.Department" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Department Management</title>

    <style>
        body {
            font-family: Arial;
            background: #f2f5f9;
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
            margin-top: 18px;
            font-weight: bold;
        }

        .input {
            width: 100%;
            padding: 11px;
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
            margin-top: 22px;
            cursor: pointer;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <div class="container">

        <h2>Department Management</h2>

        <label>Department ID</label>
        <asp:TextBox ID="txtDepartmentID"
            runat="server"
            CssClass="input">
        </asp:TextBox>

        <label>Department Name</label>
        <asp:TextBox ID="txtDepartmentName"
            runat="server"
            CssClass="input">
        </asp:TextBox>

        <label>Description</label>
        <asp:TextBox ID="txtDescription"
            runat="server"
            TextMode="MultiLine"
            Rows="3"
            CssClass="input">
        </asp:TextBox>
        <asp:Button ID="btnSaveDepartment" runat="server"
    Text="Save Department"
    CssClass="btn"
    OnClick="btnSaveDepartment_Click" />

        <asp:Label ID="lblMessage"
            runat="server">
        </asp:Label>
        <br /><br />

<h3>Department List</h3>

<asp:GridView ID="gvDepartments" runat="server"
    AutoGenerateColumns="true"
    GridLines="Both"
    CellPadding="10"
    Width="100%">
</asp:GridView>
    </div>

</form>
</body>
</html>