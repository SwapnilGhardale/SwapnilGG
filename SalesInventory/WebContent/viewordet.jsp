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
	padding: 10px
}

td {	padding: 10px;
}
</style>
<body>
<%@page import="data.DB" %>
<%@page import="controller.*" %>
<%@page import="model.Product" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<h1 align="center">Order Details</h1>

<table rules="all" border="1" width="80%" align="center">
<tr>
			<th>Order Date</th>
			<th>Customer Name</th>
			<th>Total Amount</th>
			<th>Customer Address</th>
			<th>Mobile Number</th>
		
			<th>Status</th>
			</tr>
			
		<%!String date,custname,amnt,custaddr,mobn,mobn1,status;%>
		<%String oid1=request.getParameter("oid");
		Connection con=DB.getConnection();
		Statement st= con.createStatement();
		int oid=Integer.parseInt(oid1);
ResultSet rs=st.executeQuery("select * from ordertbl where orderid="+oid);

if(rs.next())
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
			<td align="center">
				<%out.print(date);%>
			</td>
			<td align="center">
				<% out.print(custname);%>
			</td>
			<td align="center">
				<%out.print(amnt); %>
			</td>
			<td align="center">
				<%out.print(custaddr); %>
			</td>
			<td align="center">
				<%out.print(mobn);if(mobn1!=null&&mobn1!="") out.print(" "+mobn1); %>
			</td>
			<td align="center">
				<%if(status!=null)out.print(status);else out.println(); %>
			</td>
			<td>
			<%if(status!=null && status.equals("Delivered")) {%>Order Delivered<%} else {%>
			<a href="OnlineDelivery?oid=<%=rs.getInt(1)%>">Forward Order</a><%} %>
			</td>
			</tr>
		<%
}


%>
				
</table>
<hr width=60%/>
<table align="center" cellpadding="4">

<tr>
			<th align="left">Product Name</th>
			<th align="left">Price</th>
			<th align="left">Quantity</th>
</tr>
<%
rs=st.executeQuery("select * from orderlinetbl where orderid="+oid);

int price,quant;
String pid;
SQLControl s;
while(rs.next())
{	s=new SQLControl();
	pid=rs.getString(2);
	ArrayList<Product> a=s.selectProduct(pid);
	
	price=rs.getInt(3);
	quant=rs.getInt(4);
	%>
		<tr>
			<td>
				<%if(!a.isEmpty())out.print(a.get(0).getpName());%>
			</td>
			<td>
				<% out.print(price);%>
			</td>
			<td>
				<%out.print(quant); %>
			</td>
		</tr>		<%
}
%>
		<tr><th align="left">TOTAL</th><td></td><th align="left"><%out.print(amnt); %></th></tr>






</table>
<p align=center>
<button onClick="window.print()">Print</button></p>

</body>
</html>