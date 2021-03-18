<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/productList.css">
</head>
<header>
<%@include file="header.jsp" %>
</header>
<body style="background-image:url('/images/banner4.jpg')">

	<div class="product_list">
	<c:forEach var="product" items="${productList}">
		<div class="card bg-dark">
		
			<div class="card_img">
				<!--<img src="${pageContext.request.contextPath}/${item.image}" />-->
				<img alt="" src="${pageContext.request.contextPath}/${product.image}" />
			</div>
			<div class="card_header">
				<h2><a href="/product/description/${product.id}" class="text-default mb-2" data-abc="true">${product.productName}</a></h2>
				
				<p class="price">
					<i class="fa fa-inr" aria-hidden="true"></i> ${product.sellingPrice}
				</p>
			</div>
			
		</div>
		</c:forEach>
	</div>
	<script
		src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'></script>
</body>
<footer>
<%@include file="footer.jsp" %>
</footer>
</html>