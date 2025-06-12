<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="nit_server.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product List</title>
<style>
/* General Page Styling */
body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f7fc;
    color: #333;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Navbar Styling */
.navbar {
    background-color: #4CAF50;
    color: white;
    padding: 15px 30px;
    text-align: center;
    font-size: 18px;
    font-weight: bold;
    position: sticky;
    top: 0;
    width: 100%;
}

.navbar a {
    color: white;
    text-decoration: none;
    margin-left: 30px;
    font-size: 18px;
}

.navbar a:hover {
    text-decoration: underline;
}

/* Container for content */
.container {
    max-width: 1200px;
    margin: 50px auto;
    padding: 40px;
    background: white;
    border-radius: 10px;
    box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
}

/* Header Section */
h2 {
    text-align: center;
    color: #333;
    font-size: 32px;
    font-weight: bold;
    margin-bottom: 30px;
}

/* Product Cards */
.card-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    gap: 30px;
    margin-top: 30px;
}

.card {
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 250px;
    border-radius: 8px;
    overflow: hidden;
    text-align: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card:hover {
    transform: translateY(-10px);
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
}

.card img {
    width: 100%;
    height: 200px;
    object-fit: cover;
}

.card-content {
    padding: 15px;
}

.card-content h3 {
    color: #333;
    font-size: 20px;
    margin: 10px 0;
}

.card-content p {
    color: #666;
    font-size: 14px;
    margin-bottom: 15px;
}

.card-footer {
    display: flex;
    justify-content: space-around;
    margin-top: 15px;
}

.card-footer .btn {
    background-color: #4CAF50;
    color: white;
    padding: 8px 20px;
    text-decoration: none;
    border-radius: 5px;
    font-size: 16px;
    transition: background-color 0.3s ease;
}

.card-footer .btn:hover {
    background-color: #45a049;
}

/* Logout Button */
a.logout-btn {
    text-align: center;
    display: block;
    margin-top: 30px;
    background-color: #e74c3c;
    color: white;
    padding: 12px 30px;
    text-decoration: none;
    border-radius: 5px;
    width: 200px;
    margin: 30px auto 0;
    font-size: 16px;
    text-align: center;
}

a.logout-btn:hover {
    background-color: #c0392b;
}

/* Responsive Design */
@media (max-width: 768px) {
    .card-container {
        flex-direction: column;
        align-items: center;
    }

    .card {
        width: 90%;
        margin-bottom: 20px;
    }

    .navbar {
        font-size: 16px;
        padding: 10px 20px;
    }
}

</style>
</head>
<body>

<div class="navbar">
    <span>Welcome to Our Product Store</span>
    <a href="logout.jsp">Logout</a>
</div>

<div class="container">
    <% 
        CustBean cb = (CustBean) session.getAttribute("cbean");
        ArrayList<ProductBean> al = (ArrayList<ProductBean>) session.getAttribute("Clist");
    %>

    <h2>
        Page belongs to: <%= cb != null ? cb.getUname() : "Unknown Customer" %>
    </h2>

    <% 
        if (al != null && al.size() > 0) {
    %>
        <div class="card-container">
            <%
                Iterator<ProductBean> itr = al.iterator();
                while (itr.hasNext()) {
                    ProductBean pb = itr.next();
            %>
            <div class="card">
                <img src="path_to_your_image.jpg" alt="<%= pb.getPname() %>">
                <div class="card-content">
                    <h3><%= pb.getPname() %></h3>
                    <p><strong>Price:</strong> $<%= String.format("%.2f", pb.getPrice()) %></p>
                    <p><strong>Stock:</strong> <%= pb.getStock() %> left</p>
                </div>
                <div class="card-footer">
                    <a href="BuyServlet?pcode=<%= pb.getPcode() %>" class="btn">Buy</a>
                </div>
            </div>
            <%
                }
            %>
        </div>
    <% 
        } else {
    %>
        <p style="text-align: center; color: #e74c3c; font-size: 18px;">No products available.</p>
    <% 
        }
    %>

    <a href="logout.jsp" class="logout-btn">Logout</a>
</div>

</body>
</html>
