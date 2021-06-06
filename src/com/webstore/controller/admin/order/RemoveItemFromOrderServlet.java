package com.webstore.controller.admin.order;

import static com.webstore.service.CommonUtility.forwardToPage;

import java.io.IOException;
import java.util.Iterator;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.webstore.entity.Order;
import com.webstore.entity.OrderDetail;

@WebServlet("/admin/remove_item_from_order")
public class RemoveItemFromOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RemoveItemFromOrderServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		int itemId = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		Order order = (Order) session.getAttribute("order");
		
		Set<OrderDetail> orderDetails = order.getOrderDetails();
		Iterator<OrderDetail> iterator = orderDetails.iterator();
		
		while(iterator.hasNext()) {
			OrderDetail orderDetail = iterator.next();
			if(orderDetail.getItem().getItemId() == itemId) {
				float newTotal = order.getTotal() - orderDetail.getSubtotal();
				order.setTotal(newTotal);
				iterator.remove();
			}
		}
		
		forwardToPage("order_form.jsp", request, response);
	}
}
