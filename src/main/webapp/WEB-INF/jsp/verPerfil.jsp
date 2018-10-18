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

	<!------------------ Hover Effect Style : Demo - 5 --------------->
	<div class="container mt-40">
		<h3 class="">Detalles del usuario ${name} ${surname}</h3>
		<br>
		<div class="row mt-30">
			<div class="col-md-4 col-sm-6">
				<div class="box5">
					<img
						src="http://bestjquery.com/tutorial/hover-effect/demo160/images/img-1.jpg"
						alt="">
					<div class="box-content">
						<h3 class="title">${name }${surname }</h3>
						<span class="post">Web Developer</span>
					</div>
				</div>
			</div>
		</div>
	</div>


	

	<!-- Evnetos del usuario -->
	<h3 class="text-center">Eventos</h3>
	<!-- Start of card´s -->
	<div class="container row mt-5 px-3">
		<c:forEach var="e" items="${listaEventos}">
			<div class="col-md-4">
				<div class="card">
					<img class="card-img-top" src="//placeimg.com/280/180/tech"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title border-bottom pb-3">${e.ciudad }</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-sm btn-info float-right">Read more
							&raquo;</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<!-- end of card -->

	<%@ include file="fragments/footer.jsp"%>

</body>
</html>