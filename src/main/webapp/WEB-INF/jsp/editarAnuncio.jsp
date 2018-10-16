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

<title>Editar anuncio</title>
</head>
<body>

	<%@ include file="fragments/header.jsp"%>

	<div class="container p-3">
		<hr>
		<!-- Register form Bootstrap4 -->
		<form class="form-signin" action="/update" method="post">
			<h1 class="h3 mb-3 font-weight-normal text-center">Alta anuncio</h1>
			<hr>
			<input type="text" name="titulo" value="${a.titulo }"
				class="form-control" placeholder="Titulo" required />
			<textarea name="descripcion" class="form-control my-3"
				placeholder="Descripcion" required>${a.descripcion }</textarea>
			<div class="input-group">
				<input type="text" class="form-control"
					onkeypress='return event.charCode >= 48 && event.charCode <= 57'
					name="precio" class="form-control my-3" placeholder="Precio"
					value="${a.precio }" required>
				<div class="input-group-append">
					<span class="input-group-text">&euro;</span>
				</div>
			</div>
			<input type="submit" value="Actualizar anuncio"
				class="btn btn-lg btn-info btn-block my-3" />
		</form>
		<!-- End register form Bootstrap4 -->
	</div>
	<h5>${mensaje}</h5>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>