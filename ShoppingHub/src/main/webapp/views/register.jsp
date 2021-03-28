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

		


	<div
		style="width: 100%; height: 90vh; background: linear-gradient(rgba(0, 0, 0, 0.01), #009688), url(background_img.jpg)"
		class=" d-flex justify-content-center align-items-center m-0 p-0">
		<form action="/user/createuser" method="post"  style="background-color:light ;width:30% ; height:85%"" class="rounded p-4">
	<c:if test="${ q==1}">
		<div class="alert alert-success">"${strs}"</div>
		</c:if>
		<div class="d-flex justify-content-center">
			<h2>Register Here</h2>
			</div>
			<div class="form-group mb-1">

				<input class="pb-0 form-control mb-3" type="text"
					placeholder="Username..." name="username" pattern="[A-Za-z0-9]+" required autocomplete="off"/>
			</div>

			<div class="form-group mb-1">

				<input type="text" class="form-control mb-3" placeholder="First name"
					name="firstName" pattern="[A-Za-z]+"   required autocomplete="off"/>
			</div>

			<div class="form-group mb-1">

				<input type="text" class="form-control mb-3" placeholder="Last name"
					name="lastName" pattern="[A-Za-z]+" required autocomplete="off"/>
			</div>

			<div class="form-group mb-1">

				<input type="email" class="form-control mb-3" placeholder="Enter email"
					name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"  required autocomplete="off"/>
			</div>

			<div class="form-group mb-1">

				<input type="password" class="form-control mb-3"
					placeholder="Enter password" name="password" pattern="(?=.*\d).{8,}" required autocomplete="off"/>
					<i  style="background-color:light">min 8 character and number required  </i>

			</div>
			<div class="form-group mb-1">

				<input type="text" class="form-control mb-3"
					placeholder="Enter phone number" name="phone" pattern="[789][0-9]{9}" required autocomplete="off"/>
			</div>
			<div class="mt-1 d-flex justify-content-between">
			<div>
				<button type="submit" class="btn btn-primary btn-lg btn-block">Register</button>
			</div>

			<div>
				Already registered &nbsp; <a href="/user/login-views" class="p-1 text-light">log
					in?</a>
					</div>
			
			</div>

		</form>
		<div style="height:20vh"></div>

	</div>
	


</body>
<div style="500px"></div>

</html>