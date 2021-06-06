<!-- <link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Open+Sans">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 -->
<style type="text/css">


body {
    background: #e2eaef;
    font-family: "Open Sans", sans-serif;
	font-size: 14px;
    line-height: 1.42857143;
    color: #333;
	margin: 0;
	display: block;
}

* {
margin: 0;
}

html {
    -webkit-tap-highlight-color: rgba(0,0,0,0);
}

:after, :before {
    box-sizing: border-box;
}

.carousel slide {
	color: #7ac400;
	font-size: 11px;
	text-transform: uppercase;
	font-weight: bold;
	background: none;
	border: 1px solid #7ac400;
	padding: 6px 14px;
	margin-top: 5px;
	line-height: 16px;
	border-radius: 20px;
}

h1 {
	color: #eff5fb;
	font-size: 26px;
	font-weight: 1000;
	text-align: center;
	text-transform: uppercase,lowercase;
	position: relative; 
	margin: 5px 0 5px;
}




</style>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/">Minhaz Grocery</a> 
			<a class="navbar-brand" href="${pageContext.request.contextPath}/"><span
				class="glyphicon glyphicon-home"></span> Home</a>

			<ul class="nav navbar-nav navbar-left">

				<li class="dropdown"><a class="glyphicon glyphicon-th-list"
					data-toggle="dropdown" href="#"> Category <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<c:forEach var="category" items="${listCategory}"
							varStatus="status">
							<li><a href="view_category?id=${category.categoryId}"><font
									size="+1" color="red"> <c:out value="${category.name}" /></font>
							</a></li>
						</c:forEach>
					</ul></li>
			</ul>
		</div>

		<form class="navbar-form navbar-left" action="search" method="get">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search"
					name="keyword">
			</div>
			<button type="submit" class="btn btn-danger">Search</button>

		</form>
		<ul class="nav navbar-nav navbar-right">

			<c:if test="${loggedCustomer==null}">
				<li><a href="login"><span
						class="glyphicon glyphicon-log-in"></span> Sign In</a></li>
				<li><a href="register"><span
						class="glyphicon glyphicon-user"></span> Sign Up</a></li>
			</c:if>

			<c:if test="${loggedCustomer!=null}">
				<li><a href="view_profile">Hello,
						${loggedCustomer.fullname}</a></li>
				<li><a href="view_orders"><span
						class="glyphicon glyphicon-sort-by-order"></span> Orders</a></li>
					
				<li><a href="logout">
				
				 <span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
						
			</c:if>
       
			<li><a href="view_cart" id="cart"><i
					class="fa fa-shopping-cart "></i> Cart <span class="badge"
					style="color: orange;" ><b>${cart.totalQuantity}</b></span></a></li>
					
			

		</ul>

	</div>
	<div >
		<h1>
			<c:forEach var="category" items="${listCategory}" varStatus="status">
				<a style= color:white; href="view_category?id=${category.categoryId}"> <c:out value="${category.name}" /></a> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</c:forEach>
			</h1>
		</div>
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators-->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides-->
		<div class="carousel-inner">
			<div class="item active">
				<img src="images/Logo.jpg" style="width: 100%;">
			</div>

			<div class="item">
				<img src="images/Logo.jpg" style="width: 100%;">
			</div>

			<div class="item">
				<img src="images/Logo.jpg" style="width: 100%;">
			</div>
		</div>

		<!-- Left and right controls-->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	
	
</nav>
<script type="text/javascript">
	
		$(document).ready(function() {
			$("#clearCart").click(function() {
				window.location = 'clear_cart';
			});
		});
	</script>