<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Display User Info</title>
</head>
<body>
    <h1>User Information</h1>
    <%
        String name = request.getParameter("name");
        String ageString = request.getParameter("age");
        String gender = request.getParameter("gender");

        // Perform basic validation
        int age = -1;
        if (name != null && !name.isEmpty() && ageString != null && !ageString.isEmpty()) {
            try {
                age = Integer.parseInt(ageString);
            } catch (NumberFormatException e) {
                // Invalid age format
            }
        }
    %>
    
    <%
        if (age >= 0) {
    %>
        <p>Name: <%= name %></p>
        <p>Age: <%= age %></p>
        <p>Gender: <%= gender %></p>
    <%
        } else {
    %>
        <p>Invalid input. Please enter valid name and age.</p>
    <%
        }
    %>
</body>
</html>
