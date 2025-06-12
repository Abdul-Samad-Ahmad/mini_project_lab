<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Status</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(to right, #e0f7fa, #ffffff);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    
    .message-container {
        background-color: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        text-align: center;
        max-width: 500px;
        width: 100%;
    }
    
    .success-message {
        color: #4CAF50;
        font-size: 18px;
        margin-bottom: 20px;
    }
    
    .error-message {
        color: #f44336;
        font-size: 18px;
        margin-bottom: 20px;
    }
    
    .btn {
        display: inline-block;
        padding: 10px 20px;
        margin: 10px;
        background-color: #0d47a1;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-weight: bold;
        transition: background-color 0.3s;
    }
    
    .btn:hover {
        background-color: #1565c0;
    }
</style>
</head>
<body>
    <div class="message-container">
        <%
            String msg = (String)request.getAttribute("msg");
            if(msg != null) {
        %>
            <div class="success-message">
                <%= msg %>
            </div>
        <% } else { %>
            <div class="error-message">
                Registration failed. Please try again.
            </div>
        <% } %>
        
        <div>
            <a href="login.html" class="btn">Go to Login</a>
            <a href="register.html" class="btn">Register Again</a>
        </div>
    </div>
</body>
</html>