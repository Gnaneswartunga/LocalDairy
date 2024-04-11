<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LocalDairy</title>

<style type="text/css">
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	padding: 5px;
}

h1 {
	text-align: center;
}

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

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: orange;
	color: #333;
}

tr:hover {
	background-color: #f2f2f2;
}
</style>


</head>
<body>
	
	<h1>Amount Details</h1>

	<nav>
		<a href="adduser.html">Add User</a> 
		<a href="clintmanage.jsp">Add Milk Details</a> 
		<a href="users.jsp">Users</a>
  		<a href="userslist.jsp">Monthly Manage</a>
	</nav>
</body>
<body>
	
	<table border="1">
		<thead>
			<tr>
				<th>User ID</th>
				<th>Full Name</th>
				<th>Phone Number</th>
				<th>Total Liters</th>
				<th>Total Price</th>
			</tr>
		</thead>
		<tbody>
			<% 
                try {
                    // Establishing Database Connection
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/localdairy", "root", "SVECIT50");
                    
                    // Prepare and execute the query
                    String query = "SELECT u.UserId, u.FullName, u.PhoneNo, SUM(m.Liters) AS TotalLiters, SUM(m.Price) AS TotalPrice " +
                                   "FROM users u " +
                                   "JOIN milk m ON u.UserId = m.UserIds " +
                                   "GROUP BY u.UserId, u.FullName, u.PhoneNo";
                    PreparedStatement pstmt = con.prepareStatement(query);
                    ResultSet rs = pstmt.executeQuery();
                    
                    // Iterate over the result set and display data
                    while (rs.next()) {
                        int userId = rs.getInt("UserId");
                        String fullName = rs.getString("FullName");
                        String phoneNo = rs.getString("PhoneNo");
                        double totalLiters = rs.getDouble("TotalLiters");
                        double totalPrice = rs.getDouble("TotalPrice");
            %>
			<tr>
				<td><%= userId %></td>
				<td><%= fullName %></td>
				<td><%= phoneNo %></td>
				<td><%= totalLiters %></td>
				<td><%= totalPrice %></td>
			</tr>
			<% 
                    }
                    // Closing database connections
                    rs.close();
                    pstmt.close();
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
		</tbody>
	</table>
</body>
</html>
