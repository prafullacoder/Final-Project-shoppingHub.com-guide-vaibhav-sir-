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
		style="width: 100vw; height: 83vh; background: linear-gradient(rgba(0, 0, 0, 0.01), #009688)"
		class=" d-flex justify-content-center align-items-center m-0 p-0">
		<form action="/user/login" method="post" style="background-color: light;width:30% ; height:70%"
			class="rounded p-4">
			<c:if test="${ q==1}">
		<div class="alert alert-success">Login Fail</div>
		</c:if>
		<div class="d-flex justify-content-center mb-3">
			<h3>Log in</h3>
		</div>
			<div class="form-group" style="height:15%">
				<input type="text" class="form-control" placeholder="username...."
					name="username" autocomplete="off"/>
			</div>
			<div class="form-group">
				<input type="password" class="form-control"
					placeholder="Enter password" name="password" autocomplete="off"/>
			</div>
			<div class="mt-4 d-flex justify-content-between">
			<div>
				<button type="submit" class="btn btn-primary btn-lg btn-block">Sign
					in</button>

			</div>
			<div>
				<a href="/user/register-views" class="p-1 text-dark">Create An Account</a>
			<div>
			</div>
		</form>
	</div>
</body>

</html>