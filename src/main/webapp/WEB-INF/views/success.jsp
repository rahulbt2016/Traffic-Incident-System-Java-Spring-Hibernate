<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Booking Success</title>
	
	<style>
	
	/* Style for body */
body {
  background-color: #f2f2f2;
  font-family: Arial, sans-serif;
}

/* Style for main heading */
h1 {
  color: green;
  text-align: center;
}

/* Style for table headings */
th {
  font-weight: bold;
  text-align: left;
}

/* Style for table cells */
td {
  padding: 5px;
}

/* Style for table */
table {
  border-collapse: collapse;
  margin-top: 20px;
  margin-bottom: 20px;
}

/* Style for table rows */
tr:nth-child(even) {
  background-color: #f2f2f2;
}
	
	
	</style>
	
</head>
<body>
	<div>
		<h1 style="color:green">Booking Success</h1>
		<div>
			<div>
				<h3>Taxi Details</h3>
				<table>
					<tr>
						<th>Taxi ID</th>
						<td>${booking.taxi.id}</td>
					</tr>
					<tr>
						<th>Source</th>
						<td>${booking.taxi.source}</td>
					</tr>
					<tr>
						<th>Destination</th>
						<td>${booking.taxi.destination}</td>
					</tr>
					<tr>
						<th>Departure Time</th>
						<td>${booking.taxi.cost}</td>
					</tr>
				</table>
			</div>
			<div>
				<h3>Passenger Details</h3>
				<table>
					<tr>
						<th>Passenger ID</th>
						<td>${booking.passenger.id}</td>
					</tr>
					<tr>
						<th>First Name</th>
						<td>${booking.passenger.firstName}</td>
					</tr>
					<tr>
						<th>Last Name</th>
						<td>${booking.passenger.lastName}</td>
					</tr>
					<tr>
						<th>Age</th>
						<td>${booking.passenger.age}</td>
					</tr>
					<tr>
						<th>Phone Number</th>
						<td>${booking.passenger.phoneNumber}</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
</body>
</html>
