<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<%@ include file="fragments/head.jsp"%>

<title>Login</title>
</head>
<body>

	<%@ include file="fragments/header.jsp"%>

	<h3 class="text-center">Mis eventos</h3>
	<!-- Start of card´s -->
	<div class="container-fluid row mt-5 px-3">
		<c:forEach var="e" items="${listaMisEventos}">
			<div class="col-md-3">
				<div class="card">
					<img class="card-img-top" src="${e.imagen }" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title border-bottom pb-3">${e.sitio }</h5>
						<strong>${e.ciudad }</strong>
						<p class="card-text">${e.descripcion }.</p>
						<a href="/verevento?id_evento=${e.idEvento}"
							class="btn btn-sm btn-info float-right">Read more &raquo;</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<!-- end of card -->


	<%@ include file="fragments/footer.jsp"%>

</body>
</html>