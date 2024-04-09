<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>

<html>
<head>
    <title>Adminpage</title>
    <style>
        body {
            background-image: linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.6)),url('hoteel.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
            color: #333;
        }

        h1 {
            color:white;
        }

        h2, h3 {
            color: #fff;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
            background-color: #f2f2f2;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        form {
            display: inline-block;
            margin-top: 20px;
        }

        input[type="submit"] {
            background-color: #f44336;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #d32f2f;
        }

        input[type="text"],
        input[type="password"] {
            padding: 5px;
        }

        #addUserForm {
            margin-top: 20px;
        }

        #welcomeContainer {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
            margin-bottom: 20px;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body>
    <h1><center>YOURTRIP-ADMIN</center></h1>

    <%
        String dbUrl = "jdbc:mysql://localhost:3306/demo";
        String dbUser = "root";
        String dbPassword = "your_password";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "your_password");
            // Retrieve user data
            String userQuery = "SELECT * FROM user";
            PreparedStatement userStatement = conn.prepareStatement(userQuery);
            ResultSet userResultSet = userStatement.executeQuery();

            List<Map<String, String>> userList = new ArrayList<>();

            while (userResultSet.next()) {
                Map<String, String> user = new HashMap<>();
                user.put("id", String.valueOf(userResultSet.getInt("id")));
                user.put("username", userResultSet.getString("username"));
                user.put("password", userResultSet.getString("password"));
                user.put("firstname", userResultSet.getString("firstname"));
                user.put("lastname", userResultSet.getString("lastname"));

                userList.add(user);
            }

            // Retrieve hotel booking data
            String hotelQuery = "SELECT * FROM hotelbook";
            PreparedStatement hotelStatement = conn.prepareStatement(hotelQuery);
            ResultSet hotelResultSet = hotelStatement.executeQuery();

            List<Map<String, String>> hotelList = new ArrayList<>();

            while (hotelResultSet.next()) {
                Map<String, String> booking = new HashMap<>();
                booking.put("hotel_id", String.valueOf(hotelResultSet.getInt("hotel_id")));
                booking.put("first_name", hotelResultSet.getString("first_name"));
                booking.put("last_name", hotelResultSet.getString("last_name"));
                booking.put("check_in", hotelResultSet.getString("check_in"));
                booking.put("check_out", hotelResultSet.getString("check_out"));
                booking.put("email", hotelResultSet.getString("E_mail"));
                booking.put("room_type", hotelResultSet.getString("room_type"));
                booking.put("no_guests", String.valueOf(hotelResultSet.getInt("no_guests")));
                booking.put("number", hotelResultSet.getString("number"));
                booking.put("address", hotelResultSet.getString("address"));

                hotelList.add(booking);
            }

            conn.close();
    %>

    <!-- Display the welcome message container -->
    <% if (!userList.isEmpty() || !hotelList.isEmpty()) { %>
        <div id="welcomeContainer">
            <h3>Welcome to YourTrip Admin Page!</h3>
            <p>Here, you can access key details about our signed-in users. User profiles include usernames, emails, and registration dates. To enhance trip planning, administrators can manage user descriptions. These can cover travel preferences, accommodation choices, and special requests. This feature ensures personalized service and tailored recommendations for a seamless user experience. YourTrip is committed to meeting the diverse needs of our users, making travel planning a breeze.</p>
        </div>
    <% } %>

    <!-- Display the user list table -->
    <% if (userList.isEmpty()) { %>
        <h3>User List</h3>
        <p>User list is empty.</p>
    <% } else { %>
        <h3>User List</h3>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Password</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Action</th>
            </tr>
            <% for (Map<String, String> user : userList) { %>
                <tr>
                    <td><%= user.get("id") %></td>
                    <td><%= user.get("username") %></td>
                    <td><%= user.get("password") %></td>
                    <td><%= user.get("firstname") %></td>
                    <td><%= user.get("lastname") %></td>
                    <td>
                        <form method="post" action="deleteUser.jsp">
                            <input type="hidden" name="userId" value="<%= user.get("id") %>">
                            <input type="submit" value="Delete">
                        </form>
                    </td>
                </tr>
            <% } %>
        </table>
    <% } %>

    <!-- Display the hotel booking list table -->
    <% if (hotelList.isEmpty()) { %>
        <h3>Hotel Booking List</h3>
        <p>Hotel booking list is empty.</p>
    <% } else { %>
        <h3>Hotel Booking List</h3>
        <table border="1">
            <tr>
                <th>Hotel ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Check-in</th>
                <th>Check-out</th>
                <th>Email</th>
                <th>Room Type</th>
                <th>No. of Guests</th>
                <th>Number</th>
                <th>Address</th>
                <th>Action</th>
            </tr>
            <% for (Map<String, String> booking : hotelList) { %>
                <tr>
                    <td><%= booking.get("hotel_id") %></td>
                    <td><%= booking.get("first_name") %></td>
                    <td><%= booking.get("last_name") %></td>
                    <td><%= booking.get("check_in") %></td>
                    <td><%= booking.get("check_out") %></td>
                    <td><%= booking.get("email") %></td>
                    <td><%= booking.get("room_type") %></td>
                    <td><%= booking.get("no_guests") %></td>
                    <td><%= booking.get("number") %></td>
                    <td><%= booking.get("address") %></td>
                    <td>
                        <form method="post" action="deleteBooking.jsp">
                            <input type="hidden" name="hotelId" value="<%= booking.get("hotel_id") %>">
                            <input type="submit" value="Delete">
                        </form>
                    </td>
                </tr>
            <% } %>
        </table>
    <% } %>

    <!-- Add a form to add a new user -->
    <div id="addUserForm">
        <h3>Add New User</h3>
        <form method="post" action="addUser.jsp">
            <label for="newUsername">Username:</label>
            <input type="text" id="newUsername" name="newUsername" required>
            
            <label for="newPassword">Password:</label>
            <input type="password" id="newPassword" name="newPassword" required>
            
            <label for="newFirstName">First Name:</label>
            <input type="text" id="newFirstName" name="newFirstName" required>
            
            <label for="newLastName">Last Name:</label>
            <input type="text" id="newLastName" name="newLastName" required>
            
            <input type="submit" value="Add User">
        </form>
    </div>

    <%
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    %>
</body>
</html>
