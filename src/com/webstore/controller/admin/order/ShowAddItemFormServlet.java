package com.webstore.controller.admin.order;

import static com.webstore.service.CommonUtility.forwardToPage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.webstore.dao.ItemDAO;
import com.webstore.entity.Item;

@WebServlet("/admin/add_item_form")
public class ShowAddItemFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShowAddItemFormServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		ItemDAO itemDAO = new ItemDAO();
		List<Item> listItem = itemDAO.listAll();
		request.setAttribute("listItem", listItem);
		
		forwardToPage("add_item_form.jsp", request, response);
	}

}
