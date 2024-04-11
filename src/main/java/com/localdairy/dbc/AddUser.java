package com.localdairy.dbc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddUser")
public class AddUser extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "jdbc:mysql://localhost:3306/localdairy";
        String user = "root";
        String password = "SVECIT50";
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            String sql = "INSERT INTO users(fullname,phoneno,address) VALUES (?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            //statement.setInt(1, Integer.parseInt(request.getParameter("customer_id")));
            statement.setString(1, request.getParameter("fullname"));
            statement.setString(2, request.getParameter("phoneno"));
            statement.setString(3, request.getParameter("address"));
            
            statement.executeUpdate();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("adduser.html");
    }

}
