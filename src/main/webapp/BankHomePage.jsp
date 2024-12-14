<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
        }
        
        .login-container {
            max-width: 400px;
            margin: 20px auto;
            padding: 30px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
        }

        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .login-header h2 {
            color: #2d3748;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .role-selector {
            margin-bottom: 25px;
        }

        .btn-check:checked + .btn-outline-primary {
            background-color: #4c1d95;
            border-color: #4c1d95;
        }

        .btn-outline-primary {
            border-color: #4c1d95;
            color: #4c1d95;
        }

        .btn-outline-primary:hover {
            background-color: #4c1d95;
            border-color: #4c1d95;
        }

        .form-control {
            border-radius: 10px;
            padding: 12px;
            border: 2px solid #e2e8f0;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: #4c1d95;
            box-shadow: 0 0 0 0.2rem rgba(76, 29, 149, 0.25);
        }

        .input-group-text {
            background: transparent;
            border: 2px solid #e2e8f0;
            border-right: none;
        }

        .form-floating label {
            padding-left: 20px;
        }

        .btn-login {
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            background: linear-gradient(135deg, #4c1d95 0%, #5b21b6 100%);
            border: none;
            font-weight: 600;
            margin-top: 20px;
            transition: transform 0.3s ease;
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(76, 29, 149, 0.3);
            background: linear-gradient(135deg, #5b21b6 0%, #4c1d95 100%);
        }

        .form-check-input:checked {
            background-color: #4c1d95;
            border-color: #4c1d95;
        }

        .links-section {
            margin-top: 20px;
        }

        .links-section a {
            color: #4c1d95;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .links-section a:hover {
            color: #5b21b6;
            text-decoration: underline;
        }

        .register-link {
            text-align: center;
            margin-top: 25px;
            padding-top: 20px;
            border-top: 1px solid #e2e8f0;
        }

        .input-group {
            margin-bottom: 20px;
        }

        .input-icon {
            color: #4c1d95;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-container">
            <div class="login-header">
                <h2>Welcome Back</h2>
                <p class="text-muted">Please login to your account</p>
            </div>
            
            
            
            <!-- Login Form -->
            <form action="LoginController" method="post">
            <!-- Role Selection -->
	            <div class="role-selector">
	                <div class="btn-group w-100" role="group">
	                    <input type="radio" class="btn-check" name="role" id="user" value="user" autocomplete="off" checked>
	                    <label class="btn btn-outline-primary" for="user">
	                        <i class="fas fa-user me-2"></i>User
	                    </label>
	                    
	                    <input type="radio" class="btn-check" name="role" id="admin" value="admin" autocomplete="off" >
	                    <label class="btn btn-outline-primary" for="admin">
	                        <i class="fas fa-user-shield me-2"></i>Admin
	                    </label>
	                </div>
	            </div>
	            
                <div class="input-group">
                    <span class="input-group-text">
                        <i class="fas fa-envelope input-icon"></i>
                    </span>
                    <input type="email" class="form-control" name="email" id="email" placeholder="Email address" required>
                </div>
                
                <div class="input-group">
                    <span class="input-group-text">
                        <i class="fas fa-lock input-icon"></i>
                    </span>
                    <input type="password" class="form-control" name="password" id="password" placeholder="Password" required>
                </div>
                
                <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="remember">
                    <label class="form-check-label" for="remember">Remember me</label>
                </div>
                
                <button type="submit" class="btn btn-primary btn-login">
                    <i class="fas fa-sign-in-alt me-2"></i>Login
                </button>
            </form>
            
            <!-- Links Section -->
            <div class="links-section d-flex justify-content-between">
                <a href="#" class="forgot-link">
                    <i class="fas fa-key me-1"></i>Forgot Password?
                </a>
                <a href="#" class="help-link">
                    <i class="fas fa-question-circle me-1"></i>Need Help?
                </a>
            </div>
            
            <div class="register-link">
                <p class="mb-0">Don't have an account? 
                    <a href="AdminRegistration.jsp" class="fw-bold">Register here</a>
                </p>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>