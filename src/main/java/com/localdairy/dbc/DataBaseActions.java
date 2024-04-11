package com.localdairy.dbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DataBaseActions {

    public static boolean validateUser(String username, String password) throws ClassNotFoundException {
			Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/localdairy", "root", "SVECIT50");
             PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM admins WHERE username = ? AND password = ?")) {

            stmt.setString(1, username);
            stmt.setString(2, password);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
            //System.out.println("No records found for the user");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
