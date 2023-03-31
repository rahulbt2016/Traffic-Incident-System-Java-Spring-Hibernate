<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>List of Taxis</title>

<style>

/* Main styles */

body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
}

.container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
}

h2 {
    font-size: 24px;
    margin-top: 0;
}

form {
    margin-bottom: 20px;
}

form select {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
    background-color: #fff;
    font-size: 16px;
    margin-bottom: 10px;
}

form button {
    background-color: #4CAF50;
    color: #fff;
    padding: 10px;
    border: none;
    border-radius: 3px;
    font-size: 16px;
    cursor: pointer;
}

table {
    width: 100%;
    border-collapse: collapse;
}

table th, table td {
    padding: 10px;
    text-align: left;
    border-bottom: 1px solid #ccc;
}

table th {
    background-color: #f2f2f2;
    font-weight: normal;
}

table td:last-child {
    text-align: center;
}

table td button {
    background-color: #4CAF50;
    color: #fff;
    padding: 5px 10px;
    border: none;
    border-radius: 3px;
    font-size: 14px;
    cursor: pointer;
}

/* Responsive styles */

@media screen and (max-width: 480px) {
    .container {
        padding: 10px;
    }

    h2 {
        font-size: 20px;
    }

    table td {
        font-size: 14px;
        padding: 5px;
    }

    table td button {
        font-size: 12px;
        padding: 3px 8px;
    }
}


</style>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

	<div>

		<h2>List of Taxis</h2>

		<form method="post" action="${pageContext.request.contextPath }/handle-filtertaxi">
			<div>
				<div>
					<label for="source">Source</label> <select
						id="source" name="source">
						<option value="">--Select Source--</option>
						<c:forEach var="taxi" items="${listoftaxis}">
							<option value="${taxi.source}">${taxi.source}</option>
						</c:forEach>
					</select>
				</div>
				<div>
					<label for="destination">Destination</label> <select
						id="destination" name="destination">
						<option value="">--Select Destination--</option>
						<c:forEach var="taxi" items="${listoftaxis}">
							<option value="${taxi.destination}">${taxi.destination}</option>
						</c:forEach>
					</select>
				</div>
				<div>
					<label for="submit">&nbsp;</label>
					<button type="submit">Search</button>
				</div>
			</div>
		</form>

		<table>
			<thead>
				<tr>
					<th>Taxi ID</th>
					<th>Source</th>
					<th>Destination</th>
					<th>Cost</th>
					<th>Action</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="taxi" items="${listoftaxis}">
					<tr>
						<td>${taxi.id}</td>
						<td>${taxi.source}</td>
						<td>${taxi.destination}</td>
						<td>${taxi.cost}</td>
						<td>
							<form action="${pageContext.request.contextPath}//handle-booktaxi" method="post">
								<input type="hidden" name="taxiId" value="${taxi.id}" />
								<button type="submit">Book</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>