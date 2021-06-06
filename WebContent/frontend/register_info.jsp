<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Register as a Customer</title>
	
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/jquery-ui.min.css">
	
	<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center">

		<h2 class="pageheading">
			Register as a Customer
		</h2>
	</div>

	<div align="center">
		<form action="register_customer" method="post" id="customerForm">

		<table class="form">
			<tr>
				<td align="right">Email:</td>
				<td align="left"><input type="text" id="email" name="email" size="45" /></td>
			</tr>
			<tr>
				<td align="right">Full Name:</td>
				<td align="left"><input type="text" id="fullname" name="fullname" size="45" /></td>
			</tr>
			<tr>
				<td align="right">Password:</td>
				<td align="left"><input type="password" id="password" name="password" size="45"  /></td>
			</tr>
			<tr>
				<td align="right">Confirm Password:</td>
				<td align="left"><input type="password" id="confirmPassword" name="confirmPassword" size="45"  /></td>
			</tr>
			<tr>
				<td align="right">Phone Number:</td>
				<td align="left"><input type="text" id="phone" name="phone" size="45" /></td>
			</tr>
			<tr>
				<td align="right">Address:</td>
				<td align="left"><input type="text" id="address" name="address" size="45"  /></td>
			</tr>
			<tr>
				<td align="right">City:</td>
				<td align="left"><input type="text" id="city" name="city" size="45" /></td>
			</tr>
			<tr>
				<td align="right">Zip Code:</td>
				<td align="left"><input type="text" id="zipcode" name="zipcode" size="45"  /></td>
			</tr>
			<tr>
				<td align="right">Country:</td>
				<td align="left"><input type="text" id="country" name="country" size="45"  /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">Save</button>&nbsp;&nbsp;&nbsp;
					<button id="buttonCancel">Cancel</button>
				</td>
			</tr>
		</table>
		</form>
	</div>


	<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">

	$(document).ready(function() {
		$("#customerForm").validate({
			rules: {
				email: {
					required: true,
					email: true
				},
				fullname: "required",
				password: "required",
				confirmPassword: {
					required: true,
					equalTo: "#password",
				},
				phone: "required",
				address: "required",
				city: "required",
				zipcode: "required",
				country: "required",
			},
			
			messages: {
				email: {
					required: "Please enter the e-mail address",
					email: "Please enter a valid e-mail address"
				},
				fullname: "Please enter Full Name of the Customer",
				password: "Please enter Password of the Customer",
				confirmPassword: {
					required: "Please enter Confirm Password of the Customer",
					equalTo: "Confirm Password does not match the password",
				},
				phone: "Please enter Phone Number of the Customer",
				address: "Please choose address of the Customer",
				city: "Please enter city of the Customer",
				zipcode: "Please enter Zipcode of the Customer",
				country: "Please enter country of the Customer"
			}
		});
		
		$("#buttonCancel").click(function() {
			history.go(-1);
		});
	});
	
</script>
</html>