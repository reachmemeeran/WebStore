<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Order- Minhaz Grocery Administration</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
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
	color: #566787;
	background: #f5f5f5;
	font-family: 'Varela Round', sans-serif;
	font-size: 13px;
}

.table-wrapper {
	background: #fff;
	padding: 20px 25px;
	margin: 30px 0;
	border-radius: 3px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-title {
	padding-bottom: 15px;
	background: #435d7d;
	color: #fff;
	padding: 16px 30px;
	margin: -20px -25px 10px;
	border-radius: 3px 3px 0 0;
}

.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}

.table-title .btn-group {
	float: right;
}

.table-title .btn {
	color: #fff;
	float: right;
	font-size: 13px;
	border: none;
	min-width: 50px;
	border-radius: 2px;
	border: none;
	outline: none !important;
	margin-left: 10px;
}

.table-title .btn i {
	float: left;
	font-size: 21px;
	margin-right: 5px;
}

.table-title .btn span {
	float: left;
	margin-top: 2px;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 15px;
	vertical-align: middle;
}

table.table tr th:first-child {
	width: 60px;
}

table.table tr th:last-child {
	width: 100px;
}

table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}

table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}

table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table td:last-child i {
	opacity: 0.9;
	font-size: 22px;
	margin: 0 5px;
}

table.table td a {
	font-weight: bold;
	color: #566787;
	display: inline-block;
	text-decoration: none;
	outline: none !important;
}

table.table td a:hover {
	color: #2196F3;
}

table.table td a.edit {
	color: #FFC107;
}

table.table td a.delete {
	color: #F44336;
}

table.table td i {
	font-size: 19px;
}

table.table .avatar {
	border-radius: 50%;
	vertical-align: middle;
	margin-right: 10px;
}

.pagination {
	float: right;
	margin: 0 0 5px;
}

.pagination li a {
	border: none;
	font-size: 13px;
	min-width: 30px;
	min-height: 30px;
	color: #999;
	margin: 0 2px;
	line-height: 30px;
	border-radius: 2px !important;
	text-align: center;
	padding: 0 6px;
}

.pagination li a:hover {
	color: #666;
}

.pagination li.active a, .pagination li.active a.page-link {
	background: #03A9F4;
}

.pagination li.active a:hover {
	background: #0397d6;
}

.pagination li.disabled i {
	color: #ccc;
}

.pagination li i {
	font-size: 16px;
	padding-top: 6px
}

.hint-text {
	float: left;
	margin-top: 10px;
	font-size: 13px;
}

/* Modal styles */
.modal .modal-dialog {
	max-width: 400px;
}

.modal .modal-header, .modal .modal-body, .modal .modal-footer {
	padding: 20px 30px;
}

.modal .modal-content {
	border-radius: 3px;
}

.modal .modal-footer {
	background: #ecf0f1;
	border-radius: 0 0 3px 3px;
}

.modal .modal-title {
	display: inline-block;
}

.modal .form-control {
	border-radius: 2px;
	box-shadow: none;
	border-color: #dddddd;
}

.modal textarea.form-control {
	resize: vertical;
}

.modal .btn {
	border-radius: 2px;
	min-width: 100px;
}

.modal form label {
	font-weight: normal;
}
</style>

