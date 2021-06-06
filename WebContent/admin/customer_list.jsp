<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Customers - Minhaz Grocery Administration</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://unpkg.com/bootstrap-table@1.15.4/dist/bootstrap-table.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<h3>
		<button type="button" class="btn btn-danger btn-lg btn-block">Customer
			Management</button>
	</h3>
	<div align="center">
		<h3>
			<a href="customer_form.jsp">Create New Customer</a>
		</h3>
	</div>
	<div class="panel-group">
		<div class="panel-body">
			<c:if test="${message!=null}">
				<div align="center">
					<h4 class="message">${message}</h4>
				</div>
			</c:if>

			<table class="table">
				<thead>
					<tr class="danger">
						<th>Index</th>
						<th>ID</th>
						<th>E-mail</th>
						<th>Full Name</th>
						<th>City</th>
						<th>Country</th>
						<th>Registered Date</th>
						<th>Actions</th>

					</tr>
				</thead>
				<c:forEach var="customer" items="${listCustomer}" varStatus="status">
					<tbody>
						<tr class="info">
							<td>${status.index + 1}</td>
							<td>${customer.customerId}</td>
							<td>${customer.email}</td>
							<td>${customer.fullname}</td>
							<td>${customer.city}</td>
							<td>${customer.country}</td>
							<td>${customer.registerDate}</td>
							<td>
								<a href="edit_customer?id=${customer.customerId}">Edit</a> &nbsp; 
								<a href="javascript:void(0);" class="deleteLink" id="${customer.customerId}">Delete</a>
							</td>

						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</div>
	<jsp:directive.include file="footer.jsp" />
	<script>
	
		$(document).ready(function(){
			$(".deleteLink").each(function(){
				$(this).on("click",function(){
					customerId=$(this).attr("id");
					if(confirm("Are you sure you want to delete the customer with ID " + customerId + " ?")){
						window.location = 'delete_customer?id='+customerId;
					}
				});
			});
		});
	</script>
</body>
</html>