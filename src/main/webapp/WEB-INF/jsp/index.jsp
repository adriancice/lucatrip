<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<%@ include file="fragments/head.jsp"%>
<meta charset="utf-8">
<script
	src="http://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyBa-NxlN1zc0dlp5bdYBzt1xzS2F1ZVlro"
	type="text/javascript"></script>
<title>LucaTrip</title>
</head>
<body>

	<%@ include file="fragments/header.jsp"%>
	<!-- El carrousel del index -->
	<div class="container">
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100" src="/images/carousel/slide1.jpg"
						alt="First slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="/images/carousel/slide2.jpg"
						alt="Second slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="/images/carousel/slide3.jpg"
						alt="Third slide">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<!-- Fin carrousel del index -->

	<!-- Empieza buscador -->
	<div id="buscador" class="container text-center mt">
		<form action="/searchEvent" method="post">
			<h3>Buscar Eventos</h3>
			<c:if test="${bandera==false}">
				<div class="alert alert-danger alert-dismissible show" role="alert">
					<strong>${mensaje}</strong>
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			</c:if>
			<div class=" container form-group has-search">
				<span class="fa fa-search form-control-feedback"></span> <input
					id="searchTextField" type="text" class="form-control"
					placeholder="Elige un lugar" autocomplete="on" runat="server"
					required autofocus>
			</div>
			<input type="hidden" id="latitud" name="latitud" /> <input
				type="hidden" id="longitud" name="longitud" /> <input type="hidden"
				id="lugar" name="lugar" /> <input type="hidden" id="ciudad"
				name="ciudad" /> <input type="hidden" id="pais" name="pais" /> <input
				type="hidden" id="url" name="url" />

			<div class="container text-center" id="enviar">
				<input class="btn btn-success" type="submit" name="enviarbtn"
					disabled="disabled" id="enviarbtn">
			</div>
		</form>
	</div>
	<!-- Finaliza buscador -->


	<!-- Start of card´s -->
	<div class="container">
		<div class="container mt-5">
			<h3 class="text-uppercase">ultimos eventos añadidos</h3>
		</div>

		<div class="container-fluid row my-5 px-3">
			<c:forEach var="e" items="${listaEventos}">
				<div class="col-md-3">
					<div class="card h-100">
						<img class="card-img-top" src="${e.imagen}" alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title border-bottom pb-3">${e.sitio }</h5>
							<strong>${e.ciudad }</strong>
							<p class="card-text">${e.descripcion }.</p>
							<a href="/verevento?id_evento=${e.idEvento}"
								class="btn btn-sm btn-info float-right">Ver más detalles
								&raquo;</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- end of card -->

	<!-- Optional JavaScript-->
	<script src="js/getPlace.js"></script>


	<%@ include file="fragments/footer.jsp"%>
</body>
</html>