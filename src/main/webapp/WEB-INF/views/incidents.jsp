<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Incidents</title>
</head>
<body>
	<div id="sidebar">
		<h2>Officer Details</h2>
		<p>Name: ${loggedinOfficer.getOfficerName()}</p>
		<p>Branch: ${loggedinOfficer.getBranch()}</p>
		<p>Username: ${loggedinOfficer.getUsername()}</p>
	</div>
	
	<div id="content">
		<h2>Reported Incidents</h2>
		<a href="${pageContext.request.contextPath}/new-incident"><button>New Incident</button></a>
		<table>
			<tr>
				<th>Incident ID</th>
				<th>Incident Date</th>
				<th>Route</th>
				<th>Vehicle ID</th>
				<th>Vehicle Details</th>
				<th>Vehicle Owner</th>
				<th>Description</th>
			</tr>
			<c:forEach items="${incidents}" var="incident">
				<tr>
					<td>${incident.getIncidentId()}</td>
					<td>${incident.getIncidentDate()}</td>
					<td>${incident.getRoute().getRouteName()}, ${incident.getRoute().getLocation()}</td>
					<td>${incident.getVehicle().getVehicleId()}</td>
					<td>${incident.getVehicle().getMake()} ${incident.getVehicle().getModel()} ${incident.getVehicle().getYear()}</td>
					<td>${incident.getVehicle().getOwnerName()}</td>
					<td>${incident.getDescription()}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>