<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="nit_server.CustBean,nit_server.ProductBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buy Product</title>
<style>
/* General Styling */
body {
    font-family: 'Arial', sans-serif;
    background-color: #f5f5f5;
    color: #333;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
}

.container {
    background: #ffffff;
    border-radius: 10px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    padding: 40px;
    max-width: 500px;
    width: 100%;
}

.user-info {
    font-size: 18px;
    margin-bottom: 20px;
    text-align: center;
}

.user-info strong {
    color: #4CAF50;
}

.user-info a {
    color: #2196F3;
    text-decoration: none;
}

.user-info a:hover {
    text-decoration: underline;
}

h1 {
    color: #333;
    font-size: 24px;
    margin-bottom: 20px;
    font-weight: 600;
    text-align: center;
}

form {
    display: flex;
    flex-direction: column;
    gap: 15px;
}

label {
    font-weight: bold;
    color: #555;
}

input[type="text"],
input[type="number"] {
    padding: 10px;
    font-size: 16px;
    border: 2px solid #ddd;
    border-radius: 5px;
    background-color: #f9f9f9;
}

input:focus {
    border-color: #4CAF50;
    outline: none;
}

.buy-btn {
    background-color: #4CAF50;
    color: white;
    padding: 12px 30px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 18px;
    transition: background-color 0.3s ease;
    width: 100%;
}

.buy-btn:hover {
    background-color: #45a049;
}

.error {
    color: red;
    font-size: 18px;
    text-align: center;
    margin-top: 20px;
}
</style>
</head>
<body>
    <div class="container">
        <% CustBean cb = (CustBean) session.getAttribute("cbean");
           ProductBean pb = (ProductBean) request.getAttribute("products");
        %>

        <div class="user-info">
            <% if (cb != null) { %>
                Welcome, <strong><%= cb.getUname() %></strong>
            <% } else { %>
                Session expired or not found. Please <a href="login.jsp">login</a>.
            <% } %>
        </div>

        <div class="product-container">
            <h1>Buy Product</h1>

            <% if (pb != null) { %>
            <form action="Bill" method="post">
                <label>Product Name:</label>
                <input type="text" name="name" value="<%= pb.getPname() %>" readonly>

                <label>Product Code:</label>
                <input type="text" name="pCode" value="<%= pb.getPcode() %>" readonly>

                <label>Price:</label>
                <input type="text" name="price" value="<%= pb.getPrice() %>" readonly>

                <label>Stock Available:</label>
                <input type="text" name="stock" value="<%= pb.getStock() %>" readonly>

                <label>Required Quantity:</label>
                <input type="number" name="qty" min="1" max="<%= pb.getStock() %>" required>

                <button type="submit" class="buy-btn">Buy Product</button>
            </form>
            <% } else { %>
                <div class="error">Product information not available.</div>
            <% } %>
        </div>
    </div>
</body>
</html>
