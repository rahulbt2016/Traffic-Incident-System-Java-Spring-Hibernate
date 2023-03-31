<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Login Form</title>

<style type="text/css">
/* Set background color for body */
body {
  background-color: #f2f2f2;
}

/* Style for the form */
form {
  margin-top: 20px;
  border: 1px solid #ccc;
  padding: 20px;
  border-radius: 5px;
}

/* Style for the form input fields */
form input {
  width: 50%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  margin-bottom: 10px;
}

/* Style for the submit button */
form input[type="submit"] {
  background-color: #4CAF50;
  color: white;
  font-size: 16px;
  padding: 10px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

/* Style for the heading */
h1 {
  text-align: center;
  margin-top: 50px;
  color: #4CAF50;
}
</style>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>

	<div>
		<h2>Officer Login</h2>
		<form action="${pageContext.request.contextPath }/handle-login"
			method="post">
			<div>
				<label for="username">Username:</label> <input type="text"
					class="form-control" id="username" placeholder="Enter username"
					name="username">
			</div>
			<div>
				<label for="pwd">Password:</label> <input type="password"
					class="form-control" id="pwd" placeholder="Enter password"
					name="password">
			</div>
			<button type="submit">Submit</button>
		</form>
	</div>
</body>
</html>
