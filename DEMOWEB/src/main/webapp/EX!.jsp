<!DOCTYPE html>
<html>
<head>
    <title>Hello, World!</title>
</head>
<body>
    <h1>Hello, World!</h1>
    
    <p>Date and Time: <%= new java.util.Date() %></p>
    <p>Host Name: <%= java.net.InetAddress.getLocalHost().getHostName() %></p>
    <p>Session ID: <%= session.getId() %></p>
</body>
</html>