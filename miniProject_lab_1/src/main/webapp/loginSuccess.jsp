<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="nit_server.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style>
    body {
        margin: 0;
        padding: 0;
        background: linear-gradient(to bottom right, #0f2027, #203a43, #2c5364);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        color: white;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .dashboard {
        background-color: #1e1e2f;
        padding: 40px 50px;
        border-radius: 15px;
        text-align: center;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
    }

    .welcome-box {
        background-color: deepskyblue;
        color: darkred;
        font-size: 22px;
        font-weight: bold;
        padding: 15px 20px;
        border-radius: 8px;
        margin-bottom: 35px;
        box-shadow: 0 0 10px rgba(0,0,0,0.3);
    }

    .dashboard a button {
        background-color: #007bff;
        color: white;
        padding: 12px 25px;
        margin: 10px;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .dashboard a button:hover {
        background-color: #0056b3;
        transform: scale(1.05);
    }

    .dashboard-buttons {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
    }
</style>
</head>
<body>

<%
    AdminBean ab = (AdminBean)session.getAttribute("abean");
%>

<div class="dashboard">
    <div class="welcome-box">
        👋 Welcome, Admin <%= ab.getName() %>
    </div>

    <div class="dashboard-buttons">
        <a href="addproducts.html"><button>➕ Add Product</button></a>
        <a href="ViewProducts"><button>📦 View Products</button></a>
        <a href="logout.jsp"><button>🚪 Logout</button></a>
    </div>
</div>

</body>
</html>
