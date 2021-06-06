<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700"
	rel="stylesheet">
<title>Register as a Customer</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- jQuery library -->
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<script
	src="js/<a href="https://www.jqueryscript.net/tags.php?/Validation/">Validation</a>FormScript.js"></script>
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
	<div class="container"  style="height: 900px">
		<div class="row">
			<c:if test="${message!=null}">
				<div align="center">
					<h4 class="message">${message}</h4>
				</div>
			</c:if>

			<form action="update_profile" method="post" id="editForm"
				class="form-horizontal">
				<h2>Edit Profile</h2>
				<hr>

				<div class="form-group">
					<label for="disabledInput" class="col-sm-2 control-label">Email:
					</label>
					<div class="col-sm-4">
						<input class="form-control" id="email" type="text" name="email"
							value="${loggedCustomer.email}" disabled>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Full Name: </label>
					<div class="col-sm-4">
						<input class="form-control" id="fullname" type="text"
							name="fullname" value="${loggedCustomer.fullname}">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">Phone Number: </label>
					<div class="col-sm-4">
						<input class="form-control" id="phone" type="text"
							name="phone" value="${loggedCustomer.phone}">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">Address: </label>
					<div class="col-sm-4">
						<input class="form-control" id="address" type="text"
							name="address" value="${loggedCustomer.address}">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">City: </label>
					<div class="col-sm-4">
						<input class="form-control" d="city" name="city" type="text"
							value="${loggedCustomer.city}">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">ZipCode: </label>
					<div class="col-sm-4">
						<input class="form-control" id="zipcode" type="text"
							name="zipcode" value="${loggedCustomer.zipcode}">
					</div>
				</div>

				<div class="form-group">

					<label class="col-sm-2 control-label">Country: </label>
					<div class="col-sm-4">
						<input class="form-control" id="country" type="text"
							name="country" value="${loggedCustomer.country}">
					</div>
				</div>

				<div class="form-group">
					<i>(Leave password fields blank if you don't want to change
						password)</i> <label class="col-sm-2 control-label">New
						Password: </label>
					<div class="col-sm-4">
						<input class="form-control" type="password" id="password"
							name="password">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">Confirm Password: </label>
					<div class="col-sm-4">
						<input class="form-control" type="password" id="confirmpassword"
							name="confirmpassword">
					</div>
				</div>



				<div class="form-group" align="center">
					<button type="submit" class="btn btn-success btn-lg">Update</button>
					<button type="submit" class="btn btn-danger btn-lg" value="Cancel"
					id="buttonCancel" onClick="javascript:history.go(-1);">Cancel</button>
				</div>
			</form>
		</div>
	</div>
	<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">
$(document).ready(function() {
		$("#editForm").validate({
			rules : {
				email : {
					required : true,
					email : true
				},
				fullname : "required",
		
				confirmpassword : {
					  minlength : 5,
			          maxlength : 8,
					equalTo : "#password"
				},
				phone : "required",
				address : "required",
				city : "required",
				zipcode : "required",
				country : "required",
			},
			messages : {
				email : {
					required : "Please enter e-mail address.",
					email : "Please enter a valid e-mail address."
				},
				fullname : "Please enter full name.",
			
				confirmpassword : {
			        minlength: "Minimum password length is 5",
	                maxlength: "Maximum password length is 8",
					equalTo : "Confirm password does not match password."
				    
				},
				phone : "Please enter phone number.",
				address : "Please enter address.",
				city : "Please enter city.",
				zipcode : "Please enter zip code.",
				country : "Please enter country.",
			}
		});
		$("#buttonCancel").click(function() {
			history.go(-1);
		});
	});
</script>
</html>