<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Orders</title>
    <style>
        /* Your existing styles here */
    </style>
</head>
<body>
    <header>
        <!-- Your existing header content here -->
    </header>

    <section>
        <h1>Admin Orders</h1>
        <table border="1">
            <tr>
                <th>Order ID</th>
                <th>Dish Name</th>
                <th>Delivery Time</th>
                <th>Delivery Address</th>
                <th>Phone Number</th>
            </tr>
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "root");
                    String query = "SELECT * FROM orders2";
                    Statement statement = connection.createStatement();
                    ResultSet resultSet = statement.executeQuery(query);
                    while (resultSet.next()) {
            %>
            <tr>
                <td><%= resultSet.getInt("order_id") %></td>
                <td><%= resultSet.getString("dish_name") %></td>
                <td><%= resultSet.getString("delivery_time") %></td>
                <td><%= resultSet.getString("delivery_address") %></td>
                <td><%= resultSet.getString("phone_number") %></td>
            </tr>
            <%
                    }
                    resultSet.close();
                    statement.close();
                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </table>
    </section>

    <section class="contact-details">
        <!-- Your existing contact details section here -->
    </section>
</body>
</html>
