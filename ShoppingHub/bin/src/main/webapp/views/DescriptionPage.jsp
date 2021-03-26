<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="/css/productList.css">

</head>
<header>
<%@include file="header.jsp" %>
</header>
<body>

	<div class="container mt-5"></div>
	<div class="container" style="height:400px">
		<div class="row"  style="height:400px">
			<div class="col-md-6">
			
			<img class="card-img-bot alt="" src="${pageContext.request.contextPath}/${items.image}" />
			</div>
			<div class="col-md-6" style="height:400px">
				<div class="row">
					<h3>${items.productName}</h3>
				</div>
				<div class="row d-flex">
				<div class="col d-flex justify-content-start">
					<h2>
						<i class="fa fa-inr" aria-hidden="true"></i>${items.sellingPrice}
					</h2>
					&nbsp; &nbsp;
					<h4>
						<del>${items.mrp}</del>
					</h4>
					&nbsp; &nbsp;
					<h3 class="text-success">${items.discount}% off</h3>
					</div>
				</div>
			
				<div class="row">
					<h5>${items.description}</h5>
				</div>
				<div class="row mt-4 ml-1">
				<div class="col d-flex justify-content-start">
					<a class="btn btn-warning btn-lg text-light" href="/cart/addtocart/${items.id}" role="button">
						<i class="fa fa-shopping-cart" aria-hidden="true"></i>   Add to cart</a>  &nbsp;
					<a class="btn btn-danger btn-lg text-light" href="/cart/buynow/${items.id}" role="button">
						<i class="fa fa-bolt" aria-hidden="true"></i>   Buy Now</a>
				</div>
				</div>
				
				
			</div>
		</div>
	</div>
	<div class="row" style="height:50px"></div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>

<footer>
<%@include file="footer.jsp" %>
</footer>
</html>