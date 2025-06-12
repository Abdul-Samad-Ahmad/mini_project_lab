<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="nit_server.AdminBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Deletion</title>
<style>
    body {
        font-family: Arial, sans-serif;
        text-align: center;
        margin-top: 50px;
    }
    .msg {
        color: green;
        font-size: 18px;
        font-weight: bold;
    }
    .navbar {
        margin-top: 20px;
    }
    .navbar a {
        margin: 0 15px;
        text-decoration: none;
        color: #2196F3;
        font-weight: bold;
    }
</style>
</head>
<body>

<%
    AdminBean ab = (AdminBean) session.getAttribute("abean");
    String msg = (String) request.getAttribute("msg");
%>

<h2>Welcome, <%= ab.getName() %></h2>

<% if (msg != null) { %>
    <p class="msg"><%= msg %></p>
<% } %>

<div class="navbar">
    <a href="addproducts.html">Add Product</a>
    <a href="ViewProducts">View All Products</a>
    <a href="logout">Logout</a>
</div>

</body>
</html>
