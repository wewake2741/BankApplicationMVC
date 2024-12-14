<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Passbook - Transaction History</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .transaction-history {
            background: #f8f9fa;
            padding: 20px;
            margin-bottom: 30px;
            border-radius: 5px;
        }
        .table-responsive {
            border-radius: 5px;
            overflow: hidden;
        }
        .table th {
            background-color: #0d6efd;
            color: white;
        }
        .credit {
            color: #198754;
            font-weight: bold;
        }
        .debit {
            color: #dc3545;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="#">Online Banking</a>
            <div class="navbar-text text-white">
                Welcome, <%= session.getAttribute("userName") %>
            </div>
            <div class="ms-auto">
                <a href="home" class="btn btn-outline-light me-2">Back to Home</a>
                <form action="logout" method="post" class="d-inline">
                    <button type="submit" class="btn btn-outline-light">Logout</button>
                </form>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <!-- Transaction History Header -->
        <div class="transaction-history">
            <h2>Transaction History</h2>
            <p>View all your past transactions and account activity</p>
        </div>

        <!-- Transaction Table -->
        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Sender Account</th>
                                <th>Receiver Account</th>
                                <th>Transaction Type</th>
                                <th>Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${transactions}" var="transaction">
                                <tr>
                                    <td>${transaction.date}</td>
                                    <td>${transaction.senderAccount}</td>
                                    <td>${transaction.receiverAccount}</td>
                                    <td>
                                        <span class="${transaction.type == 'CREDIT' ? 'credit' : 'debit'}">
                                            ${transaction.type}
                                        </span>
                                    </td>
                                    <td>
                                        <span class="${transaction.type == 'CREDIT' ? 'credit' : 'debit'}">
                                            ₹${transaction.amount}
                                        </span>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Account Summary Card -->
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