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

<title>Buscar</title>
</head>
<body>

	<%@ include file="fragments/header.jsp"%>

	<form action="/filtrarPrecio">
		<div class="container inline">
			<p>Precio</p>
			<input type="number" name="precioDesde" min="1" placeholder="Desde" />
			<input type="number" name="precioHasta" min="1" placeholder="Hasta" />
			<button>Filtrar</button>
		</div>
	</form>
	<div class="container marketing pt-5">
		<div class="container">
			<h5>${mensaje}</h5>
		</div>
		<!-- Three columns of text below the carousel -->
		<div class="row">
			<c:forEach var="a" items="${listadoBuscar}">
				<div class="col-lg-2">
					<img class="img-thumbnail" src="${a.foto }" alt="Third slide">
					<h2>${a.titulo }</h2>
					<p>${a.descripcion }</p>
					<p>
						<a class="btn btn-secondary"
							href="/detallesAnuncio?id_anuncio=${a.idAnuncio }" role="button">Ver
							mas detalles &raquo;</a>
					</p>
				</div>
			</c:forEach>
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