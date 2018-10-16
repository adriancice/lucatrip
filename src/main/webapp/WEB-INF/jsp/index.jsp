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


	<div class="container text-center">
		<h5>${mensaje}</h5>
		<h1>Bienvenido a la tienda</h1>
	</div>

	<div class="container marketing pt-5">
		<!-- Three columns of text below the carousel -->
		<div class="row">
			<c:forEach var="c" items="${listadoCategorias}">
				<div class="col-lg-2">
					<img class="img-thumbnail"
						src="${c.foto }"
						alt="Third slide">
					<h2>${c.nombre }</h2>
					<p>${c.descripcion }</p>
					<p>
						<a class="btn btn-secondary"
							href="/anuncios?id_categoria=${c.idCategoria }" role="button">Ver
							todos &raquo;</a>
					</p>
				</div>
			</c:forEach>
			<div class="col-lg-2">
				<img class="img-thumbnail"
					src="https://image.flaticon.com/icons/svg/482/482569.svg"
					alt="Third slide">
				<h2>Ver todo</h2>
				<p>Aqui puedes ver todos los anuncios</p>
				<p>
					<a class="btn btn-secondary"
						href="/todosAnuncios?id_categoria=0" role="button">Ver
						todo &raquo;</a>
				</p>
			</div>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.row -->
	<div class="container marketing pt-5"></div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>