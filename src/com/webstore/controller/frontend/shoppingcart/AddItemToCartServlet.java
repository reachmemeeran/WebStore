package com.webstore.controller.frontend.shoppingcart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.webstore.dao.ItemDAO;
import com.webstore.entity.Item;

@WebServlet("/add_to_cart")
public class AddItemToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddItemToCartServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		Integer itemId = Integer.parseInt(request.getParameter("item_id"));
		
		Object cartObject = request.getSession().getAttribute("cart");
		ShoppingCart shoppingCart = null;
				
		if(cartObject !=null && cartObject instanceof ShoppingCart) {
			shoppingCart = (ShoppingCart) cartObject;
		} else {
			shoppingCart = new ShoppingCart();
			request.getSession().setAttribute("cart", shoppingCart);
		}
		
		ItemDAO itemDAO = new ItemDAO();
		Item item = itemDAO.get(itemId);
		
		shoppingCart.addItem(item);
		
		String cartPage = request.getContextPath().concat("/view_cart");
		response.sendRedirect(cartPage);
	}

}
