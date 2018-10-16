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
		<h1>Detalles de mis anuncio</h1>

	</div>
	<div class="container marketing pt-5">
		<h5>Estos son tus anuncios ${user} :</h5>
		<br>
		<!-- Three columns of text below the carousel -->
		<div class="row">
			<c:forEach var="a" items="${listadoMisAnuncios}">
				<div class="col-lg-3">
					<img class="img-thumbnail" src="${a.foto }" alt="Third slide">
					<h5>Titulo del anuncio: ${a.titulo }</h5>
					<p>
						<strong>Descripcion:</strong> ${a.descripcion }
					</p>
					<p>
						<strong>Precio:</strong> ${a.precio } &euro;
					</p>
					<p>
						<strong>Telefono:</strong> ${a.telefono }
					</p>
					<p>
						<a class="btn btn-danger"
							href="/borrarAnuncio?id_anuncio=${a.idAnuncio }" role="button">BORRAR</a>
					</p>
					<p>
						<a class="btn btn-warning"
							href="/editarAnuncio?id_anuncio=${a.idAnuncio }" role="button">EDITAR</a>
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