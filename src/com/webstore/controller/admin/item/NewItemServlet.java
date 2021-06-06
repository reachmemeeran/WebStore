package com.webstore.controller.admin.item;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.webstore.service.ItemServices;

@WebServlet("/admin/new_item")
public class NewItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public NewItemServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		ItemServices itemServices = new ItemServices(request, response);
		request.getSession().removeAttribute("item");
		itemServices.showItemNewForm();
	}

}
