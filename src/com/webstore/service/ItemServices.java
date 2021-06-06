package com.webstore.service;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.webstore.dao.ItemDAO;
import com.webstore.dao.CategoryDAO;
import com.webstore.dao.OrderDAO;
import com.webstore.entity.Item;
import com.webstore.entity.Category;

public class ItemServices extends CommonUtility {
	
	private ItemDAO itemDAO;
	private CategoryDAO categoryDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public ItemServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		itemDAO = new ItemDAO();
		categoryDAO = new CategoryDAO();
	}

	public void listItems() 
			throws ServletException, IOException{
		listItems(null);
	}
	
	public void listItems(String message) throws ServletException, IOException {
		List<Item> listitems =  itemDAO.listAll();
		request.setAttribute("listitems", listitems);
		
		if(message !=null) {
			request.setAttribute("message", message);
		}
		
		String listPage ="item_list.jsp";
		
		CommonUtility.forwardToPage(listPage, request, response);
	}
	
	public void showItemNewForm() throws ServletException, IOException {
		List<Category> listCategory = categoryDAO.listAll();
		
		request.setAttribute("listCategory", listCategory);
		
		String listPage ="item_form.jsp";
		CommonUtility.forwardToPage(listPage, request, response);
	}

	public void createItem() throws ServletException, IOException {
		
		String title = request.getParameter("title");
		
		Item existItem = itemDAO.findByTitle(title);
		
		if(existItem !=null) {
			String message = "Could not create new item because the title '" + title + "' already Exists";
			listItems(message);
			return;
		}
		
		Item newItem = new Item();
		readItemFields(newItem);
		
		Item createdItem = itemDAO.create(newItem);
		
		if(createdItem.getItemId()>0) {
			String message = "A new Item has been created successfully.";
			listItems(message);
		}
	}
	
	public void readItemFields(Item item) throws ServletException, IOException {
		Integer categoryId = Integer.parseInt(request.getParameter("category"));
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		float price=Float.parseFloat(request.getParameter("price"));
		Integer unitstock = Integer.parseInt(request.getParameter("stockAvailable"));
		
		
		item.setTitle(title);
		item.setDescription(description);
		
		Category category = categoryDAO.get(categoryId);
		item.setCategory(category);
		
		item.setPrice(price);
		float falsePrice = price+20;
		item.setFalsePrice(falsePrice);
		item.setUnitstock(unitstock);
		
		Part part = request.getPart("itemImage");
		
		if(part !=null && part.getSize()>0) {
			long size = part.getSize();
			byte[] imageBytes = new byte[(int) size];
			
			InputStream inputStream = part.getInputStream();
			inputStream.read(imageBytes);
			inputStream.close();
			
			item.setImage(imageBytes);
		}
	}

	public void editItem() throws ServletException, IOException {
		Integer itemId = Integer.parseInt(request.getParameter("id"));
		Item item = itemDAO.get(itemId);
		String destPage = "item_form.jsp";
		
		if (item != null) {
			List<Category> listCategory = categoryDAO.listAll();
			
			request.setAttribute("item", item);
			request.setAttribute("listCategory", listCategory);
			
		} else {
			destPage = "message.jsp";
			String message = "Could not find item with ID " + itemId;
			request.setAttribute("message", message);			
		}
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(destPage);
		requestDispatcher.forward(request, response);	
	}

	public void updateItem() throws ServletException, IOException {
		Integer itemId = Integer.parseInt(request.getParameter("itemId"));
		String title = request.getParameter("title");
		
		Item existItem = itemDAO.get(itemId);
		Item itemByTitle = itemDAO.findByTitle(title);
		
		if(itemByTitle !=null && !existItem.equals(itemByTitle)) {
			String message = "Could not update item because there is another item having the same title";
			listItems(message);
			return;
		}
		
		readItemFields(existItem);
		
		itemDAO.update(existItem);
		
		String message = "The item has been updated successfully.";
		listItems(message);
	}

	public void deleteItem() throws ServletException, IOException {
		Integer itemId = Integer.parseInt(request.getParameter("id"));
		Item item =  itemDAO.get(itemId);
		
		if (item == null) {
			String message = "Could not find item with ID " + itemId 
					+ ", or it might have been deleted";
			showMessageBackend(message, request, response);
			
		} else {
			if (!item.getReviews().isEmpty()) {
				String message = "Could not delete the item with ID " + itemId
						+ " because it has reviews";
				showMessageBackend(message, request, response);
			} else {
				OrderDAO orderDAO = new OrderDAO();
				long countByOrder = orderDAO.countOrderDetailByItem(itemId);
				
				if (countByOrder > 0) {
					String message = "Could not delete item with ID " + itemId
							+ " because there are orders associated with it.";
					showMessageBackend(message, request, response);
				} else {
					String message = "The item has been deleted successfully.";
					itemDAO.delete(itemId);			
					listItems(message);
				}
			}
		}
	}

	public void listItemsByCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("id"));
		
		
		Category category = categoryDAO.get(categoryId);
		
		if (category == null) {
			String message = "Sorry, the category ID " + categoryId + " is not available.";
			request.setAttribute("message", message);
			request.getRequestDispatcher("frontend/message.jsp").forward(request, response);
			
			return;
		}
		request.setAttribute("category", category);
		
		List<Item> listItems = itemDAO.listByCategory(categoryId);
		request.setAttribute("listItems", listItems);
		
		String listPage ="frontend/items_list_by_category.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
	}

	public void viewItemDetail() throws ServletException, IOException {
		int itemId = Integer.parseInt(request.getParameter("id"));
		Item item = itemDAO.get(itemId);
		
		String destPage ="frontend/item_detail.jsp";
		
		if (item != null) {
			request.setAttribute("item", item);
			
		} else {
			destPage = "frontend/message.jsp";
			String message = "Sorry, the item with ID " + itemId + " is not available.";
			request.setAttribute("message", message);			
		}
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(destPage);
		requestDispatcher.forward(request, response);
	}

	public void search() throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		List<Item> result = null;
		if(keyword.equals("")) {
			result = itemDAO.listAll();
		} else {
			result = itemDAO.search(keyword);
		}
		request.setAttribute("keyword", keyword);
		request.setAttribute("result", result);
		
		String resultPage ="frontend/search_result.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(resultPage);
		requestDispatcher.forward(request, response);
	}
}
