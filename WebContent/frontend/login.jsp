<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Customer Login</title>
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

<!--jQuery bootstrap validation plugin -->
<script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>
<script src="js/<a href="https://www.jqueryscript.net/tags.php?/Validation/">Validation</a>FormScript.js"></script>
<style type="text/css">
	body {
		color: #17202A;
	font-family: "Open Sans", sans-serif;
	}
	.form-control {
		box-shadow: none;
		border-color: #ddd;
	}
	.login-form {
        width: 350px;
		margin: 0 auto;
		padding: 30px 0;
	}
    	.login-form h4 {
		text-align: center;
		font-size: 22px;
        margin-bottom: 20px;
	}
    .form-control, .btn {        
        border-radius: 2px;
    }
	    .login-form form {
        color: #434343;
		border-radius: 1px;
    	margin-bottom: 15px;
        background: #fff;
		border: 1px solid #f3f3f3;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
	}
	.login-form h2 {		
        margin: 0;
		padding: 30px 0;
        font-size: 34px;
    }
    
    .login-form .icon1 {
        color: #fff;
		margin: 0 auto 30px;
        text-align: center;
		width: 100px;
		height: 100px;
		border-radius: 50%;
		z-index: 9;
		background: #4aba70;
		padding: 15px;
		box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
	}
	.login-form .icon1 img {
		width: 100%;
	}
    .login-form form {
		color: #7a7a7a;
		border-radius: 4px;
    	margin-bottom: 15px;
        background: #fff;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;		
    }	

	.login-form .btn {
		background: #4aba70;
		border: none;
		line-height: normal;
	}
	.login-form a {
		color: #ef3b3a;
	}	
	.login-form form a {
		color: #4aba70;
	}

	.hint-text {
		color: #999;
		text-align: center;
	}
	.form-footer {
    	padding-bottom: 15px;
		text-align: center;
    }
</style>
</head>
<body>
<jsp:directive.include file="header.jsp" />
<div class="login-form">
	<h2 class="text-center" >Customer Login</h2>
		<c:if test="${message!=null}">
			<div align="center">
				<h4 class="message">${message}</h4>

			</div>
		</c:if>
  	<form id="loginForm" action="login" method="post" >
  		
	<div class="icon1">
		<img src="images/users.png" alt="icon1" />
		</div>   
		<h4 class="modal-title">Login to Your Account</h4>     
        <div class="form-group">
        	<input type="text" name="email" id="email" class="form-control input-lg"  placeholder="Email">
        </div>
		<div class="form-group">
            <input type="password" name="password" id="password" class="form-control input-lg" placeholder="Password">
        </div>        
        
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-lg btn-block login-btn">Sign In</button>
        </div>
        	<p class="hint-text">Don't have an account? <a href="register">Sign up here</a></p>
    </form>

</div>
<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#loginForm").validate({
			rules : {
				email : {
					required : true,
					email : true
				},
				 password: {
				        required: true,
				        minlength : 5,
		                maxlength : 8
				      }
				    },
			messages : {
				email : {
					required : " Please enter email.",
					email : " Please enter an valid email address."
				},
				password: {
			        required: "Please enter a password.",
			        minlength: "Minimum password length is 5",
	                maxlength: "Maximum password length is 8"
			      },
			}
		});
	});
</script>
</html>                            