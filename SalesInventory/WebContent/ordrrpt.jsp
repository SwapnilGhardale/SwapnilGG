<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Report</title>
</head>
<body>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="data.DB"%>

View Order Report from
<form action="ordrrpt1.jsp">
	<input type="text" placeholder="YYYY-MM-DD" name="fordrdate">
TO
	<input type="text" placeholder="YYYY-MM-DD" name="tordrdate">

	<input type="submit" value="View">
</form>
<br/><br/>


<%
	String fordrdate=request.getParameter("fordrdate");
	String tordrdate=request.getParameter("tordrdate");
	Connection con=DB.getConnection();
	Statement st= con.createStatement();
	ResultSet rs=st.executeQuery("SELECT * from ordertbl where orderdate between '"+fordrdate+"00:00:00' and '"+tordrdate+"23:59:59' order by OrderDate desc");
	String ordrdte;
	String cusname;
	int tprc;
	String pmode,ttype;
	if(!rs.isBeforeFirst())
	{
	out.println("<h1 align=\"center\">No Sale Orders Found!!!</h1>");
	}
	else{
		%>
		<h4>Sales Report from <%out.print(request.getParameter("fordrdate"));%> to <%out.print(request.getParameter("tordrdate"));%></h4>
	<table border="1" width="80%" align="center" height="100%">
	<tr>
		<th>Order Date</th>
		<th>Customer Name</th>
		<th>Total Price</th>
		<th>Payment Mode</th>
		<th>Transaction Type</th>
	</tr><%
	while(rs.next())
	{
		ordrdte=rs.getString(2);
		cusname=rs.getString(4);
		tprc=rs.getInt(5);
		pmode=rs.getString(3);
		ttype=rs.getString(6);
%>
	<tr>
		<td>
			<%out.print(ordrdte);%>
		</td>
		<td>
			<% out.print(cusname);%>
		</td>
		<td>
			<%out.print(tprc); %>
		</td>
		<td>
			<%out.print(pmode); %>
		</td>
		<td>
			<%out.print(ttype); %>
		</td>
	</tr>
<%
	}
	
%>
</table>

<p align="right">
<input type="submit" value="Print" onClick="window.print()"/>
</p>

<%} %>


</body>
</html>