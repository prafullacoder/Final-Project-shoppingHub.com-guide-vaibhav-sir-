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
								aria-describedby="emailHelp" required autocomplete="off">
							<div id="emailHelp" class="form-text">Street/Area/Apartment
								Details</div>
						</div>
						<div class="mb-3">
							<label for="exampleInputcity" class="form-label">City/District</label>
							<input type="text" class="form-control" name="shippingCity" pattern="[A-Za-z]+"
								required autocomplete="off">
						</div>
						<div class="mb-3">
							<label for="exampleInputstate" class="form-label">State</label> <input
								type="text" class="form-control" name="shippingState" pattern="[A-Za-z]+" required autocomplete="off">
						</div>
						<div class="mb-3">
							<label for="exampleInputcountry" class="form-label">Country</label>
							<input type="text" class="form-control" name="shippingCountry" pattern="[A-Za-z]+"
								required autocomplete="off">
						</div>
						<div class="mb-3">
							<label for="exampleInputpin" class="form-label">Area-Pincode</label>
							<input type="text" class="form-control" name="shippingZipcode" pattern="[0-9]{6}"
								required autocomplete="off">
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
							<input type="text" class="form-control billingAddress" name="billingStreet"
								aria-describedby="emailHelp" >
							<div id="emailHelp" class="form-text">Street/Area/Apartment
								Details</div>
						</div>
						<div class="mb-3">
							<label for="exampleInputcity" class="form-label">City/District</label>
							<input type="text" class="form-control billingAddress" name="billingCity" pattern="[A-Za-z]+"
								>
						</div>
						<div class="mb-3">
							<label for="exampleInputstate" class="form-label">State</label> <input
								type="text" class="form-control billingAddress" name="billingState" pattern="[A-Za-z]+" >
						</div>
						<div class="mb-3">
							<label for="exampleInputcountry" class="form-label">Country</label>
							<input type="text" class="form-control billingAddress" name="billingCountry" pattern="[A-Za-z]+"
								>
						</div>
						<div class="mb-3">
							<label for="exampleInputpin" class="form-label">Area-Pincode</label>
							<input type="text" class="form-control billingAddress" name="billingZipcode" pattern="[0-9]{6}"
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
	 let x = document.querySelectorAll(".billingAddress");
 	var arr = name.split(" ");
	  if ($this.checked){
	  	var i;
	  	 for(i=0;i<arr.length;i++ ) {
	    	billingAddress.className += " " +arr[i];
	    }
	    
	    var j;
	    for(j=0;j<x.length;j++){
			x[j].setAttribute("required","True");	    
	    }
	  }else{
	  	billingAddress.className='';
	  	var j;
	  	  for(j=0;j<x.length;j++){
			x[j].removeAttribute("required")   
	    }
	  }
	 
}</script>
</html>