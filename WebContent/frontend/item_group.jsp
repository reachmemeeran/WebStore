<div class="item"> 
				<div>
					<a href="view_item?id=${item.itemId }">
			<img class="item_small"
			 src="data:image/jpg;base64,${item.base64Image}">
		</a>
	</div>
	<div>
		<a href="view_item?id=${item.itemId }">
			<b>${item.title}</b>
		</a>
	</div>
	<div>
		<jsp:directive.include file ="item_rating.jsp" />
	</div>
	<div><strike>&#8377; ${item.falsePrice}</strike> <b>&#8377; ${item.price}</b></div>
</div>