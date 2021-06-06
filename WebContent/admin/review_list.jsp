<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Review - Minhaz Grocery Administration</title>
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
		<button type="button" class="btn btn-danger btn-lg btn-block">Review
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
						<th>ID</th>
						<th>Item</th>
						<th>Rating</th>
						<th>Headline</th>
						<th>Customer</th>
						<th>Review On</th>
						<th>Actions</th>
					</tr>
				</thead>
				<c:forEach var="review" items="${listReviews}" varStatus="status">
					<tbody>
						<tr class="info">
							<td>${status.index + 1}</td>
							<td>${review.reviewId}</td>
							<td>${review.item.title}</td>
							<td>${review.rating}</td>
							<td>${review.headline}</td>
							<td>${review.customer.fullname}</td>
							<td>${review.reviewTime}</td>
							<td>

								<div class="btn-group">
									<button type="button" class="btn btn-danger"
										onclick="deleteFunction(this.id);" id="${review.reviewId}">
										<span class="glyphicon glyphicon-remove-circle"></span> Delete
									</button>
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
	function deleteFunction(reviewId) {
		console.log("Review id: " + reviewId);
		if (confirm('Are you sure you want to delete the review  with ID '
				+ reviewId+ '?')) {
			window.location = 'delete_review?id=' + reviewId;
		}
	}
</script>
</html>