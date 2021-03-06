<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Edit Review</title>
	<link rel="stylesheet" href="../css/style.css">
	<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center">

		<h2 class="pageheading">
			<c:if test="${review!=null}">
				Edit Review
			</c:if>
		</h2>
	</div>

	<div class="center">
		<c:if test="${review!=null}">
			<form action="update_review" method="post" id="reviewForm">
				<input type="hidden" name="reviewId" value="${review.reviewId}">
		</c:if>


		<table class="form">
			<tr>
				<td align="right">Item:</td>
				<td align="left"><b>${review.item.title}</b></td>
			</tr>
			<tr>
				<td align="right">Rating:</td>
				<td align="left"><b>${review.rating}</b></td>
			</tr>
			<tr>
				<td align="right">Customer:</td>
				<td align="left"><b>${review.customer.fullname}</b></td>
			</tr>
			<tr>
				<td align="right">Headline:</td>
				<td align="left"><input type="text" id="headline" name="headline" size="60" value="${review.headline}" /></td>
			</tr>
			<tr>
				<td align="right">Comment:</td>
				<td align="left">
					<textarea rows="5" cols="70" name="comment">${review.comment }</textarea>
				</td>
			</tr>
			
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">Save</button>&nbsp;&nbsp;&nbsp;
					<button id="buttonCancel">Cancel</button>
				</td>
			</tr>
		</table>
		</form>
	</div>


	<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">
	
	$(document).ready(function(){
		$("#reviewForm").validate({
			rules: {
				headline: "required",
				comment: "required",
			},
			messages: {
				headline: "Please enter Headline",
				comment: "Please enter Comment"
			}
		});
		$("#buttonCancel").click(function(){
			history.go(-1);
		});
	});

</script>
</html>