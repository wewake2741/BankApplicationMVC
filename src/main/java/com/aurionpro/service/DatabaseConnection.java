package com.aurionpro.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	
	 private static Connection connection = null;

	  
	    private DatabaseConnection() {}

	  
	    public static Connection getConnection() {
	        if (connection == null) {
	            try {
	                
	                Class.forName("com.mysql.cj.jdbc.Driver");


	                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankapplication","root","123456");

	                System.out.println("Database connection established successfully.");
	            } catch (ClassNotFoundException e) {
	                System.err.println("JDBC Driver not found: " + e.getMessage());
	            } catch (SQLException e) {
	            	System.out.println("here i am failedd");
	                System.err.println("Failed to establish database connection: " + e.getMessage());
	            }
	        }
	        return connection;
	    }

	    
	    public static void closeConnection() {
	        if (connection != null) {
	            try {
	                connection.close();
	                System.out.println("Database connection closed successfully.");
	            } catch (SQLException e) {
	                System.err.println("Failed to close the database connection: " + e.getMessage());
	            }
	        }
	    }

}
