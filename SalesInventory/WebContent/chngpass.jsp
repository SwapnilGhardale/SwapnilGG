<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="Brown">
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	
	<%
String userid=request.getParameter("user");
String old_pass=request.getParameter("oldpass");
String new_pass=request.getParameter("newpass");
String new_pass1=request.getParameter("newpass1");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","swapnil");

PreparedStatement ps = con.prepareStatement("select pwd from users where user='"+userid+"'");
ResultSet rs = ps.executeQuery();
Statement st=con.createStatement();
rs.next();
if(rs.getString(1).equals(old_pass))
{
	if(new_pass.equals(new_pass1))
	{
		PreparedStatement ps1=con.prepareStatement("Update users Set pwd='"+ new_pass +"'where user = '"+userid+"'");
		int i=ps1.executeUpdate();
		%><br />
	<b><center>
			<h1>Password Changed Successfully!!</h1>
		</center></b>
	<br />
	<center>
		<h1>
			<font color="white"> <a href="home.jsp" target=_top>HOME</a></font>
		</h1>
	</center>
	<%	
	}
	else 
	{
		%><br />
	<b><center>
			<h1>Confirmed Password do not match...</h1>
		</center></b>
	<br />
	<center>
		<h1>
			<font color="white"> <a href="home.jsp" target=_top>HOME</a></font>
		</h1>
	</center>
	<%	
	}
}
else
{	%><br />
	<b><center>
			<h1>Old password mismatching...</h1>
		</center></b>
	<br />
	<center>
		<h1>
			<font color="white"><a href="home.jsp" target=_top>HOME</a></font>
		</h1>
	</center>
	<%	
}

%>

</body>
</html>