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
		style="width: 100%; height: 70vh; background: linear-gradient(rgba(0, 0, 0, 0.01), #009688), url(background_img.jpg)"
		class=" d-flex justify-content-center align-items-center m-0 p-0">
		<form action="/user/createuser" method="post" style="background-color: white ;width:30% ; height:85%"" class="rounded p-4">
		<c:if test="${ q==1}">
		<div class="alert alert-success">Registration successfull</div>
		</c:if>
		<div class="d-flex justify-content-center">
			<h2>Register Here</h2>
			</div>
			<div class="form-group mb-1">

				<input class="pb-0 form-control" type="text"
					placeholder="Username..." name="username" pattern="[A-Za-z0-9]+" required autocomplete="off"/>
			</div>

			<div class="form-group mb-1">

				<input type="text" class="form-control" placeholder="First name"
					name="firstName" pattern="[A-Za-z]+"   required autocomplete="off"/>
			</div>

			<div class="form-group mb-1">

				<input type="text" class="form-control" placeholder="Last name"
					name="lastName" pattern="[A-Za-z]+" required autocomplete="off"/>
			</div>

			<div class="form-group mb-1">

				<input type="email" class="form-control" placeholder="Enter email"
					name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"  required autocomplete="off"/>
			</div>

			<div class="form-group mb-1">

				<input type="password" class="form-control"
					placeholder="Enter password" name="password" pattern="(?=.*\d).{8,}" required autocomplete="off"/>
					<i>min 8 character and number required  </i>

			</div>
			<div class="form-group mb-1">

				<input type="text" class="form-control"
					placeholder="Enter phone number" name="phone" pattern="[789][0-9]{9}" required autocomplete="off"/>
			</div>
			<div class="mt-3">
				<button type="submit" class="btn btn-primary btn-lg btn-block">Register</button>
			</div>

		<div class="d-flex justify-content-end">
			
				Already registered &nbsp; <a href="/user/login-views">log
					in?</a>
			
			</div>

		</form>

	</div>
	


</body>
<div style="500px"></div>
<footer>
<%@include file="footer.jsp" %>
</footer>
</html>