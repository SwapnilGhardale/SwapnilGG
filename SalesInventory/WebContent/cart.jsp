
<%@	page import="controller.SQLControl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Cart"%>
<%@	page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart</title>
    </head>
    <body>
<%String value="";
value=request.getParameter("value");
if(value!=null)
{
if(value.equals("1"))
{
	HttpSession newSession=request.getSession();
	newSession.setAttribute("cart",null);
}
}
%>
        <h1>Your Shopping Cart</h1>
        <%
            SQLControl control = new SQLControl();
        boolean status=true;
            %>
        <form action="ShoppingCardServlet" method="POST" id="sbmit">     

      <%if(session.getAttribute("log")=="true"){ %>   
        <p>Customer Name : <input type="text" name="custname" value="Admin" form="sbmit" />
        
        Mobile No : <input type="tel" name="custtele" placeholder="Enter your Mobile Number : " form="sbmit" required/></p>
    
        <p>Payment Method : <input type="text" name="txtMethod" value="Cash" form="sbmit" /></p>
      <%}else{
    	  %>
    	 <p>Customer Name :<input type="text" placeholder="Enter your Name : " name="custname" form="sbmit" required/></p>
        <p>Customer Address : <input type="text" name="custaddr" placeholder="Enter your Address : " form="sbmit" required/></p>
        <p>Mobile No : <input type="tel" name="custtele" placeholder="Enter your Mobile Number : " form="sbmit" required/>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	Alternate Mobile : <input type="tel" name="custtele1" placeholder="Enter your Alternate Mobile Number (if any) : " form="sbmit" /></p>
        <p>Payment Method : <input type="text" name="txtMethod" value="CashOnDelivery" readonly form="sbmit" /></p>
      <%} %> <p>Gmail : <input type="email" name="mail" placeholder="abc@gmail.com" form="sbmit" /></p>
                <%--
                    - Get all product that added to cart
                    - Calculate total cash
                --%>   
                <%
                    int totalOrder = 0;
                    HttpSession newSession = request.getSession();
                    if (newSession.getAttribute("cart") != null) {
                    	%> <table border="1"  rules="all" width="50%">
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Subtotal</th>
                    <th>Remove</th>
                	
                </tr>
            </thead>
            <tbody><%                   	
                        ArrayList<Cart> arrC = (ArrayList<Cart>) newSession.getAttribute("cart");
                        for (int i = 0; i < arrC.size(); i++) {
                            totalOrder += (arrC.get(i).getQuantity() * arrC.get(i).getpPrice());
                %>   
                <tr>
                    <td><%= arrC.get(i).getpName()%></td>
                    <td><%= arrC.get(i).getQuantity()%></td>
                    <td><%= arrC.get(i).getpPrice()%></td>
                    <td><%= arrC.get(i).getQuantity()*arrC.get(i).getpPrice()%></td>
                    <td align="center"><a href="RemoveServlet?id=<%=arrC.get(i).getpID()%>">Remove</a></td>
                </tr>
                <%      }
                }
                    else 
                {
                status=false;
                %>
            <h1>YOU DONT BUY ANYTHING</h1>
            <%
                }

            %>
        </tbody>
    </table>

    <p>Total Amount : &nbsp;&nbsp;&nbsp;&nbsp; Rs. <input type="text" name="tot" value="<%=totalOrder%>" form="sbmit" readonly></p>
  <%
  if(status==true)
  {%>
	  <p><input type="submit" value="Confirm and Generate Bill" value="confirm" onClick="window.print();orderwarn();" form="sbmit"/></p>
  <%} else
  {%><p><input type="submit" value="Confirm and Generate Bill" value="confirm" form="sbmit"/></p>
 <%} 
 %>
 
    </form>     
     <p><a href="product.jsp">Back to buy</a></p>
     <%if(status==true){ %>
	<p align="center"><a href="cart.jsp?value=1"><button>Empty cart</button></a>
<%} 
if(session.getAttribute("log")!="true"){
%>
<p align="center"><a href="index.html">Main Page</a></p>
<%} %>
</body>
<script type="text/javascript">
function orderwarn(){
	alert("You are about to place the order. Please wait a while to place the order...Thank You");
}</script>
</html>
