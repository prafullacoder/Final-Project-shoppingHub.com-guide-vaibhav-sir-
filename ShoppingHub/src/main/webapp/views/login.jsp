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
		style="width: 100vw; height: 70vh; background: linear-gradient(rgba(0, 0, 0, 0.01), #009688)"
		class=" d-flex justify-content-center align-items-center m-0 p-0">
		<form action="/user/login" method="post" style="background-color: white"
			class="rounded p-4">
			<c:if test="${ q==1}">
		<div class="alert alert-success">Login Fail</div>
		</c:if>

			<h3>Log in</h3>

			<div class="form-group">
				<input type="text" class="form-control" placeholder="username...."
					name="username" />
			</div>
			<div class="form-group">
				<input type="password" class="form-control"
					placeholder="Enter password" name="password" />
			</div>
			<div class="d-grid gap-2">
				<button type="submit" class="btn btn-primary btn-lg btn-block">Sign
					in</button>

			</div>
			<p class="forgot-password text-right d-flex justify-content-center" >
				<a href="#" class="p-1">Forgot password?</a> <br>
				<a href="/user/register-views" class="p-1">Create An Account</a>
			</p>
		</form>
	</div>
</body>

<footer>
<%@include file="footer.jsp" %>
</footer>
</html>