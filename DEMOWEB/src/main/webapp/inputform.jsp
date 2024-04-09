<!DOCTYPE html>
<html>
<head>
    <title>User Information</title>
</head>
<body>
    <h1>User Information</h1>
    <form action="displayinfo.jsp" method="post">
        <label for="name">Name:</label>
        <input type="text" name="name" required><br>
        
        <label for="age">Age:</label>
        <input type="number" name="age" required><br>
        
        <label>Gender:</label>
        <input type="radio" name="gender" value="Male">Male
        <input type="radio" name="gender" value="Female">Female
        <input type="radio" name="gender" value="Other">Other<br>
        
        <input type="submit" value="Submit">
    </form>
</body>
</html>
