<!DOCTYPE html>
<html>
<head>
    <title>Employee Information</title>
</head>
<body>
    <h1>Employee Information</h1>
    <%
        String name = request.getParameter("name");
        String dob = request.getParameter("dob");
    %>

    <p><strong>Name:</strong> <%= name %></p>
    <p><strong>Date of Birth:</strong> <%= dob %></p>
</body>
</html>
