<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
ul {
	margin: 0px;
	padding: 0 0px;
}

ul li {
	padding: 1px;
	width: 150px;
	margin: 05px 0px;
	align: left;
}

li a {
	border-radius: 0px 15px 15px 0px;
	display: block;
	color: white;
	padding: 6px;
	font-weight: bold;
	text-decoration: none;
	background-color: brown;
	width: 200px;
	align: center;
	font-size: 15px;
}

li a:hover {
	background-color: grey;
	color: black;
}
</style>

<body bgcolor="white">
	<ul style="list-style-type: none;">
	<li><a href="onlneslsrsts.jsp" target=middle><b>Online Orders</b></a>
		<li><a href="prod_mng.jsp" target=middle>Product Management</a></li>
		<li><a href="Stock.jsp" target=middle>Stock Report</a></li>
		<li><a href="product.jsp" target=middle>Create Sales Order</a></li>
		<li><a href="ordrrpt.jsp" target=middle>Sales report</a></li>
		<li><a href="update.jsp" target=middle>Update Product Quantity</a></li>
		<li><a href="chngpass.html" target="middle">Change Password</a></li>
		<li><a href="logout.jsp" target=_top>Logout</a></li>
	</ul>
</body>
</html>