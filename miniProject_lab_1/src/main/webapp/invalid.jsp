<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>

<%
    String invalid = (String) request.getAttribute("invalid");
    if (invalid != null) {
%>
    <h2 style="color:red;"><%= invalid %></h2>
<%
    }
%>

<%@ include file="login.html" %>

</body>
</html>
