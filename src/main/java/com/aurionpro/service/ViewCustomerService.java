package com.aurionpro.service;



import com.aurionpro.entity.CustomerEntity;
import com.aurionpro.entity.ViewCustomerEntity;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ViewCustomerService {

    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankapplication", "root", "123456");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public List<ViewCustomerEntity> getAllCustomers() {
        List<ViewCustomerEntity> customerList = new ArrayList<>();
        String query = "SELECT c.id AS customer_id, c.fname, c.lname, c.email, a.accountnumber, a.balance " +
                       "FROM customer c " +
                       "LEFT JOIN accounts a ON c.id = a.customer_id";
        
        try (Connection connection = getConnection();
             PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                int customerId = rs.getInt("customer_id");
                String fname = rs.getString("fname");
                String lname = rs.getString("lname");
                String email = rs.getString("email");
                Integer accountNumber = rs.getInt("accountnumber");
                Double balance = rs.getDouble("balance");

                // Null check for accountNumber and balance (they may be null if no account exists)
                if (rs.wasNull()) {
                    accountNumber = null;
                    balance = null;
                }

                ViewCustomerEntity customer = new ViewCustomerEntity(customerId, fname, lname, email, accountNumber, balance);
                customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }
}

