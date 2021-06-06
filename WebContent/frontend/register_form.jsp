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
	color: #fff;
	background: #17202A;
		font-family: "Open Sans", sans-serif;
}

.form-control, .form-control:focus, .input-group-addon {
	border-color: #e1e1e1;
}

.form-control, .btn {
	border-radius: 3px;
}

.signup-form {
	width: 390px;
	margin: 0 auto;
	padding: 30px 0;
}

.signup-form form {
	color: #999;
	border-radius: 3px;
	margin-bottom: 15px;
	background: #fff;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}

.signup-form h2 {
	color: #333;
	font-weight: bold;
	margin-top: 0;
}

.signup-form hr {
	margin: 0 -30px 20px;
}

.signup-form .form-group {
	margin-bottom: 20px;
}

.signup-form label {
	font-weight: normal;
	font-size: 13px;
}

.signup-form .form-control {
	min-height: 38px;
	box-shadow: none !important;
}

.signup-form .input-group-addon {
	max-width: 42px;
	text-align: center;
}

.signup-form input[type="checkbox"] {
	margin-top: 2px;
}

.signup-form .btn {
	font-size: 16px;
	font-weight: bold;
	background: #19aa8d;
	border: none;
	min-width: 140px;
}

.signup-form .btn:hover, .signup-form .btn:focus {
	background: #179b81;
	outline: none;
}

.signup-form a {
	color: #fff;
	text-decoration: underline;
}

.signup-form a:hover {
	text-decoration: none;
}

.signup-form form a {
	color: #19aa8d;
	text-decoration: none;
}

.signup-form form a:hover {
	text-decoration: underline;
}

.signup-form .fa {
	font-size: 21px;
}

.signup-form .fa-paper-plane {
	font-size: 18px;
}

.signup-form .fa-check {
	color: #fff;
	left: 17px;
	top: 18px;
	font-size: 7px;
	position: absolute;
}
</style>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class="signup-form">
		<c:if test="${message!=null}">
			<div align="center">
				<h4 class="message">${message}</h4>
			</div>
			</c:if>
		<form action="register_customer" method="post" id="registerForm">
			<h2>Sign Up</h2>
			<p>Please fill in this form to create an account!</p>
			<hr>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-paper-plane"></i></span>
					<input type="text" id="email" class="form-control" name="email"
						placeholder="Email Address" >
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-user"></i></span> <input
						type="text" id="fullname" name="fullname" class="form-control" placeholder="Full Name">
				</div>
			</div>

			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-lock"></i></span> <input
						type="password" id="password" class="form-control" name="password"
						placeholder="Password" >
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"> <i class="fa fa-lock"></i>
						<i class="fa fa-check"></i>
					</span> <input type="password" id="confirmPassword" class="form-control"
						name="confirmPassword" placeholder="Confirm Password"
						>
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-phone"></i></span>
					<input type="text" id="phone" class="form-control"
						name="phone" placeholder="Phone Number">
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"><i
						class="fas fa-address-card"></i></span> <input type="text" id="address"
						class="form-control" name="address" placeholder="Address"
						>
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"><i class='fas fa-city'
						class='fas fa-city'></i> </span> <input type="text" id="city"
						class="form-control" name="city" placeholder="City"
						>
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"><i
						class="fa fa-file-archive-o"></i></span> <input type="text" id="zipcode"
						class="form-control" name="zipcode" placeholder="Zip Code"
					>
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-globe"></i></span>
					<input type="text" id="country" class="form-control" name="country"
						placeholder="Country" >
				</div>
			</div>

			<div class="form-group" align="center">
				<button type="submit" class="btn btn-primary btn-lg">Sign
					Up</button>
			</div>
			<div class="text-center">
				Already have an account? <a href="login">Login here</a>
			</div>
		</form>
	</div>
	<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">
$(document).ready(function() {
	$("#registerForm").validate({
		rules : {
			email : {
				required : true,
				email : true
			},
			 fullname : "required",
			 password: {
			        required: true,
			        minlength : 5,
	                maxlength : 8,
	                passwordCheck: true
			      },
			 confirmPassword : {
	            	 required: true,
	                 minlength : 5,
		             maxlength : 8,
	                 equalTo : "#password"
	            },
			phone : {
						required : true,
						phoneUS : true
					},
			address : "required",
			city : "required",
			zipcode: "required",
			country:"required"          
		},
		messages : {
			email : {
				required : " Please enter a email.",
				email : " Please enter a valid email address."
			},
			fullname : "Please enter a Full Name.",
			password: {
		        required: "Please enter a password.",
		        minlength: "Minimum password length is 5",
                maxlength: "Maximum password length is 8",
                passwordCheck: "Password must contain an uppercase, lowercase, number and special character"
		      },
			confirmPassword : {
				required: 	"Please enter a Confirm Password.",
		        minlength: "Minimum password length is 5",
                maxlength: "Maximum password length is 8",
                equalTo : "Please enter a same password as above"
			},
		  	phone : {
				required : "Please enter a phone number.",
				phoneUS : " Please enter a valid phone number."
			},
			address : "Please a enter Address.",
			city : "Please enter a city.",
			zipcode: "Please enter a zipcode.",
			country:"Please enter a country."
		}
	});
	
	$.validator.addMethod("passwordCheck", function(value) {
	   return /^[A-Za-z0-9\d=!\-@._*]*$/.test(value)
	       && /[a-z]/.test(value)
	       && /[A-Z]/.test(value)
	       && /\d/.test(value)
	       && /[\!\"\#\$\%\&\'\(\)\*\+\,\-\.\/\:\;\<\>\=\?\@\[\]\{\}\\\\\^\_\`\~]/.test(value)
	});
});
</script>
</html>