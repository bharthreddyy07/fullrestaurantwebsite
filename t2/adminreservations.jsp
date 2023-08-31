<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Reservations</title>
</head>
<body>
    <h1>Admin Reservations</h1>
    
    <table border="1">
        <tr>
            <th>Booking ID</th>
            <th>Table Number</th>
            <th>Booking Date</th>
            <th>From Time</th>
            <th>To Time</th>
        </tr>
        
        <%
            // Database connection details
            String dbUrl = "jdbc:mysql://localhost:3306/login";
            String dbUsername = "root";
            String dbPassword = "root";

            // JDBC variables
            Connection conn = null;
            Statement statement = null;
            ResultSet resultSet = null;

            try {
                // Establish database connection
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

                // SQL query to retrieve reservations
                String selectQuery = "SELECT * FROM table_bookings";
                statement = conn.createStatement();
                resultSet = statement.executeQuery(selectQuery);

                // Loop through the result set and display reservations
                while (resultSet.next()) {
                    int bookingId = resultSet.getInt("booking_id");
                    int tableNumber = resultSet.getInt("table_number");
                    Date bookingDate = resultSet.getDate("booking_date");
                    Time fromTime = resultSet.getTime("from_time");
                    Time toTime = resultSet.getTime("to_time");

                    out.println("<tr>");
                    out.println("<td>" + bookingId + "</td>");
                    out.println("<td>" + tableNumber + "</td>");
                    out.println("<td>" + bookingDate + "</td>");
                    out.println("<td>" + fromTime + "</td>");
                    out.println("<td>" + toTime + "</td>");
                    out.println("</tr>");
                }

            } catch (Exception e) {
                // Handle any exceptions
                out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
            } finally {
                // Close resources
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (conn != null) {
                    conn.close();
                }
            }
        %>
    </table>
</body>
</html>
