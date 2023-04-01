<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div id="sidebar">
		<h2>Officer Details</h2>
		<p>Name: ${loggedinOfficer.getOfficerName()}</p>
		<p>Branch: ${loggedinOfficer.getBranch()}</p>
		<p>Username: ${loggedinOfficer.getUsername()}</p>
	</div>
	<div id="content">
		<h2>Report Incident</h2>
		<form action="add-incident" method="POST">
		    <label for="incidentDate">Incident Date:</label>
		    <input type="date" id="incidentDate" name="incidentDate" required><br><br>
		    
		    <label for="routeId">Route:</label>
		    <select id="routeId" name="routeId" required>
		        <option value="">Select Route</option>
		        <c:forEach items="${routes}" var="route">
		            <option value="${route.getRouteId()}">${route.getRouteName()}, ${route.getLocation()}</option>
		        </c:forEach>
		    </select><br><br>
		    
		    <label for="vehicleId">Vehicle:</label>
		    <select id="vehicleId" name="vehicleId" required>
		        <option value="">Select Vehicle</option>
		        <c:forEach items="${vehicles}" var="vehicle">
		            <option value="${vehicle.getVehicleId()}">${vehicle.getVehicleId()}  -  ${vehicle.getMake()} ${vehicle.getModel()} ${vehicle.getYear()}</option>
		        </c:forEach>
		    </select><br><br>
		    
		    <label for="description">Description:</label>
		    <textarea id="description" name="description" required></textarea><br><br>
		    
		    <input type="hidden" id="officerId" name="officerId" value="${loggedinOfficer.getOfficerId()}">
		    <input type="submit" value="Submit">
		</form>
				
	</div>
</body>
</html>