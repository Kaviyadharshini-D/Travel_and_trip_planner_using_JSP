<%@ page import="java.sql.*" %>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    String role = request.getParameter("role");

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "your_password"); 

        String sql = "INSERT INTO user (username, password, firstname, lastname, role) VALUES (?, ?, ?, ?, ?)";
        ps = conn.prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, password);
        ps.setString(3, firstname);
        ps.setString(4, lastname);
        ps.setString(5, role);
        
        int rowsAffected = ps.executeUpdate();

        if (rowsAffected > 0) {
            // Registration successful
            if ("admin".equals(role)) {
                response.sendRedirect("admin.jsp");
            } else {
                response.sendRedirect("hotel.html");
            }
        } else {
            // Registration failed
            out.println("<html><body><h2>Registration failed</h2></body></html>");
        }
    } catch (Exception e) {
        // Log the exception for debugging purposes
        e.printStackTrace();
        
        // Provide a user-friendly error message
        out.println("<html><body><h2>An error occurred during registration. Please try again later. Details: " + e.getMessage() + "</h2></body></html>");
    } finally {
        try {
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            // Log the exception for debugging purposes
            e.printStackTrace();
            
            // Provide a user-friendly error message
            out.println("<html><body><h2>An error occurred during registration. Please try again later.</h2></body></html>");
        }
    }
%>
