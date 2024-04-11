<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.Statement, java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LocalDairy User Details</title>
<style type="text/css">
	nav {
			background-color: #ffb62e;
			color: #fff;
			padding: 10px;
			text-align: center;
		}

		nav a {
			color: #fff;
			text-decoration: none;
			margin: 0 10px;
			padding-left: 50px;
			font-size: 20px;
		}

		nav a:hover {
			text-decoration: underline;
		}
        
        h2 {
            color: #333;
            text-align:center;
        }
	table {
        width: 100%;
        margin:10px;
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
		<h2>Adding Daily Buying Milk Details</h2>

		<nav>
			<a href="adduser.html">Add New User</a>  
			<a href="clintmanage.jsp">Add Milk Details</a>
			<a href="userslist.jsp">Monthly Manage</a>
			<a href="display.jsp">Amount Details</a>
		</nav>
    <table border='1'>
        <tr>
        	<th>ID</th>
            <th>FullName</th>
            <th>Phone No</th>
            <th>Address</th>            
        </tr>
        <% 
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/localdairy", "root", "SVECIT50");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM users");
                while (rs.next()) {
        %>
                    <tr>
                    	<td><%= rs.getInt(1) %></td>
                        <td><%= rs.getString(2) %></td>
                        <td><%= rs.getString(3) %></td>                       
                        <td><%= rs.getString(4) %></td>
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