</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<h3>
		<button type="button" class="btn btn-danger btn-lg btn-block">Edit
			Order ID: ${order.orderId}</button>
	</h3>
	<c:if test="${message!=null}">
		<div align="center">
			<h4 class="message">${message}</h4>
		</div>
	</c:if>

	<div class="container">
		<div class="table-wrapper">
			<form action="update_order" method="post" id="orderForm">
				<div class="table-title">

					<div class="row">

						<div class="col-sm-6">
							<h2>
								Edit <b>Order</b>
							</h2>
						</div>
						


							<button type="submit" class="btn btn-success" value="Save">
								<span class="glyphicon glyphicon-save"></span>Save
							</button>
							
							<a href="javascript:window.location.href='list_order';"
								type="submit" value="Cancel" class="btn btn-danger"><i
								class="material-icons">&#xE15C;</i> <span>Cancel </span></a>


					

					</div>
				</div>

				<table class="table table-striped table-hover">
					<tbody>
						<tr>
							<td><b>Order By: </b></td>
							<td>${order.customer.fullname}</td>
						</tr>


						<tr>
							<td><b>Order Date: </b></td>
							<td>${order.orderDate}</td>
						</tr>

						<tr>
							<td><b>Recipient Name: </b></td>
							<td><input type="text" name="recipientName"
								value="${order.recipientName}" size="45" readonly="readonly"/></td>
						</tr>

						<tr>
							<td><b>Recipient phone: </b></td>
							<td><input type="text" name="recipientPhone"
								value="${order.recipientPhone}" size="45" readonly="readonly"/></td>
						</tr>

						<tr>
							<td><b>Ship To: </b></td>
							<td><input type="text" name="shippingAddress"
								value="${order.shippingAddress}" size="45" readonly="readonly"/></td>
						</tr>

						<tr>
							<td><b>Payment Method: </b></td>
							<td>
							<input type="text" name="paymentMethod"
								value="${order.paymentMethod}" size="45" readonly="readonly"/></td>
						</tr>

						<tr>
							<td><b>Order Status: </b></td>
							<td><select name="orderStatus">
							<option value="OrderPlaced"
										<c:if test="${order.status eq 'OrderPlaced' }">selected='selected'</c:if>>Order Placed</option>
									<option value="Processing"
										<c:if test="${order.status eq 'Processing' }">selected='selected'</c:if>>Processing</option>
										<option value="Cancelled"
										<c:if test="${order.status eq 'Cancelled' }">selected='selected'</c:if>>Cancelled</option>
									<option value="Shipped"
										<c:if test="${order.status eq 'Shipped' }">selected='selected'</c:if>>Shipped</option>
									<option value="Delivered"
										<c:if test="${order.status eq 'Delivered' }">selected='selected'</c:if>>Delivered</option>
									<option value="Completed"
										<c:if test="${order.status eq 'Completed' }">selected='selected'</c:if>>Completed</option>
									
											
										<option value="Returned"
										<c:if test="${order.status eq 'Returned' }">selected='selected'</c:if>>Returned</option>
										
							</select></td>
						</tr>

					</tbody>
				</table>
			
		</div>
</div>

	<div class="container">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>
							Ordered <b>Items</b>
						</h2>
					</div>


				</div>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>Index</th>
						<th>Item Title</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Sub Total</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${order.orderDetails}" var="orderDetail"
						varStatus="status">
						<tr>
							<td>${status.index + 1}</td>
							<td>${orderDetail.item.title}</td>
							<td><input type="hidden" name="price"
								value="${orderDetail.item.price}" /> &#8377; <fmt:formatNumber
									value="${orderDetail.item.price}"  /></td>
							<td><input type="hidden" name="itemId"
								value="${orderDetail.item.itemId}" /> <input type="text"
								name="quantity${status.index+1}" value="${orderDetail.quantity}"
								/></td>
							<td>&#8377; <fmt:formatNumber value="${orderDetail.subtotal}" /></td>
							<td><a
								href="remove_item_from_order?id=${orderDetail.item.itemId}">Remove</a></td>
						</tr>
					</c:forEach>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td align="right" style="color: red;"><b>TOTAL:</b></td>
						<td>${order.itemCopies}</td>
						<td style="color: red;"><b>&#8377; <fmt:formatNumber
									value="${order.total}"  /></b></td>
						<td></td>
					</tr>
				</tbody>
			</table>


		</div>



	</div>
</form>

	<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">
$(document).ready(function() {
	$("#orderForm").validate({
		rules: {	
			recipientName: "required",
			recipientPhone: "required",
			shippingAddress: "required",
			
			<c:forEach items="${order.orderDetails}" var="item" varStatus="status">
				quantity${status.index + 1}: {
					required: true, number: true, min: 1
				},
			</c:forEach>					
		},
		
		messages: {
			recipientName: "Please enter recipient name.",
			recipientPhone: "Please enter recipient phone.",
			shippingAddress: "Please enter shipping address.",
			
			<c:forEach items="${order.orderDetails}" var="item" varStatus="status">
				quantity${status.index + 1}: { 
					required: "Please enter quantity.",
					number: "Quantity must be a number.",
					min: "Quantity must be greater than 0!"
				},
			</c:forEach>						
		}
	});
	
});		
	</script>
</html>
