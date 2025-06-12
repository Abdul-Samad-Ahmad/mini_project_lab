<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="nit_server.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Success</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f2f5;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .container {
        background-color: #fff;
        padding: 40px;
        border-radius: 12px;
        box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
        text-align: center;
    }

    h2 {
        color: #333;
        margin: 20px 0;
    }

    a {
        text-decoration: none;
        margin: 10px;
    }

    button {
        background-color: #3498db;
        color: white;
        padding: 12px 20px;
        font-size: 16px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    button:hover {
        background-color: #2980b9;
    }
</style>
</head>
<body>
    <%
        CustBean cb = (CustBean) session.getAttribute("cbean");
        double bill = (double) request.getAttribute("bill");
    %>
    <div class="container">
        <h2>Welcome, <%= cb.getUname() %>!</h2>
        <h2>₹<%= bill %> successfully paid</h2>
        <a href="CProducts.jsp"><button>View All Products</button></a>
        <a href="logout.jsp"><button>Logout</button></a>
    </div>
</body>
</html>
