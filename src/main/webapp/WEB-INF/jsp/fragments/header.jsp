<header>

	<div
		class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
		<h3 class="my-0 mr-md-auto"><a href="/">LucaTrip</a></h3>
		<nav class="my-2 my-md-0 mr-md-3">
			<a class="p-2 text-dark" href="#">Features</a> <a
				class="p-2 text-dark" href="#">Enterprise</a> <a
				class="p-2 text-dark" href="#">Support</a> <a class="p-2 text-dark"
				href="#">Pricing</a>
		</nav>
		<c:choose>
			<c:when test="${sessionScope.user == null }">
				<a href="/login" role="button" class="btn btn-outline-success mx-2">Sign
					in</a>
				<a href="/register" role="button" class="btn btn-outline-info">Sign
					up</a>
			</c:when>
			<c:otherwise>
				<div class="dropdown mx-5">
					<button class="btn btn-outline-info dropdown-toggle" type="button"
						id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">Welcome
						${name} ${surname}</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<form action="/logout">
							<a class="dropdown-item" href="/verPerfil">Ver mi perfil</a> <a
								class="dropdown-item" href="/crearEvento">Crear evento</a> <a
								class="dropdown-item" href="/verMisEventos">Ver mis eventos</a>
								 <a class="dropdown-item" href="/verGustados">Eventos que me han gustado</a>
							<hr>
							<button class="dropdown-item" type="submit">Logout</button>
							
						</form>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>

</header>