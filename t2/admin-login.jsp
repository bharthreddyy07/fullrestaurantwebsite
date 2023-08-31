<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login - Processing</title>
</head>
<body>
    <%
        // Database connection details
        String dbUrl = "jdbc:mysql://localhost:3306/login";
        String dbUsername = "root";
        String dbPassword = "root";

        // Get form data
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // JDBC variables
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // Establish database connection
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

            // SQL query to check admin credentials
            String selectQuery = "SELECT * FROM admin_users WHERE email = ? AND password = ?";
            preparedStatement = conn.prepareStatement(selectQuery);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // Admin login successful
                response.sendRedirect("admin.html");
            } else {
                // Admin login failed
                out.println("<h2>Admin login failed. Invalid credentials.</h2>");
            }

        } catch (Exception e) {
            // Handle any exceptions
            out.println("<h2>Error: " + e.getMessage() + "</h2>");
        } finally {
            // Close resources
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    %>
</body>
</html>
