package com.webstore.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.webstore.dao.ItemDAO;
import com.webstore.dao.CustomerDAO;
import com.webstore.dao.OrderDAO;
import com.webstore.dao.ReviewDAO;
import com.webstore.dao.UserDAO;
import com.webstore.entity.Order;
import com.webstore.entity.Review;


@WebServlet("/admin/")
public class AdminHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminHomeServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderDAO orderDAO = new OrderDAO();
    	ReviewDAO reviewDAO = new ReviewDAO();
    	ItemDAO itemDAO = new ItemDAO();
    	CustomerDAO customerDAO = new CustomerDAO();
    	UserDAO userDAO = new UserDAO();
    	
    	List<Order> listMostRecentSales = orderDAO.listMostRecentSales();
    	List<Review> listMostRecentReviews = reviewDAO.listMostRecentReviews();
    	
    	long totalItemsOnStrore = itemDAO.count();
    	long totalCustomersOnItemstall = customerDAO.count();
    	long totalAdmins = userDAO.count();
    	long totalOrders = orderDAO.count();
    	long totalReviews = reviewDAO.count();
    	
    	String homepage = "index.jsp";
		
		request.setAttribute("listMostRecentSales", listMostRecentSales);
		request.setAttribute("listMostRecentReviews", listMostRecentReviews);
		
		request.setAttribute("totalItemsOnStrore", totalItemsOnStrore);
		request.setAttribute("totalCustomersOnItemstall", totalCustomersOnItemstall);
		request.setAttribute("totalAdmins", totalAdmins);
		request.setAttribute("totalOrders", totalOrders);
		request.setAttribute("totalReviews", totalReviews);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(homepage);
		dispatcher.forward(request, response);

	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
