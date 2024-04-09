<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Information</title>
</head>
<body>
    <h1>User Information</h1>
    <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Ensure the parameters are not null or empty
        if (username == null || username.trim().isEmpty()) {
            username = "No username entered";
        }

        if (password == null || password.trim().isEmpty()) {
            password = "No password entered";
        }
    %>
    <p>Username: <%= username %></p>
    <p>Password: <%= password %></p>
</body>
</html>
