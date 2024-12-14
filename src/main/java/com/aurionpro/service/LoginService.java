package com.aurionpro.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.aurionpro.entity.AdminLoginEntity;
import com.aurionpro.entity.CustomerLoginEntity;



public class LoginService {
	
	public boolean authenticateUser(CustomerLoginEntity customerentity) {
		System.out.println("2.user authenticate");
        String query = "SELECT * FROM customer WHERE email = ? AND password = ?";
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
        	System.out.println("3.inside  data base connection");
            
            statement.setString(1, customerentity.getEmail());
            statement.setString(2, customerentity.getPassword());
            ResultSet resultSet = statement.executeQuery();
            
            System.out.println("4.query executed");
            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    
    public boolean authenticateAdmin(AdminLoginEntity admin) {
        String query = "SELECT * FROM adminlist WHERE email = ? AND password = ?";
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setString(1, admin.getEmail());
            statement.setString(2, admin.getPassword());
            ResultSet resultSet = statement.executeQuery();
            
            
            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


}
