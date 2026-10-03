<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EmployeeManagement.Login" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Employee Management - Login</title>

    <style>
        body {
            font-family: Arial;
            background-color: #f2f5f9;
        }

        .login-box {
            width: 350px;
            margin: 100px auto;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px #ccc;
        }

        h2 {
            text-align: center;
            color: #123c69;
        }

        .input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            box-sizing: border-box;
        }

        .login-btn {
            width: 100%;
            padding: 10px;
            background-color: #1769aa;
            color: white;
            border: none;
            cursor: pointer;
        }

        .login-btn:hover {
            background-color: #0d4f80;
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

    <div class="login-box">

        <h2>Employee Management</h2>

        <asp:TextBox ID="txtUsername"
            runat="server"
            CssClass="input"
            placeholder="Username">
        </asp:TextBox>

        <asp:TextBox ID="txtPassword"
            runat="server"
            CssClass="input"
            TextMode="Password"
            placeholder="Password">
        </asp:TextBox>

        <asp:Button ID="btnLogin"
            runat="server"
            Text="Login"
            CssClass="login-btn"
            OnClick="btnLogin_Click" />

    </div>

</form>

</body>
</html>