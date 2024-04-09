<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Submit Train Reservation</title>
    <script>
        function redirectToSuccess() {
            window.location.href = 'hotel.html';
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
            String train_num = request.getParameter("train_num");
            String train_name = request.getParameter("train_name");
            String train_type = request.getParameter("train_type");
            String sector = request.getParameter("sector");
            String arrival_date = request.getParameter("arrival_date");
            String arrival_time = request.getParameter("arrival_time");
            String no_of_adults_param = request.getParameter("no_of_adults");
            String no_of_kids_param = request.getParameter("no_of_kids");
            String name = request.getParameter("name");
            String mail_id = request.getParameter("mail_id");

            // Check for null values
            if (train_num == null || train_name == null || train_type == null || sector == null || arrival_date == null ||
                arrival_time == null || no_of_adults_param == null || no_of_kids_param == null || name == null || mail_id == null) {
    %>
                <script>
                    alert('Error: One or more required parameters are missing');
                    window.location.href = 'error.html';
                </script>
    <%
                return;
            }

            int no_of_adults = Integer.parseInt(no_of_adults_param);
            int no_of_kids = Integer.parseInt(no_of_kids_param);

            // SQL query to insert the train reservation data into a table (assuming you have a "trainres" table)
            String sql = "INSERT INTO trainres (train_num, train_name, train_type, sector, `Arrival date`, `Arrival time`, `No.of adults`, `No of kids`, Name, Mail_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, train_num);
            stmt.setString(2, train_name);
            stmt.setString(3, train_type);
            stmt.setString(4, sector);
            stmt.setString(5, arrival_date);
            stmt.setString(6, arrival_time);
            stmt.setInt(7, no_of_adults);
            stmt.setInt(8, no_of_kids);
            stmt.setString(9, name);
            stmt.setString(10, mail_id);

            // Execute the SQL statement
            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
    %>
                <script>
                    redirectToSuccess();
                </script>
    <%
            } else {
    %>
                <script>
                    showErrorPopup("Error: Train Reservation not submitted.");
                </script>
    <%
            }
        } catch (SQLException ex) {
    %>
            <script>
                showErrorPopup("SQL Exception: <%= ex.getMessage() %>");
            </script>
    <%
        } catch (Exception e) {
    %>
            <script>
                showErrorPopup("Exception: <%= e.getMessage() %>");
            </script>
    <%} finally {
            // Close the resources
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
    %>
                <script>
                    showErrorPopup("Error closing resources: <%= e.getMessage() %>");
                </script>
    <%
            }
        }
    %>
</body>
</html>
