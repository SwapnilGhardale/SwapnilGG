<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">
	function display_c(){
	var refresh=1000; // Refresh rate in milli seconds
	mytime=setTimeout('display_ct()',refresh)
	}

	function display_ct() {
	var x = new Date()
	document.getElementById('ct').style.fontSize='12px';
	document.getElementById('ct').style.color='White';
	document.getElementById('ct').innerHTML = x;
	display_c();
	 }

	</script>
<style>
th a {
	text-decoration: none;
}

th a:hover {
	background-color: grey;
	color: black;
}

th a small font:hover {
	color: black;
}

table {
	/*  border-radius:10px;*/
	
}
</style>
</head>

<body onload=display_ct(); bgcolor="brown" style="margin-top: 0px">


	<table border="0" cellspacing="0" cellpadding="0" align=right>
		<tr>
			<th><font size="3px" color="Yellow"> <%  String userid=(String)session.getAttribute("userid");
	out.print("Welcome "+userid+" |  ");%>
			</font></th>
			<th><a href="logout.jsp" target=_top><small align="right"><font
						size="3px" color="Yellow">Logout</font></small></a></th>
		</tr>
	</table>

	<font color="White">
		<h1>Inventory Management System</h1>
		<h3 style="display: inline;">Manage Product Stock and Inventory
			Online</h3>
	</font>


	<div id='ct' align=right style="display: inline; float: right"></div>
	<br />
	<table align="center" width="70%" cellpadding="5" cellspacing=no
		bgcolor="White">

		<tr>
			<th><font color="Brown"><a href="Middle.jsp" target=middle>HOME</a></font></th>
			<th><font color="Brown"><a href="dshbrd.jsp" target=middle>DASHBOARD</a></font></th>
			<%//	<th><font color="Brown"><a>INVENTORY ADMINISTRATION</a></font></th> %>
			<th><font color="Brown"><a href="usrprf.jsp" target="middle">USER PROFILE</a></font></th>
			<th><font color="Brown"><a href="logout.jsp" target=_top >LOGOUT</a></font></th>
		</tr>
	</table>
<marquee behavior="alternate" ><a href="onlneslsrsts.jsp" target=middle><b><font color="yellow" >View Latest Online Orders !!!</font></b></a></marquee>


</body>
</html>