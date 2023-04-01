<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<%
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Traffic System - Incidents</title>
<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<!-- Add Font Awesome CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<!-- Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNSzN9W" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<style>
		#sidebar{
			background-color: #f5f5f5;
			padding: 20px;
			height: 100%;
		}
	</style>
</head>
<body>
	
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	  <a class="navbar-brand" href="${pageContext.request.contextPath}/incidents">Traffic System</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarNavDropdown">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="${pageContext.request.contextPath}/incidents"><i class="fa fa-home"></i> Home <span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${pageContext.request.contextPath}/new-incident"><i class="fa fa-file"></i> Report Incident <span class="sr-only">(current)</span></a>
	      </li>
	    </ul>
	    <div class="ml-auto">
	      <a href="${pageContext.request.contextPath}/logout" class="text-white"><i class="fa fa-sign-out text-white"></i> Logout</a>
	    </div>
	  </div>
	</nav>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3">
				<div id="sidebar">
					<h5>Officer Details</h2>
					<p>Name: ${loggedinOfficer.getOfficerName()}</p>
					<p>Branch: ${loggedinOfficer.getBranch()}</p>
					<p>Username: ${loggedinOfficer.getUsername()}</p>
				</div>
			</div>
			<div class="col-md-9 mt-5">
				<div id="content">
					<h2 class="mb-5">Reported Incident</h2>
					<table class="table table-striped table-bordered table-hover table-active">
						<thead class="thead-dark">
							<tr>
								<th>Incident ID</th>
								<th>Incident Date</th>
								<th>Route</th>
								<th>Vehicle ID</th>
								<th>Vehicle Details</th>
								<th>Vehicle Owner</th>
								<th>Description</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${incidents}" var="incident">
								<tr>
									<td>${incident.getIncidentId()}</td>
									<td>${incident.getIncidentDate()}</td>
									<td>${incident.getRoute().getRouteName()}, ${incident.getRoute().getLocation()}</td>
									<td>${incident.getVehicle().getVehicleId()}</td>
									<td>${incident.getVehicle().getMake()} ${incident.getVehicle().getModel()} ${incident.getVehicle().getYear()}</td>
									<td>${incident.getVehicle().getOwnerName()}</td>
									<td>${incident.getDescription()}</td>
									<td><a href="${pageContext.request.contextPath}/edit-incident?incidentId=${incident.getIncidentId()}"><i class="fa fa-lg fa-edit"></i></a></td>
									<td><a href="${pageContext.request.contextPath}/delete-incident?incidentId=${incident.getIncidentId()}"><i class="fa fa-lg fa-trash text-danger"></i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
		
</body>
</html>