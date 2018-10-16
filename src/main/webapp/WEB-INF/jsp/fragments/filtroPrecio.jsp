<form action="/filtrarPrecio">
	<div class="container inline">
		<p>Precio</p>
		<input type="text"
			onkeypress='return event.charCode >= 48 && event.charCode <= 57'
			name="precioDesde" min="1" placeholder="Desde" /> <input type="text"
			onkeypress='return event.charCode >= 48 && event.charCode <= 57'
			name="precioHasta" min="1" placeholder="Hasta" />
		<!-- recuperamos el id_categoria -->
		<input type="hidden" name="id_categoria" value="${id_categoria }">
		<button type="submit" class="btn btn-success btn-sm">Aplicar
			filtro</button>
	</div>
</form>