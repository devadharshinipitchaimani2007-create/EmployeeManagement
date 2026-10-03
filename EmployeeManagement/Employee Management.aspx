
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee Management.aspx.cs" Inherits="EmployeeManagement.Employee_Management" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Employee Management Dashboard</title>

   
<style>
    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background-color: #f4f6f9;
        animation: pageFade 0.8s ease-in;
    }

    @keyframes pageFade {
        from {
            opacity: 0;
            transform: translateY(8px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .sidebar {
        width: 240px;
        height: 100vh;
        background: linear-gradient(180deg, #123c69, #1769aa, #123c69);
        background-size: 100% 200%;
        animation: sidebarGlow 8s ease infinite;
        position: fixed;
        left: 0;
        top: 0;
        padding-top: 25px;
    }

    @keyframes sidebarGlow {
        0%, 100% {
            background-position: 0% 0%;
        }
        50% {
            background-position: 0% 100%;
        }
    }

    .sidebar h2 {
        color: white;
        text-align: center;
        margin-bottom: 30px;
    }

    .menu {
        display: block;
        color: white;
        text-decoration: none;
        padding: 15px 25px;
        font-size: 16px;
        transition: all 0.3s ease;
        border-left: 4px solid transparent;
    }

    .menu:hover {
        background-color: #1769aa;
        border-left: 4px solid #65d6ff;
        padding-left: 32px;
    }

    .main {
        margin-left: 240px;
        padding: 25px;
    }

    .topbar {
        background-color: white;
        padding: 20px;
        border-radius: 10px;
        margin-bottom: 20px;
        box-shadow: 0 3px 12px rgba(0,0,0,0.05);
    }

    .topbar h1 {
        margin: 0;
        color: #123c69;
        position: relative;
        display: inline-block;
        padding-bottom: 8px;
    }

    .topbar h1::after {
        content: "";
        position: absolute;
        left: 0;
        bottom: 0;
        height: 3px;
        width: 100%;
        background: linear-gradient(90deg, #1769aa, #65d6ff, #1769aa);
        background-size: 200% 100%;
        animation: movingLine 3s linear infinite;
        border-radius: 5px;
    }

    @keyframes movingLine {
        from {
            background-position: 100% 0;
        }
        to {
            background-position: -100% 0;
        }
    }

    .welcome {
        background: linear-gradient(120deg, #1769aa, #123c69, #2385c5);
        background-size: 250% 250%;
        animation: welcomeGradient 8s ease infinite;
        color: white;
        padding: 25px;
        border-radius: 12px;
        margin-bottom: 25px;
        box-shadow: 0 5px 18px rgba(18,60,105,0.18);
    }

    @keyframes welcomeGradient {
        0%, 100% {
            background-position: 0% 50%;
        }
        50% {
            background-position: 100% 50%;
        }
    }

    .welcome h2 {
        margin-top: 0;
    }

    .stats {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 20px;
        margin-bottom: 30px;
    }

    .card {
        background-color: white;
        padding: 20px;
        border-radius: 12px;
        box-shadow: 0 3px 10px #ddd;
        border-bottom: 3px solid transparent;
        transition: transform 0.3s ease,
                    box-shadow 0.3s ease,
                    border-color 0.3s ease;
        animation: cardAppear 0.7s ease both;
    }

    .card:nth-child(2) {
        animation-delay: 0.1s;
    }

    .card:nth-child(3) {
        animation-delay: 0.2s;
    }

    .card:nth-child(4) {
        animation-delay: 0.3s;
    }

    @keyframes cardAppear {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .card:hover {
        transform: translateY(-7px);
        box-shadow: 0 10px 24px rgba(23,105,170,0.18);
        border-bottom-color: #1769aa;
    }

    .card h3 {
        margin-top: 0;
        color: #555;
    }

    .number {
        font-size: 30px;
        font-weight: bold;
        color: #1769aa;
    }

    .modules {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 20px;
    }

    .module {
        background-color: white;
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0 3px 10px #ddd;
        transition: transform 0.3s ease,
                    box-shadow 0.3s ease;
    }

    .module:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 22px rgba(18,60,105,0.15);
    }

    .module h3 {
        color: #123c69;
    }

    .btn {
        background: linear-gradient(90deg, #1769aa, #2385c5);
        background-size: 200% 100%;
        color: white;
        border: none;
        padding: 10px 18px;
        border-radius: 6px;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .btn:hover {
        background-position: 100% 0;
        transform: translateY(-2px);
        box-shadow: 0 5px 14px rgba(23,105,170,0.3);
    }

    .btn:active {
        transform: scale(0.97);
    }

    @media (max-width: 900px) {
        .stats {
            grid-template-columns: repeat(2, 1fr);
        }

        .modules {
            grid-template-columns: repeat(2, 1fr);
        }
    }

    @media (max-width: 600px) {
        .sidebar {
            width: 180px;
        }

        .main {
            margin-left: 180px;
            padding: 15px;
        }

        .stats,
        .modules {
            grid-template-columns: 1fr;
        }
    }

    @media (prefers-reduced-motion: reduce) {
        *, *::before, *::after {
            animation-duration: 0.01ms !important;
            transition-duration: 0.01ms !important;
        }
    }
    .menu a.active {
    background: linear-gradient(90deg, #1769aa, #2d8bd3);
    color: white;
    border-left: 4px solid #ffffff;
    padding-left: 16px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

    .main {
    animation: contentFade 0.7s ease-in-out;
}

@keyframes contentFade {
    from {
        opacity: 0;
        transform: translateY(15px);
    }

    to {
        opacity: 1;
        transform: translateY(0);
    }
}
.sidebar a.active {
    display: block;
    background: linear-gradient(90deg, #1769aa, #2d8bd3);
    color: white;
    border-left: 4px solid white;
    padding: 10px;
    border-radius: 5px;
    text-decoration: none;
}

.welcome {
    background: linear-gradient(120deg, #1769aa, #123c69, #2384c6);
    background-size: 200% 200%;
    animation: welcomeMove 5s ease infinite;
}

@keyframes welcomeMove {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

.card {
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card:hover {
    transform: translateY(-6px);
    box-shadow: 0 10px 22px rgba(18, 60, 105, 0.18);
}
.sidebar a {
    transition: all 0.3s ease;
    position: relative;
}

.sidebar a:hover {
    background: linear-gradient(90deg, #1769aa, #2d8bd3);
    color: white;
    padding-left: 20px;
    border-radius: 5px;
    transform: translateX(5px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}
</style>
</head>

<body>

<form id="form1" runat="server">

    <!-- Sidebar -->
    <div class="sidebar">

        <h2>HR Manager</h2>

       <a href="Employee Management.aspx" class="active">Dashboard</a>
        <a class="menu" href="EmployeeList.aspx">👥 Employees</a>

        <a class="menu" href="Department.aspx">🏢 Departments</a>

        <a class="menu" href="AttendanceList.aspx">📅 Attendance</a>

        <a class="menu" href="LeaveManagement.aspx">📝 Leave</a>

        <a class="menu" href="SalaryList.aspx">💰 Salary</a>

        <a class="menu" href="Reports.aspx">📊 Reports</a>

    </div>

    <!-- Main Content -->
    <div class="main">

        <div class="topbar">
            <h1>Employee Management Dashboard</h1>
        </div>

        <div class="welcome">

            <h2>Welcome, HR Admin 👋</h2>

            <p>
                Manage employees, attendance, leave, salary and other
                HR activities from one place.
            </p>

        </div>

        <!-- Statistics -->
        <div class="stats">

            <div class="card">
                <h3>Total Employees</h3>

                <asp:Label ID="lblTotalEmployees"
                    runat="server"
                    CssClass="number"></asp:Label>
            </div>

            <div class="card">
                <h3>Departments</h3>

                <asp:Label ID="lblTotalDepartments"
                    runat="server"
                    CssClass="number"></asp:Label>

                <br /><br />

               
            </div>

           <div class="card">
    <h3>Present Today</h3>
    <asp:Label ID="lblPresentToday"
        runat="server"
        CssClass="number"></asp:Label>
</div>

           <div class="card">
    <h3>Leave Requests</h3>
    <asp:Label ID="lblLeaveRequests"
        runat="server"
        CssClass="number"></asp:Label>
</div>

        </div>

        <!-- Modules -->
        <div class="modules">

            <div class="module">

                <h3>👥 Employee Management</h3>

                <p>
                    Add, update and manage employee information.
                </p>

              <asp:Button
    ID="btnEmployees"
    runat="server"
    Text="View Employees"
    CssClass="btn"
    PostBackUrl="~/EmployeeList.aspx" />

            </div>

            <div class="module">

                <h3>🏢 Department</h3>

                <p>
                    Manage company departments and employee departments.
                </p>

                <asp:Button
                    ID="btnDepartment"
                    runat="server"
                    Text="Manage"
                    CssClass="btn"
                    PostBackUrl="~/Department.aspx" />

            </div>

            <div class="module">

                <h3>📅 Attendance</h3>

                <p>
                    Track employee attendance and daily presence.
                </p>

                <asp:Button
                    ID="btnViewAttendance"
                    runat="server"
                    Text="View Attendance"
                    CssClass="btn"
                    PostBackUrl="~/AttendanceList.aspx" />

            </div>

            <div class="module">

                <h3>📝 Leave Management</h3>

                <p>
                    Manage employee leave requests and approvals.
                </p>

                <asp:Button
                    ID="btnManageLeave"
                    runat="server"
                    Text="Manage Leave"
                    CssClass="btn"
                    PostBackUrl="~/LeaveManagement.aspx" />

            </div>

            <div class="module">

                <h3>💰 Salary</h3>

                <p>
                    Manage employee salary and payment information.
                </p>

                <asp:Button
                    ID="btnViewSalary"
                    runat="server"
                    Text="View Salary"
                    CssClass="btn"
                    PostBackUrl="~/SalaryList.aspx" />

            </div>

            <div class="module">

                <h3>📊 Reports</h3>

                <p>
                    View employee and HR related reports.
                </p>

                <asp:Button
                    ID="btnReports"
                    runat="server"
                    Text="View Reports"
                    CssClass="btn"
                    PostBackUrl="~/Reports.aspx" />

            </div>

        </div>

    </div>

</form>

</body>
</html>