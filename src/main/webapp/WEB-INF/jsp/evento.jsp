<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<!-- My propio css -->
<html lang="en">
<head>
<%@ include file="fragments/head.jsp"%>

<title>LucaTrip</title>
<script
	src="http://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyBa-NxlN1zc0dlp5bdYBzt1xzS2F1ZVlro"
	type="text/javascript"></script>

<style>
/* Set the size of the div element that contains the map */
#map {
	height: 500px; /* The height is 400 pixels */
	width: 40%; /* The width is the width of the web page */
	margin: 0 auto 0 auto;
}
</style>

</head>
<body>

	<%@ include file="fragments/header.jsp"%>

	<input type="hidden" name="latitud" id="latitud" value="${latitud }">
	<input type="hidden" name="longitud" id="longitud" value="${longitud }">

	<div class="container-fluid row my-5 px-3">
		<div class="col-md-6 text-center">
			<h2>${lugar}</h2>
			<h3>${ciudad },&nbsp;&nbsp;${pais }</h3>
			<div id="imagen" class="container text-center mt">
				<img alt="" src="${imagen}">
			</div>
		</div>
		<div class="col-md-6 mt-5" id="map"></div>
	</div>
	<div class="container-fluid gedf-wrapper">
		<div class="row">
			<div class="col-md-3">
				<div class="card">
					<div class="card-body">
						<div class="h5">@autor</div>
						<div class="h6 text-muted text-uppercase">descripcion del
							evento</div>
						<div class="h7">${descripcion}</div>
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">
							<div class="h6 text-muted">Like´s totales</div>
							<div class="h5">${sessionScope.totallikes }</div>
						</li>
						<li class="list-group-item"><c:choose>
								<c:when test="${sessionScope.user != null }">
									<a
										href="/darlike?id_user=${sessionScope.user.idUser}&id_evento=${id_evento}">
										<i class="fa fa-gittip"></i>&nbsp;&nbsp;Like
									</a>
								</c:when>
								<c:otherwise>
									<a> <i class="fa fa-gittip"></i>Like&nbsp;&nbsp;&nbsp;${sessionScope.totallikes }
									</a>
								</c:otherwise>
							</c:choose></li>
					</ul>
				</div>
			</div>

			<div class="col-md-6 gedf-main">
				<!--- \\\\\\\ Comentarios-->
				<c:forEach var="c" items="${listaComentarios}">
					<div class="card gedf-card my-4">

						<div class="card-header">
							<div class="d-flex justify-content-between align-items-center">
								<div class="d-flex justify-content-between align-items-center">
									<div class="mr-2">
										<img class="rounded-circle" width="45"
											src="https://picsum.photos/50/50" alt="">
									</div>
									<div class="ml-2">
										<div class="h5 m-0">autor del comment</div>
									</div>
								</div>
							</div>

						</div>
						<div class="card-body">
							<div class="text-muted h7 mb-2">
								<i class="fa fa-clock-o"></i>&nbsp;${c.fechaComentario }
							</div>

							<p class="card-text">${c.comentario }</p>
						</div>

					</div>
				</c:forEach>
				<!-- Comentarios /////-->

				<!--- \\\\\\\ Escribir comentario-->
				<div class="card gedf-card mt-5">
					<form action="/comentar" id="cajacomentario">
						<input type="hidden" value="${sessionScope.user.idUser}"
							name="id_user" id="id_user"> <input type="hidden"
							value="${id_evento}" name="id_evento" id="id_evento">
						<div class="card-header">
							<ul class="nav nav-tabs card-header-tabs" id="myTab"
								role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="posts-tab" data-toggle="tab" role="tab"
									aria-controls="posts" aria-selected="true">Deja un
										comentario</a></li>
							</ul>
						</div>
						<div class="card-body">
							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade show active" id="posts"
									role="tabpanel" aria-labelledby="posts-tab">
									<div class="form-group">
										<label class="sr-only" for="message">post</label>
										<textarea class="form-control" id="comentario"
											name="comentario" rows="3"
											placeholder="¿ Que opinas de este evento ?" required></textarea>
									</div>

								</div>
							</div>
							<c:choose>
								<c:when test="${sessionScope.user != null }">
									<div class="btn-toolbar justify-content-between">
										<div class="btn-group">
											<button type="submit" class="btn btn-primary">publicar</button>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<p>
										Para comentar tienes que estar logueado, pulse <a href="login">LOGIN</a>
										o <a href="register">REGISTRAR</a>
									</p>
								</c:otherwise>
							</c:choose>
						</div>
					</form>
				</div>
				<!-- Escribir comentario /////-->
			</div>

			<div class="col-md-3">
				<div class="card gedf-card">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="card-link">Card link</a> <a href="#"
							class="card-link">Another link</a>
					</div>
				</div>
				<div class="card gedf-card">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="card-link">Card link</a> <a href="#"
							class="card-link">Another link</a>
					</div>
				</div>
			</div>
		</div>
	</div>




	<script>
		// Initialize and add the map
		function initMap() {
			// The location of Uluru
			var uluru = {
				lat : parseFloat(document.getElementById('latitud').value),
				lng : parseFloat(document.getElementById('longitud').value)
			};
			// The map, centered at Uluru
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 12,
				center : uluru
			});
			// The marker, positioned at Uluru
			var marker = new google.maps.Marker({
				position : uluru,
				map : map
			});
		}
	</script>
	<!--Load the API from the specified URL
    * The async attribute allows the browser to render the page while the API loads
    * The key parameter will contain your own API key (which is not needed for this tutorial)
    * The callback parameter executes the initMap() function
    -->
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD8Ukthf75uZ9wqWmeujyYJoZBb_AWxry8&callback=initMap">
		
	</script>

	<%@ include file="fragments/footer.jsp"%>
</body>
</html>