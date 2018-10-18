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
	<script src="http://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyBa-NxlN1zc0dlp5bdYBzt1xzS2F1ZVlro"
		type="text/javascript"></script>
</head>
<body>

	<%@ include file="fragments/header.jsp"%>



	<form action="/crearEventoNuevo" method="post">
		<div class="container text-center">
			<h1>Crear evento</h1>
		</div>

		<div id="buscador" class="container text-center mt">
			<h3>Lugar</h3>


			<input id="searchTextField" type="text" size="50" placeholder="Elige un lugar" autocomplete="on" runat="server" required="required" />
				<input type="hidden" id="latitud" name="latitud" /> 
				<input type="hidden" id="longitud" name="longitud" /> 
				<input type="hidden" id="lugar" name="lugar" /> 
				<input type="hidden" id="imagen" name="imagen" />
				<input type="hidden" id="ciudad" name="ciudad" />
				<input type="hidden" id="pais" name="pais" />
				
				



		</div>


		<div id="descripcion" class="container text-center mt">
			<h3>Descripcion del evento</h3>

			<textarea  required="required" placeholder="Descripcion del evento" style="min-width: 40%"
				id="descripcion" name="descripcion"></textarea>


		</div>

		<div id="fecha" class="container text-center mt">
			<h3>Fecha del evento</h3>
			<input required="required" type="datetime-local" id="fecha" name="fecha"  max="9999-12-12T00:00:00.00">


		</div>



		<div class="container text-center">
			<div class="col-md-6">
				<div class="form-group">
					<label>Upload Image</label>
					<div class="input-group">
						<span class="input-group-btn"> <span
							class="btn btn-default btn-file"> Browse <input
								type="file" id="imgInp">
						</span>
						</span> <input required="required" type="text" class="form-control" readonly>
					</div>
					<img id='img-upload' />
				</div>
			</div>
		</div>

		<div class="container text-center" id="enviar">

			<input type="submit" name="enviar">
		</div>

	</form>








	<!-- Optional JavaScript
	
	 -->

		<script src="js/getPlace.js"></script>
		 <script src="js/setImage.js"></script>
		 
		
	






	
	
	
	
	
	




	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
		
</body>
</html>