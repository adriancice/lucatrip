<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
				



		</div>


		<div id="descripcion" class="container text-center mt">
			<h3>Descripcion del evento</h3>

			<textarea  required="required" placeholder="Descripcion del evento" style="min-width: 40%"
				id="descripcion" name="descripcion"></textarea>


		</div>

		<div id="fecha" class="container text-center mt">
			<h3>Fecha del evento</h3>
			<input required="required" type="datetime-local" id="fecha" name="fecha">


		</div>



		<div class="container">
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








	<!-- Optional JavaScript -->


	<script
		src="http://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyBa-NxlN1zc0dlp5bdYBzt1xzS2F1ZVlro"
		type="text/javascript"></script>

	<script type="text/javascript">
		function initialize() {
			var input = document.getElementById('searchTextField');
			var autocomplete = new google.maps.places.Autocomplete(input);
			autocomplete.setComponentRestrictions({
				'country' : [ 'ESP' ]
			});
			google.maps.event
					.addListener(
							autocomplete,
							'place_changed',
							function() {
								var place = autocomplete.getPlace();
								document.getElementById('lugar').value = place.name;
								document.getElementById('latitud').value = place.geometry.location
										.lat();
								document.getElementById('longitud').value = place.geometry.location
										.lng();
								document.getElementById('ciudad').value = place.getAddress().subSequence(place.getName());
								

								//alert("This function is working!");

								// alert(place.address_components[0].long_name);

							});
		}

		google.maps.event.addDomListener(window, 'load', initialize);
	</script>
	
	
	
	
	
	
	
	<script type="text/javascript">
		$(document).ready(
				function() {
					$(document).on(
							'change',
							'.btn-file :file',
							function() {
								var input = $(this), label = input.val()
										.replace(/\\/g, '/')
										.replace(/.*\//, '');
								input.trigger('fileselect', [ label ]);
							});

					$('.btn-file :file').on(
							'fileselect',
							function(event, label) {

								var input = $(this).parents('.input-group')
										.find(':text'), log = label;

								if (input.length) {
									input.val(log);
								} else {
									if (log)
										alert(log);
								}

							});
					function readURL(input) {
						if (input.files && input.files[0]) {
							var reader = new FileReader();

							reader.onload = function(e) {
								$('#img-upload').attr('src', e.target.result);
								document.getElementById('imagen').value =('src', e.target.result);
							}

							reader.readAsDataURL(input.files[0]);
						}
					}

					$("#imgInp").change(function() {
						readURL(this);
					});
				});
	</script>





	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
		
</body>
</html>