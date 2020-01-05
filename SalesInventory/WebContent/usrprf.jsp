<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1><p align="center">User Profile</p></h1>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	
	<%@ page import="data.DB"%>
	<%/*
@ throws Exception
*/%>
<%
		Connection con=DB.getConnection();
		Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from users");
String user=null;
String pwd=null;
String fname=null;
String lname=null;
String email=null;
while(rs.next())
{
	user=rs.getString(1);
	pwd=rs.getString(2);
	fname=rs.getString(3);
	lname=rs.getString(4);
	email=rs.getString(5);
}
%>
<img alt="Profile Picture" src="prf.png" align="right">
<p><font size="5">
Username:<%out.print(user); %><br/><br/>
First Name:<%out.print(fname); %><br/><br/>
Last Name:<%out.print(lname); %><br/><br/>
E-mail:<%out.print(email); %><br/><br/>
<form>
Password:<input type="password" value=<%out.print(pwd);%> readonly>
<a href="chngpass.html">Change Password</a>
</form></font>
</p>
</body>
</html>