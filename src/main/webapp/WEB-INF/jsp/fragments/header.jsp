<header>
	<div class="container">
		<nav class="navbar navbar-expand-md navbar-light bg-light mb-4">
			<a class="navbar-brand" href="/">Inicio</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<form class="form-inline mt-2 mt-md-0" action="/buscar">
					<input class="form-control mr-sm-2" type="text" name="nombre"
						placeholder="Buscar" aria-label="Search">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar
						anuncio</button>
				</form>
				<!-- con el c:choose hacemos un if-else si esta loggeado o no -->

				<c:choose>
					<c:when test="${email == null}">
						<div class="ml-5">
							<a href="/login" role="button"
								class="btn btn-outline-success mx-2">Sign in</a> <a
								href="/register" role="button" class="btn btn-outline-info">Sign
								up</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="dropdown mx-5">
							<button class="btn btn-outline-info dropdown-toggle"
								type="button" id="dropdownMenuButton" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">Welcome
								${name} ${surname}</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<form action="/logout">
									<button class="dropdown-item" type="submit">Logout</button>
									<a class="dropdown-item" href="/altaAnuncio">Crear anuncio</a>
									<a class="dropdown-item" href="/misAnuncios">Ver mis
										anuncios</a> <a class="dropdown-item" href="/crearCategoria">Crear
										categoria</a>
								</form>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</nav>
	</div>
</header>