<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

</head>
<body>
	<%@ include file="fragments/header.jsp"%>

	<div class="container text-center">
		<h3>Buscar Eventos</h3>
	</div>
	<!-- Start of card´s -->
	<div class="container-fluid row my-5 px-3">
		<c:forEach var="e" items="${evento}">
			<div class="col-md-3">
				<div class="card">
					<img class="card-img-top" src="${e.imagen }" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title border-bottom pb-3">${e.sitio }</h5>
						<strong>${e.ciudad }</strong>
						<p class="card-text">${e.descripcion }.</p>
						<a href="/verevento?id_evento=${e.idEvento}"
							class="btn btn-sm btn-info float-right">Ver más detalles &raquo;</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<!-- end of card -->
</body>
</html>