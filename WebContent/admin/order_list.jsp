<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Orders - Minhaz Grocery Administration</title>
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
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<h3>
		<button type="button" class="btn btn-danger btn-lg btn-block">Item Order
			Management</button>
	</h3>
	<div class="panel-group">
		<div class="panel-body">
			<c:if test="${message != null}">
				<div align="center">
					<h4>${message}</h4>
				</div>
			</c:if>
			<table class="table">
				<thead>
					<tr class="danger">

						<th>Index</th>
				<th>Order ID</th>
				<th>Ordered by</th>
				<th>Item Count</th>
				<th>Total</th>
				<th>Payment Method</th>
				<th>Status</th>
				<th>Order Date</th>
				<th>Actions</th>
					</tr>
				</thead>
				<c:forEach var="order" items="${listOrder}" varStatus="status">
					<tbody>
						<tr class="info">
						<td>${status.index + 1}</td>
					<td>${order.orderId}</td>
					<td>${order.customer.fullname}</td>
				    <td>${order.itemCopies}</td>
				    <td>&#8377; <fmt:formatNumber value="${order.total}" /></td>
				   <td>${order.paymentMethod}</td>
				   <td>${order.status}</td>
				   <td>${order.orderDate}</td>	
							<td>

							<div class="btn-group">
											<button type="button" class="btn btn-success a-btn-slide-text"
												onclick="location.href = 'view_order?id=${order.orderId}';"> <span class="glyphicon glyphicon-eye-open"></span> View</button>
												<button type="button" class="btn btn-success"
												onclick="location.href = 'edit_order?id=${order.orderId}';"> <span class="glyphicon glyphicon-edit"></span> Edit</button>
											<button type="button" class="btn btn-danger"
												onclick="deleteFunction(this.id);" id="${order.orderId}">     <span class="glyphicon glyphicon-remove-circle"></span> Delete</button>
										</div>
							</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</div>
	<jsp:directive.include file="footer.jsp" />
</body>
<script>
function deleteFunction(orderId) {
	console.log("Order id: " + orderId);
	if(confirm('Are you sure you want to delete the order with ID '+ orderId +'?'))
	{
		window.location='delete_order?id=' + orderId;
	}
}
</script>
</html>