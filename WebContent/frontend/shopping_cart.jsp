<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MinhazGrocery.com Shopping Cart</title>
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--jQuery bootstrap validation plugin -->
<script
	src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>
<style type="text/css">
body {
	background: #e2eaef;
	font-family: "Open Sans", sans-serif;
}

h2 {
	color: #333;
	text-align: center;
	text-transform: uppercase, lowercase;
	font-family: "Roboto", sans-serif;
	font-weight: bold;
	position: relative;
	margin: 25px 0 50px;
}

h2::after {
	content: "";
	width: 100px;
	position: absolute;
	margin: 0 auto;
	height: 3px;
	background: #ffdc12;
	left: 0;
	right: 0;
	bottom: -10px;
}

h3 {
	color: #FF0000;
	text-align: center;
	text-transform: uppercase, lowercase;
	font-family: "Roboto", sans-serif;
	font-weight: bold;
	position: relative;
	margin: 25px 0 50px;
}
</style>

</head>
<body>
	<jsp:directive.include file="header.jsp" />

	<h2>Shopping Cart</h2>
	<c:if test="${message!=null}">
		<div align="center">
			<h4 class="message">${message}</h4>

		</div>
	</c:if>

	<c:set var="cart" value="${sessionScope['cart']}" />

	<c:if test="${cart.totalItems==0 }">
		<h3>There's no items in your cart!</h3>
	</c:if>

	<c:if test="${cart.totalItems>0}">
		<form action="update_cart" method="post" id="cartForm">

			<div class="row" style="height: 1200px">
				<div class="col-sm-12 col-md-10 col-md-offset-1">
					<table class="table table-hover">
						<thead>
							<tr>
								<th><h4>
										<b>Item</b>
									</h4></th>
								<th class="text-center">
									<h4>
										<b>Quantity</b>
									</h4>
								</th>
								<th class="text-center"><h4>
										<b>Unit Price</b>
									</h4></th>
								<th class="text-center"><h4>
										<b>SubTotal</b>
									</h4></th>
								<th> </th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${cart.items}" var="item" varStatus="status">
								<tr>
									<td class="col-sm-8 col-md-6">
										<div class="media" align="center">
											<a class="thumbnail pull-left"
												href="view_item?id=${item.key.itemId}"> <img
												class="media-object"
												src="data:image/jpg;base64,${item.key.base64Image}"
												style="width: 100px; height: 120px;">
											</a>
											<div class="media-body">
												<h4 class="media-heading">
													<a href="view_item?id=${item.key.itemId}">${item.key.title}</a>
												</h4>
												<%-- <h5 class="media-heading">
													<a href="view_item?id=${item.key.itemId}">${item.key.title}</a>
												</h5> --%>
												<span>Status: </span>
												<c:choose>
													<c:when test="${item.key.unitstock > 0}">
														<span class="text-success"><strong>In
																Stock</strong></span>
													</c:when>
													<c:otherwise>
														<span class="text-success"><strong>Out of
																Stock</strong></span>
													</c:otherwise>
												</c:choose>

											</div>
										</div>
									</td>

									<td class="col-sm-1 col-md-1" style="text-align: center">
										<input type="hidden" name="itemId" value="${item.key.itemId}" />

										<input type="text" class="form-control" id="quantity"
										name="quantity${status.index + 1}" value="${item.value}">
									</td>

									<td class="col-sm-1 col-md-1 text-center"><strong></strong>
										&#8377; <fmt:formatNumber value="${item.key.price}"  /></td>
									<td class="col-sm-1 col-md-1 text-center"><strong></strong>
										&#8377; <fmt:formatNumber value="${item.value*item.key.price}" /></td>
									<td class="col-sm-1 col-md-1">
										<button type="button" class="btn btn-danger"
											onclick="location.href = 'remove_from_cart?item_id=${item.key.itemId}';">
											<span class="glyphicon glyphicon-remove"></span> Remove
										</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td> </td>
								<td><i><b>${cart.totalQuantity} item(s)</b></i></td>

								<td align="center"><b>SubTotal: </b></td>
								<td align="center"><b>&#8377; <fmt:formatNumber value="${cart.totalAmount}" /></b></td>
								<td class="text-right"></td>
							</tr>
							<tr>
								<td> </td>
								<td><b>Shipping:</b></td>
								<td align="center">
									<div class="totals-value" id="cart-shipping">
										<select id="singleSelectValueDDjQuery" class="form-control" name="shipping"
											onchange="calculateTax(this.value)">
											<option value="">Select Delivery</option>
											<option value="0">Free Delivery</option>
											<!-- <option value="10">3 Days</option>
											<option value="20">Next Day</option> -->
										</select>
									</div>
								</td>
								<td class="center" align="center"><input type="text" id="textFieldValueJQ"
									class="form-control" placeholder="Shipping value" name="shippingValue" 
									readonly="readonly" /></td>
								<td></td>
							</tr>
							<tr>
								<td> </td>
								<td> </td>
								<td align="center"><h5>
										<b>Tax: Included in the Bill &#8377;</b>
									</h5></td>
								<td class="text-center" align="center"><b><input type="text"
										class="form-control" id="tax" name="tax" readonly="readonly"></b></td>
								<td></td>

							</tr>
							<tr>
								<td> </td>
								<td></td>
								<td align="center"><b>Order Total &#8377;</b></td>
								<td class="text-center"><b> <input type="text"
										class="form-control" id="orderTotal" name="orderTotal" readonly="readonly"></b></td>
								<td></td>

							</tr>
							<tr>
								<td> </td>
								<td>
									<button type="submit" class="btn btn-success">
										<span class="glyphicon glyphicon-shopping-cart"></span> Update
										Cart
									</button>
								</td>
								<td>
									<button type="button" id="clearCart" value="Clear Cart"
										class="btn btn-danger">
										<span class="glyphicon glyphicon-shopping-cart"></span> Clear
										Cart
									</button>
								</td>
								<td>
									<button type="button" class="btn btn-success"
										onclick="location.href = '${pageContext.request.contextPath}';">
										<span class="glyphicon glyphicon-shopping-cart"></span>
										Continue Shopping
									</button>
								</td>
								<td>
									<button type="button" id="checkout" class="btn btn-primary"
										onclick="location.href = 'checkout';">
										Checkout <span class="glyphicon glyphicon-play"></span>
									</button>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>

		</form>
	</c:if>

	<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">
		$(document).ready(function() {
		    $("#checkout").click(function() {
		    	if (!$("#textFieldValueJQ").val()){
		    		onchange=calculateTax(0);
			    	sessionStorage.setItem("shipping",0);
		    	} else {
		    		onchange=calculateTax(0);
			    	sessionStorage.setItem("shipping",$("#textFieldValueJQ").val());
		    	}
		    	sessionStorage.setItem("tax",$("#tax").val());
		    	sessionStorage.setItem("orderTotal",$("#orderTotal").val());
			})
			$("#clearCart").click(function() {
				window.location = 'clear_cart';
			});
			$("#cartForm").validate({
				rules : {
					shipping: {
			            required: {
			                depends: function(element) {
			                    return $("#singleSelectValueDDjQuery").val() == '';
			                }
			            }
			        },
			        
					<c:forEach items="${cart.items}" var="item" varStatus="status">
						quantity${status.index + 1}: {
							required: true, number: true, min: 1
						},
					</c:forEach>
				},
				messages : {
					shipping: "Please Select the delivery Method",
					
					<c:forEach items="${cart.items}" var="item" varStatus="status">
						quantity${status.index + 1}: { 
							required: "Please enter quantity!",
							number: "Quantity must be a number!",
							min: "Quantity must be greater than 0 !"
						},
					</c:forEach>	
						
				}
			});
			 $("#singleSelectValueDDjQuery").on("change",function(){
			        //Getting Value
			        var selValue = $("#singleSelectValueDDjQuery").val();
			        //Setting Value
			        $("#textFieldValueJQ").val(selValue);
			    });
		});
		function calculateTax(val) {
			var shipping=val*1;
			/* var tax_count=(((${cart.totalAmount}+shipping)*0.03).toFixed(2)); */
			var tax_count=(((${cart.totalAmount}+shipping)*0).toFixed(2));
			var  taxObj=document.getElementById('tax');
			
			taxObj.value=tax_count;
			
			var totalObj = document.getElementById('orderTotal');
			totalObj.value = (${cart.totalAmount} + tax_count*1 + shipping).toFixed(2);
		}
	</script>
</body>
</html>