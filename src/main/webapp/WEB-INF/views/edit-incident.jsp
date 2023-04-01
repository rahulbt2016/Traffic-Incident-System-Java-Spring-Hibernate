<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Traffic System - Edit Incident</title>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<!-- Add Font Awesome CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<!-- Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNSzN9W" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<!-- include the necessary CSS file for Select2 -->
  	<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
  
 	<!-- include jQuery and the necessary JS file for Select2 -->
  	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
	
	<style>
		#sidebar{
			background-color: #f5f5f5;
			padding: 20px;
			height: 100%;
		}
		
		.select2-container--default .select2-selection--single {
		    height: 46px !important;
		    padding: 10px 16px;
		    line-height: 1.33;
		    border-radius: 6px;
		}
		.select2-container--default .select2-selection--single .select2-selection__arrow b {
		    top: 85% !important;
		}
		.select2-container--default .select2-selection--single .select2-selection__rendered {
		    line-height: 26px !important;
		}
		.select2-container--default .select2-selection--single {
		    border: 1px solid #CCC !important;
		    box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset;
		    transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s;
		}		
		.select2-container--default.select2-container--focus .select2-selection--single {
		  border-color: #66afe9;
		  outline: 0;
		  box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.25);
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
	      <li class="nav-item">
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
					<h2 class="mb-5">Edit Incident</h2>
					<form action="${pageContext.request.contextPath}/add-incident" method="POST">
						<input type="text" hidden name="incidentId" value="${incident.getIncidentId()}">
					    <div class="form-group">
					        <label for="incidentDate">Incident Date:</label>
					        <input type="date" class="form-control" id="incidentDate" name="incidentDate" value="${incident.getIncidentDate()}" required>
					    </div>
					    
					    <div class="form-group">
						  <label for="routeId">Route:</label>
						  <select id="routeId" name="routeId" class="form-control select2" required>
						    <option value="">Select Route</option>
						    <c:forEach items="${routes}" var="route">
						      <option value="${route.getRouteId()}" ${incident.getRoute().getRouteId() == route.getRouteId() ? 'selected' : ''}>${route.getRouteName()}, ${route.getLocation()}</option>
						    </c:forEach>
						  </select>
						</div>
					    <div class="form-group">
					    	<label for="vehicleId">Vehicle:</label>
					    	<select id="vehicleId" name="vehicleId" class="form-control select2" required>
						        <option value="">Select Vehicle</option>
						        <c:forEach items="${vehicles}" var="vehicle">
						            <option value="${vehicle.getVehicleId()}" ${incident.getVehicle().getVehicleId() == vehicle.vehicleId ? 'selected' : ''}>${vehicle.getVehicleId()}  -  ${vehicle.getMake()} ${vehicle.getModel()} ${vehicle.getYear()}</option>
						        </c:forEach>
						    </select>
					    </div>
					    <div class="form-group">
					    	<label for="description">Description:</label>
					    	<textarea id="description" name="description" class="form-control" required>${incident.getDescription()}</textarea>
					    </div>
					    <button type="submit" class="btn btn-primary">Save</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>

 <!-- Select2 JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

<script>
  $(document).ready(function() {
    $('.select2').select2();
  });
</script>
</body>
</html> 