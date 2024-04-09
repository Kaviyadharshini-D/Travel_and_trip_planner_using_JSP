<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<%
    String dbUrl = "jdbc:mysql://localhost:3306/demo";
    String dbUser = "root";
    String dbPassword = "your_password";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        // Retrieve the user ID from the form
        String userId = request.getParameter("userId");

        // Perform the delete operation
        String deleteQuery = "DELETE FROM user WHERE id = ?";
        PreparedStatement deleteStatement = conn.prepareStatement(deleteQuery);
        deleteStatement.setInt(1, Integer.parseInt(userId));
        int rowsAffected = deleteStatement.executeUpdate();

        conn.close();
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }

    // Redirect back to the main page after deletion
    response.sendRedirect("admin.jsp");
%>
