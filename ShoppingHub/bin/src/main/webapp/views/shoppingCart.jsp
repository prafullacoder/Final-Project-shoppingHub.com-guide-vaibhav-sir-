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
<%@include file="header.jsp" %>
</header>

<body>

</body>
<footer>
<%@include file="footer.jsp" %>
</footer>
</html>