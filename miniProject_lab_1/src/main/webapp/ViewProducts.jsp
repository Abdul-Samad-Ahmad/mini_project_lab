<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="nit_server.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Product List</title>
	<style>
		body {
			margin: 0;
			font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
			background: linear-gradient(to right, #dfe9f3, #ffffff);
			color: #333;
		}

		header {
			background-color: #2e7d32;
			padding: 20px 0;
			text-align: center;
			color: #fff;
			box-shadow: 0 4px 8px rgba(0,0,0,0.1);
		}

		.container {
			width: 90%;
			max-width: 1000px;
			margin: 40px auto;
			background-color: #fff;
			border-radius: 12px;
			padding: 30px;
			box-shadow: 0 4px 20px rgba(0,0,0,0.1);
		}

		h2, h3 {
			text-align: center;
			color: #2e7d32;
			margin-bottom: 20px;
		}

		table {
			width: 100%;
			border-collapse: collapse;
			margin-top: 20px;
		}

		th, td {
			border: 1px solid #ddd;
			padding: 14px;
			text-align: center;
		}

		th {
			background-color: #43a047;
			color: white;
			font-size: 16px;
		}

		tr:nth-child(even) {
			background-color: #f4f4f4;
		}

		tr:hover {
			background-color: #e8f5e9;
		}

		.btn {
			padding: 8px 14px;
			border: none;
			border-radius: 5px;
			text-decoration: none;
			font-size: 14px;
			cursor: pointer;
			transition: background-color 0.3s ease;
		}

		.edit-btn {
			background-color: #0288d1;
			color: white;
		}

		.edit-btn:hover {
			background-color: #0277bd;
		}

		.delete-btn {
			background-color: #e53935;
			color: white;
		}

		.delete-btn:hover {
			background-color: #c62828;
		}

		.top-links {
			text-align: center;
			margin-top: 30px;
		}

		.top-links a {
			display: inline-block;
			margin: 0 15px;
			padding: 12px 24px;
			background-color: #4CAF50;
			color: white;
			text-decoration: none;
			border-radius: 30px;
			font-weight: bold;
			transition: background-color 0.3s ease;
		}

		.top-links a:hover {
			background-color: #388e3c;
		}

		.no-products {
			text-align: center;
			font-size: 20px;
			color: #777;
			margin-top: 30px;
		}

		@media (max-width: 768px) {
			table, th, td {
				font-size: 12px;
			}
			.btn {
				font-size: 12px;
				padding: 6px 10px;
			}
			.top-links a {
				padding: 10px 16px;
				margin: 8px 6px;
			}
		}
	</style>
</head>
<body>
	<header>
		<h2>📦 Product Management Dashboard</h2>
	</header>

	<%
		AdminBean ab = (AdminBean) session.getAttribute("abean");
		ArrayList<ProductBean> al = (ArrayList<ProductBean>) session.getAttribute("alist");
	%>

	<h2>Page belongs to: <%= ab != null ? ab.getName() : "Unknown Admin" %></h2>

	<div class="container">
		<% if (al == null || al.size() == 0) { %>
			<div class="no-products">🚫 No Products Available</div>
		<% } else { %>
			<h3>📋 Product List</h3>
			<table>
				<tr>
					<th>Product ID</th>
					<th>Name</th>
					<th>Price</th>
					<th>Stock</th>
					<th>Actions</th>
				</tr>
				<% for (ProductBean pb : al) { %>
					<tr>
						<td><%= pb.getPcode() %></td>
						<td><%= pb.getPname() %></td>
						<td>₹<%= pb.getPrice() %></td>
						<td><%= pb.getStock() %></td>
						<td>
							<a href="EditProductServlet?pcode=<%= pb.getPcode() %>" class="btn edit-btn">✏️ Edit</a>
							<a href="DeleteProductServlet?pcode=<%= pb.getPcode() %>" class="btn delete-btn" onclick="return confirm('Are you sure to delete this product?');">🗑️ Delete</a>
						</td>
					</tr>
				<% } %>
			</table>
		<% } %>
	</div>

	<div class="top-links">
		<a href="addproducts.html">➕ Add Product</a>
		<a href="logout.jsp">🚪 Logout</a>
	</div>
</body>
</html>
