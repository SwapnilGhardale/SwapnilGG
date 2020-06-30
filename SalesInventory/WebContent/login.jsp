<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sales & Inventory System</title>
</head>
<script language="text/javascript">
document.getElementById('ct1').write('InvalidPassword');
</script>
<body>

	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%@ page import="data.DB"%>
<%/*
@ throws Exception
*/%>

	<%
	//session.setMaxInactiveInterval(1800);
String userid=request.getParameter("usr");
session.putValue("userid",userid);
session.setAttribute("userid",userid);
String pwd=request.getParameter("pwd");
Connection con=DB.getConnection();
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from users where user='"+userid+"'");
if(rs.next())
	{
		if(rs.getString(2).equals(pwd))
		{
			session.setAttribute("log","true");
			response.sendRedirect("home.jsp");
		}
		else
		{ 
		%><div id='ct1' align=right></div>
	<script>alert("Invalid Password Entered...");location='Login.html'</script>
	<%out.println("Invalid Password Entered...");
		}
	}
else	{
		%><script>alert("Not Registered Yet!!!");location='Login.html'</script><%="Not Registered Yet!!!" %>
	<% 
		}%>

</body>
</html>