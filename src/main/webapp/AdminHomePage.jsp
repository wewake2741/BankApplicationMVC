<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Check if admin is logged in
    String adminName = (String) session.getAttribute("adminName");
    if(adminName == null) {
        response.sendRedirect("LoginPage.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            min-height: 100vh;
        }
        
        .sidebar {
            background: linear-gradient(135deg, #4c1d95 0%, #5b21b6 100%);
            color: white;
            min-height: 100vh;
            padding-top: 2rem;
        }
        
        .sidebar .nav-link {
            color: rgba(255, 255, 255, 0.85);
            padding: 1rem 1.5rem;
            margin: 0.2rem 0;
            border-radius: 0.5rem;
            transition: all 0.3s ease;
        }
        
        .sidebar .nav-link:hover {
            background: rgba(255, 255, 255, 0.1);
            color: white;
        }
        
        .sidebar .nav-link.active {
            background: rgba(255, 255, 255, 0.2);
            color: white;
        }
        
        .main-content {
            padding: 2rem;
        }
        
        .dashboard-card {
            background: white;
            border-radius: 1rem;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease;
        }
        
        .dashboard-card:hover {
            transform: translateY(-5px);
        }
        
        .card-icon {
            width: 48px;
            height: 48px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 col-lg-2 sidebar">
                <div class="text-center mb-4">
                    <i class="fas fa-user-shield fa-3x mb-3"></i>
                    <h5>Welcome,</h5>
                    <h6><%= adminName %></h6>
                </div>
                <nav class="nav flex-column">
                    <a class="nav-link active" href="AdminHomePage.jsp">
                        <i class="fas fa-home me-2"></i>Dashboard
                    </a>
                    <a class="nav-link" href="AddCustomer.jsp">
                        <i class="fas fa-user-plus me-2"></i>Add Customer
                    </a>
                    <a class="nav-link" href="AddBankAccount.jsp">
                        <i class="fas fa-piggy-bank me-2"></i>Add Bank Account
                    </a>
                    <a class="nav-link" href="ViewCustomers.jsp">
                        <i class="fas fa-users me-2"></i>View Customers
                    </a>
                    <a class="nav-link" href="ViewTransactions.jsp">
                        <i class="fas fa-exchange-alt me-2"></i>View Transactions
                    </a>
                    <a class="nav-link" href="LogoutServlet">
                        <i class="fas fa-sign-out-alt me-2"></i>Logout
                    </a>
                </nav>
            </div>

            <!-- Main Content -->
            <div class="col-md-9 col-lg-10 main-content">
                <div class="row mb-4">
                    <div class="col">
                        <h2>Admin Dashboard</h2>
                        <p class="text-muted">Welcome to your admin control panel</p>
                    </div>
                </div>

                <!-- Quick Actions -->
                <div class="row">
                    <div class="col-md-6 col-lg-3">
                        <div class="dashboard-card">
                            <div class="card-icon bg-primary bg-opacity-10 text-primary">
                                <i class="fas fa-user-plus"></i>
                            </div>
                            <h5>Add New Customer</h5>
                            <p class="text-muted">Register new customers to the system</p>
                            <a href="AddCustomer.jsp" class="btn btn-primary">Add Customer</a>
                        </div>
                    </div>
                    
                    <div class="col-md-6 col-lg-3">
                        <div class="dashboard-card">
                            <div class="card-icon bg-success bg-opacity-10 text-success">
                                <i class="fas fa-piggy-bank"></i>
                            </div>
                            <h5>Add Bank Account</h5>
                            <p class="text-muted">Create new bank accounts</p>
                            <a href="AddBankAccount.jsp" class="btn btn-success">Add Account</a>
                        </div>
                    </div>
                    
                    <div class="col-md-6 col-lg-3">
                        <div class="dashboard-card">
                            <div class="card-icon bg-info bg-opacity-10 text-info">
                                <i class="fas fa-users"></i>
                            </div>
                            <h5>View Customers</h5>
                            <p class="text-muted">Manage existing customers</p>
                            <a href="ViewCustomerListControlle" class="btn btn-info">View All</a>
                        </div>
                    </div>
                    
                    <div class="col-md-6 col-lg-3">
                        <div class="dashboard-card">
                            <div class="card-icon bg-warning bg-opacity-10 text-warning">
                                <i class="fas fa-exchange-alt"></i>
                            </div>
                            <h5>View Transactions</h5>
                            <p class="text-muted">Monitor all transactions</p>
                            <a href="ViewTransactions.jsp" class="btn btn-warning">View All</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>