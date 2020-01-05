<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="controller.SQLControl"%>
<%@ page import="model.*"%>
<%@ page import="java.util.ArrayList" %>

<%!SQLControl s=new SQLControl();%>
<%!boolean status=false; %>
<h1 align="center">Product Management</h1>
<hr width="30%"/>
<h2 align="left" style="display:inline">ADD <b>PRODUCT 	</b></h2><h3 style="display:inline">IN INVENTORY</h3>
<br/><br/>
<%
if(status==true){%>
<jsp:useBean id="product" class="model.Product" scope="session" />
<jsp:setProperty name="product" property="*" />
<%
int s1=-1;
if(product.getpId()!=null)
{
ArrayList<Product> a=(ArrayList<Product>)s.selectProduct(product.getpId());
if(a.isEmpty()){
		s1=s.addProduct((Product)product);
			if(s1>0)%><font size="4" color= "blue">Product Added Successfully!!!</font><%
				}
	else {
	 out.print("Entered Product Id : "+product.getpId()+" is already Present...");
			}
status=false;

}
product.setpId(null);
} %>

<form action="prod_mng.jsp" method="post">
<br/><br/><br/>&nbsp;&nbsp;Product Id: <input type="text" required name="pId" />
<br/><br/><br/>&nbsp;&nbsp;Product Name: <input type="text" required name="pName" />
<br/><br/><br/>&nbsp;&nbsp;Price(Inclusive of GST): <input type="text" required name="pPrice" />
<br/><br/><br/>&nbsp;&nbsp;Quantity: <input type="text" required name="ptQuant" />
<br/><br/><br/><input type="reset" value="Clear" />
<p align="center" style="display:inline"><input type="submit" value="Add Product" onClick="<%status=true;%>"></p>
</form>

</body>
</html>