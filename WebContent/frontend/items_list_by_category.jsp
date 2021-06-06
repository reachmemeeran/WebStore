<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Items in ${category.name}- Online Items Store</title>
	<link rel="stylesheet" href="css/style.css">
	 <!-- <link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Open+Sans">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 --><script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="background: #e2eaef">
	<jsp:directive.include file="header.jsp" />

	<div class="center">
		<h2>${category.name}</h2>
	</div>
	<div class="item_group">
		<c:forEach items="${listItems}" var="item">
			<div class="item_img"> 
				<div>
					<a href="view_item?id=${item.itemId }">
						<img class = "item_small"
						 src="data:image/jpg;base64,${item.base64Image}" >
					</a>
				</div>
				<div>
					<h4>
						<a href="view_item?id=${item.itemId}"> <b>${item.title}</b>
						</a>
					</h4>
				</div>
				<div>
				<jsp:directive.include file="item_rating.jsp"/>
					<a href="view_item?id=${item.itemId}">(${fn:length(item.reviews)})</a>
				</div>
				<p class="item-price">
					<strike>&#8377; ${item.falsePrice}</strike> <b>&#8377; ${item.price}</b>
				</p>
			
			
			<c:choose>
				<c:when test = "${item.unitstock > 0}">
					<a href="add_to_cart?item_id=${item.itemId}" class="btn btn-primary">Add to Cart</a>
				</c:when>
				<c:otherwise>
					<span class="text-success"><strong>Out of Stock</strong></span>
  					</c:otherwise>
			</c:choose>
				</div>							
		</c:forEach>
	</div>
	<jsp:directive.include file="footer.jsp" />
</body>
</html>