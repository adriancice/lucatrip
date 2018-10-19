<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link href="<c:url value="/resources/alert/alert.js"/>" rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<title>Login</title>
</head>
<body>

	<%@ include file="fragments/header.jsp"%>


	<div class="container w-50 p-3">
		<c:if test="${exist == false}">
			<div class="alert alert-danger alert-dismissible show" role="alert">
				<strong>Fallo al loguear usuario o contraseña incorrecto</strong>
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</c:if>
		<hr>
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
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>