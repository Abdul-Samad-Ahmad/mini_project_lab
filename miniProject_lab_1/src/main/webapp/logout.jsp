<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        text-align: center;
        margin-top: 100px;
    }
    
    .logout-container {
        background-color: white;
        width: 400px;
        margin: 0 auto;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    
    h2 {
        color: #4CAF50;
    }
    
    p {
        margin: 20px 0;
        font-size: 16px;
    }
    
    a {
        display: inline-block;
        padding: 10px 20px;
        background-color: #4CAF50;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        margin-top: 20px;
    }
    
    a:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
<%
    // Invalidate the session
    session.invalidate();
%>
<div class="logout-container">
    <h2>Logout Successful</h2>
    <p>You have been successfully logged out of the system.</p>
    <a href="home2.html">Back to Home</a>
</div>
</body>
</html>