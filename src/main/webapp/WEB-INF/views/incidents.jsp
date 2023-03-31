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
		<table>
			<tr>
				<th>Incident ID</th>
				<th>Incident Date</th>
				<th>Vehicle ID</th>
				<th>Route ID</th>
				<th>Description</th>
				<th>Officer ID</th>
			</tr>
		</table>
	</div>
</body>
</html>