<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Minhaz Grocery Customer Profile</title>
<!-- Latest compiled and minified CSS -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,700|Open+Sans"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	background: #e2eaef;
	font-family: "Open Sans", sans-serif;
}

h2 {
	color: #333;
	text-align: center;
	text-transform: uppercase,lowercase;
	font-family: "Roboto", sans-serif;
	font-weight: bold;
	position: relative;
	margin: 30px 0 60px;
}

h2::after {
	content: "";
	width: 100px;
	position: absolute;
	margin: 0 auto;
	height: 3px;
	background: #8fbc54;
	left: 0;
	right: 0;
	bottom: -10px;
}

</style>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class="container" align="center">
		<div class="row">

			<h2>Welcome, ${loggedCustomer.fullname}</h2>

			<table>
				<tr>
					<td><b>E-mail Address: </b></td>
					
					<td>${loggedCustomer.email}</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><b>Full Name: </b></td>
					<td>${loggedCustomer.fullname}</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><b>Phone Number: </b></td>
					<td>${loggedCustomer.phone}</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><b>Address: </b></td>
					<td>${loggedCustomer.address}</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><b>City: </b></td>
					<td>${loggedCustomer.city}</td>
				</tr>

				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><b>Zip Code: </b></td>
					<td>${loggedCustomer.zipcode}</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><b>Country: </b></td>
					<td>${loggedCustomer.country}</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><b>Registered Date: </b></td>
					<td>${loggedCustomer.registerDate}</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>

			</table>

		</div >
		<h3><b><a href="edit_profile" class="btn btn-success">Edit My Profile</a></b></h3>
	</div>



	<jsp:directive.include file="footer.jsp" />
</body>
</html>
