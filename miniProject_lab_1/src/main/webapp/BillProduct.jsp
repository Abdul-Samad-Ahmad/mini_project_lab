<%@ page import="nit_server.ProductBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bill Confirmation</title>
<style>
    body {
        margin: 0;
        padding: 0;
        background: linear-gradient(135deg, #e3f2fd, #ffffff);
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .card {
        background-color: #ffffff;
        border-radius: 20px;
        padding: 30px 40px;
        width: 420px;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
        text-align: center;
        transition: 0.3s;
    }

    .card:hover {
        transform: scale(1.01);
    }

    h1 {
        color: #222;
        font-size: 22px;
        margin-bottom: 10px;
    }

    .info {
        font-size: 18px;
        margin: 10px 0;
        color: #444;
    }

    .bill {
        font-size: 20px;
        font-weight: bold;
        color: #2e7d32;
        margin-top: 15px;
    }

    .btn {
        margin-top: 25px;
        padding: 12px 28px;
        font-size: 16px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        transition: background 0.3s;
    }

    .btn:hover {
        background-color: #43a047;
    }

    .back-btn {
        margin-top: 15px;
        display: inline-block;
        background-color: #e0e0e0;
        padding: 10px 22px;
        border-radius: 10px;
        text-decoration: none;
        color: #333;
        font-weight: 500;
        transition: background 0.3s;
    }

    .back-btn:hover {
        background-color: #ccc;
    }

    input[type="text"],
    input[type="hidden"] {
        display: none;
    }

    .tick {
        font-size: 40px;
        color: #4CAF50;
        margin-bottom: 10px;
    }
</style>
</head>
<body>
<%
    int qty = (int) request.getAttribute("quantity");
    ProductBean pb = (ProductBean) request.getAttribute("product");
    double bill = pb.getPrice() * qty;
    String payment = request.getParameter("payment");
%>

<div class="card">
    <div class="tick">✅</div>
    <h1>Billing Confirmation</h1>
    <div class="info">Product Code: <strong><%= pb.getPcode() %></strong></div>
    <div class="info">Product Name: <strong><%= pb.getPname() %></strong></div>
    <div class="info">Price per Unit: ₹<%= pb.getPrice() %></div>
    <div class="info">Quantity Ordered: <%= qty %></div>
    <div class="bill">Total Bill: ₹<%= bill %></div>

    <form action="payment" method="get">
        <input type="text" name="bill" value="<%= bill %>">
        <input type="hidden" name="code" value="<%= pb.getPcode() %>">
        <input type="hidden" name="qty" value="<%= qty %>">
        <input type="submit" class="btn" value="Make Payment 💳">
    </form>

    <a href="CProducts.jsp" class="back-btn">⬅ Back to Products</a>
</div>
</body>
</html>
