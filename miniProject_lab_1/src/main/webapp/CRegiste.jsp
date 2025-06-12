<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Status</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100vh;
        margin: 0;
    }

    .container {
        background-color: white;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        text-align: center;
    }

    .message {
        font-size: 18px;
        color: green;
        margin-bottom: 20px;
    }

    .button {
        padding: 10px 20px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        text-decoration: none;
        font-size: 16px;
    }

    .button:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>

<%
    String msg = (String) request.getAttribute("cmsg");
%>

<div class="container">
    <h2>Registration Status</h2>
    <div class="message">
        <%= (msg != null) ? msg : "No message received." %>
    </div>
    <a href="custlogin.html" class="button">login now!</a>
</div>

</body>
</html>
