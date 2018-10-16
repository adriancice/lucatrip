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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<title>Registrate</title>
</head>
<body>

	<%@ include file="fragments/header.jsp"%>

	<div class="container w-50 p-3">
		<hr>
		<!-- Register form Bootstrap4 -->
		<form class="form-signin" id="registerForm" action="/registerUser"
			method="post">
			<h1 class="h3 mb-3 font-weight-normal text-center">Alta usuario</h1>

			<input type="text" name="name" class="form-control"	placeholder="Nombre" required autofocus />
			<input type="text"	name="surname" class="form-control my-3" placeholder="Apellido"	required autofocus /> 
			<input type="email" name="email" class="form-control my-3" placeholder="Email" required />
			<h1>
				<span id="mensaje"></span>
			</h1>
				<input type="password"	name="password" class="form-control" id="password"	placeholder="Password" pattern=".{6,}" title="La contraseña debe tener 6 digitos o mas" required /> 
				<input type="password" name="cpassword" class="form-control my-3" id="c_password" placeholder="Confirm Password" required />
			<div class="input-group my-3">
				<div class="custom-file">
					<input type="file" class="custom-file-input" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04">
						<label class="custom-file-label" for="inputGroupFile04">Cargar foto de perfil</label>
				</div>
			</div>
			<input type="submit" value="Create account"
				class="btn btn-lg btn-success btn-block" />
		</form>
		<!-- End register form Bootstrap4 -->
	</div>
	<div class="container">
		<h5>${mensaje}</h5>
	</div>
	<!-- comprobar si la pass son iguales -->
	<script>
		var password = document.getElementById("password"), confirm_password = document
				.getElementById("c_password");

		function validatePassword() {
			if (password.value != confirm_password.value) {
				confirm_password.setCustomValidity("Passwords Don't Match");
			} else {
				confirm_password.setCustomValidity('');
			}
		}
		password.onchange = validatePassword;
		confirm_password.onkeyup = validatePassword;
	</script>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="js/main.js"></script>
</body>
</html>