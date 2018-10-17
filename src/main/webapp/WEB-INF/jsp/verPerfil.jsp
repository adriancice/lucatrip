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
		<h3 class="text-center">Detalles del usuario ${name} ${surname}</h3>
		<br>
		<div class="row mt-30">
			<div class="col-md-4 col-sm-6">
				<div class="box5">
					<img
						src="http://bestjquery.com/tutorial/hover-effect/demo160/images/img-1.jpg"
						alt="">
					<div class="box-content">
						<h3 class="title">Williamson</h3>
						<span class="post">Web Developer</span>
					</div>
				</div>
			</div>

		</div>
	</div>


	<%@ include file="fragments/footer.jsp"%>

</body>
</html>