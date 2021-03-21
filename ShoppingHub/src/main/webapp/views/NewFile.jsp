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
<body style="background-image:url('/images/banner4.jpg')">
<form action="/order/insertDetail" method="post">
<div CLASS="d-flex justify-content-center"><b>SHIPPING ADDRESS</b></div>
<table class="table">
	<tr>
		<th style="text-align:center"></th>
		<th style="text-align:center">street</th>
		<th style="text-align:center">city</th>
		<th style="text-align:center">state</th>
		<th style="text-align:center">country</th>
		<th style="text-align:center">zipcode</th>
	</tr>
	<c:forEach var="shippAdd" items="${shippingAddress}">
		<tr>
			<td style="text-align:center"><input type="radio" name="shippingAddressid" value="${shippAdd.id}"></input></td>
			<td style="text-align:center">${shippAdd.street}</td>
			<td style="text-align:center">${shippAdd.city}</td>
			<td style="text-align:center">${shippAdd.state}</td>
			<td style="text-align:center">${shippAdd.country}</td>
			<td style="text-align:center">${shippAdd.zipcode}</td>
			
		</tr>
	</c:forEach>
</table>

<div CLASS="d-flex justify-content-center"><b>BILLING ADDRESS</b></div>
<table class="table">
	
	<tr>
		<th style="text-align:center"></th>
		<th style="text-align:center">street</th>
		<th style="text-align:center">city</th>
		<th style="text-align:center">state</th>
		<th style="text-align:center">country</th>
		<th style="text-align:center">zipcode</th>
	</tr>
		<c:forEach var="billAdd" items="${billingAddress}">
		<tr>
			<td style="text-align:center"><input type="radio" name="billingAddressid" value="${billAdd.id}"></input></td>
			<td style="text-align:center">${billAdd.street}</td>
			<td style="text-align:center">${billAdd.city}</td>
			<td style="text-align:center">${billAdd.state}</td>
			<td style="text-align:center">${billAdd.country}</td>
			<td style="text-align:center">${billAdd.zipcode}</td>
			
		</tr>
	</c:forEach>
</table>
<div class="d-flex justify-content-right"><input type="submit" value="Proceed to Pay"></div>
</form>
	


</body>
<footer>
<%@include file="footer.jsp" %>
</footer>
</html>