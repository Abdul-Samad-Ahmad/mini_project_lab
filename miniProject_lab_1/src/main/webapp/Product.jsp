<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="nit_server.AdminBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Added</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f4f4f4;
        display: flex;
        flex-direction: column;
        align-items: center;
        padding-top: 50px;
    }
    
    .message-container {
        background-color: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        text-align: center;
        max-width: 500px;
        width: 100%;
        margin-bottom: 30px;
    }
    
    .success-message {
        color: #4CAF50;
        font-size: 18px;
        margin-bottom: 20px;
    }
    
    .admin-info {
        color: #555;
        font-size: 16px;
        margin-bottom: 20px;
    }
    
    .action-buttons {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
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
    <%
        AdminBean ab = (AdminBean)session.getAttribute("abean");
        if(ab == null) {
            response.sendRedirect("login.html");
            return;
        }
        
        String msg = (String) request.getAttribute("msg");
    %>
    
    <div class="message-container">
        <% if(msg != null) { %>
            <div class="success-message">
                <%= msg %>
            </div>
        <% } %>
        
        <div class="admin-info">
            <p>Logged in as: <%= ab.getName() %></p>
        </div>
        
        <div class="action-buttons">
            <a href="addproducts.html" class="btn">Add Product</a>
            <a href="ViewProducts" class="btn">View All Products</a>
            <a href="logout.jsp" class="btn">Logout</a>
        </div>
    </div>
</body>
</html>