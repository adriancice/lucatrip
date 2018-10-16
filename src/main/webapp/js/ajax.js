$("#categoria").blur(function() {

	var categoria = $("#categoria").val();
	
	$.post('/get_anuncios/{id_categoria}', {"id_categoria": categoria}, function(anuncios) {
		for(i = 0; i < anuncios.length; i++) {
			$("#pinta").append('id_anuncio: ' + anuncios[i].id_anuncio + '\n')
			$("#pinta").append('usuario_id: ' + anuncios[i].usuario_id + '\n')
			$("#pinta").append('categoria_id: ' + anuncios[i].categoria_id + '\n')
			$("#pinta").append('titulo: ' + anuncios[i].titulo + '\n')
			$("#pinta").append('descripcion: ' + anuncios[i].descripcion + '\n')
			$("#pinta").append('precio: ' + anuncios[i].precio + '\n')
		}
		
	})
})
