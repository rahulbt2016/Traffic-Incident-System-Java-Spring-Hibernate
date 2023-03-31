<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Taxi</title>
	<style>
	
	body {
    background-color: #f2f2f2;
    font-family: Arial, sans-serif;
}

h1 {
    color: #333;
    font-size: 28px;
    margin: 0 0 20px 0;
}

label {
    display: block;
    font-size: 16px;
    margin: 10px 0;
}

input[type="text"],
input[type="number"],
select {
    font-size: 16px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    width: 100%;
    box-sizing: border-box;
    margin: 5px 0;
}

button[type="submit"] {
    background-color: #4CAF50;
    color: white;
    padding: 10px;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
}

button[type="submit"]:hover {
    background-color: #3e8e41;
}

form {
    margin: 20px 0;
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
    font-size: 16px;
}

.form-group input[type="text"],
.form-group input[type="email"],
.form-group input[type="number"] {
    display: block;
    width: 100%;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
    margin-top: 5px;
}

.form-group input[type="text"]:focus,
.form-group input[type="email"]:focus,
.form-group input[type="number"]:focus {
    outline: none;
    border-color: #4CAF50;
    box-shadow: 0 0 5px #4CAF50;
}

.form-group button[type="submit"] {
    background-color: #4CAF50;
    color: white;
    padding: 10px;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
}

.form-group button[type="submit"]:hover {
    background-color: #3e8e41;
}
	
	
	</style>

</head>
<body>
<div>
    <div>
        <div>
            <h1>Book Taxi</h1>
            <form method="post" action="${pageContext.request.contextPath }/handle-booking">
                <div>
                    <label for="id">Taxi ID:</label>
                    <input type="text" id="id" name="taxiId" value="${taxibyid.id}" readonly />
                </div>
                <div>
                    <label for="source">Source:</label>
                    <input type="text" id="source" name="source" value="${taxibyid.source}" readonly />
                </div>
                <div>
                    <label for="destination">Destination:</label>
                    <input type="text" id="destination" name="destination" value="${taxibyid.destination}" readonly />
                </div>
                <div>
                    <label for="departureTime">Cost:</label>
                    <input type="text" id="departureTime" name="departureTime" value="${taxibyid.cost}" readonly />
                </div>
                
                <div>
                    <label for="firstName">First Name:</label>
                    <input type="text" id="firstName" name="firstName" required />
                </div>
                <div>
                    <label for="lastName">Last Name:</label>
                    <input type="text" id="lastName" name="lastName" required />
                </div>
                <div>
                    <label for="age">Age:</label>
                    <input type="number" id="age" name="age" required />
                </div>
                <div >
                    <label for="phoneNumber">Phone Number:</label>
                    <input type="text" id="phoneNumber" name="phoneNumber" required />
                </div>
                <div>
                    <input type="submit" value="Book Now" />
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
