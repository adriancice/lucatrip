<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<%@ include file="fragments/head.jsp"%>
<meta charset="utf-8">
	<title>LucaTrip</title>
</head>
<body>

<%@ include file="fragments/header.jsp"%>
<!-- Start container -->
<div class="container w-50 p-3">
	<!-- Empieza cambiar la foto de perfil -->
  <h2>Foto de perfil</h2>  
  	<form class="form-signin" id="changeimage" action="/changeImage" method="post" enctype="multipart/form-data">
		<c:choose>
			<c:when test="${user.foto != null}">
			  	<img src="/images/user/${user.foto }" class="rounded-circle mx-auto d-block" alt="${user.foto }" width="220" height="220"> 
			</c:when>
			<c:otherwise>
		  		<img src="https://d500.epimg.net/cincodias/imagenes/2016/07/04/lifestyle/1467646262_522853_1467646344_noticia_normal.jpg" class="rounded-circle mx-auto d-block" alt="imagen user" width="300" height="220"> 
			</c:otherwise>
		</c:choose>
		<input type="file" class="form-control-file" name="file">
		<input type="submit" value="Cambiar foto" class="btn btn-warning btn-success btn-block" />
	</form>
	<!-- Finaliza la foto de cambio de perfil -->
	<!-- Cambiar nombre -->
	<form class="form-signin" id="changename" action="/changeName" method="post" enctype="multipart/form-data">
		<h2>Nombre</h2>
		<input type="text" name="name" class="form-control" placeholder="Nombre" value="${name }" required autofocus />
		<h2>Apellido</h2>
		<input type="text"name="surname" class="form-control my-3" placeholder="Apellido" required autofocus value="${surname }" />  
		<input type="submit" value="Cambiar nombre y apellidos" class="btn btn-warning btn-success btn-block" />
	</form>
	<!-- Finalizar Cambiar Nombre -->
	
	<!-- Cambiar contraseña -->  
	<form class="form-signin" id="changepassword" action="/changePassword" method="post" enctype="multipart/form-data">
		<h2>Password</h2>
		<c:if test="${band==true}">
			<div class="alert alert-danger alert-dismissible show" role="alert">
					<strong>Fallo al cambiar la contraseña</strong>
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</c:if>
		<h5>Contaseña Antigua:</h5>
		<input type="password"name="old_password" class="form-control my-3" placeholder="Contraseña Antigua" required autofocus />  
		<h5>Contraseña Nueva:</h5>
		<input type="password"name="new_password" class="form-control my-3" placeholder="Contraseña Nueva" required autofocus />  
		<input type="submit" value="Cambiar contraseña" class="btn btn-warning btn-success btn-block" />
	 </form> 
	 <!-- Finalizar Cambiar Contraseña -->
</div>
<!-- Finaliza container -->

	<%@ include file="fragments/footer.jsp"%>
</body>
</html>