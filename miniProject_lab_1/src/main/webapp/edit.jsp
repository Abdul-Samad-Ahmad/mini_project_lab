<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="nit_server.AdminBean,nit_server.ProductBean" %>
<%
    AdminBean ab = (AdminBean) session.getAttribute("abean");
    ProductBean pb = (ProductBean) request.getAttribute("products");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            text-align: center;
            padding: 50px;
        }

        .container {
            display: inline-block;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
        }

        form input[type="text"], form input[type="number"] {
            width: 80%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            padding: 10px 25px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }

        .welcome {
            margin-bottom: 20px;
            font-size: 18px;
            color: #444;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="welcome">
        <% if (ab != null) { %>
            Welcome, <strong><%= ab.getName() %></strong>
        <% } else { %>
            Session expired or not found.
        <% } %>
    </div>

    <h2>Edit Product Details</h2>

    <% if (pb != null) { %>
        <form action="updateProduct" method="post">
            <input type="hidden" name="pcode" value="<%= pb.getPcode() %>">
            
           
            <input type="number" name="pprice" value="<%= pb.getPrice() %>" placeholder="Product Price" step="0.01" required><br>
            <input type="number" name="stock" value="<%= pb.getStock() %>" placeholder="Stock" required><br>
            
            <input type="submit" value="Update Product">
        </form>
    <% } else { %>
        <p style="color:red;">No product found to edit.</p>
    <% } %>
</div>

</body>
</html>
