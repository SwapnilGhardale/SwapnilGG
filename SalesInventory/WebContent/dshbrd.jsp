<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
.button {
  width: 250px;
  padding: 25px 35px;
  font-size: 24px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.button:hover {background-color: #3e8e41}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
</style>		
<body bgcolor="white">

<h1>&emsp;&emsp;&emsp;&emsp;<a href="prod_mng.jsp"><button class="button">Product Management</button></a>&emsp;&emsp;&emsp;&emsp;
<a href="Stock.jsp"><button class="button">Stock Report</button></a></h1><br/><br/>
<h1>&emsp;&emsp;&emsp;&emsp;<a href="onlneslsrsts.jsp"><button class="button">View Online Orders</button></a>&emsp;&emsp;&emsp;&emsp;
<a href="product.jsp"><button class="button">Create Sales Order</button></a></h1><br/><br/>
<h1>&emsp;&emsp;&emsp;&emsp;<a href="ordrrpt.jsp"><button class="button">Sales Report</button></a>&emsp;&emsp;&emsp;&emsp;
<a href="update.jsp"><button class="button">Update Product Quantity</button></a></h1>
</body>
</html>