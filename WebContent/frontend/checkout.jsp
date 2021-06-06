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
<title>MinhazGrocery.com CheckOut</title>
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
</style>

</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class='row' style='padding-top: 25px; padding-bottom: 25px;'>
		<div class='col-md-12'>
			<div id='mainContentWrapper'>
				<div class="col-md-8 col-md-offset-2">
					<h2 style="text-align: center;">
						Review Your Order <a href="view_cart">Edit</a> & Complete Checkout
					</h2>
					<hr />
					<a href="${pageContext.request.contextPath}" class="btn btn-info"
						style="width: 100%;">Add More Products </a>
					<hr />
					<div class="shopping_cart">

						<div class="panel-group" id="accordion">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion"
											href="#collapseOne">Review Your Order</a>
									</h4>
								</div>
								<div id="collapseOne" class="panel-collapse collapse in">
									<div class="panel-body">
										<c:if test="${message!=null}">
											<div align="center">
												<h4 class="message">${message}</h4>

											</div>
										</c:if>

										<c:set var="cart" value="${sessionScope['cart']}" />

										<c:if test="${cart.totalItems==0 }">
											<h2>There's no items in your cart</h2>
										</c:if>

										<c:if test="${cart.totalItems>0}">

											<form action="update_cart" method="post" id="cartForm">

												<div class="row">
													<div class="col-sm-12 col-md-10 col-md-offset-1">
														<table class="table table-hover">
															<thead>
																<tr>
																	<th colspan="1"><h4>
																			<b>Item 
																			</b>
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

																</tr>
															</thead>
															<tbody>
																<c:forEach items="${cart.items}" var="item"
																	varStatus="status">
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
																					<h5 class="media-heading">
																						<a href="view_item?id=${item.key.itemId}">${item.key.title}</a>
																					</h5>
																					<span>Status: </span>
																					<c:choose>
																						<c:when test="${item.key.unitstock > 0}">
																							<span class="text-success"><strong>In
																									Stock</strong></span>
																						</c:when>
																						<c:otherwise>
																							<span class="text-success"><strong>Out
																									of Stock</strong></span>
																						</c:otherwise>
																					</c:choose>

																				</div>
																			</div>
																		</td>

																		<td class="col-sm-1 col-md-1"
																			style="text-align: center"><input type="hidden"
																			name="itemId" value="${item.key.itemId}" /> <input
																			type="text" class="form-control" id="quantity"
																			name="quantity${status.index + 1}"
																			value="${item.value}" readonly="readonly"></td>

																		<td class="col-sm-1 col-md-1 text-center"><strong></strong>
																			<fmt:formatNumber value="${item.key.price}"
																				type="currency" /></td>
																		<td class="col-sm-1 col-md-1 text-center"><strong></strong>
																			<fmt:formatNumber
																				value="${item.value*item.key.price}" type="currency" /></td>
																		<td class="col-sm-1 col-md-1"></td>
																	</tr>
																</c:forEach>
															</tbody>
															<tfoot>
																<tr>
																	<td> </td>
																	<td><i><b>${cart.totalQuantity} item(s)</b></i></td>

																	<td align="center"><b>SubTotal </b></td>
																	<td align="center"><b><fmt:formatNumber
																				value="${cart.totalAmount}" type="currency" /></b></td>
																	<td class="text-right"></td>
																</tr>
																<tr>
																	<td> </td>
																	<td></td>
																	<td>
																		<b>Shipping:</b>
																	</td>
																	<td align="center"><input
																		type="text" id="textFieldValueJQ" class="form-control"
																		placeholder="Shipping value" readonly="readonly" /></td>
																	<td></td>

																</tr>
																<tr>
																	<td> </td>
																	<td> </td>
																	<td align="center"><h5>
																			<b>Tax: Included in the Bill</b>
																		</h5></td>
																	<td class="text-center" align="center"><b><input
																			type="text" class="form-control" id="tax" name="tax"
																			readonly="readonly"></b></td>
																	<td></td>

																</tr>
																<tr>
																	<td> </td>
																	<td></td>
																	<td align="center"><b>Order Total </b></td>
																	<td class="text-center"><b> <input type="text"
																			class="form-control" id="orderTotal"
																			name="orderTotal" readonly="readonly"></b></td>
																	<td></td>

																</tr>
															</tfoot>
														</table>
													</div>
												</div>

											</form>
										</c:if>
									</div>
								</div>
							</div>

						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<div style="text-align: center; width: 100%;">
									<a style="width: 100%;" data-toggle="collapse"
										data-parent="#accordion" href="#collapseTwo"
										class=" btn btn-success"
										onclick="$(this).fadeOut(); $('#payInfo').fadeIn();">Continue
										to Shipping Information»</a>
								</div>
							</h4>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseTwo">Shipping Information</a>
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse">
							<div class="panel-body">
								<b>Help us keep your account safe and secure, please verify
									your Shipping information.</b> <br /> <br />
								<form id="orderForm" action="place_order" method="post">
									<table class="table table-striped" style="font-weight: bold;">
										<tr>
											<td style="width: 175px;"><label for="id_email">Recipient
													Name:</label></td>
											<td><input class="form-control" type="text"
												name="recipientName" value="${loggedCustomer.fullname}" /></td>
										</tr>
										<tr>
											<td style="width: 175px;"><label for="id_first_name">Recipient
													Phone:</label></td>
											<td><input class="form-control" type="text"
												name="recipientPhone" value="${loggedCustomer.phone}" /></td>
										</tr>
										<tr>
											<td style="width: 175px;"><label for="id_last_name">Street
													Address:</label></td>
											<td><input class="form-control" type="text"
												name="address" value="${loggedCustomer.address}" /></td>
										</tr>
										<tr>
											<td style="width: 175px;"><label for="id_address_line_1">City:</label></td>
											<td><input class="form-control" type="text" name="city"
												value="${loggedCustomer.city}" /></td>
										</tr>
										<tr>
											<td style="width: 175px;"><label for="id_address_line_2">Zip
													Code:</label></td>
											<td><input class="form-control" type="text"
												name="zipcode" value="${loggedCustomer.zipcode}" /></td>
										</tr>
										<tr>
											<td style="width: 175px;"><label for="id_city">Country:</label></td>
											<td><input class="form-control" type="text"
												name="country" value="${loggedCustomer.country}" /></td>
										</tr>


									</table>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<div style="text-align: center;">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapseThree" class=" btn   btn-success" id="payInfo"
										style="width: 100%; display: none;"
										onclick="$(this).fadeOut();  
                   document.getElementById('collapseThree').scrollIntoView()">Enter
										Payment Information »</a>
								</div>
							</h4>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseThree"> <b>Credit Card Payment
										Information</b>
								</a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse">
							<div class="panel-body">
								<span class='payment-errors'></span>
								<fieldset>
									<legend>What method would you like to pay with today?</legend>
									<div class="form-group">
										<label class="col-sm-3 control-label" for="expiry-month">Credit
											Card Method</label>
										<div>
											<div class="row">
												<div class="col-xs-3">
													<select class="form-control col-sm-2"
														data-stripe="exp-month" name="paymentMethod"
														style="margin-left: 5px;">

														<option>Cash On Delivery</option>
														
														<%-- <option value="American Express"
															<c:if test="${order.paymentMethod eq 'American Express' }">selected='selected'</c:if>>American
															Express</option>
														<option value="Master Card"
															<c:if test="${order.paymentMethod eq 'Master Card' }">selected='selected'</c:if>>Master
															Card</option>
														<option value="Visa Card"
															<c:if test="${order.paymentMethod eq 'Visa Card' }">selected='selected'</c:if>>Visa
															Card</option> --%>


													</select>
												</div>

											</div>
										</div>
									</div>

									<!-- <div class="form-group">
										<label class="col-sm-3 control-label" for="card-holder-name">Name
											on Card</label>
										<div class="col-sm-9">
											<input type="text" name="nameCard" class="form-control"
												stripe-data="name" id="name-on-card"
												placeholder="Card Holder's Name">
										</div>

									</div>

									<br /> <br />

									<div class="form-group">
										<label class="col-sm-3 control-label" for="card-number">Card
											Number</label>
										<div class="col-sm-9">
											<input type="text" name="cardNumber" class="form-control"
												stripe-data="number" id="card-number"
												placeholder="Debit/Credit Card Number"> <br />
											<div>
												<img class="pull-right"
													src="https://s3.amazonaws.com/hiresnetwork/imgs/cc.png"
													style="max-width: 250px; padding-bottom: 20px;">
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label" for="expiry-month">Expiration
											Date</label>
										<div class="col-sm-9">
											<input type="text" name="expDate" class="form-control"
												stripe-data="exp" id="expdate" placeholder="Expiration Date">
										</div>
									</div>
									<br /> <br /> <br />
									<div class="form-group">
										<label class="col-sm-3 control-label" for="cvv">Card
											CVC</label>
										<div class="col-sm-9">
											<input type="text" name="cvc" class="form-control"
												stripe-data="cvc" id="card-cvc" placeholder="Security Code">
										</div>

									</div> -->

								</fieldset>
								<center>
									<button type="submit" class="btn btn-success btn-lg">
										Place Order</button>
								</center>


							</div>
						</div>
					</div>
					</form>
				</div>
			</div>

		</div>
	</div>



	<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">
	$(document).ready(function() {
		var shipValue = sessionStorage.getItem("shipping");
		var taxValue=sessionStorage.getItem("tax");
		var orderTotalValue=sessionStorage.getItem("orderTotal");
		
		$("#textFieldValueJQ").val(shipValue);
		$("#tax").val(taxValue);
		$("#orderTotal").val(orderTotalValue);
		
		$("#orderForm").validate({
			rules : {
				recipientName : "required",
				recipientPhone : "required",
				address : "required",
				city : "required",
				zipcode : "required",
				country : "required",
			
			
			},
			messages : {
				recipientName : "Please enter recipient name.",
				recipientPhone : "Please enter phone number.",
				address : "Please enter street address",
				city : "Please enter city.",
				zipcode : "Please enter zipcode.",
				country : "Please enter country.",
			}
		});		
		
	});

</script>

</html>