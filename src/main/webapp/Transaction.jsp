<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .transaction-form {
            display: none;
        }
        .form-active {
            display: block;
        }
        .nav-pills .nav-link.active {
            background-color: #0d6efd;
        }
        .error-message {
            color: red;
            display: none;
        }
    </style>
</head>
<body class="bg-light">
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="UserHomePage.jsp">Online Banking</a>
            <div class="navbar-text text-white me-3">
                Welcome, <%= session.getAttribute("userName") %>
            </div>
            <a href="UserHomePage.jsp" class="btn btn-outline-light">Back to Dashboard</a>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow">
                    <div class="card-header bg-white">
                        <ul class="nav nav-pills card-header-pills" role="tablist">
                            <li class="nav-item">
                                <button class="nav-link active" data-bs-toggle="pill" data-type="credit" type="button">Credit/Deposit</button>
                            </li>
                            <li class="nav-item">
                                <button class="nav-link" data-bs-toggle="pill" data-type="debit" type="button">Debit/Withdraw</button>
                            </li>
                            <li class="nav-item">
                                <button class="nav-link" data-bs-toggle="pill" data-type="transfer" type="button">Transfer</button>
                            </li>
                        </ul>
                    </div>
                    
                    <div class="card-body">
                        <!-- Credit Form -->
                        <form id="creditForm" action="TransactionController" method="post" class="transaction-form form-active">
                            <input type="hidden" name="transactionType" value="credit">
                            <div class="mb-3">
                                <label class="form-label">Your Account Number</label>
                                <input type="text" class="form-control" value="${accountNumber}" readonly>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Amount to Deposit</label>
                                <input type="number" name="amount" class="form-control" min="1" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Description</label>
                                <input type="text" name="description" class="form-control" required>
                            </div>
                            <button type="submit" class="btn btn-success">Deposit Money</button>
                        </form>

                        <!-- Debit Form -->
                        <form id="debitForm" action="TransactionController" method="post" class="transaction-form">
                            <input type="hidden" name="transactionType" value="debit">
                            <div class="mb-3">
                                <label class="form-label">Your Account Number</label>
                                <input type="text" class="form-control" value="${accountNumber}" readonly>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Amount to Withdraw</label>
                                <input type="number" name="amount" class="form-control" min="1" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Description</label>
                                <input type="text" name="description" class="form-control" required>
                            </div>
                            <button type="submit" class="btn btn-warning">Withdraw Money</button>
                        </form>

                        <!-- Transfer Form -->
                        <form id="transferForm" action="TransactionController" method="post" class="transaction-form">
                            <input type="hidden" name="transactionType" value="transfer">
                            <div class="mb-3">
                                <label class="form-label">Your Account Number</label>
                                <input type="text" class="form-control" value="${accountNumber}" readonly>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Recipient Account Number</label>
                                <input type="text" name="recipientAccount" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Amount to Transfer</label>
                                <input type="number" name="amount" class="form-control" min="1" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Description</label>
                                <input type="text" name="description" class="form-control" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Transfer Money</button>
                        </form>
                    </div>
                </div>

                <!-- Balance Display -->
                <div class="card mt-3">
                    <div class="card-body">
                        <h6 class="card-subtitle mb-2 text-muted">Current Balance</h6>
                        <h4 class="card-title">₹ ${balance}</h4>
                    </div>
                </div>

                <!-- Error/Success Messages -->
                <% if(request.getAttribute("errorMessage") != null) { %>
                    <div class="alert alert-danger mt-3">
                        <%= request.getAttribute("errorMessage") %>
                    </div>
                <% } %>
                <% if(request.getAttribute("successMessage") != null) { %>
                    <div class="alert alert-success mt-3">
                        <%= request.getAttribute("successMessage") %>
                    </div>
                <% } %>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Handle form switching
        document.querySelectorAll('.nav-link').forEach(button => {
            button.addEventListener('click', function() {
                // Remove active class from all nav links
                document.querySelectorAll('.nav-link').forEach(btn => btn.classList.remove('active'));
                // Add active class to clicked button
                this.classList.add('active');
                
                // Hide all forms
                document.querySelectorAll('.transaction-form').forEach(form => {
                    form.classList.remove('form-active');
                });
                
                // Show selected form
                const formType = this.getAttribute('data-type');
                document.getElementById(formType + 'Form').classList.add('form-active');
            });
        });

        // Form validation
        document.querySelectorAll('form').forEach(form => {
            form.addEventListener('submit', function(e) {
                const amountInput = this.querySelector('input[name="amount"]');
                if (amountInput.value <= 0) {
                    e.preventDefault();
                    alert('Please enter a valid amount greater than 0');
                }
            });
        });
    </script>
</body>
</html>