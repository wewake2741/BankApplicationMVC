package com.aurionpro.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.aurionpro.entity.CustomerEntity;

public class AddCustomerService {
	//private Connection connection = null;
	public boolean addCustomer(CustomerEntity customer) {
		
		Connection connection=null;
		System.out.println("inside add customer");
        boolean isAdded = false;
        

        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Step 1: driver loaded add customer");
			 connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankapplication","root","123456");
			System.out.println("Step 2: Connection established add customer");
            
            //connection = DatabaseConnection.getConnection();
            System.out.println("connection check 1");
            if (connection == null || connection.isClosed()) {
                throw new SQLException("Failed to establish a database connection.");
            }
            System.out.println("connection check 2");

          
            

            // Insert customer data into the database
            String query = "INSERT INTO customer VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, customer.getCustomerId());
                statement.setString(2, customer.getFirstName());
                statement.setString(3, customer.getLastName());
                statement.setString(4, customer.getEmail());
                statement.setString(5, customer.getPassword());

                int rowsInserted = statement.executeUpdate();
                System.out.println("query executed");
                if (rowsInserted > 0) {
                    isAdded = true;
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Log the error or throw a custom exception
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
            try {
                if (connection != null && !connection.isClosed()) {
                    connection.close(); // Close the connection if it is still open
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Handle exception while closing connection
            }
        }

        return isAdded;
    }

    // Method to check if the email already exists in the database
    public boolean isEmailExists(String email) {
    	System.out.println("is email exist or not");
        boolean exists = false;
        Connection connection = null;

        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Step 1: driver loaded add customer");
			 connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankapplication","root","123456");
			System.out.println("Step 2: Connection established add customer");
            if (connection == null || connection.isClosed()) {
                throw new SQLException("Failed to establish a database connection.");
            }

            String query = "SELECT * FROM customer WHERE email = ?";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setString(1, email);

                ResultSet resultSet = statement.executeQuery();
                if (resultSet.next()) {
                    exists = true;
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
            try {
                if (connection != null && !connection.isClosed()) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return exists;
    }
}
