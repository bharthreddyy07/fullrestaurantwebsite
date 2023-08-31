<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <!-- ...Your head content... -->
</head>
<body>
    <%
    // Get form data
    String[] selectedDishNames = request.getParameterValues("order-items");
    String deliveryTime = request.getParameter("pickup-time");
    String deliveryAddress = request.getParameter("delivery-address");
    String phoneNumber = request.getParameter("phone-number");
  
    // Database connection parameters
    String jdbcUrl = "jdbc:mysql://localhost:3306/login";
    String username = "root";
    String password = "root";
  
    Connection connection = null;
    PreparedStatement preparedStatement = null;
  
    try {
      // Establish the connection
      Class.forName("com.mysql.jdbc.Driver");
      connection = DriverManager.getConnection(jdbcUrl, username, password);
  
      // Prepare the INSERT statement
      String insertQuery = "INSERT INTO orders2 (dish_name, delivery_time, delivery_address, phone_number) VALUES (?, ?, ?, ?)";
      preparedStatement = connection.prepareStatement(insertQuery);
  
      // Insert each selected dish separately
      for (String dishName : selectedDishNames) {
        preparedStatement.setString(1, dishName);
        preparedStatement.setString(2, deliveryTime);
        preparedStatement.setString(3, deliveryAddress);
        preparedStatement.setString(4, phoneNumber);
  
        // Execute the query
        preparedStatement.executeUpdate();
      }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
      } finally {
      // Close resources
      if (preparedStatement != null) {
        preparedStatement.close();
      }
      if (connection != null) {
        connection.close();
      }
    }
  %>
  
  <h2>Order Placed Successfully!</h2>
  <p>Thank you for your order. Your order details have been recorded.</p>

  <!-- ...Your footer content... -->
</body>
</html>
