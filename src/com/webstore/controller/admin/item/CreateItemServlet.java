package com.webstore.controller.admin.item;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.webstore.service.ItemServices;

@WebServlet("/admin/create_item")
@MultipartConfig(
		fileSizeThreshold = 1204 * 10, // 10KB
		maxFileSize = 1024*1024, // 1MB
		maxRequestSize = 1024*1024*5 // 5MB
)
public class CreateItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CreateItemServlet() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		ItemServices itemServices = new ItemServices(request, response);
		itemServices.createItem();
	}

}
