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
	<%@include file="header.jsp"%>
</header>
<body >

	<div class="row">
		<div class="col d-flex justify-content-center">
			<div>
					<form>
						<div class="row mb-4" style='display:none'>
							<div class="col-lg-8 mx-auto text-center">
								<h5 class="display-6">Add your Billing Address</h5>
							</div>
						</div>
						<div class="card" style='display:none'>
							<div class="card-header">
								<div class="bg-light shadow-sm pt-4 pl-2 pr-2 pb-2">
									<div class="mb-3">
										<input type="hidden" class="form-control" value="${cart.id}" id="exampleInputaddress"
											aria-describedby="emailHelp" required>
									</div>
									<div class="mb-3">
										<label for="exampleInputaddress" class="form-label">Address</label>
										<input type="text" class="form-control" id="exampleInputaddress"
											aria-describedby="emailHelp" required>
										<div id="emailHelp" class="form-text">Street/Area/Apartment
											Details</div>
									</div>
									<div class="mb-3">
										<label for="exampleInputcity" class="form-label">City/District</label>
										<input type="text" class="form-control" id="exampleInputcity"
											required>
									</div>
									<div class="mb-3">
										<label for="exampleInputstate" class="form-label">State</label>
										<input type="text" class="form-control" id="exampleInputstate"
											required>
									</div>
									<div class="mb-3">
										<label for="exampleInputcountry" class="form-label">Country</label>
										<input type="text" class="form-control" id="exampleInputcountry"
											required>
									</div>
									<div class="mb-3">
										<label for="exampleInputpin" class="form-label">Area-Pincode</label>
										<input type="text" class="form-control" id="exampleInputpin"
											required>
									</div>
									<div class="mb-3 form-check">
										<input type="checkbox" class="form-check-input"
											name="isBillingAddressDifferent" required> <label
											class="form-check-label" for="isBillingAddressDifferent">IsBillingAddressDifferent</label>
									</div>
									<button type="submit" class="btn btn-primary">Make Payment</button>
								</div>
							</div>
						</div>
					</form>
				</div>	
				<div>
					<form action="/order/insertDetail" method="post">
						<div class="row mb-4">
							<div class="col-lg-8 mx-auto text-center">
								<h5 class="display-6">Add your Shipping Address</h5>
							</div>
						</div>
						<div class="card">
							<div class="card-header">
								<div class="bg-light shadow-sm pt-4 pl-2 pr-2 pb-2">
									<div class="mb-3">
										<input type="hidden" class="form-control" value="${cart.id}" name="cartItemId"
											aria-describedby="emailHelp" required>
									</div>
									<div class="mb-3">
										<label for="exampleInputaddress" class="form-label">Address</label>
										<input type="text" class="form-control" name="shippingStreet"
											aria-describedby="emailHelp" required>
										<div id="emailHelp" class="form-text">Street/Area/Apartment
											Details</div>
									</div>
									<div class="mb-3">
										<label for="exampleInputcity" class="form-label">City/District</label>
										<input type="text" class="form-control" name="shippingCity"
											required>
									</div>
									<div class="mb-3">
										<label for="exampleInputstate" class="form-label">State</label>
										<input type="text" class="form-control" name="shippingState"
											required>
									</div>
									<div class="mb-3">
										<label for="exampleInputcountry" class="form-label">Country</label>
										<input type="text" class="form-control" name="shippingCountry"
											required>
									</div>
									<div class="mb-3">
										<label for="exampleInputpin" class="form-label">Area-Pincode</label>
										<input type="text" class="form-control" name="shippingZipcode"
											required>
									</div>
									<div class="mb-3 form-check">
										<input type="checkbox" class="form-check-input"
											name="isBillingAddressDifferent"h> <label
											class="form-check-label" for="isBillingAddressDifferent" onchange="handle(this)">IsBillingAddressDifferent</label>
									</div>
									<button type="submit" class="btn btn-primary">Make Payment</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>	
	</div>
	
<div class="row" style="height:60px"></div>
</body>

<footer>
	<%@include file="footer.jsp"%>
</footer>
<script type="text/javascript">
function handleClick($this){
	console.log($this.value());
}</script>
</html>