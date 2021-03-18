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
<div class="container">
<div class="card text-center">
  <div class="card-header">
    ORDER DETAILS
  </div>
  <div class="card-body">
    <h5 class="card-title">Special title treatment</h5>
    <p class="card-text  d-">bankName = 			 ${orders.payment.bankName}</p>
    <p class="card-text">bankTXNID = 			 ${orders.payment.bankTXNID}</p>
    <p class="card-text">currency = 			 ${orders.payment.currency}</p>
    <p class="card-text">gateWayName =			 ${orders.payment.gateWayName}</p>
    <p class="card-text">orderId = 				 ${orders.payment.orderId}</p>
    <p class="card-text">paymentMode =			 ${orders.payment.paymentMode}</p>
    <p class="card-text">respMsg =				 ${orders.payment.respMsg}</p>
    <p class="card-text">status =				 ${orders.payment.status}</p>
    <p class="card-text">txnAmount =			 ${orders.payment.txnAmount}</p>
    <p class="card-text">txDate =				 ${orders.payment.txDate}</p>
    <p class="card-text">bankName =				 ${orders.payment.bankName}</p>
    <p class="card-text">txnId =				 ${orders.payment.txnId}</p>
    <p class="card-text">order status =				 ${orders.orderStatus}</p>
    <p class="card-text">txnId =				 ${orders.payment.txnId}</p>
    <p class="card-text">Product name=<c:forEach var="cart" items = "${orders.cartitem}">
    	${cart.product.productName }
    </c:forEach>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
  <div class="card-footer text-muted">
    THANKS FOR VISITING	"${result}"
  </div>
</div>
</div>
</body>

<footer>
	<%@include file="footer.jsp"%>
</footer>
</html>