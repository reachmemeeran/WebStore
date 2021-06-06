package com.webstore.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.webstore.dao.ItemDAO;
import com.webstore.dao.CategoryDAO;
import com.webstore.entity.Category;

public class CategoryServices {
	private CategoryDAO categoryDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public CategoryServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		categoryDAO = new CategoryDAO();
	}
	
	public void listCategory() 
			throws ServletException, IOException{
		listCategory(null);
	}
	
	public void listCategory(String message) throws ServletException, IOException {
		List<Category> listCategory =  categoryDAO.listAll();
		request.setAttribute("listCategory", listCategory);
		
		if(message !=null) {
			request.setAttribute("message", message);
		}
		
		String listPage ="category_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
	}
	
	public void createCategory() throws ServletException, IOException {
		String name = request.getParameter("name");
		Category existCategory = categoryDAO.findByName(name);
		if(existCategory!=null) {
			String message = "Could not create Category. A existCategory with email "+ name + " already exists";
			request.setAttribute("message", message);
			String listPage ="message.jsp";
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
			requestDispatcher.forward(request, response);
		}else {
			Category newCategory= new Category(name);
			categoryDAO.create(newCategory);
			listCategory("New Category Created Successfully");
		}
	}

	public void editCategory() throws ServletException, IOException {
		Integer categoryId = Integer.parseInt(request.getParameter("id"));
		Category category = categoryDAO.get(categoryId);
		String destPage = "category_form.jsp";
		if(category!=null) {
			request.setAttribute("category", category);
			
		}else {
			String message = "Could not find Category with ID " +categoryId;
			request.setAttribute("message", message);
			destPage ="message.jsp";
		}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(destPage);
		requestDispatcher.forward(request, response);		
	}

	public void updateCategroy() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		String name = request.getParameter("name");
		
		Category categoryById = categoryDAO.get(categoryId);
		
		Category categoryByName = categoryDAO.findByName(name);
	
		if(categoryByName != null && categoryByName.getCategoryId()!=categoryById.getCategoryId()) {
			String message = "Could not update Category. Category with Name " + name + " already Exists";
			request.setAttribute("message", message);
			String listPage ="message.jsp";
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
			requestDispatcher.forward(request, response);
			
		}else {
			categoryById.setName(name);
			categoryDAO.update(categoryById);
			
			String message="Category has been Updated Successfully";
			listCategory(message);
		}		
	}

	public void deleteCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("id"));
		String message;
		Category category = categoryDAO.get(categoryId);
		if (category == null) {
			message = "Could not find category with ID " + categoryId
					+ ", or it might have been deleted";
			request.setAttribute("message", message);
			request.getRequestDispatcher("message.jsp").forward(request, response);
			return;
		}
		
		ItemDAO itemDAO = new ItemDAO();
		long numberOfItems = itemDAO.countByCategory(categoryId);
				
		if (numberOfItems > 0) {
			message = "Could not delete the category (ID: " + categoryId + ") because it currently contains some items.";
			message = String.format(message, numberOfItems);
		} else {
			categoryDAO.delete(categoryId);		
			message = "The category with ID " + categoryId + " has been removed successfully.";
		}
		listCategory(message);
		
	}
}
