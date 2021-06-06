<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Order History - Minhaz Grocery </title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.css">
<script
	src="https://unpkg.com/bootstrap-table@1.15.4/dist/bootstrap-table.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
body {
	background: #e2eaef;
	font-family: "Open Sans", sans-serif;
}

h2 {
	color: #000;
	font-size: 26px;
	font-weight: 300;
	text-align: center;
	text-transform: uppercase,lowercase;
	position: relative;
	margin: 30px 0 60px;
}

h2::after {
	content: "";
	width: 100px;
	position: absolute;
	margin: 0 auto;
	height: 4px;
	border-radius: 1px;
	background: #7ac400;
	left: 0;
	right: 0;
	bottom: -20px;
}
</style>
<body>
	<jsp:directive.include file="header.jsp" />
	<h2><b>
		My Order History
	</b></h2>
	<div class="container" align="center">
		<div class="row">
			<c:if test="${fn:length(listOrders) == 0}">
				<div align="center">
					<h3>You have not placed any orders.</h3>
				</div>
			</c:if>

			<c:if test="${fn:length(listOrders) > 0}">
				<table class="table">
					<thead>
						<tr class="danger">

							<th>Index</th>
							<th>Order ID</th>
							<th>Quantity</th>
							<th>Total Amount</th>
							<th>Order Date</th>
							<th>Status</th>
							<th>Actions</th>
						</tr>
					</thead>
				<c:forEach var="order" items="${listOrders}" varStatus="status">
						<tbody>
							<tr class="info">
						<tr>
						<td>${status.index + 1}</td>
						<td>${order.orderId}</td>
						<td>${order.itemCopies}</td>
						<td>&#8377; <fmt:formatNumber value="${order.total}" /></td>
						<td>${order.orderDate}</td>
						<td>${order.status}</td>
						<td>
										<div class="btn-group">
											<button type="button" class="btn btn-success a-btn-slide-text"
												onclick="location.href = 'show_order_detail?id=${order.orderId}';"> <span class="glyphicon glyphicon-eye-open"></span> View Order Details</button>
						</div>
						</td>
					
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</c:if>
		</div>
	</div>
	<jsp:directive.include file="footer.jsp" />
</body>
</html>