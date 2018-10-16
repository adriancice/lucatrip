<%@page import="com.example.demo.model.Usuario"%>
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

<title>Tienda de Adrian</title>
</head>
<body>

	<%@ include file="fragments/header.jsp"%>

	<div class="container">
		<h5>${mensaje}</h5>
		<h1>Detalles del anuncio</h1>
	</div>

	<div class="container marketing pt-5">
		<!-- Three columns of text below the carousel -->
		<div class="row">
			<div class="col-lg-4">
				<img class="img-thumbnail" src="${anuncio.foto }" alt="Third slide">
				<h3>Nombre del anunciante: ${anuncio.user }</h3>
				<h5>Titulo del anuncio: ${anuncio.titulo }</h5>
				<p>Descripcion: ${anuncio.descripcion }</p>
				<p>Precio: ${anuncio.precio } &euro;</p>
				<p>Telefono: ${anuncio.telefono }</p>
			</div>
		</div>
		<!-- /.row -->
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