<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<%@ include file="fragments/head.jsp"%>

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
								<a class="btn btn-lg btn-primary" href="#" role="button">Learn
									more</a>
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
	<!-- El carrousel del index -->
	<div class="justify-content-center align-items-center">
		<form class=" col-6 form-inline mt-2 mt-md-0" action="/buscar">
			<input class="form-control mr-sm-2" type="text" name="nombre"
				placeholder="Buscar" aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar
				evento</button>
		</form>
	</div>

	<!-- Start of card´s -->
	<div class="container-fluid row mt-5 px-3">
		<c:forEach var="e" items="${listaEventos}">
			<div class="col-md-3">
				<div class="card">

					<img class="card-img-top" src="${e.imagen }" alt="Card image cap">
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

	<%@ include file="fragments/footer.jsp"%>
</body>
</html>