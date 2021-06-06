package com.webstore.controller.admin.order;

import static com.webstore.service.CommonUtility.forwardToPage;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.webstore.dao.ItemDAO;
import com.webstore.entity.Item;
import com.webstore.entity.Order;
import com.webstore.entity.OrderDetail;

@WebServlet("/admin/add_item_to_order")
public class AddItemToOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int itemId = Integer.parseInt(request.getParameter("itemId"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		ItemDAO itemDAO = new ItemDAO();
		Item item = itemDAO.get(itemId);
		
		HttpSession session = request.getSession();
		Order order = (Order) session.getAttribute("order");
		
		float subtotal = quantity * item.getPrice();
		
		OrderDetail orderDetail = new OrderDetail();
		orderDetail.setItem(item);
		orderDetail.setQuantity(quantity);
		orderDetail.setSubtotal(subtotal);
		
		float newTotal = order.getTotal() + subtotal;
		order.setTotal(newTotal);
		
		boolean isItemAlreadyInOrder = false;
		Set<OrderDetail> orderDetails = order.getOrderDetails();
		for (OrderDetail od : orderDetails) {
			if (od.getItem().equals(item)) {
				isItemAlreadyInOrder = true;
				od.setQuantity(od.getQuantity() + quantity);
				od.setSubtotal(od.getSubtotal() + subtotal);
				break;
			}
		}
		
		if (!isItemAlreadyInOrder) {
			orderDetails.add(orderDetail);
		}
		
		request.setAttribute("item", item);
		session.setAttribute("NewItemPendingToAddToOrder", true);
		
		forwardToPage("add_item_result.jsp", request, response);
	}

}