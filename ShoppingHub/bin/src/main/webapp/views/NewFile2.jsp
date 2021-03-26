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

<body>
<form action="/order/insertDetail" method="post">
	<div class="row">
		<div class="col d-flex justify-content-center">

			<div class="card">
				<h5 class="display-6">Add your Shipping Address</h5>
				<div class="card-header">
					<div class="bg-light shadow-sm pt-4 pl-2 pr-2 pb-2">
						<div class="mb-3">
							<input type="hidden" class="form-control" value="${cart.id}"
								name="cartItemId" aria-describedby="emailHelp" required>
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
							<label for="exampleInputstate" class="form-label">State</label> <input
								type="text" class="form-control" name="shippingState" required>
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
						
					</div>
				</div>
			</div>
		</div>
		<div style="display:none" id="billingAddress">

			<div class="card">
				<h5 class="display-6">Add your Billing Address</h5>
				<div class="card-header">
					<div class="bg-light shadow-sm pt-4 pl-2 pr-2 pb-2">
						<div class="mb-3">
							<label for="exampleInputaddress" class="form-label">Address</label>
							<input type="text" class="form-control" name="billingStreet"
								aria-describedby="emailHelp" >
							<div id="emailHelp" class="form-text">Street/Area/Apartment
								Details</div>
						</div>
						<div class="mb-3">
							<label for="exampleInputcity" class="form-label">City/District</label>
							<input type="text" class="form-control" name="billingCity"
								>
						</div>
						<div class="mb-3">
							<label for="exampleInputstate" class="form-label">State</label> <input
								type="text" class="form-control" name="billingState" >
						</div>
						<div class="mb-3">
							<label for="exampleInputcountry" class="form-label">Country</label>
							<input type="text" class="form-control" name="billingCountry"
								>
						</div>
						<div class="mb-3">
							<label for="exampleInputpin" class="form-label">Area-Pincode</label>
							<input type="text" class="form-control" name="billingZipcode"
								>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col d-flex justify-content-center">
			<div class="mb-3 form-check">
							<input type="checkbox" value="true" class="form-check-input"
								name="isBillingAddressDifferent" onclick="handleClick(this)">
							<label class="form-check-label" for="isBillingAddressDifferent">IsBillingAddressDifferent</label>
						</div>
		</div>
	</div>
	<div class="row">
		<div class="col d-flex justify-content-center">
			<div class="mb-3 form-check">
						
						<button type="submit" class="btn btn-primary">Make
							Payment</button>
							</div>
		</div>
	</div>
</form>
</body>

<footer>
	<%@include file="footer.jsp"%>
</footer>
<script type="text/javascript">
function handleClick($this){
	var billingAddress = document.getElementById('billingAddress');
	 billingAddress.style.display = $this.checked ? null : "none";
	 var name = "col d-flex justify-content-center";
 	var arr = name.split(" ");
	  if ($this.checked){
	  	var i;
	  	 for(i=0;i<arr.length;i++ ) {
	    	billingAddress.className += " " +arr[i];
	    }
	  }else{
	  	billingAddress.className='';
	  }
	 
}</script>
</html>