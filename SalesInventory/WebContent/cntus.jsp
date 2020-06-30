<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sales & Inventory System</title>
</head>
<body>

	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%@ page import="data.DB" %>
	<%
String userid=request.getParameter("nme");
session.putValue("nme",userid);
String email=request.getParameter("email");
String phn=request.getParameter("phn");
String sbjt=request.getParameter("sbjt");
String msg=request.getParameter("msg");
Connection con=DB.getConnection();
Statement st= con.createStatement();
ResultSet rs; 
int i=st.executeUpdate("insert into contactq values ('"+userid+"','"+email+"','"+phn+"','"+sbjt+"','"+msg+"')"); 

%>
	<h1>Query Submited Sucessfully</h1>
	<a href="index.html">Home</a>
</body>
</html>