<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Dispatcher Example</title>
</head>
<body>
    <h1>Dispatcher Example</h1>
    
    <%-- Include the loginForm.html file using RequestDispatcher --%>
    <%
        request.getRequestDispatcher("loginex5.html").include(request, response);
    %>
</body>
</html>
