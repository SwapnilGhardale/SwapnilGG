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

	<%!Connection con;Statement st;String pid,tquant,pname,quant;%>
	<%
pid=request.getParameter("pid");	
con=DB.getConnection();
st= con.createStatement();
ResultSet rs=st.executeQuery("select * from stock where p_id='"+pid+"'");
if(rs.next())
{
pname=rs.getString(2);
tquant=rs.getString(4);
}
%>
	<table border="1" width="80%" align="center" height="100%">
		<tr>
			<th>Product Id</th>
			<th>Product Name</th>
			<th>In Stock</th>
			<th>Enter update quantity</th>
			<th></th>
		</tr>
		<form action="update.jsp">
			<tr>
				<td><input type="text" name="pid"></td>

				<td>
					<%if(pname!=null)out.print(pname);else out.println();%>
				</td>
				<td>
					<%if(tquant!=null)out.print(tquant);else out.println();%>
				</td>
				<td><input type="text" name="quant"></td>
				<td><input type="submit" value="Update"></td>

			</tr>
	</table>
	</form>


	<%
try{
	
quant=request.getParameter("quant");

int tquant1=Integer.parseInt(tquant);
int quant1=Integer.parseInt(quant);
int r=st.executeUpdate("update stock set stk="+ (tquant1+quant1) +" where name='"+pname+"'");
if(r==1)
{
	response.sendRedirect("updatestk.jsp");
}
}
catch(Exception e)
{}
%>


</body>
</html>