package com.webstore.controller.frontend.shoppingcart;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.webstore.dao.ItemDAO;
import com.webstore.entity.Item;

@WebServlet("/remove_from_cart")
public class RemoveItemFromCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RemoveItemFromCartServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		Integer itemId = Integer.parseInt(request.getParameter("item_id"));
		
		Object cartObject = request.getSession().getAttribute("cart");
		
		ShoppingCart shoppingCart = (ShoppingCart) cartObject;
		
		shoppingCart.removeItem(new Item(itemId));
		
		String cartPage = request.getContextPath().concat("/view_cart");
		response.sendRedirect(cartPage);
	}

}
