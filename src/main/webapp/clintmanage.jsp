<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LocalDairy</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
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
        
        h2 {
            color: #333;
            text-align:center;
        }
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            width: 50%;
            margin: 20px auto;
        }
        label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }
        select, input[type="date"],input[type="time"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        select {
            width: calc(100% - 21px); /* Adjusted for the arrow icon */
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="%23838E96" d="M7.41 8.59L12 13.17l4.59-4.58L18 10l-6 6-6-6 1.41-1.41z"/><path fill="none" d="M0 0h24v24H0z"/></svg>');
            background-repeat: no-repeat;
            background-position: right 10px top 50%;
            background-size: 16px;
            cursor: pointer;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
	
	<h2>Adding Daily Buying Milk Details</h2>

	<nav>
		<a href="adduser.html">Add New User</a>  
		<a href="userslist.jsp">Monthly Manage</a>
		<a href="users.jsp">Users</a>
		<a href="display.jsp">Amount Details</a>
	</nav>

    
    <form action="ClintManage" method="post">
        <label for="username">Select User:</label>
        <select name="username" id="username" required>
        	<option>Select Name</option>
            <% 
                try {
                    // Establishing Database Connection
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/localdairy", "root", "SVECIT50");
                    
                    // Query to retrieve user names from the table
                    String query = "SELECT UserId, FullName FROM users";
                    PreparedStatement pst = con.prepareStatement(query);
                    ResultSet rs = pst.executeQuery();
                    
                    // Iterating over the result set and generating options for the dropdown list
                    while (rs.next()) {
                        int UserId = rs.getInt("UserId");
                        String FullName = rs.getString("FullName");
            %>
                        <option value="<%=FullName%>"><%=FullName%></option>
            <% 
                    }
                    // Closing database connections
                    rs.close();
                    pst.close();
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </select>
        <br><br>
        <label for="liters">Liters:</label>
        <select name="liters" id="liters" required>
        	<option>Select a Liters</option>
        	<option value="0.5">0.5</option>
            <option value="1">1</option>
            <option value="1.5">1.5</option>
            <option value="2">2</option>
            <option value="2.5">2.5</option>
        </select>
        <br><br>
        <label for="datetime">Select Date:</label>
        <input type="datetime-local" id="datetime" name="datetime" required>
        <br><br>
        <label for="amount">Amount:</label>
        <select name="amount" id="amount" required>
        	<option>Select Amount</option>
            <option value="25">25</option>
            <option value="50">50</option>
            <option value="75">75</option>
            <option value="100">100</option>
            <option value="125">125</option>
        </select>
        <br><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
