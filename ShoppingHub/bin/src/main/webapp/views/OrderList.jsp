<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
  	if(session.getAttribute("userId") == null){
		response.sendRedirect("/user/login-views");
	}
  	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<header>
<%@include file="header.jsp" %>
</header>

<body>
<table class="table table-striped">
<thead class="table-dark">
	<tr>
		<th style="text-align:center">Order Id</th>
		<th style="text-align:center">Product Name</th>
		<th style="text-align:center">Quantity</th>
		<th style="text-align:center">Ammount</th>
		
	</tr>
	</thead>
	<tbody>
	<c:forEach var="orderList" items="${order}">
	
		<tr>
			<td style="text-align:center"><a href="/order/orderdetail/${orderList.orderNo}">${orderList.orderNo}</a></td>
			<td style="text-align:center">
			<c:forEach var="cart" items = "${orderList.cartitem}">
			${cart.product.productName}<br>
			</c:forEach></td>
			<td style="text-align:center">
			<c:forEach var="cart" items = "${orderList.cartitem}">
			${cart.qty}<br>
			</c:forEach></td>
			<td style="text-align:center">${orderList.total}</td>
			
		</tr>
		
	</c:forEach>
	</tbody>
</table>

</body>

<footer>
<%@include file="footer.jsp" %>
</footer>
</html>