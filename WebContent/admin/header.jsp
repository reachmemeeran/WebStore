<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" 
			href="${pageContext.request.contextPath}/admin/">Minhaz Grocery
			 <span class="glyphicon glyphicon-itemmark"></span></a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="${pageContext.request.contextPath}/admin/">Home
					<span class="glyphicon glyphicon-home"></span>
			</a></li>

			<li><a href="list_category">Categories <span
					class="glyphicon glyphicon-th-list"></span>
			</a></li>
			<li><a href="list_items">Items <span
					class="glyphicon glyphicon-item"></span></a></li>
			<li><a href="list_customer">Customers <span
					class="glyphicon glyphicon-user"></span></a></li>
			<li><a href="list_review">Reviews <span class="glyphicon glyphicon-star"></span></a></li>
			<li><a href="list_order">Orders <span
					class="glyphicon glyphicon-sort-by-order"></span>
			</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="logout"><span
					class="glyphicon glyphicon-log-in"> Welcome, <c:out
							value="${sessionScope.useremail}" />
				</span> Logout</a></li>
		</ul>
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
				<img src="../images/Logo.jpg" style="width: 100%;">
			</div>

			<div class="item">
				<img src="../images/Logo.jpg" style="width: 100%;">
			</div>

			<div class="item">
				<img src="../images/Logo.jpg" style="width: 100%;">
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