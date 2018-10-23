<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<%@ include file="fragments/head.jsp"%>

<title>Ver mis eventos</title>
</head>
<body>

	<%@ include file="fragments/header.jsp"%>

	<h3 class="text-center">Mis eventos</h3>
	<c:if test="${mensajeNoEventos != null }">
		<h5 class="container">${mensajeNoEventos }</h5>
	</c:if>
	<!-- Start of card´s -->
	<div class="container">
		<div class="container-fluid row mt-5 px-3">
			<c:forEach var="ev" items="${listarMisEventos}">
				<div class="col-md-4">
					<div class="card">
						<img class="card-img-top" src="${ev.imagen }" alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title border-bottom pb-3">${ev.sitio }</h5>
							<strong>${ev.ciudad }</strong>
							<p class="card-text">${ev.descripcion }.</p>
							<a href="/verevento?id_evento=${ev.idEvento}"
								class="btn btn-sm btn-info float-right">Ver más detalles
								&raquo;</a>
						</div>
						<div class="card-footer">
							<a href="/borrarEvento?idEvento=${ev.idEvento }"
								class="card-link"><i class="fa fa-times-circle"></i>&nbsp;BORRAR</a>
							<a href="/editarEvento?idEvento=${ev.idEvento }"
								class="card-link"><i class="fa fa-edit"></i>&nbsp;EDITAR</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- end of card -->


	<%@ include file="fragments/footer.jsp"%>

</body>
</html>