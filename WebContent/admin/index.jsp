<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Minhaz Grocery Administration</title>
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
     
    <div align="center">
		<h3>
			<button type="button" class="btn btn-success btn-lg btn-block">Administration
				DashBoard</button>
		</h3>
	</div>
     
<div class="container" style="height: 950px">
	<div class="panel-group" align="center">
		<div class="panel panel-success">
			<div class="panel-heading">
				<h3><b>Recent sales</b></h3>
			</div>
			<div class="panel-body">
					<table class="table">
					<thead>
						<tr class="danger">
							<th>Order ID</th>
							<th>Ordered By</th>
							<th>Item Count</th>
							<th>Total</th>
							<th>Payment Method</th>
							<th>Status</th>
							<th>Order Date</th>
						</tr>
					</thead>
					<c:forEach items="${listMostRecentSales}" var="order"
						varStatus="status">
						<tbody>
							<tr class="info">
								<td><a href="view_order?id=${order.orderId}">${order.orderId}</a></td>
								<td>${order.customer.fullname}</td>
								<td>${order.itemCopies}</td>
								<td>&#8377; <fmt:formatNumber value="${order.total}" /></td>
								<td>${order.paymentMethod}</td>
								<td>${order.status}</td>
								<td>${order.orderDate}</td>
							</tr>
								</tbody>
					</c:forEach>
				</table>
			</div>

		</div>
	</div>

	<div class="panel panel-info" align="center">
		<div class="panel-heading">
			<h3><b>Recent Review</b></h3>
		</div>
		<div class="panel-body">
				<table class="table">
				<thead>
					<tr class="danger">
						<th>Item</th>
						<th>Rating</th>
						<th>Headline</th>
						<th>Customer</th>
						<th>Review ON</th>
					</tr>
				</thead>
				<c:forEach items="${listMostRecentReviews}" var="review">
					<tbody>
					<tr class="info">
						<td>${review.item.title}</td>
						<td>${review.rating}</td>
						<td><a href="edit_review?id=${review.reviewId}">${review.headline}</a></td>
						<td>${review.customer.fullname}</td>
						<td>${review.reviewTime}</td>
					</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</div>

	<div class="panel panel-warning" align="center">
		<div class="panel-heading">
			<h3><b>Statistics</b></h3>
		</div>
		<div class="panel-body"><b>Total Admins:</b> ${totalAdmins}
			&nbsp; &nbsp; &nbsp; &nbsp; <b>Total Items:</b> ${totalItemsOnStrore} &nbsp; &nbsp;
			&nbsp; &nbsp; <b>Total Categories:</b> ${totalCategories} &nbsp; &nbsp;
			&nbsp; &nbsp; <b>Total Customers:</b> ${totalCustomersOnItemstall} &nbsp; &nbsp; &nbsp;
			&nbsp; <b>Total Reviews:</b> ${totalReviews} &nbsp; &nbsp; &nbsp; &nbsp;
			<b>Total Orders:</b> ${totalOrders} &nbsp; &nbsp; &nbsp; &nbsp;</div>
	</div>

</div>
     
     <jsp:directive.include file="footer.jsp" />
</body>
</html>