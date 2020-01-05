

<%@ page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="controller.SQLControl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List products</title>
    </head>
    <body>
        <%
            SQLControl control = new SQLControl();
            ArrayList<Product> arrP = control.selectAllProduct();

        %>
        <h1>Select thing to buy</h1>
        <table border="1" cellpadding=5 cellspacing=5>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Total Stock</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%  if (arrP != null) {
                        for (int i = 0; i < arrP.size(); i++) {
                        	if(arrP.get(i).getptQuant()==0){
                %>
                <tr>
                    <td><%= arrP.get(i).getpId()%></td>
                    <td><%= arrP.get(i).getpName()%></td>
                    <td><%= arrP.get(i).getpPrice()%></td>
                    <td color="red"><%= arrP.get(i).getptQuant()%></td>
                    <td>
                        <a><input type="submit" value="Out of Stock" disabled /></a> 
                    </td>
                </tr>
                <% }
                        	else
                        	{%>
                        		 <tr>
                                 <td><%= arrP.get(i).getpId()%></td>
                                 <td><%= arrP.get(i).getpName()%></td>
                                 <td><%= arrP.get(i).getpPrice()%></td>
                                 <td><%= arrP.get(i).getptQuant()%></td>
                                 <td>
                                     <a href="ProductServlet?id=<%=arrP.get(i).getpId()%>"><input type="submit" value="Buy"/></a> 
                                 </td>
                             </tr><%
                        	}
                        }
                    }%>
            </tbody>
        </table>

        <p><a href="cart.jsp">View Shopping Cart</a></p>
<%
if(session.getAttribute("log")!="true"){
%>
<p align="center"><a href="index.html">Main Page</a></p>
<%} %>
    </body>
</html>
