<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
        }

        .registration-container {
            max-width: 500px;
            margin: 20px auto;
            padding: 30px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            backdrop-filter: blur(10px);
        }

        .registration-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .registration-header h2 {
            color: #2d3748;
            font-weight: 700;
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

        .input-group {
            margin-bottom: 20px;
        }

        .input-group-text {
            background: transparent;
            border: 2px solid #e2e8f0;
            border-right: none;
        }

        .input-icon {
            color: #4c1d95;
            width: 20px;
        }

        .btn-register {
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            background: linear-gradient(135deg, #4c1d95 0%, #5b21b6 100%);
            border: none;
            font-weight: 600;
            color: white;
            margin-top: 20px;
            transition: transform 0.3s ease;
        }

        .btn-register:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(76, 29, 149, 0.3);
        }

        .role-indicator {
            background: #4c1d95;
            color: white;
            padding: 10px 20px;
            border-radius: 10px;
            text-align: center;
            margin-bottom: 20px;
        }

        .login-link {
            text-align: center;
            margin-top: 25px;
            padding-top: 20px;
            border-top: 1px solid #e2e8f0;
        }

        .login-link a {
            color: #4c1d95;
            text-decoration: none;
            font-weight: 600;
        }

        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="registration-container">
            <div class="registration-header">
                <h2>Admin Registration</h2>
                <p class="text-muted">Create your admin account</p>
            </div>

            <div class="role-indicator">
                <i class="fas fa-user-shield me-2"></i>Registering as Admin
            </div>

            <form action="AdminRegistrationController" method="post">
                <!-- Admin ID -->
                <div class="input-group">
                    <span class="input-group-text">
                        <i class="fas fa-id-card input-icon"></i>
                    </span>
                    <input type="text" class="form-control" id="adminId" name="adminId" 
                           placeholder="Admin ID" required pattern="[A-Za-z0-9]+" 
                           title="Only letters and numbers allowed">
                </div>

                <!-- Name -->
                <div class="input-group">
                    <span class="input-group-text">
                        <i class="fas fa-user input-icon"></i>
                    </span>
                    <input type="text" class="form-control" id="name" name="name" 
                           placeholder="Full Name" required>
                </div>

                <!-- Email -->
                <div class="input-group">
                    <span class="input-group-text">
                        <i class="fas fa-envelope input-icon"></i>
                    </span>
                    <input type="email" class="form-control" id="email" name="email" 
                           placeholder="Email Address" required>
                </div>

                <!-- Password -->
                <div class="input-group">
                    <span class="input-group-text">
                        <i class="fas fa-lock input-icon"></i>
                    </span>
                    <input type="password" class="form-control" id="password" name="password" 
                           placeholder="Password" required >
                </div>

               

                <button type="submit" class="btn btn-register">
                    <i class="fas fa-user-plus me-2"></i>Register as Admin
                </button>
            </form>

            <div class="login-link">
                <p>Already have an account? <a href="BankHomePage.jsp">Login here</a></p>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>