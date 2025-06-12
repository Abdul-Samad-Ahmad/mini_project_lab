<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f8d7da;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    
    .error-container {
        background-color: white;
        padding: 30px;
        border-radius: 10px;
        border-left: 5px solid #dc3545;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        text-align: center;
        max-width: 500px;
        width: 100%;
    }
    
    .error-icon {
        font-size: 50px;
        color: #dc3545;
        margin-bottom: 20px;
    }
    
    .error-message {
        color: #dc3545;
        font-size: 18px;
        margin-bottom: 20px;
    }
    
    .btn {
        display: inline-block;
        padding: 10px 20px;
        margin: 10px;
        background-color: #dc3545;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-weight: bold;
        transition: background-color 0.3s;
    }
    
    .btn:hover {
        background-color: #c82333;
    }
</style>
</head>
<body>
    <div class="error-container">
        <div class="error-icon">⚠️</div>
        
        <%
            String errorMsg = (String)request.getAttribute("wrong");
            if(errorMsg == null) {
                errorMsg = "An error occurred";
            }
        %>
        
        <div class="error-message">
            <%= errorMsg %>
        </div>
        
        <div>
            <a href="login.html" class="btn">Back to Login</a>
        </div>
    </div>
</body>
</html>