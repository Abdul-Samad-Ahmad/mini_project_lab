<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="nit_server.AdminBean,nit_server.ProductBean" %>
<%
    AdminBean ab = (AdminBean) session.getAttribute("abean");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 700px;
            margin: 50px auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0,0,0,0.1);
            text-align: center;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        .message {
            color: green;
            font-weight: bold;
            margin-bottom: 20px;
        }

        input[type=text], input[type=number] {
            width: 80%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        button {
            padding: 10px 25px;
            background-color: #2196F3;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .nav-links {
            margin-top: 20px;
        }

        .nav-links a {
            margin: 0 10px;
            text-decoration: none;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border-radius: 5px;
        }

        .nav-links a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Product - <%= ab != null ? ab.getName() : "Guest" %></h2>

        <% String msg = (String) request.getAttribute("msg"); %>
        <% if (msg != null && !msg.isEmpty()) { %>
            <div class="message"><%= msg %></div>
        <% } %>

        <!-- Form will go here if needed -->

        <div class="nav-links">
            <a href="addproducts.html">Add Products</a>
            <a href="ViewProducts">View All Products</a>
            <a href="logout">Logout</a>
        </div>
    </div>
</body>
</html>
