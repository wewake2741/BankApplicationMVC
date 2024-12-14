package com.aurionpro.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.aurionpro.entity.AccountEntity;

public class AccountService {
	
	
	// Generate an 8-digit random account number
    public int generateAccountNumber() {
        // Generate a random 8-digit number
        return 10000000 + (int) (Math.random() * 90000000);
    }

    // Insert account details into the database
    public boolean createAccount(int customerId, double initialBalance) {
        boolean isCreated = false;
        Connection connection = null;
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Step 1: driver loaded add customer");
			 connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankapplication","root","123456");
			System.out.println("Step 2: Connection established add customer");
            //connection = DatabaseConnection.getConnection();
            if (connection == null || connection.isClosed()) {
                throw new SQLException("Failed to establish database connection.");
            }

            // Generate a random 8-digit account number
            System.out.println("step 1 completed connection establish");
            int accountNumber = generateAccountNumber();

            // SQL query to insert account details
            String query = "INSERT INTO accounts (customer_id, account_number, balance) VALUES (?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, customerId);
                statement.setInt(2, accountNumber);
                statement.setDouble(3, initialBalance);

                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                    isCreated = true;
                    System.out.println("account inserted");
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
        return isCreated;
    }

    // Fetch account details by customer ID
    public AccountEntity getAccountDetails(int customerId) {
        AccountEntity account = null;
        Connection connection = null;

        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Step 1: driver loaded add customer");
			 connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankapplication","root","123456");
			System.out.println("Step 2: Connection established add customer");
           
            if (connection == null || connection.isClosed()) {
                throw new SQLException("Failed to establish database connection.");
            }

            String query = "SELECT * FROM accounts WHERE customer_id = ?";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, customerId);

                ResultSet resultSet = statement.executeQuery();
                if (resultSet.next()) {
                    int accountNumber = resultSet.getInt("account_number");
                    double balance = resultSet.getDouble("balance");

                    // Create AccountEntity object with the retrieved data
                    account = new AccountEntity(customerId, accountNumber, balance);
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

        return account;
    }
}


