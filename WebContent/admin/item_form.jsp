<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create New Item</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- jQuery library -->
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>
<script
	src="js/<a href="https://www.jqueryscript.net/tags.php?/Validation/">Validation</a>FormScript.js"></script>
<!-- DatetimePicker library -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<script type='text/javascript'
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<style>
.inputstl {
	padding: 9px;
	border: solid 1px #FFA07A;
	outline: 0;
	background: -webkit-gradient(linear, left top, left 25, from(#FFFFFF),
		color-stop(4%, #A4FFA4), to(#FFFFFF));
	background: -moz-linear-gradient(top, #FFFFFF, #A4FFA4 1px, #FFFFFF 25px);
	box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;
	-moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;
	-webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;
}
</style>
<body>
	<jsp:directive.include file="header.jsp" />

	<div class="container" style="height: 1200px">
		<div class="panel-group">
				<div class="panel-heading" align="center">
					<h3>
						<c:if test="${item !=null}">
						 <h3><button type="button" class="btn btn-danger btn-lg btn-block">Update item Information</button></h3>
						 </c:if>

						<c:if test="${item ==null}">
							<h3><button type="button" class="btn btn-danger btn-lg btn-block">New item Information</button></h3>
	
						</c:if>
					</h3>
				</div>
		
		</div>
		<c:if test="${item !=null}">
			<form class="form-horizontal" action="update_item" method="post"
				id="itemForm" enctype="multipart/form-data">
				<input type="hidden" class="form-control" name="itemId"
					value="${item.itemId}">
		</c:if>
		<c:if test="${item==null}">
			<form class="form-horizontal" action="create_item" method="post"
				id="itemForm" enctype="multipart/form-data">
		</c:if>
		<div class="form-group">
			<label class="control-label col-sm-2" for="title">Category: </label>
			<div class="col-md-4 selectContainer">
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-list"></i></span> <select name="category"
						class="form-control inputstl">
						<option>Please select your Category</option>
						<c:forEach items="${listCategory}" var="category">
							<c:if test="${category.categoryId eq item.category.categoryId}">
								<option value="${category.categoryId}" selected>
							</c:if>
							<c:if test="${category.categoryId ne item.category.categoryId}">
								<option value="${category.categoryId}">
							</c:if>
							${category.name}
							</option>
						</c:forEach>

					</select>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="title">Title: </label>
			<div class="col-sm-10">
				<input type="text" class="form-control inputstl" id="title"
					placeholder="Enter Item Title" name="title" value="${item.title}">
			</div>
		</div>



		<div class="form-group">
			<label class="control-label col-sm-2" for="title">Item Image:
			</label>
			<div class="col-sm-10">
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroupFileAddon01"></span>
					</div>
					<div class="custom-file">
						<input type="file" class="form-control inputstl" id="itemImage"
							name="itemImage" aria-describedby="inputGroupFileAddon01">


						<img id="thumbnail" alt="Image Preview"
							style="width: 30%; margin-top: 10px"
							src="data:image/jpg;base64,${item.base64Image}" />
					</div>
				</div>
			</div>
		</div>

		<div class="form-group">

			<label class="control-label col-sm-2" for="price">Price:</label>
			<div class="col-sm-10">
				<input type="text" class="form-control inputstl" id="price"
					placeholder="Enter Item Price" name="price" value="${item.price}">
			</div>
		</div>
				<div class="form-group">

			<label class="control-label col-sm-2" for="stockAvailable" >Stock Available:</label>
			<div class="col-sm-10">
				<input type="text" class="form-control inputstl" id="stockAvailable"
					placeholder="Enter Stock Available" name="stockAvailable" value="${item.unitstock}">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="description">Item
				Description: </label>
			<div class="col-sm-10">
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-pencil"></i></span>
					<textarea class="form-control inputstl" name="description"
						rows="10 placeholder=" placeholder="Enter Item Description">${item.description}</textarea>

				</div>
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-danger" value="Save">
					<span class="glyphicon glyphicon-save"></span> Add Item
				</button>
				<button type="submit" class="btn btn-danger" value="Cancel"
					id="buttonCancel" onClick="javascript:history.go(-1);">
					<span class=""></span>Cancel
				</button>
			</div>
	
		</div>
	
	</div>
	<jsp:directive.include file="footer.jsp" />
</body>
<script type='text/javascript'>
	$(document).ready(function() {
		$('.col-sm-3.date').datepicker({
			
		});
		$('#itemImage').change(function() {
			showImageThumbnail(this);
		});
		$("#itemForm").validate({
			rules : {
				category : "required",
				title : "required",
				
				<c:if test="${item==null}">
				itemImage : "required",
				</c:if>
				
				price : "required",
				stockAvailable:"required",
				description : "required",
			},
			messages : {
				category : "Please select a category for the item.",
				title : "Please enter title of the item.",
				itemImage : "Please choose an image of the item.",
				price : "Please enter price of the item.",
				stockAvailable:"Please enter Unit Stock Available Quantity. ",
				description : "Please enter description of the item.",
			}
		});
		$("#buttonCancel").click(function() {
			history.go(-1);
		});
	});

	function showImageThumbnail(fileInput) {
		var file = fileInput.files[0];
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#thumbnail').attr('src', e.target.result);
		};
		reader.readAsDataURL(file);
	}
</script>
</html>