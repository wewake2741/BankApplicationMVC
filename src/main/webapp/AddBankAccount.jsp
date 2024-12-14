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
    <title>Generate Account Number</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            min-height: 100vh;
            display: flex;
            align-items: center;
        }
        
        .form-container {
            background: white;
            border-radius: 1rem;
            padding: 2rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin: 2rem auto;
            max-width: 600px;
        }
        
        .form-label {
            font-weight: 500;
            color: #4c1d95;
        }
        
        .form-control:focus {
            border-color: #4c1d95;
            box-shadow: 0 0 0 0.2rem rgba(76, 29, 149, 0.25);
        }
        
        .btn-submit {
            background: linear-gradient(135deg, #4c1d95 0%, #5b21b6 100%);
            border: none;
            padding: 0.8rem 2rem;
            transition: transform 0.3s ease;
        }
        
        .btn-submit:hover {
            transform: translateY(-2px);
            background: linear-gradient(135deg, #5b21b6 0%, #4c1d95 100%);
        }
        
        .account-info {
            background: #f8f9fa;
            border-radius: 0.5rem;
            padding: 1.5rem;
            margin-top: 2rem;
            display: none;
        }
        
        .account-number {
            font-size: 1.5rem;
            font-weight: bold;
            color: #4c1d95;
            text-align: center;
            padding: 1rem;
            background: #e9ecef;
            border-radius: 0.5rem;
            margin: 1rem 0;
        }
        
        .input-group-text {
            background-color: #4c1d95;
            color: white;
            border: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <div class="text-center mb-4">
                <h2 class="text-primary">Generate Account Number</h2>
                <p class="text-muted">Verify customer details to generate account number</p>
            </div>
            
           
            
            <form action="GenerateAccountController" method="post" class="needs-validation" novalidate id="verifyForm">
                <div class="mb-3">
                    <label for="customerId" class="form-label">Customer ID</label>
                    <input type="text" class="form-control" id="customerId" name="customerId" required
                           pattern="[0-9]+" title="Please enter a valid customer ID">
                    <div class="invalid-feedback">
                        Please enter a valid customer ID
                    </div>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Customer Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                    <div class="invalid-feedback">
                        Please enter a valid email address
                    </div>
                </div>

                <div class="mb-3">
                    <label for="balance" class="form-label">Initial Balance</label>
                    <div class="input-group">
                        <span class="input-group-text">₹</span>
                        <input type="number" class="form-control" id="balance" name="balance" 
                               required min="500" step="0.01" 
                               title="Minimum initial balance is ₹500">
                        <div class="invalid-feedback">
                            Please enter a valid amount (minimum ₹500)
                        </div>
                    </div>
                </div>

                <div class="d-grid gap-2 mb-3">
                    <button type="submit" class="btn btn-primary btn-submit">
                        <i class="fas fa-key me-2"></i>Generate Account Number
                    </button>
                </div>
            </form>

            <!-- Generated Account Number Display -->
            <div class="account-info" id="accountInfo">
                <h5 class="text-center mb-3">Generated Account Details</h5>
                
                <div class="customer-details mb-3">
                    <p class="mb-2"><strong>Customer Name:</strong> <span id="customerName"></span></p>
                    <p class="mb-2"><strong>Customer ID:</strong> <span id="displayCustomerId"></span></p>
                    <p class="mb-2"><strong>Email:</strong> <span id="displayEmail"></span></p>
                    <p class="mb-2"><strong>Initial Balance:</strong> ₹<span id="displayBalance"></span></p>
                </div>
                
                <div class="account-number">
                    <i class="fas fa-university me-2"></i>
                    <span id="generatedAccountNumber"></span>
                </div>
                
                <div class="text-center mt-3">
                    <small class="text-muted">Account number generated successfully</small>
                </div>
            </div>

            <div class="d-flex justify-content-center mt-3">
                <a href="AdminHomePage.jsp" class="btn btn-secondary">
                    <i class="fas fa-arrow-left me-2"></i>Back to Dashboard
                </a>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>