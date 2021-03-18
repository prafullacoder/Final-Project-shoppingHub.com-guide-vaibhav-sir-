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

<body style="background-image:url('/images/banner4.jpg')">

	<div
		style="width: 100%; height: 70vh; background: linear-gradient(rgba(0, 0, 0, 0.01), #009688), url(background_img.jpg)"
		class=" d-flex justify-content-center align-items-center m-0 p-0">
		<form action="/user/createuser" method="post" style="background-color: white" class="rounded p-4">
		<c:if test="${ q==1}">
		<div class="alert alert-success">Registration successfull</div>
		</c:if>
			<h1>Register Here</h1>
			<div class="form-group mb-1">

				<input class="pb-0 form-control" type="text"
					placeholder="Username..." name="username" />
			</div>

			<div class="form-group mb-1">

				<input type="text" class="form-control" placeholder="First name"
					name="firstName" />
			</div>

			<div class="form-group mb-1">

				<input type="text" class="form-control" placeholder="Last name"
					name="lastName" />
			</div>

			<div class="form-group mb-1">

				<input type="email" class="form-control" placeholder="Enter email"
					name="email" />
			</div>

			<div class="form-group mb-1">

				<input type="password" class="form-control"
					placeholder="Enter password" name="password" />
			</div>
			<div class="form-group mb-1">

				<input type="text" class="form-control"
					placeholder="Enter phone number" name="phone" />
			</div>
			<div class="d-grid gap-2">
				<button type="submit" class="btn btn-primary btn-lg btn-block">Register</button>
			</div>


			<p class="forgot-password text-right">
				Already registered <a href="/user/login-views">log
					in?</a>
			</p>

		</form>

	</div>

</body>
<footer>
<%@include file="footer.jsp" %>
</footer>
</html>