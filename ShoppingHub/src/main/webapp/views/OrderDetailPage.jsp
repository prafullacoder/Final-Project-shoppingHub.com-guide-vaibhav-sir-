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
<table class="table table-striped table-bordered">
<div class="d-flex justify-content-center bg-success"><b>ORDER DETAILS</b></div>
	<tr>
		<th style="text-align:center">Order Id</th>
		<th style="text-align:center">Product Name</th>
		<th style="text-align:center">Category</th>
		<th style="text-align:center">Selling Price</th>
		<th style="text-align:center">Quantity</th>
		<th style="text-align:center">Total Ammount</th>
		<th style="text-align:center">Placed On</th>
		<th style="text-align:center">Tracking Id</th>
		<th style="text-align:center">Payment Mode</th>
		<th style="text-align:center">Shipping Address</th>
		<th style="text-align:center">Order status</th>
		<th style="text-align:center">button</th>
		
	</tr>
		<tr>
			<td style="text-align:center">${orders.orderNo}</td>
			<td style="text-align:center">
			<c:forEach var="cart" items = "${orders.cartitem}">
			${cart.product.productName}
			</c:forEach></td>
			
				<td style="text-align:center">
			<c:forEach var="cart" items = "${orders.cartitem}">
			${cart.product.category.name}<br>
			</c:forEach></td>
			
			<td style="text-align:center">
			<c:forEach var="cart" items = "${orders.cartitem}">
			${cart.product.sellingPrice}<br>
			</c:forEach></td>
			
			<td style="text-align:center">
			<c:forEach var="cart" items = "${orders.cartitem}">
			${cart.qty}<br>
			</c:forEach></td>
			
			<td style="text-align:center">${orders.total}</td>
			<td style="text-align:center">${orders.orderDate}</td>
			
			<td style="text-align:center">${orders.trackingId}</td>
			<td style="text-align:center">${orders.payment.paymentMode}</td>
			<td style="text-align:center">
			${orders.shipAdd.street}<br>
			${orders.shipAdd.city}<br>
			${orders.shipAdd.state}<br>
			${orders.shipAdd.country}<br>
			${orders.shipAdd.zipcode}<br>
			</td>
			<td style="text-align:center">${orders.orderStatus}</td>
			<td style="text-align:center"><a href="/order/trackorder/${orders.orderNo}" class="btn btn-warning">TRACK ORDER</a></td>
		</tr>
</table>

<c:if test="${q==1}">

<table class="table table-striped table-bordered">
<div class="d-flex justify-content-center bg-success"><b>TRACKING DETAILS</b></div>
	<tr>
		<th style="text-align:center">Status</th>
		<th style="text-align:center">StatusLocation</th>
		<th style="text-align:center">StatusDateTime</th>
		<th style="text-align:center">Instructions</th>
		<th style="text-align:center">StatusType</th>
		<th style="text-align:center">StatusCode</th>
		
	</tr>
		<tr>
			<td style="text-align:center">${shipmentTrackLists.shipment.status.status}</td>
			<td style="text-align:center">${shipmentTrackLists.shipment.status.statusLocation}</td>
			<td style="text-align:center">${shipmentTrackLists.shipment.status.statusDateTime}</td>
			<td style="text-align:center">${shipmentTrackLists.shipment.status.instructions}</td>
			<td style="text-align:center">${shipmentTrackLists.shipment.status.statusType}</td>
			<td style="text-align:center">${shipmentTrackLists.shipment.status.statusCode}</td> 
			
		</tr>
</table>

</c:if>

<c:if test="${q==1}">

<table class="table table-striped table-bordered">
<div class="d-flex justify-content-center bg-success"><b>SCANNING DETAILS</b></div>
	<tr>
		<th style="text-align:center">ScanDateTime</th>
		<th style="text-align:center">ScanType</th>
		<th style="text-align:center">Scan</th>
		<th style="text-align:center">StatusDateTime</th>
		<th style="text-align:center">ScannedLocation</th>
		<th style="text-align:center">Instructions</th>
		<th style="text-align:center">StatusCode</th>
		
		
	</tr>
	<tr>
	<c:forEach var="list" items="${shipmentTrackLists.shipment.scans}">
		<td style="text-align:center">${list.scanDetail.scanDateTime}</td>
		<td style="text-align:center">${list.scanDetail.scanType}</td>
		<td style="text-align:center">${list.scanDetail.scan}</td>
		<td style="text-align:center">${list.scanDetail.statusDateTime}</td>
		<td style="text-align:center">${list.scanDetail.scannedLocation}</td>
		<td style="text-align:center">${list.scanDetail.instructions}</td>
		<td style="text-align:center">${list.scanDetail.statusCode}</td>
	</c:forEach> 
		
	</tr>
</table>

</c:if>
</body>

<footer>
<%@include file="footer.jsp" %>
</footer>
</html>