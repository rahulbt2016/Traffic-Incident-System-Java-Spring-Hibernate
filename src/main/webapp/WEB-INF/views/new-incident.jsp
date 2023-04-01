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
</body>
</html>