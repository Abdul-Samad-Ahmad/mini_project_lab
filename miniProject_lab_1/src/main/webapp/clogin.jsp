<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="nit_server.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #e9f5ff;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .welcome-box {
        background-color: white;
        padding: 40px;
        border-radius: 12px;
        box-shadow: 0 0 15px rgba(0,0,0,0.1);
        text-align: center;
    }

    h2 {
        color: #333;
    }

    .logout-btn {
        margin-top: 20px;
        padding: 10px 20px;
        background-color: #ff4d4d;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        cursor: pointer;
        text-decoration: none;
    }

    .logout-btn:hover {
        background-color: #e60000;
    }
</style>
</head>
<body>

<%
    CustBean cb = (CustBean)session.getAttribute("cbean");
    if (cb != null) {
%>
    <div class="welcome-box">
        <h2>Welcome, Admin <%= cb.getUname() %> 👋</h2>
        <p>You have successfully logged in to the admin dashboard.</p>
        <a class="logout-btn" href="View">View Products</a>
    </div>
<%
    } else {
%>
    <div class="welcome-box">
        <h2>Session expired or not logged in!</h2>
        <a class="logout-btn" href="logout.jsp">Go to Login</a>
    </div>
<%
    }
%>

</body>
</html>
