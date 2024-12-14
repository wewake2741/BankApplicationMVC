<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Home Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .welcome-section {
            background: #f8f9fa;
            padding: 20px;
            margin-bottom: 30px;
            border-radius: 5px;
        }
        .card {
            transition: transform 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="#">Online Banking</a>
            <div class="navbar-text text-white">
                Welcome, <%= session.getAttribute("userName") %>
            </div>
            <form action="logout" method="post" class="ms-auto">
                <button type="submit" class="btn btn-outline-light">Logout</button>
            </form>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="welcome-section">
            <h2>Welcome to Your Account Dashboard</h2>
            <p>What would you like to do today?</p>
        </div>

        <div class="row g-4">
            <!-- Passbook Card -->
            <div class="col-md-4">
                <div class="card h-100">
                    <div class="card-body text-center">
                        <h5 class="card-title">Passbook</h5>
                        <p class="card-text">View your transaction history and account details</p>
                        <a href="passbook" class="btn btn-primary">View Passbook</a>
                    </div>
                </div>
            </div>

            <!-- New Transaction Card -->
            <div class="col-md-4">
                <div class="card h-100">
                    <div class="card-body text-center">
                        <h5 class="card-title">New Transaction</h5>
                        <p class="card-text">Make a new transaction or transfer money</p>
                        <a href="Transaction.jsp" class="btn btn-success">Make Transaction</a>
                    </div>
                </div>
            </div>

            <!-- Edit Profile Card -->
            <div class="col-md-4">
                <div class="card h-100">
                    <div class="card-body text-center">
                        <h5 class="card-title">Edit Profile</h5>
                        <p class="card-text">Update your personal information and settings</p>
                        <a href="editProfile" class="btn btn-info">Edit Profile</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Account Summary Section -->
        <div class="card mt-4">
            <div class="card-header bg-light">
                <h5 class="mb-0">Account Summary</h5>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-4">
                        <p class="text-muted mb-1">Account Number</p>
                        <h6>${accountNumber}</h6>
                    </div>
                    <div class="col-md-4">
                        <p class="text-muted mb-1">Current Balance</p>
                        <h6>${balance}</h6>
                    </div>
                    <div class="col-md-4">
                        <p class="text-muted mb-1">Account Type</p>
                        <h6>${accountType}</h6>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>