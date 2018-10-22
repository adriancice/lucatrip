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
			<div class="col-md-4 ">
				<div class="box5">
					<c:choose>
						<c:when test="${user.foto != null}">
							<img src="/images/user/${user.foto }" alt="${user.foto }">
						</c:when>
						<c:otherwise>
							<img
								src="/images/user/userFoto.jpg">
						</c:otherwise>
					</c:choose>
					<div class="box-content">
						<h2 class="title">${name } ${surname }</h2>
						<span class="post">Web Developer</span><br> <span
							class="post">Fecha registro: ${fecha }</span>
					</div>
				</div>
			</div>

		</div>

	</div>

	<div class="container">
		<h3 class="text-center text-uppercase">contact me</h3>
		<p class="text-center w-75 m-auto">Lorem ipsum dolor sit amet,
			consectetur adipiscing elit. Mauris interdum purus at sem ornare
			sodales. Morbi leo nulla, pharetra vel felis nec, ullamcorper
			condimentum quam.</p>
		<div class="row">
			<div class="col-sm-12 col-md-6 col-lg-3 my-5">
				<div class="card border-0">
					<div class="card-body text-center">
						<i class="fa fa-phone fa-5x mb-3" aria-hidden="true"></i>
						<h4 class="text-uppercase mb-5">call me</h4>
						<p>+8801683615582</p>
					</div>
				</div>
			</div>
			<div class="col-sm-12 col-md-6 col-lg-3 my-5">
				<div class="card border-0">
					<div class="card-body text-center">
						<i class="fa fa-globe fa-5x mb-3" aria-hidden="true"></i>
						<h4 class="text-uppercase mb-5">email</h4>
						<a href="mailto:#">${email }</a>
					</div>
				</div>
			</div>
			<div class="col-sm-12 col-md-6 col-lg-3 my-5">
				<div class="card border-0">
					<div class="card-body text-center">
						<i class="fa fa-edit fa-5x mb-3" aria-hidden="true"></i>
						<h4 class="text-uppercase mb-5">edit user</h4>
						<a href="/modificarPerfil">EDITAR USER</a>

					</div>
					
					
				</div>
			</div>
			</div>
	</div>


	<%@ include file="fragments/footer.jsp"%>

</body>
</html>