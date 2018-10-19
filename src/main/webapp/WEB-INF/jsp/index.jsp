<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<%@ include file="fragments/head.jsp"%>
<meta charset="utf-8">

<script src="http://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyBa-NxlN1zc0dlp5bdYBzt1xzS2F1ZVlro" type="text/javascript"></script>
	<title>LucaTrip</title>
</head>
<body>

	<%@ include file="fragments/header.jsp"%>
	<!-- El carrousel del index -->
	<div class="container-fluid">

		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="first-slide" src="images/slide_1.jpg" alt="First slide">
					<div class="container">
						<div class="carousel-caption text-left">
							<h1>Example headline.</h1>
							<p>Cras justo odio, dapibus ac facilisis in, egestas eget
								quam. Donec id elit non mi porta gravida at eget metus. Nullam
								id dolor id nibh ultricies vehicula ut id elit.</p>
							<p>
								<a class="btn btn-lg btn-primary" href="#" role="button">Sign
									up today</a>
							</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img class="second-slide" src="images/slide_2.jpg"
						alt="Second slide">
					<div class="container">
						<div class="carousel-caption">
							<h1>Another example headline.</h1>
							<p>Cras justo odio, dapibus ac facilisis in, egestas eget
								quam. Donec id elit non mi porta gravida at eget metus. Nullam
								id dolor id nibh ultricies vehicula ut id elit.</p>
							<p>
								<a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a>
							</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img class="third-slide" src="images/slide_3.jpg" alt="Third slide">
					<div class="container">
						<div class="carousel-caption text-right">
							<h1>One more for good measure.</h1>
							<p>Cras justo odio, dapibus ac facilisis in, egestas eget
								quam. Donec id elit non mi porta gravida at eget metus. Nullam
								id dolor id nibh ultricies vehicula ut id elit.</p>
							<p>
								<a class="btn btn-lg btn-primary" href="#" role="button">Browse
									gallery</a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#myCarousel" role="button"
				data-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#myCarousel" role="button"
				data-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
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
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
	 	</c:if>
			<input id="searchTextField" type="text" size="50" placeholder="Elige un lugar" autocomplete="on" runat="server" required="required" />
				<input type="hidden" id="latitud" name="latitud" /> 
				<input type="hidden" id="longitud" name="longitud" /> 
				<input type="hidden" id="lugar" name="lugar" /> 
				<input type="hidden" id="ciudad" name="ciudad" />
				<input type="hidden" id="pais" name="pais" />
				<input type="hidden" id="url" name="url" />
				 
			<div class="container text-center" id="enviar">
				<input type="submit" name="enviarbtn" disabled="disabled"  id="enviarbtn">
			</div>
		</form>
	</div>
	<!-- Finaliza buscador -->
	<!-- Start of card´s -->
	<div class="container-fluid row my-5 px-3">
		<c:forEach var="e" items="${listaEventos}">
			<div class="col-md-3">
				<div class="card">
					<img class="card-img-top" src="${e.imagen}" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title border-bottom pb-3">${e.sitio }</h5>
						<strong>${e.ciudad }</strong>
						<p class="card-text">${e.descripcion }.</p>
						<a href="/verevento?id_evento=${e.idEvento}"
							class="btn btn-sm btn-info float-right">Read more &raquo;</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<!-- end of card -->
	
	<!-- Optional JavaScript-->
		<script src="js/getPlace.js"></script>
	<!--  Optional JavaScript -->

	<%@ include file="fragments/footer.jsp"%>
</body>
</html>