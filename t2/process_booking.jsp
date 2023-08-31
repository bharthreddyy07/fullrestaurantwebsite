<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Table Booking - Processing</title>
</head>
<body>
    <%
        // Database connection details
        String dbUrl = "jdbc:mysql://localhost:3306/login";
        String dbUsername = "root";
        String dbPassword = "root";
        // Get form data
        int tableNumber = Integer.parseInt(request.getParameter("table-number"));
        String bookingDate = request.getParameter("booking-date");
        String fromTime = request.getParameter("from-time");
        String toTime = request.getParameter("to-time");

        // JDBC variables
        Connection conn = null;
        PreparedStatement preparedStatement = null;

        try {
            // Establish database connection
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

            // SQL query to insert the booking data
            String insertQuery = "INSERT INTO table_bookings (table_number, booking_date, from_time, to_time) VALUES (?, ?, ?, ?)";
            preparedStatement = conn.prepareStatement(insertQuery);
            preparedStatement.setInt(1, tableNumber);
            preparedStatement.setString(2, bookingDate);
            preparedStatement.setString(3, fromTime);
            preparedStatement.setString(4, toTime);
            preparedStatement.executeUpdate();

            // Successful booking message
            out.println("<h2>Table booked successfully!</h2>");

        } catch (Exception e) {
            // Handle any exceptions
            out.println("<h2>Error: " + e.getMessage() + "</h2>");
        } finally {
            // Close resources
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
