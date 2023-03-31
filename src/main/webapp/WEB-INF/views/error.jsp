<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@page isELIgnored="false" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Failed</title>
</head>
<body>
    <div>
        <div>
            <div>
                <div>
                    <h2>Login Failed!</h2>
                    <p>Your username or password is incorrect. Please try again.</p>
                    <a href="${pageContext.request.contextPath }/"> Try Again</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>