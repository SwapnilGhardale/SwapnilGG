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
			<th>Product Id</th>
			<th>Product Name</th>
			<th>In Stock</th>
		</tr>




		<%
		Connection con=DB.getConnection();
		Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from stock");
String p_id;
String name;
int stk;
while(rs.next())
{
	p_id=rs.getString(1);
	name=rs.getString(2);
	stk=rs.getInt(4);
	%>
		<tr>
			<td>
				<%out.print(p_id);%>
			</td>
			<td>
				<% out.print(name);%>
			</td>
			<td>
				<%out.print(stk); %>
			</td>
		</tr>
		<%
}


%>
	</table>
</body>
</html>