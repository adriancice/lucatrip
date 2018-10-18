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
	
	<h3 class="text-center">Eventos del usuario</h3>
	
	<section id="contact">
		<div class="container">
			<h3 class="text-center text-uppercase">contact us</h3>
			<p class="text-center w-75 m-auto">Lorem ipsum dolor sit amet,
				consectetur adipiscing elit. Mauris interdum purus at sem ornare
				sodales. Morbi leo nulla, pharetra vel felis nec, ullamcorper
				condimentum quam.</p>
			<div class="row">
				<div class="col-sm-12 col-md-6 col-lg-3 my-5">
					<div class="card border-0">
						<div class="card-body text-center">
							<i class="fa fa-phone fa-5x mb-3" aria-hidden="true"></i>
							<h4 class="text-uppercase mb-5">call us</h4>
							<p>+8801683615582,+8801750603409</p>
						</div>
					</div>
				</div>
				<div class="col-sm-12 col-md-6 col-lg-3 my-5">
					<div class="card border-0">
						<div class="card-body text-center">
							<i class="fa fa-map-marker fa-5x mb-3" aria-hidden="true"></i>
							<h4 class="text-uppercase mb-5">office loaction</h4>
							<address>Suite 02, Level 12, Sahera Tropical Center</address>
						</div>
					</div>
				</div>
				<div class="col-sm-12 col-md-6 col-lg-3 my-5">
					<div class="card border-0">
						<div class="card-body text-center">
							<i class="fa fa-map-marker fa-5x mb-3" aria-hidden="true"></i>
							<h4 class="text-uppercase mb-5">office loaction</h4>
							<address>Suite 02, Level 12, Sahera Tropical Center</address>
						</div>
					</div>
				</div>
				<div class="col-sm-12 col-md-6 col-lg-3 my-5">
					<div class="card border-0">
						<div class="card-body text-center">
							<i class="fa fa-globe fa-5x mb-3" aria-hidden="true"></i>
							<h4 class="text-uppercase mb-5">email</h4>
							<p>http://al.a.noman1416@gmail.com</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="fragments/footer.jsp"%>

</body>
</html>