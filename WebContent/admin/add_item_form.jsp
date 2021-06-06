<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Item to Order</title>
</head>
<body>
	<div align="center">
		<h2>Add Item to Order ID: ${order.orderId}</h2>
		<form action="add_item_to_order" method="post">
			<table>
				<tr>
					<td>Select a item: </td>
					<td> 
						<select name="itemId">
							<c:forEach items="${listItem}" var="item" varStatus="status">
								<option value="${item.itemId}">${item.title} </option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>&nbsp;</tr>
				<tr>
					<td>Number of copies: </td>
					<td>
						<select name="quantity">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</td>
				</tr>	
				<tr>&nbsp;</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="Add">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="Cancel" onclick="javascript: self.close()">
					</td>
				</tr>
						
			</table>		
		</form>
	</div>
</body>
</html>