<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
th {
	text-style: bold;
	size: 36px;
	padding: 20px
}

td {
	text-align: center;
	padding: 10px;
}
</style>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	
	<%@ page import="data.DB"%>
	<table border="1" width="95%" align="center" height="100%">
		<tr>
			<th>Order Date</th>
			<th>Customer Name</th>
			<th>Total Amount</th>
			<th>Customer Address</th>
			<th>Mobile Number</th>
			<th></th>
			<th>Status</th>
		</tr>

		<%
		Connection con=DB.getConnection();
		Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from ordertbl where transtype='OnlineClient' order by orderdate desc");
String date,custname,amnt,custaddr,mobn,mobn1,status;

while(rs.next())
{
date=rs.getString(2);
custname=rs.getString(4);
amnt=rs.getString(5);
custaddr=rs.getString(7);
mobn=rs.getString(8);
mobn1=rs.getString(9);
status=rs.getString(10);
	%>
		<tr>
			<td>
				<%out.print(date);%>
			</td>
			<td>
				<% out.print(custname);%>
			</td>
			<td>
				<%out.print(amnt); %>
			</td>
			<td>
				<%out.print(custaddr); %>
			</td>
			<td>
				<%out.print(mobn);if(mobn1!=null&&mobn1!="") out.print(" "+mobn1); %>
			</td>
			<td>
			<a href="viewordet.jsp?oid=<%=rs.getInt(1)%>">	View Details</a>
			</td>
			<td>
				<%if(status!=null)out.print(status);else out.println(); %>
			</td>
			<td><a href="OnlineDelivery?oid=<%=rs.getInt(1)%>">Forward Order</a></td>
		</tr>
		<%
}


%>
	</table>
</body>
</html>