<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<!--frameset rows="30%,70%" framespacing="no" frameborder="no">
<frame name="midtop">
<frame name="midbot">
</frameset-->

<style>
body, html {
  height: 100%;
  margin: 0;
}

.bg {
  /* The image used */
  background-image: url("img.jpg");

  /* Full height */
  height: 170%; 

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
</style>
</head>
<body>
<div class="bg">
<table align=center>
		<tr>
			<th><font size="10px" color="Brown"> <%  String userid=(String)session.getAttribute("userid");
	out.print("Welcome "+userid);%>
			</font></th>
		</tr>
	</table>
	<br/>
	<p><font size="6" color="Brown">&emsp;&emsp;<b>Sales and Inventory Management</b>	

	<font size="6" color="White"> is a system developed for the ease of organizations having concerns about Billing System and Reports Management. 
	</font></p>
	<p><font size="5" color="White">
	Following are some Facilities provided by us:<br/>
		
		* Product Management.<br/>
		* Stock Report.<br/>
		* Create Sales Order.<br/>
		* Sales Report.<br/>
		* Update Product Quantity.<br/>
		</font>	</p>	
		  
	<p><font size="4" color="White">	  
	Product Management:<br/>
	&emsp;&emsp;&emsp;&emsp;Product Management is a Module for a Adding new Product in System.<br/> 
	Stock Report:<br/>
	&emsp;&emsp;&emsp;&emsp;Stock Report is a Module for Checking Availability of a Product.<br/>
	Create Sales Order:<br/>
	&emsp;&emsp;&emsp;&emsp;Create Sales Order is a Module for Creating a sales Invoice for Customer.<br/>
	Sales Report:<br/>
	&emsp;&emsp;&emsp;&emsp;Sales Report generates Reports of Sales date wise according our requirement.<br/>
	Update Product Quantity:<br/>
	&emsp;&emsp;&emsp;&emsp;Update Product Quantity Add's Product in Stock when new stock arrives.<br/>
	</font></p>
	
	</div>
</body>
</html>