package com.aurionpro.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.aurionpro.entity.Admin;

public class AdminRegistrationConnection {
	
	
	public boolean registerAdmin(Admin admin) {
        Connection connection = null;
        PreparedStatement preparedstatement = null;
        try {
            
            connection = DatabaseConnection.getConnection();


            String sql = "insert into adminlist values(?,?,?,?)";
            preparedstatement=connection.prepareStatement(sql);
            preparedstatement.setInt(1, admin.getId());
            preparedstatement.setString(2, admin.getName());
            preparedstatement.setString(3, admin.getEmail());
            preparedstatement.setString(4, admin.getPassword());

            
            int rowsAffected = preparedstatement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            
            try {
                if (preparedstatement != null) preparedstatement.close();
                if (connection != null) connection.close(); 
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
