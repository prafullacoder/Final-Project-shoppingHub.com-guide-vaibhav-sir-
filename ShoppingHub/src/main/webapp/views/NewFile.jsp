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
<form action="/order/insertDetail" method="post">
<input type="hidden" class="form-control" value="${cart.id}" name="cartItemId"
											aria-describedby="emailHelp" required>
											
<div CLASS="d-flex justify-content-center bg-success"><b>SHIPPING ADDRESS</b></div>
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
			<td style="text-align:center"><input type="radio" name="shippingAddressid" value="${shippAdd.id}" required></input></td>
			<td style="text-align:center">${shippAdd.street}</td>
			<td style="text-align:center">${shippAdd.city}</td>
			<td style="text-align:center">${shippAdd.state}</td>
			<td style="text-align:center">${shippAdd.country}</td>
			<td style="text-align:center">${shippAdd.zipcode}</td>
			
		</tr>
	</c:forEach>
</table>

<div CLASS="d-flex justify-content-center bg-success"><b>BILLING ADDRESS</b></div>
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
			<td style="text-align:center"><input type="radio" name="billingAddressid" value="${billAdd.id}" required></input></td>
			<td style="text-align:center">${billAdd.street}</td>
			<td style="text-align:center">${billAdd.city}</td>
			<td style="text-align:center">${billAdd.state}</td>
			<td style="text-align:center">${billAdd.country}</td>
			<td style="text-align:center">${billAdd.zipcode}</td>
			
		</tr>
	</c:forEach>
</table>
<div class=" btn d-flex justify-content-center">
<div><button type="submit" class="btn btn-primary">Proceed to pay</button></div>
<c:if test="${cart.id !=0}">
<div><a href="/order/newfile/${cart.id}" class="brn btn btn-success ml-5">Enter New Address</a></div>
</c:if>
<c:if test="${cart.id ==0}">
<div><a href="/order/newfile" class="brn btn btn-success ml-5">Enter New Address</a></div>
</c:if>
</div>
</form>
	


</body>
<footer>
<%@include file="footer.jsp" %>
</footer>
</html>