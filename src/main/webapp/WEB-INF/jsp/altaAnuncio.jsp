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

<title>Alta anuncio</title>
</head>
<body>

	<%@ include file="fragments/header.jsp"%>

	<div class="container p-3">
		<hr>
		<!-- Register form Bootstrap4 -->
		<form class="form-signin" action="/grabarAnuncio" method="post">
			<h1 class="h3 mb-3 font-weight-normal text-center">Alta anuncio</h1>
			<hr>

			<select class="custom-select my-3" name="id_categoria" required
				autofocus>
				<option value="" disabled selected>Elige una categoria . .
					.</option>
				<c:forEach var="c" items="${listadoCategorias}">
					<option value="${c.idCategoria }">${c.nombre }</option>
				</c:forEach>
			</select> <input type="text" name="titulo" class="form-control"
				placeholder="Titulo" required />
			<textarea name="descripcion" class="form-control my-3"
				placeholder="Descripcion" required></textarea>
			<div class="input-group">
				<input type="text" class="form-control"
					onkeypress='return event.charCode >= 48 && event.charCode <= 57'
					name="precio" class="form-control my-3" placeholder="Precio"
					required>
				<div class="input-group-append">
					<span class="input-group-text">&euro;</span>
				</div>
			</div>
			<input type="submit" value="Crear anuncio"
				class="btn btn-lg btn-success btn-block my-2" />
		</form>
		<!-- End register form Bootstrap4 -->
	</div>
	<div class="container">
		<h5>${mensaje}</h5>
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