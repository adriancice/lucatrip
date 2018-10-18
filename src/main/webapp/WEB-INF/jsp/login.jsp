<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<%@ include file="fragments/head.jsp"%>

<title>Login</title>
</head>
<body>

	<%@ include file="fragments/header.jsp"%>

	<div class="container w-50 p-3">
		<hr>
		<!-- Register form Bootstrap4 -->
		<form class="form-signin" id="registerForm" action="/loginUser"
			method="post">
			<h5>${mensaje}</h5>
			<h1 class="h3 mb-3 font-weight-normal text-center">Login</h1>
			<hr>
			<input type="text" name="email" class="form-control"
				placeholder="email" required autofocus /> <input type="password"
				name="password" class="form-control my-2" placeholder="Password"
				required /> <input type="submit" value="Login"
				class="btn btn-lg btn-success btn-block" />
		</form>
		<!-- End register form Bootstrap4 -->
	</div>
	<div class="container">
		<h5>${mensaje}</h5>
	</div>
	<%@ include file="fragments/footer.jsp"%>
</body>
</html>