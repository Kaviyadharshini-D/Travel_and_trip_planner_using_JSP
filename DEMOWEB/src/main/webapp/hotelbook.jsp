<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Submit Reservation</title>
    <script>
        function redirectToSuccess() {
            window.location.href = 'success.html';
        }

        function showErrorPopup(message) {
            alert('Error: ' + message);
        }
    </script>
</head>
<body>
    <%
        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/demo";
        String username = "root";
        String password = "your_password";

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish a database connection
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "your_password");

            // Retrieve data from the HTML form
            String first_name = request.getParameter("first_name");
            String last_name = request.getParameter("last_name");
            String check_in = request.getParameter("check_in");
            String check_out = request.getParameter("check_out");
            String E_mail = request.getParameter("E_mail");
            String room_type = request.getParameter("room_type");
            int no_guests = Integer.parseInt(request.getParameter("no_guests"));
            String phone_number = request.getParameter("phone_number");
            String address = request.getParameter("address");

            // SQL query to insert the reservation data into a table (assuming you have a "reservations" table)
            // SQL query with backticks to enclose the "number" column name
			String sql = "INSERT INTO hotelbook (first_name, last_name, check_in, check_out, E_mail, room_type, no_guests, `number`, address) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, first_name);
            stmt.setString(2, last_name);
            stmt.setString(3, check_in);
            stmt.setString(4, check_out);
            stmt.setString(5, E_mail);
            stmt.setString(6, room_type);
            stmt.setInt(7, no_guests);
            stmt.setString(8, phone_number);
            stmt.setString(9, address);

            // Execute the SQL statement
            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                out.println("Reservation submitted successfully!");
    %>
                <script>
                    redirectToSuccess();
                </script>
    <%
            } else {
                out.println("Error: Reservation not submitted.");
    %>
                <script>
                    showErrorPopup("Reservation not submitted.");
                </script>
    <%
            }
        } catch (SQLException ex) {
            out.println("SQL Exception: " + ex.getMessage());
    %>
            <script>
                showErrorPopup("<%= ex.getMessage() %>");
            </script>
    <%
        } catch (Exception e) {
            out.println("Exception: " + e.getMessage());
    %>
            <script>
                showErrorPopup("<%= e.getMessage() %>");
            </script>
    <%} finally {
            // Close the resources
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    %>
</body>
</html>
