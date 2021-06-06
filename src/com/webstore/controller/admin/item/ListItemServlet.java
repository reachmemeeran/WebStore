package com.webstore.controller.admin.item;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.webstore.service.ItemServices;

@WebServlet("/admin/list_items")
public class ListItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ListItemServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		ItemServices itemServices = new ItemServices(request, response);
		itemServices.listItems();
	}

}
