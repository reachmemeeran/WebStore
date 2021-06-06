<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Information</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
	src="js/<a href="https://www.jqueryscript.net/tags.php?/Validation/">Validation</a>FormScript.js"></script>
<style>
.inputstl {
	padding: 9px;
	border: solid 1px #FFA07A;
	outline: 0;
	background: -webkit-gradient(linear, left top, left 25, from(#FFFFFF),
		color-stop(4%, #A4FFA4), to(#FFFFFF));
	background: -moz-linear-gradient(top, #FFFFFF, #A4FFA4 1px, #FFFFFF 25px);
	box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;
	-moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;
	-webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;

}
</style>
</head>
<body>
	<jsp:directive.include file="header.jsp" />

			
	<div class="container" style="height: 1000px">
		<div class="panel-group">
				<div class="panel-heading" align="center">
					<h3>
						<c:if test="${customer !=null}">
						 <h3><button type="button" class="btn btn-danger btn-lg btn-block">Update customer Information</button></h3>
						 </c:if>

						<c:if test="${customer ==null}">
						<h3><button type="button" class="btn btn-danger btn-lg btn-block">New customer</button></h3>
						</c:if>
					</h3>
				</div>
			</div>
			
		<c:if test="${customer != null}">
			<form class="form-horizontal" action="update_customer" method="post" id="customerForm">
			<input type="hidden" class="form-control" name="customerId" value="${customer.customerId}">
		</c:if>
		<c:if test="${customer == null}">
			<form class="form-horizontal" action="create_customer" method="post" id="customerForm">
		</c:if>
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="email">E-mail: </label>
			<div class="col-sm-4">
				<input type="text" class="form-control inputstl" id="email" placeholder="Enter Customer Email" name="email" value="${customer.email}">
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="fullname">Full Name: </label>
			<div class="col-sm-4">
				<input type="text" class="form-control inputstl" id="fullname" placeholder="Enter Customer Full Name" name="fullname" value="${customer.fullname}">
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="phone">Phone Number: </label>
			<div class="col-sm-4">
				<input type="text" class="form-control inputstl" id="phone" placeholder="Enter Customer Phone Number" name="phone" value="${customer.phone}">
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="address">Address: </label>
			<div class="col-sm-10">
				<input type="text" class="form-control inputstl" id="address" placeholder="Enter Customer Address" name="address" value="${customer.address}">
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="city">City: </label>
			<div class="col-sm-4">
				<input type="text" class="form-control inputstl" id="city" placeholder="Enter Customer City" name="city" value="${customer.city}">
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="zipcode">Zip Code: </label>
			<div class="col-sm-4">
				<input type="text" class="form-control inputstl" id="zipcode" placeholder="Enter Customer Zip Code" name="zipcode" value="${customer.zipcode}">
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="country">Country: </label>
			<div class="col-sm-4">
				<input type="text" class="form-control inputstl" id="country" placeholder="Enter Customer Country" name="country" value="${customer.country}">
			</div>
		</div>
		
		<div class="form-group">
					<i>(Leave password fields blank if you don't want to change
						password)</i> <label class="col-sm-2 control-label">Password: </label>
					<div class="col-sm-4">
						<input class="form-control" type="password" id="password"
							name="password" value="${customer.password}">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">Confirm Password: </label>
					<div class="col-sm-4">
						<input class="form-control" type="password" id="confirmpassword"
							name="confirmpassword" value="${customer.password}">
					</div>
				</div>
				
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-danger" value="Save">
					<span class="glyphicon glyphicon-save"> </span> Save
				</button>
				<button type="submit" class="btn btn-danger" value="Cancel"
					id="buttonCancel">Cancel</button>
			</div>
		</div>
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
				
				<c:if test="${customer == null}">
				password: "required",
				</c:if>
				
				confirmPassword: {
					<c:if test="${customer == null}">
					required: true,
					</c:if>
					equalTo: "#password"
				},
				
				phone: "required",								
				address: "required",
				city: "required",
				zipcode: "required",
				country: "required",
			},
			
			messages: {
				email: {
					required: "Please enter e-mail address",
					email: "Please enter a valid e-mail address"
				},
				
				fullname: "Please enter full name",
				
				<c:if test="${customer == null}">
				password: "Please enter password",
				</c:if>
				
				confirmPassword: {
					<c:if test="${customer == null}">
					required: "Please confirm password",
					</c:if>
					equalTo: "Confirm password does not match password"
				},
				
				phone: "Please enter phone number",								
				address: "Please enter address",
				city: "Please enter city",
				zipcode: "Please enter zip code",
				country: "Please enter country",
			}
		});
		
		$("#buttonCancel").click(function() {
			history.go(-1);
		});
	});	
</script>
</html>