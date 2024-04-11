package com.localdairy.dbc;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/ClintManage")
public class ClintManage extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        // Retrieve form data
        String FullName = request.getParameter("username");
        double Liters = Double.parseDouble(request.getParameter("liters"));
        String Date = request.getParameter("datetime");
        double Price = Double.parseDouble(request.getParameter("amount"));
    
        // Database connection variables
        String url = "jdbc:mysql://localhost:3306/localdairy";
        String user = "root";
        String password = "SVECIT50";
    
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
    
        try {
            // Load MySQL JDBC driver
        	Class.forName("com.mysql.cj.jdbc.Driver");

    
            // Establish database connection
            con = DriverManager.getConnection(url, user, password);
    
            // Fetch user ID based on username
            String query = "SELECT UserId FROM users WHERE FullName = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, FullName);
            rs = pstmt.executeQuery();
    
            int UserId = -1; // Default value if user not found
            if (rs.next()) {
                UserId = rs.getInt("UserId");
            }
    
            // Insert data into the milk table
            if (UserId != -1) {
                query = "INSERT INTO milk(UserIds, FullName, Liters, Date, Price) VALUES (?, ?, ?, ?, ?)";
                pstmt = con.prepareStatement(query);
                pstmt.setInt(1, UserId); // Use the retrieved UserId
                pstmt.setString(2, FullName);
                pstmt.setDouble(3, Liters);
                pstmt.setString(4, Date);
                pstmt.setDouble(5, Price);
                pstmt.executeUpdate();
            } else {
                // Handle the case where the user is not found
                response.getWriter().println("User not found!");
            }
    
            // Redirect back to the form page after successful submission
            response.sendRedirect("clintmanage.jsp");
    
        } catch (Exception e) {
            e.printStackTrace();
            // Handle any errors, such as displaying an error message to the user
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            // Close all connections
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
