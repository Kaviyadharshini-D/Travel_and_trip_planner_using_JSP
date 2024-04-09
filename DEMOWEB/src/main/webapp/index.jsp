<!-- admin.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Page - Trips</title>
</head>
<body>
    <h1>Admin Page - Trips</h1>

    <form action="/admin/addTrip" method="post">
        <label for="destination">Destination:</label>
        <input type="text" id="destination" name="destination" required>
        <label for="startDate">Start Date:</label>
        <input type="text" id="startDate" name="startDate" required>
        <label for="endDate">End Date:</label>
        <input type="text" id="endDate" name="endDate" required>
        <button type="submit">Add Trip</button>
    </form>

    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Destination</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="trip" items="${trips}">
                <tr>
                    <td>${trip.id}</td>
                    <td>${trip.destination}</td>
                    <td>${trip.startDate}</td>
                    <td>${trip.endDate}</td>
                    <td>
                        <a href="/admin/deleteTrip/${trip.id}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html 