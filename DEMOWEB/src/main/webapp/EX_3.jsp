<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Multiples of 2</title>
</head>
<body>
    <h2>Multiples of 2:</h2>
    
    <%
        for (int i = 1; i <= 10; i++) {
            int multiple = 2 * i;
            out.println(multiple + "<br>");
        }
    %>
</body>
</html>
