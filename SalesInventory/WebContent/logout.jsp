<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sales & Inventory System</title>
</head>
<body bgcolor="Brown">
	<table align="Right">
		<tr>
			<th><a href="index.html"><font color="White">Home</a>|</th>
			<th><a href="abtus.html"><font color="White">About Us</a>|</th>
			<th><a href="Login.html"><font color="White">Admin
						Login</a>|</th>
			<th><a href="cntus.html"><font color="White">Contact
						Us</a>|</th>
		</tr>
	</table>

	<h1>
		<font color="White">Sales and Inventory System</font>
	</h1>
	<h4>
		<font color="White">Manage Product stock and Inventory online</font>
	</h4>

	<style>
.topnav {
	display: block;
	margin-left: auto;
	margin-right: auto;
	overflow: hidden;
	background-color: white;
	width: 80%;
	height: 45px;
}

.topnav a {
	float: left;
	color: black;
	text-align: center;
	padding: 4px 16px;
	text-decoration: none;
	font-size: 17px;
}

.topnav a:hover {
	background-color: #333;
	color: white;
}
</style>

	<%
	session.setAttribute("log",null);
	session.invalidate();
%>

	<div class="topnav">
		<table align="center" bgcolor="White" height=40 width="80%">
			<a class="active">
				<th><a href="index.html"><font color="Black">Home</a></th>
				<th><a href="abtus.html"><font color="Black">About
							Us</a></th>
				<th><a href="Login.html"><font color="Black">Admin
							Login</a></th>
				<th><a href="cntus.html"><font color="Black">Contact
							Us</a></th>
				</tr>
		</table>
	</div>
	<br>
	<br>
	<p align="Center">
		<a href="Login.html"><img src="admin.png" width="10%" height="10%"></a>
	</p>
	<br>
	<h1>
		<p align="center">You have logged out successfully!!</p>
	</h1>
	<form action="login.jsp" method="post" align="Center">
			User name:<input type="text" name="usr" required placeholder="Enter Username(Admin)"/><br>
		<br>
		<br> Password:<input type="password" name="pwd" required placeholder="Enter Password(invent)"/><br>
		<br>
		<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="Login" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="Clear"/>
	</form></body>
</html>