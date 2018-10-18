<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<!-- My propio css -->
<html lang="en">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">


<title>LucaTrip</title>
<script
	src="http://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyBa-NxlN1zc0dlp5bdYBzt1xzS2F1ZVlro"
	type="text/javascript"></script>
	
	 <style>
       /* Set the size of the div element that contains the map */
      #map {
        height: 400px;  /* The height is 400 pixels */
        width: 30%;  /* The width is the width of the web page */
        margin: 0 auto 0 auto;
               }
    </style>
    
</head>
<body>


	<%@ include file="fragments/header.jsp"%>



	<input type="hidden" name="latitud" id="latitud" value="${latitud }">
	<input type="hidden" name="longitud" id="longitud" value="${longitud }">

	<div id="titulo" class="container text-center mt">

		<h2>${lugar}</h2>
	</div>


	<div id="lugar" class="container text-center mt">

		<h3>${pais },${ciudad }</h3>
	</div>

	<div id="imagen" class="container text-center mt">

		<img alt="" src="${imagen}">
	</div>


	<div id="map"></div>



	<div id="descripcion" class="container text-center mt">
		<h3>DESCRIPCION DEL EVENTO</h3>
		<a>${descripcion}</a>
	</div>




	<div id="votos" class="container text-center mt">

		<a>Votos</a>
	</div>


	<div id="comentarios" class="container text-center mt">
		<h3>¿Que comenta la gente?</h3>
<c:forEach var="c" items="${listaComentarios}">
			<div class="col-md-3">
		
				${c.comentario}
			</div>
		</c:forEach>

<!--  -->

	</div>




	<!-- Optional JavaScript-->



	 <script>
// Initialize and add the map
function initMap() {
  // The location of Uluru
  var uluru = {
				lat : parseFloat(document.getElementById('latitud').value),
				lng : parseFloat(document.getElementById('longitud').value)
			};
  // The map, centered at Uluru
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 12, center: uluru});
  // The marker, positioned at Uluru
  var marker = new google.maps.Marker({position: uluru, map: map});
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


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>