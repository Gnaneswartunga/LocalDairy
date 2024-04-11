<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.Statement, java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LocalDairy Users</title>
<style type="text/css">
	table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #f2f2f2;
    }
</style>
</head>
<body>
    <table border='1'>
        <tr>
            <th>Customer ID</th>
            <th>Name</th>
            <th>Liters</th>
            <th>Buy Date</th>
            <th>Total Amount</th>
        </tr>
        <% 
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/localdairy", "root", "SVECIT50");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM milk");
                while (rs.next()) {
        %>
                    <tr>

                        <td><%= rs.getInt(2) %></td>
                        <td><%= rs.getString(3) %></td>
                        <td><%= rs.getDouble(4) %></td>
                        <td><%= rs.getString(5) %></td>
                        <td><%= rs.getInt(6) %></td>
                    </tr>
        <% 
                }
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </table>
</body>
</html>
