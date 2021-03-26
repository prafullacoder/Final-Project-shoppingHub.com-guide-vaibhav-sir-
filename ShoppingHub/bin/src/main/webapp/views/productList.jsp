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
<body>

<div class="col d-flex ">
		<c:forEach var="product" items="${productList}">
			<div class="card ">
				<div class="card_img">
				<!--<img src="${pageContext.request.contextPath}/${item.image}" />-->
				<a href="/product/description/${product.id}"><img class="card-img-top"
				 alt="" src="${pageContext.request.contextPath}/${product.image}" /></a>
			</div>
				<div class="card-title">
					<h3>${product.productName}</h3>
				</div>
				<div class="card-text">
					<h3>
						<i class="fa fa-inr" aria-hidden="true"></i>${product.sellingPrice}
					</h3>
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