var init = function() {
	$('#provincias').change(
			function() {

				var provincia = $("#provincias").val();
				$('#localidades').children().remove()
				$.post('/cargarlocalidades/{codigo_provincia}', {
					"codigo_provincia" : provincia
				}, function(localidades) {
					for (i = 0; i < localidades.length; i++) {
						$('#localidades').append(
								new Option(localidades[i].nombre, true, true));
					}
				})
			})
}
$().ready(init);