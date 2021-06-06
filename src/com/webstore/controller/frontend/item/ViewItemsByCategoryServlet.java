package com.webstore.controller.frontend.item;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.webstore.service.ItemServices;

@WebServlet("/view_category")
public class ViewItemsByCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ViewItemsByCategoryServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		ItemServices itemServices = new ItemServices(request, response);
		itemServices.listItemsByCategory();
	}

}
