<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<header>
	<%@include file="header.jsp"%>
</header>
<body>
	<div class="container-fluid">
		<div class=" col d-flex justify-content-center">
		<c:forEach var="address" items="${shippingAddress}">
			<div class="card ml-3 mt-3 mb-3" style="width: 18rem;">
				<div class="card-header">SHIPPING ADDRESS</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">street =  "${address.zipcode }"</li>
					<li class="list-group-item">city =  "${address.city }"</li>
					<li class="list-group-item">state =  "${address.zipcode }"</li>
					<li class="list-group-item">country =  "${address.country }"</li>
					<li class="list-group-item">zipcode =  "${address.zipcode }"</li>
					<li><a href="#" class="brn btn btn-success">PLACE ORDER</a></li>
					<li><a href="#" class="brn btn btn-success mt-3">PLACE ORDER</a></li>
				</ul>
			</div>
		</c:forEach>
		<c:forEach var="address" items="${billingAddress}">
			<div class="card ml-3 mt-3 mb-3" style="width: 18rem;">
				<div class="card-header">BILLING ADDRESS</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">street =  "${address.zipcode }"</li>
					<li class="list-group-item">city =  "${address.city }"</li>
					<li class="list-group-item">state =  "${address.zipcode }"</li>
					<li class="list-group-item">country =  "${address.country }"</li>
					<li class="list-group-item">zipcode =  "${address.zipcode }"</li>
					<li><a href="#" class="brn btn btn-success">PLACE ORDER</a></li>
					<li><a href="#" class="brn btn btn-success mt-3">PLACE ORDER</a></li>
				</ul>
			</div>
		</c:forEach>
		

		</div>

	</div>
</body>
<footer>
	<%@include file="footer.jsp"%>
</footer>
</html>