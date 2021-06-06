<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>${item.title}-OnlineMinhazGrocery</title>
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,700|Open+Sans:400,700"
	rel="stylesheet">
	<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>
	<style type="text/css">

.carousel {
	margin: 50px auto;
	padding: 0 70px;
}

.carousel .item {
	color: #747d89;
	min-height: 155px;
	text-align: center;
	overflow: hidden;
}


.carousel .item rating {
	max-width: 100%;
	max-height: 100%;
	display: inline;
	bottom: 0;
	margin: 0 auto;
	left: 0;
	right: 0;
}

.carousel .item img {
	max-width: 100%;
	max-height: 100%;
	display: inline;
	bottom: 0;
	margin: 0 auto;
	left: 0;
	right: 0;
}

.alignleft {
	float: left;
}
.aligncenter {
	float: center;
}


</style>
</head>
<body>
	<jsp:directive.include file="header.jsp" />

	
	<div align="center">
		<b><h2>${item.title}</h2></b>
	</div>
	<br />
	<div id="myCarousel" class="carousel slide">
		<div class="carousel-inner">
			<div class="item carousel-item active">
			<div class="alignleft">
				<div class="img-box">
					<img class="item-large"
						src="data:image/jpg;base64,${item.base64Image}" />
				</div>
				<p class="testimonial">${item.description}</p>
				<div>
					<jsp:directive.include file="item_rating.jsp"/>
					<a href="#reviews">${fn:length(item.reviews)} Customer Reviews</a>
				</div>
				<div>
				<h3>
					<strike>&#8377; ${item.falsePrice}</strike> <b>&#8377; ${item.price}</b>	</h3>
					<h4><span>Status: </span>
					<c:choose>
						<c:when test = "${item.unitstock > 0}">
							<span class="text-success"><strong>In Stock</strong></span>
						</c:when>
						<c:otherwise>
							<span class="text-success"><strong>Out of Stock</strong></span>
	   					</c:otherwise>
   					</c:choose>
					</h4>
			
				
</div>
				<c:choose>
					<c:when test = "${item.unitstock > 0}">
						
					<button type="submit" class="btn btn-success" id="buttonAddToCart">
						<b>Add to Cart</b>
					</button>
					</c:when>
				</c:choose>

				<button type="button" class="btn btn-danger" id="buttonWriteReview" >
					<b>Write a Customer Review</b>
				</button>
				</div>
				<div class="aligncenter">
				<h3>
					<a id="reviews"> <b>Customer Reviews</b></a>
				</h3>

				<table align="center">
					<c:forEach items="${item.reviews}" var="review">
						<tr>
							<td><c:forTokens items="${review.stars}" delims=","
									var="star">
									<c:if test="${star eq 'on'}">
										<img src="images/rating_on.png">
									</c:if>

									<c:if test="${star eq 'off'}">
										<img src="images/rating_off.png">
									</c:if>

								</c:forTokens> - <b>${review.headline}</b></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td>by ${review.customer.fullname} on ${review.reviewTime}</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td><i>${review.comment}</i></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
					</c:forEach>
				</table>
				</div>
			</div>
		</div>
	</div>

	<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#buttonWriteReview").click(function() {
			window.location='write_review?item_id=' + ${item.itemId};
		});
		$("#buttonAddToCart").click(function() {
			window.location='add_to_cart?item_id=' + ${item.itemId};
		});
	});
		</script>
</html>
