<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<%
if(session.getAttribute("log")==null)
	{
	response.sendRedirect("logout.jsp");
	}
else{
	%>
<frameset rows="22%,78%" framespacing="1" frameborder=no>
	<frame src="Top.jsp" noresize="noresize" scrolling=no>
	<frameset cols="15%,70%,15%" frameborder=no framespacing="1">
		<frame src="Left.jsp" noresize="noresize" scrolling=no>
		<frame src="Middle.jsp" name="middle">
		<frame src="Right.jsp">
	</frameset>
</frameset>
<%} %>
</html>