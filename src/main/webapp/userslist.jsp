<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LocalDairy Users</title>
<style type="text/css">
body {
	font-family: Arial, sans-serif;
	margin: 10px;
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

.container {
	max-width: 800px;
	margin: 20px auto;
	padding: 0 20px;
}

h1 {
	text-align: center;
}
</style>

</head>
<body>
	<div class="container">
		<h1>LocalDairy Administration</h1>
	</div>

	<nav>  
		<a href="adduser.html">Add New User</a>
		<a href="clintmanage.jsp">Add Milk Details</a>
		<a href="users.jsp">Users</a> 
		<a href="display.jsp">Amount Details</a>
	</nav>
	<br><br>
	<div class="container">
        <form action="filterDataServlet" method="post">
            <label for="fromDate">From Date:</label>
            <input type="date" id="fromDate" name="fromDate">
            
            <label for="toDate">To Date:</label>
            <input type="date" id="toDate" name="toDate">
            
            <input type="submit" value="Filter">
        </form>
    </div>
	<iframe src="cds.jsp" width="1200" height="600"></iframe>
</body>
</html>