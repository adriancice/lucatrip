<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<%@ include file="fragments/head.jsp"%>

<title>Registrate</title>
</head>
<body>

	<%@ include file="fragments/header.jsp"%>
	<div class="container w-50 p-3">
		<hr>
		<!-- Register form Bootstrap4 -->
		<form class="form-signin" id="registerForm" action="/registerUser"
			method="post" enctype="multipart/form-data">
			<h1 class="h3 mb-3 font-weight-normal text-center">Alta usuario</h1>

			<c:if test="${existe.equals('no') }">
				<div class="alert alert-success alert-dismissible show" role="alert">
					<strong>${mensaje}</strong>
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			</c:if>
			<c:if test="${existe.equals('si') }">
				<div class="alert alert-danger alert-dismissible fade show"
					role="alert">
					<strong>${mensaje}</strong>
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			</c:if>
			<input type="text" name="name" class="form-control"
				placeholder="Nombre" required autofocus /> <input type="text"
				name="surname" class="form-control my-3" placeholder="Apellido"
				required autofocus /> <input type="email" name="email"
				class="form-control my-3" placeholder="Email" required />
			<h1>
				<span id="mensaje"></span>
			</h1>
			<input type="password" name="password" class="form-control"
				id="password" placeholder="Password" required /> <input
				type="password" name="cpassword" class="form-control my-3"
				id="c_password" placeholder="Confirm Password" required />

			<div class="form-group">
				<input type="file" class="form-control-file" name="file">
			</div>
			<input type="submit" value="Create account"
				class="btn btn-lg btn-success btn-block" />
		</form>
		<!-- End register form Bootstrap4 -->
	</div>

	<%@ include file="fragments/footer.jsp"%>
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


</body>
</html>