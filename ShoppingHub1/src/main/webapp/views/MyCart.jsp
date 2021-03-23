<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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


<table class="table">
<thead>
	<tr>
		<th style="text-align:center">PRODUCT NAME</th>
		<th style="text-align:center">CATEGORY</th>
		<th style="text-align:center">PRICE</th>
		<th style="text-align:center">QUANTITY</th>
		<th style="text-align:center">SUB TOTAL</th>
		<th style="text-align:center">REMOVE ITEM</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="cartItem" items="${carts}">
		<tr>
			<td style="text-align:center">${cartItem.product.productName}</td>
			<td style="text-align:center">${cartItem.product.category.name}</td>
			<td style="text-align:center">${cartItem.product.sellingPrice}</td>
			<td style="text-align:center">
			<c:if test="${cartItem.qty > 1}">
			<a href="/cart/removeitem/${cartItem.id}" class="brn btn btn-success">-</a></c:if>
			${cartItem.qty}
			<c:if test="${cartItem.qty < 5 && cartItem.qty < cartItem.product.instockNumber}">
			<a href="/cart/addtocart/${cartItem.product.id}" class="brn btn btn-success">+</a></td></c:if>
			<td style="text-align:center">${cartItem.total}</td>
			<td style="text-align:center"><a href="/cart/deketecartitem/${cartItem.id}" class="btn btn-warning">DELETE</a></td>
		</tr>
	</c:forEach>
	<tr>
		<th style="text-align:center">TOTAL AMMOUNT = ${total}</th>
		<c:if test="${total!=0.00 }">
		<th style="text-align:center"><a href="/order/" class="brn btn btn-success">PLACE ORDER</a></th>
		</c:if>
	</tr>
	</tbody>
</table>

</body>
<footer>
<%@include file="footer.jsp" %>
</footer>
</html>