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
<link rel="stylesheet" href="css/main.css">

<title>Alta anuncio</title>
</head>
<body>

	<%@ include file="fragments/header.jsp"%>

	<div class="container p-3">
		<hr>
		<!-- Register form Bootstrap4 -->
		<form class="form-signin" action="/crearCat"
			enctype="multipart/form-data" method="post">
			<h1 class="h3 mb-3 font-weight-normal text-center">Crear
				categoria</h1>
			<hr>
			<input type="text" name="nombre" class="form-control"
				placeholder="Nombre categoria" required autofocus /> <input
				type="text" name="descripcion" class="form-control my-3"
				placeholder="Descripcion" required /> <input type="submit"
				value="Crear categoria"
				class="btn btn-lg btn-success btn-block my-2" />
		</form>
		<!-- End register form Bootstrap4 -->
	</div>
	<div class="container">
		<h5>${mensaje}</h5>
		<h5>${mensaje2}</h5>
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